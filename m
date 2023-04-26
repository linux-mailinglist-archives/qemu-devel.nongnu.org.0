Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E902F6EF681
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 16:33:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prgBf-0003YB-JN; Wed, 26 Apr 2023 10:32:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1prgBb-0003XV-2x; Wed, 26 Apr 2023 10:32:00 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1prgBX-00019B-0d; Wed, 26 Apr 2023 10:31:58 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 362B445983;
 Wed, 26 Apr 2023 16:31:39 +0200 (CEST)
Message-ID: <3ba2f8b9-9818-6601-2247-7b0e20d7ab0d@proxmox.com>
Date: Wed, 26 Apr 2023 16:31:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Fiona Ebner <f.ebner@proxmox.com>
Subject: Re: QMP (without OOB) function running in thread different from the
 main thread as part of aio_poll
To: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Michael Roth <michael.roth@amd.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Xu <peterx@redhat.com>
References: <2a61b581-5a21-c945-bb98-b6863cac0c1f@proxmox.com>
 <877cu7gk1g.fsf@pond.sub.org>
 <CABgObfapoyrFhY9kna_=D7PJ4yAssTgzY3jxSZD=6v0zCGDcSA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CABgObfapoyrFhY9kna_=D7PJ4yAssTgzY3jxSZD=6v0zCGDcSA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.422,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 20.04.23 um 08:55 schrieb Paolo Bonzini:
> 
> 
> Il gio 20 apr 2023, 08:11 Markus Armbruster <armbru@redhat.com
> <mailto:armbru@redhat.com>> ha scritto:
> 
>     So, splicing in a bottom half unmoored monitor commands from the main
>     loop.  We weren't aware of that, as our commit messages show.
> 
>     I guess the commands themselves don't care; all they need is the BQL.
> 
>     However, did we unwittingly change what can get blocked?  Before,
>     monitor commands could block only the main thread.  Now they can also
>     block vCPU threads.  Impact?
> 
> 
> Monitor commands could always block vCPU threads through the BQL(*).
> However, aio_poll() only runs in the vCPU threads in very special cases;
> typically associated to resetting a device which causes a blk_drain() on
> the device's BlockBackend. So it is not a performance issue.
> 

AFAIU, all generated coroutine wrappers use aio_poll. In my backtrace
aio_poll happens via blk_pwrite for a pflash device. So a bit more often
than "very special cases" ;)

> However, liberal reuse of the main block layer AioContext could indeed
> be a *correctness* issue. I need to re-read Fiona's report instead of
> stopping at the first three lines because it's the evening. :)

For me, being called in a vCPU thread caused problems with a custom QMP
function patched in by Proxmox. The function uses a newly opened
BlockBackend and calls qemu_mutex_unlock_iothread() after which
qemu_get_current_aio_context() returns 0x0 (when running in the main
thread, it still returns the main thread's AioContext). It then calls
blk_pwritev which is also a generated coroutine wrapper and the
assert(qemu_get_current_aio_context() == qemu_get_aio_context());
in the else branch of the AIO_WAIT_WHILE_INTERNAL macro fails.

Sounds like there's room for improvement in our code :/ I'm not aware of
something similar in upstream QEMU.

Thanks to Markus for the detailed history lesson!

Best Regards,
Fiona


