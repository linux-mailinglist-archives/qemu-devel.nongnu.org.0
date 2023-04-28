Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E301D6F12CB
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 09:48:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psIpY-0002LR-QD; Fri, 28 Apr 2023 03:47:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psIpX-0002Kg-2j
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 03:47:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psIpL-0005AZ-DZ
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 03:47:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682668054;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=nqofiq6r7jJH450X2HfcM2/vH3+4MOcIEKAdTGOE/H8=;
 b=AnXoRtzfYb/myqVwAlX5evh9T9Is2K/HulCM7tYH3fFVO7Cyrmpk5IXY6HfPiaGTHcdS7l
 9ePssR5Lwh6HzyS4cLdFm/6NVt6TlGQsVHbl+Phsuv4+P9sovpxA5gbzO7yIByHt7qirWC
 XFHp2Z6lann5G/vBJmnErW86VJkufHI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-328-a0NaOLKuOLuSJJYD0GTo5A-1; Fri, 28 Apr 2023 03:47:30 -0400
X-MC-Unique: a0NaOLKuOLuSJJYD0GTo5A-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f1912ed0daso31641935e9.1
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 00:47:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682668049; x=1685260049;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nqofiq6r7jJH450X2HfcM2/vH3+4MOcIEKAdTGOE/H8=;
 b=c1UJDSsM+vWpatA/YnNKDhMNoS5NVd0QCRfgR+ifkXDNdj3yInQzz6zmY+7rM84Ooz
 fcJyHl/ZyyuPqO6C0P9hy0VWOPtMCMC6KIyD1zPdsia9W8Ue9/cKVaD6LSatiDSTp9NM
 oO8x4bvmlGp7sYOrVsORbiKwkm87u0OBrm3rafUOnYIdmkg3LJ/mgaRhuirsUWZ2vPGU
 ixwfv2g2Dzb5ObeUqgGlv4LWpyEKtC2IQnm9/OAaNDlWT0tUQhbHjQKbZ/6UBBvSXhma
 KGj/AqnFrJcE+o1NehoPI2Jn+KHCkkla3qEV/nB6PDXSaF6eFv0CORCHrB5yPIlZ2LCd
 li3w==
X-Gm-Message-State: AC+VfDzMW+URmRPVKl9rJYZ3L6cFSBmLpvpFP6IbwHxwrUjDQbEKMjYy
 A/YEaSq7FJ86eY6Cp83xMIkPA00beLOPrVHHC3FmK6gudu/kSG7QkYfTKI9I86D742+PHX1CCcg
 UPY/gCSj5k52ckDc=
X-Received: by 2002:a05:600c:24cd:b0:3f1:7006:e782 with SMTP id
 13-20020a05600c24cd00b003f17006e782mr2994134wmu.25.1682668049089; 
 Fri, 28 Apr 2023 00:47:29 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7yhW4M48FGRK2Vj3bTR/QPJqRMEdlJQiStcnUyRYikjQ2LPIvpHJJAxme38eLBgU3XBhhK3w==
X-Received: by 2002:a05:600c:24cd:b0:3f1:7006:e782 with SMTP id
 13-20020a05600c24cd00b003f17006e782mr2994118wmu.25.1682668048771; 
 Fri, 28 Apr 2023 00:47:28 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 l18-20020a05600012d200b002ceacff44c7sm20458495wrx.83.2023.04.28.00.47.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 00:47:28 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Fiona Ebner <f.ebner@proxmox.com>
Cc: Kevin Wolf <kwolf@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,  QEMU Developers
 <qemu-devel@nongnu.org>,  "open list:Block layer core"
 <qemu-block@nongnu.org>,  Michael Roth <michael.roth@amd.com>,  Fam Zheng
 <fam@euphon.net>,  Stefan Hajnoczi <stefanha@redhat.com>,  Thomas
 Lamprecht <t.lamprecht@proxmox.com>,  Peter Xu <peterx@redhat.com>
Subject: Re: QMP (without OOB) function running in thread different from the
 main thread as part of aio_poll
In-Reply-To: <b1402ecd-1288-1ceb-ce58-65fc90636fac@proxmox.com> (Fiona Ebner's
 message of "Fri, 28 Apr 2023 09:23:46 +0200")
References: <2a61b581-5a21-c945-bb98-b6863cac0c1f@proxmox.com>
 <877cu7gk1g.fsf@pond.sub.org>
 <CABgObfapoyrFhY9kna_=D7PJ4yAssTgzY3jxSZD=6v0zCGDcSA@mail.gmail.com>
 <3ba2f8b9-9818-6601-2247-7b0e20d7ab0d@proxmox.com>
 <ZEpWd+273aIVZrRV@redhat.com>
 <515e6a39-8515-b32b-05ce-6d7511779b1b@proxmox.com>
 <87zg6tbdep.fsf@secure.mitica>
 <b1402ecd-1288-1ceb-ce58-65fc90636fac@proxmox.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 28 Apr 2023 09:47:27 +0200
