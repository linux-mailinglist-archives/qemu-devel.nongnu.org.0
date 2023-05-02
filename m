Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BBB6F41A6
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 12:31:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptnHN-0005Jm-IW; Tue, 02 May 2023 06:30:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ptnHE-0005Hy-VW
 for qemu-devel@nongnu.org; Tue, 02 May 2023 06:30:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ptnHC-0008EX-AI
 for qemu-devel@nongnu.org; Tue, 02 May 2023 06:30:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683023429;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=CrY0ZDZvt0/aGiUF4oDTw+ksuRBBVjq9NZFqJhtF7MU=;
 b=jCNTJAy8GT55S5YphNZT8ToQv1hMPBtYwOFEv5RZXh0Za2fsUd7tbbOVcGJl1dI1MrEtoQ
 nMR3A1OBG9zqJ9lOHjzRiuX9FxdsyYHE2EkKRerfp7jBfrztsi9cIyjEACxVC0VdDQ2rNw
 Ge+a6bFJIVvOIU55aWnJv/hJMqXDyjA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-352-TvbrJlaANIGNxFLsbcxxRw-1; Tue, 02 May 2023 06:30:28 -0400
X-MC-Unique: TvbrJlaANIGNxFLsbcxxRw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f16f50aeb5so11435345e9.3
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 03:30:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683023427; x=1685615427;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CrY0ZDZvt0/aGiUF4oDTw+ksuRBBVjq9NZFqJhtF7MU=;
 b=j3teHgd+s/LTAe93h+AhonowV5QYN5szjfZZA3fGKwxUnwPrGhnjtaKkWxzDF1pCRe
 bgpKx3h5nuRdPoYvx4j81xxiYNCYDBu5m7EugJIif/3JjuMXkmKWpVdSjVFqdznsKg7Z
 f/Yve64TOyaFxcM/2HzARvvTM4DLrk0inloAxSNmB6K2qjXZm9SgzMyaiGBK3MWFOLTQ
 pMyTvKWJ7crfIF+8fHRHjjQaIi8mPM0fVLttMa8O2bLaO8i1y+JF8c2ztt5nGxB9xVQm
 nSFRfVumyt7FIOoKsnM0mmsXnXzxQ/ZYZ0+HOl4whJljRvyz3br40AJ6kQQol+GSpLQV
 qdXA==
X-Gm-Message-State: AC+VfDyWGBDfwuPzKxWoupClYHz7qk7+AYQWFxD0DaX7cJUWYwTdkGhl
 ocSgZveXOkKyq6ppRQc0LfFCjYMR5p7npHNGMmVBH07J9+3STmzl/ap63XSl0eT7w9v0Jw4Mhlj
 jRWB67E2JwkhgKaA=
X-Received: by 2002:a05:600c:24cd:b0:3f1:92e8:a6fe with SMTP id
 13-20020a05600c24cd00b003f192e8a6femr12306663wmu.31.1683023426943; 
 Tue, 02 May 2023 03:30:26 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7J/gvsTboaCjFp8oPyZkcTuVg1GPrIOXV6xzyXkj+IHEASTJJW9yl5GSJpc7EOZ3h+b2GFfA==
X-Received: by 2002:a05:600c:24cd:b0:3f1:92e8:a6fe with SMTP id
 13-20020a05600c24cd00b003f192e8a6femr12306641wmu.31.1683023426635; 
 Tue, 02 May 2023 03:30:26 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 t24-20020a1c7718000000b003f3195be0a0sm15267779wmi.31.2023.05.02.03.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 03:30:26 -0700 (PDT)
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
In-Reply-To: <df3b995e-884c-8e3c-e0cf-b720ff4fff56@proxmox.com> (Fiona Ebner's
 message of "Tue, 2 May 2023 12:03:41 +0200")
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
 <df3b995e-884c-8e3c-e0cf-b720ff4fff56@proxmox.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 02 May 2023 12:30:25 +0200
