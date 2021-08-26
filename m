Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 224673F8969
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 15:54:09 +0200 (CEST)
Received: from localhost ([::1]:33232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJFpT-0003vJ-61
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 09:54:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJFm1-0007ry-Nh
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:50:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJFlz-00035G-DU
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:50:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629985826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zx0z/En679LI4zhTIPF6fJNkvQ2QhnsXRCyN4AnQde0=;
 b=NneeLbOChqn+C2R9TsQ5vJolwoQpbzhi1eIhxhCdEnbHYODocey2zk9Tj25jFVw5aLAYVD
 mRf8iXpJTZ38ZshpAe2uR6Y6uphP07zmCqmxUfiVdcIqkjNtIvh1EY7Mv3bdrSNAiTvJIp
 kFu6gv9nukZd1sS6NXoG/xTLrYKvoiE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-XSAr7ELQMV2jHX-SqtAx5w-1; Thu, 26 Aug 2021 09:50:25 -0400
X-MC-Unique: XSAr7ELQMV2jHX-SqtAx5w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24FFE1018F74;
 Thu, 26 Aug 2021 13:50:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FA3560871;
 Thu, 26 Aug 2021 13:50:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DB6CC11380A9; Thu, 26 Aug 2021 15:50:21 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Reiter <s.reiter@proxmox.com>
Subject: Re: [PATCH] monitor/qmp: fix race with clients disconnecting early
References: <20210823101115.2015354-1-s.reiter@proxmox.com>
 <87r1eh4j0f.fsf@dusky.pond.sub.org>
Date: Thu, 26 Aug 2021 15:50:21 +0200
In-Reply-To: <87r1eh4j0f.fsf@dusky.pond.sub.org> (Markus Armbruster's message
 of "Wed, 25 Aug 2021 17:54:40 +0200")
Message-ID: <87r1eguxgi.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Markus Armbruster <armbru@redhat.com> writes:

[...]

> Let me re-explain the bug in my own words, to make sure I understand.
>
> A QMP monitor normally runs in the monitor I/O thread.
>
> A QMP monitor can serve only one client at a time.
>
> It executes out-of-band commands right as it reads them.  In-band
> commands are queued, and executed one after the other in the main loop.
>
> Command output is buffered.  We write it out as fast as the character
> device can take it.  If a write fails, we throw away the entire buffer
> contents.
>
> A client can disconnect at any time.  This throws away the queue.  An
> in-band command may be executing in the main loop.  An out-of-band
> command may be executing in the monitor's thread.
>
> Such commands (if any) are not affected by the disconnect.  Their output
> gets buffered, but write out fails, so it's thrown away.
>
> *Except* when another client connects quickly enough.  Then we send it
> output meant for the previous client.  This is wrong.  I suspect this
> could even send invalid JSON.
>
> Special case: if in-band command qmp_capabilities is executing when the
> client disconnects, and another client connects before the command flips
> the monitor from capabilities negotiation mode to command mode, that
> client starts in the wrong mode.

What the cases have in common: disconnect + connect in monitor I/O
thread and the command executing in the main thread change the same
monitor state.

You observed two issues: one involving the output buffer (new client
receives old client's output), and one involving monitor mode (new
client has its mode flipped by the old client's qmp_capabilities
command).

Any monitor state accessed by commands could cause issues.  Right now, I
can see only one more: file descriptors.  Cleaning them up on disconnect
could mess with the command.

[...]