Message-ID: <87bkj8bg8g.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Fiona Ebner <f.ebner@proxmox.com> wrote:
> Am 27.04.23 um 16:36 schrieb Juan Quintela:
>> Fiona Ebner <f.ebner@proxmox.com> wrote:
>>> Am 27.04.23 um 13:03 schrieb Kevin Wolf:
>>>> Am 26.04.2023 um 16:31 hat Fiona Ebner geschrieben:
>>>>> Am 20.04.23 um 08:55 schrieb Paolo Bonzini:
>> 
>> Hi
>> 
>>> Our function is a custom variant of saving a snapshot and uses
>>> qemu_savevm_state_setup(), which is why the qemu_mutex_unlock_iothread()
>>> is there. I looked for inspiration for how upstream does things and it
>>> turns out that upstream QEMU v8.0.0 has essentially the same issue with
>>> snapshot-save. When snapshot_save_job_bh runs in a vCPU thread instead
>>> of the main thread, the situation is the same: after
>>> qemu_mutex_unlock_iothread(), qemu_get_current_aio_context() will return
>>> 0x0 and then the assertion in the AIO_WAIT_WHILE_INTERNAL macro fails
>>> (this time the generated coroutine wrapper is bdrv_writev_vmstate)[0].
>>>
>>>
>>> So all bottom halves scheduled for the main thread's AioContext can
>>> potentially get to run in a vCPU thread and need to be very careful with
>>> things like qemu_mutex_unlock_iothread.
>>>
>>> Is qemu_get_current_aio_context() returning 0x0 expected? I haven't
>>> looked into why it happens yet. Does there need to be a way to drop the
>>> BQL without also giving up the main thread's AioContext or would it be
>>> enough to re-acquire the context?
>>>
>>> CC-ing Juan as the migration maintainer.
>> 
>> This is the world backwards.
>> The tradition is that migration people blame block layer people for
>> breaking things and for help, not the other way around O:-)
>
> Sorry, if I didn't provide enough context/explanation. See below for my
> attempt to re-iterate. I CC'ed you, because the issue happens as part of
> snapshot-save and in particular the qemu_mutex_unlock_iothread call in
> qemu_savevm_state is one of the ingredients leading to the problem.

This was a joke O:-)

>> To see that I am understading this right:
>> 
>> - you create a thread
>> - that calls a memory_region operation
>> - that calls a device write function
>> - that calls the block layer
>> - that creates a snapshot
>> - that calls the migration code
>> - that calls the block layer again
>> 
>> Without further investigation, I have no clue what is going on here,
>> sorry.
>> 
>> Later, Juan.
>> 
>
> All I'm doing is using QEMU (a build of upstream's v8.0.0) in intended
> ways, I promise! In particular, I'm doing two things at the same time
> repeatedly:
> 1. Write to a pflash drive from within the guest.
> 2. Issue a snapshot-save QMP command (in a way that doesn't lead to an
> early error).
>
> (I actually also used a debugger to break on pflash_update and
> snapshot_save_job_bh, manually continuing until I triggered the
> problematic situation. It's very racy, because it depends on the host OS
> to switch threads at the correct time.)

I think the block layer is the problem (famous last words)

>
> Now we need to be aware of two things:
> 1. As discussed earlier in the mail thread, if the host OS switches
> threads at an inconvenient time, it can happen that a bottom half
> scheduled for the main thread's AioContext can be executed as part of a
> vCPU thread's aio_poll.
> 2. Generated coroutine wrappers for block layer functions spawn the
> coroutine and use AIO_WAIT_WHILE/aio_poll to wait for it to finish.
>
> What happens in the backtrace above is:
> 1. The write to the pflash drive uses blk_pwrite which leads to an
> aio_poll in the vCPU thread.
> 2. The snapshot_save_job_bh bottom half, that was scheduled for the main
> thread's AioContext, is executed as part of the vCPU thread's aio_poll.
> 3. qemu_savevm_state is called.
> 4. qemu_mutex_unlock_iothread is called. Now
> qemu_get_current_aio_context returns 0x0. Usually, snapshot_save_job_bh
> runs in the main thread, in which case qemu_get_current_aio_context
> still returns the main thread's AioContext at this point.

I am perhaps a bit ingenuous here, but it is there a way to convince qemu
that snapshot_save_job_bh *HAS* to run on the main thread?

> 5. bdrv_writev_vmstate is executed as part of the usual savevm setup.
> 6. bdrv_writev_vmstate is a generated coroutine wrapper, so it uses
> AIO_WAIT_WHILE.
> 7. The assertion to have the main thread's AioContext inside the
> AIO_WAIT_WHILE macro fails.

several problems here:
a- There is no "test/qtest/snapshot-test" around
   Hint, Hint.
   Basically snapshots are the bastard sibling of migration, and nobody
   really tests them.
b- In an ideal world, migration shouldn't need a bottom_handler
   Remember, it has its own thread.  But there are functions that can
   only been called from the main thread.  And no, I don't remember
   which, I just try very hard not to touch that part of the code.
c- At that point the vcpus are stopped, for migration it doesn't matter
   a lot(*) to have to use a bottom handler.
d- snapshots are a completely different beast, that don't really stop
   the guest in the same way at that point, and sometimes it shows in
   this subtle details.

I am sorry that I can't be of more help.  I still think that the block
layer people should have a clue at what is going on here.

Later, Juan.

*: That is not completely true.  There is no way to get back from the
   bottom handler to the iterative stage of migration.  If something
   happens at that point, we just have to cancel migration. But we will
   left this discussion for another day.