Message-ID: <87v8hbt48u.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
> Am 28.04.23 um 18:54 schrieb Juan Quintela:
>> Kevin Wolf <kwolf@redhat.com> wrote:
>>> Am 28.04.2023 um 10:38 hat Juan Quintela geschrieben:
>>>> Kevin Wolf <kwolf@redhat.com> wrote:
>>>>>> I am perhaps a bit ingenuous here, but it is there a way to convince
>>>>>> qemu that snapshot_save_job_bh *HAS* to run on the main thread?
>>>>>
>>>>> I believe we're talking about a technicality here. I asked another more
>>>>> fundamental question that nobody has answered yet:
>>>>>
>>>>> Why do you think that it's ok to call bdrv_writev_vmstate() without
>>>>> holding the BQL?
>>>>
>>>> I will say this function starts by bdrv_ (i.e. block layer people) and
>>>> endes with _vmstate (i.e. migration people).
>>>>
>>>> To be honest, I don't know.  That is why I _supposed_ you have an idea.
>>>
>>> My idea is that bdrv_*() can only be called when you hold the BQL, or
>>> for BlockDriverStates in an iothread the AioContext lock.
>>>
>>> Apparently dropping the BQL in migration code was introduced in Paolo's
>>> commit 9b095037527.
>> 
>> Damn.  I reviewed it, so I am as guilty as the author.
>> 10 years later without problems I will not blame that patch.
>> 
>> I guess we changed something else that broke doing it without the lock.
>> 
>> But no, I still don't have suggestions/ideas.
>>
>
> I do feel like the issue might be very difficult to trigger under normal
> circumstances. Depending on the configuration and what you do in the
> guest, aio_poll in a vCPU thread does not happen often and I imagine
> snapshot-save is also not a super frequent operation for most people. It
> still takes me a while to trigger the issue by issuing lots of pflash
> writes and running snapshot-save in a loop, I'd guess about 30-60
> snapshots. Another reason might be that generated co-wrappers were less
> common in the past?

May I suggest that you add a test in migration-test (or ever better
create snapshot-test, hint, hint!) if you ever find a way to reproduce
it.

>>> I'm not sure what this was supposed to improve in
>>> the case of snapshots because the VM is stopped anyway.
>
> Is it? Quoting Juan:> d- snapshots are a completely different beast,
> that don't really stop
>>    the guest in the same way at that point, and sometimes it shows in
>>    this subtle details.

Exhibit A:

qemu/migration/migration.c:migration_thread()

Exhibit B:

qemu/migration/savevm.c:qemu_savevm_state()

They both call (from a 10000feet view):

qemu_savevm_state_header()
qemu_savevm_state_setup()
qemu_savevm_iterate()
qemu_savevm_state_cleanup()

But there are subtle details in the middle that are different in both
places, and historically we have forgotten to add fixes to
qemu_savevm_state() (principally because almost nobody uses it, compared
with migration) and because on upstream we test with migration-test,
several advocado tests for migration, and we do the same for Enterprise
distros.  As said before, snapshots are the bastard child of migration,
they are there, but nobody look at them.

I tried in the past to merge both code paths, but as said, the
differences are tricky and subtle and I never finished that project.

>>> Would anything bad happen if we removed the BQL unlock/lock section in
>>> qemu_savevm_state() again?
>> 
>> Dunno.
>> 
>> For what is worth, I can say that it survives migration-test, but don't
>> ask me why/how/...
>> 
>> Fiona, can you check if it fixes your troubles?
>> 
>
> Just removing the single section in qemu_savevm_state() breaks even the
> case where snapshot_save_job_bh() is executed in the main thread,
> because ram_init_bitmaps() will call qemu_mutex_lock_iothread_impl()
> which asserts that it's not already locked.
>
> Also removing the lock/unlock pair in ram_init_bitmaps() seems to work.
> But I'm not sure what else a full semantic revert of commit 9b095037527
> would entail.

I have no idea.

I will let Paolo to answer this one.

I can guess this was a solution to improve coroutines or rcu or
whatever, but I don't remember the details.

Later, Juan.


