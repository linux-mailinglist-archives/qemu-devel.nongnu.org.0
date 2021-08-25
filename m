Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F154A3F7987
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 17:55:45 +0200 (CEST)
Received: from localhost ([::1]:49814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIvFb-0006cz-JH
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 11:55:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@pond.sub.org>)
 id 1mIvEn-0005wC-W1
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 11:54:50 -0400
Received: from oxygen.pond.sub.org ([2a01:4f8:13b:3ad0:1::3]:40970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@pond.sub.org>)
 id 1mIvEl-0007lB-Q0
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 11:54:49 -0400
Received: from blackfin.pond.sub.org
 (p200300d36f498700dacb8afffee0c842.dip0.t-ipconnect.de
 [IPv6:2003:d3:6f49:8700:dacb:8aff:fee0:c842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by oxygen.pond.sub.org (Postfix) with ESMTPSA id EA38C20906;
 Wed, 25 Aug 2021 17:54:41 +0200 (CEST)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4180011380A9; Wed, 25 Aug 2021 17:54:40 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Reiter <s.reiter@proxmox.com>
Subject: Re: [PATCH] monitor/qmp: fix race with clients disconnecting early
References: <20210823101115.2015354-1-s.reiter@proxmox.com>
Date: Wed, 25 Aug 2021 17:54:40 +0200
Message-ID: <87r1eh4j0f.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2a01:4f8:13b:3ad0:1::3;
 envelope-from=armbru@pond.sub.org; helo=oxygen.pond.sub.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Wolfgang Bumiller <w.bumiller@proxmox.com>,
 Michael Roth <michael.roth@amd.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Stefan Reiter <s.reiter@proxmox.com> writes:

> From: Stefan Reiter <stefan@pimaker.at>
>
> The following sequence can produce a race condition that results in
> responses meant for different clients being sent to the wrong one:
>
> (QMP, no OOB)
> 1) client A connects
> 2) client A sends 'qmp_capabilities'
> 3) 'qmp_dispatch' runs in coroutine, schedules out to
>    'do_qmp_dispatch_bh' and yields
> 4) client A disconnects (i.e. aborts, crashes, etc...)
> 5) client B connects
> 6) 'do_qmp_dispatch_bh' runs 'qmp_capabilities' and wakes calling coroutine
> 7) capabilities are now set and 'mon->commands' is set to '&qmp_commands'
> 8) 'qmp_dispatch' returns to 'monitor_qmp_dispatch'
> 9) success message is sent to client B *without it ever having sent
>    'qmp_capabilities' itself*
> 9a) even if client B ignores it, it will now presumably send it's own
>    greeting, which will error because caps are already set
>
> The fix proposed here uses an atomic, sequential connection number
> stored in the MonitorQMP struct, which is incremented every time a new
> client connects. Since it is not changed on CHR_EVENT_CLOSED, the
> behaviour of allowing a client to disconnect only one side of the
> connection is retained.
>
> The connection_nr needs to be exposed outside of the monitor subsystem,
> since qmp_dispatch lives in qapi code. It needs to be checked twice,
> once for actually running the command in the BH (fixes 7/9a), and once for
> sending back a response (fixes 9).
>
> This satisfies my local reproducer - using multiple clients constantly
> looping to open a connection, send the greeting, then exiting no longer
> crashes other, normally behaving clients with unrelated responses.
>
> Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
> ---
>
> This is another patch in the apparently never-ending series of fixes to
> QMP-related race conditions. Our PVE users really seem to have a knack for
> triggering these ;)

Fortunately, you seem to have a knack for fixing them!

> Here's one of the (several) forum threads where we tried to diagnose the issue:
> https://forum.proxmox.com/threads/error-with-backup-when-backing-up-qmp-command-query-backup-failed-got-wrong-command-id.88017/
>
> It manifested itself under load, where sometimes our monitor code (which uses
> the 'id' system of QMP to track commands) would receive bogus responses, showing
> up as "got wrong command id" errors in our logs.

Let me re-explain the bug in my own words, to make sure I understand.

A QMP monitor normally runs in the monitor I/O thread.

A QMP monitor can serve only one client at a time.

It executes out-of-band commands right as it reads them.  In-band
commands are queued, and executed one after the other in the main loop.

Command output is buffered.  We write it out as fast as the character
device can take it.  If a write fails, we throw away the entire buffer
contents.

A client can disconnect at any time.  This throws away the queue.  An
in-band command may be executing in the main loop.  An out-of-band
command may be executing in the monitor's thread.

Such commands (if any) are not affected by the disconnect.  Their output
gets buffered, but write out fails, so it's thrown away.

*Except* when another client connects quickly enough.  Then we send it
output meant for the previous client.  This is wrong.  I suspect this
could even send invalid JSON.

Special case: if in-band command qmp_capabilities is executing when the
client disconnects, and another client connects before the command flips
the monitor from capabilities negotiation mode to command mode, that
client starts in the wrong mode.

> I'm not sure this approach is the best fix, it seems a lot like a band-aid to
> me, but it's the best I could come up with for now - open for different ideas of
> course.

I need to think through the ramifications.  Please ping me if you don't
hear from me this week.

> Note that with this patch, we're no longer running a command that was scheduled
> after a client has disconnected early. This seems like a slight behaviour change
> to me...

The commit message needs to spell this out.

>          On the other hand, I didn't want to drag the connection number into
> qmp_capabilities() and special case that even further.
>
> I didn't look to deeply into 'QMP in iothread' yet, if that does what I think it
> does there might be two more potential races here:
> * between 'do_qmp_dispatch_bh' running 'aio_co_wake' and 'qmp_dispatch' actually
>   yielding (very unlikely though)
> * plus a TOCTOU in 'do_qmp_dispatch_bh' with the atomic read of the
>   connection_nr and actually running cmd->fn()

We should discuss these in more detail.

> Thanks!

Thank *you*!

