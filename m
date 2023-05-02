Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B03D76F4096
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 12:04:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptmrl-0007P4-PJ; Tue, 02 May 2023 06:04:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1ptmri-0007Na-M2; Tue, 02 May 2023 06:04:10 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1ptmrd-0003FM-D9; Tue, 02 May 2023 06:04:10 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 9FFF246E89;
 Tue,  2 May 2023 12:03:52 +0200 (CEST)
Message-ID: <df3b995e-884c-8e3c-e0cf-b720ff4fff56@proxmox.com>
Date: Tue, 2 May 2023 12:03:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: QMP (without OOB) function running in thread different from the
 main thread as part of aio_poll
To: quintela@redhat.com, Kevin Wolf <kwolf@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Michael Roth <michael.roth@amd.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>, Peter Xu <peterx@redhat.com>
References: <877cu7gk1g.fsf@pond.sub.org>
 <CABgObfapoyrFhY9kna_=D7PJ4yAssTgzY3jxSZD=6v0zCGDcSA@mail.gmail.com>
 <3ba2f8b9-9818-6601-2247-7b0e20d7ab0d@proxmox.com>
 <ZEpWd+273aIVZrRV@redhat.com>
 <515e6a39-8515-b32b-05ce-6d7511779b1b@proxmox.com>
 <87zg6tbdep.fsf@secure.mitica>
 <b1402ecd-1288-1ceb-ce58-65fc90636fac@proxmox.com>
 <87bkj8bg8g.fsf@secure.mitica> <ZEuEIhe86udi38kx@redhat.com>
 <87354kbdvc.fsf@secure.mitica> <ZEu6lVDVUh8AC6Af@redhat.com>
 <87jzxw9cco.fsf@secure.mitica>
Content-Language: en-US
From: Fiona Ebner <f.ebner@proxmox.com>
In-Reply-To: <87jzxw9cco.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Am 28.04.23 um 18:54 schrieb Juan Quintela:
> Kevin Wolf <kwolf@redhat.com> wrote:
>> Am 28.04.2023 um 10:38 hat Juan Quintela geschrieben:
>>> Kevin Wolf <kwolf@redhat.com> wrote:
>>>>> I am perhaps a bit ingenuous here, but it is there a way to convince
>>>>> qemu that snapshot_save_job_bh *HAS* to run on the main thread?
>>>>
>>>> I believe we're talking about a technicality here. I asked another more
>>>> fundamental question that nobody has answered yet:
>>>>
>>>> Why do you think that it's ok to call bdrv_writev_vmstate() without
>>>> holding the BQL?
>>>
>>> I will say this function starts by bdrv_ (i.e. block layer people) and
>>> endes with _vmstate (i.e. migration people).
>>>
>>> To be honest, I don't know.  That is why I _supposed_ you have an idea.
>>
>> My idea is that bdrv_*() can only be called when you hold the BQL, or
>> for BlockDriverStates in an iothread the AioContext lock.
>>
>> Apparently dropping the BQL in migration code was introduced in Paolo's
>> commit 9b095037527.
> 
> Damn.  I reviewed it, so I am as guilty as the author.
> 10 years later without problems I will not blame that patch.
> 
> I guess we changed something else that broke doing it without the lock.
> 
> But no, I still don't have suggestions/ideas.
>

I do feel like the issue might be very difficult to trigger under normal
circumstances. Depending on the configuration and what you do in the
guest, aio_poll in a vCPU thread does not happen often and I imagine
snapshot-save is also not a super frequent operation for most people. It
still takes me a while to trigger the issue by issuing lots of pflash
writes and running snapshot-save in a loop, I'd guess about 30-60
snapshots. Another reason might be that generated co-wrappers were less
common in the past?

>> I'm not sure what this was supposed to improve in
>> the case of snapshots because the VM is stopped anyway.

Is it? Quoting Juan:> d- snapshots are a completely different beast,
that don't really stop
>    the guest in the same way at that point, and sometimes it shows in
>    this subtle details.

>> Would anything bad happen if we removed the BQL unlock/lock section in
>> qemu_savevm_state() again?
> 
> Dunno.
> 
> For what is worth, I can say that it survives migration-test, but don't
> ask me why/how/...
> 
> Fiona, can you check if it fixes your troubles?
> 

Just removing the single section in qemu_savevm_state() breaks even the
case where snapshot_save_job_bh() is executed in the main thread,
because ram_init_bitmaps() will call qemu_mutex_lock_iothread_impl()
which asserts that it's not already locked.

Also removing the lock/unlock pair in ram_init_bitmaps() seems to work.
But I'm not sure what else a full semantic revert of commit 9b095037527
would entail.

Best Regards,
Fiona


