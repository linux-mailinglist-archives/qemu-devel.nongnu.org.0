Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 174CF69EEC1
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 07:29:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUibz-0000my-6N; Wed, 22 Feb 2023 01:28:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pUibv-0000mm-1v
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 01:28:15 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pUibs-0000ky-A1
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 01:28:14 -0500
Received: by mail-pj1-x102f.google.com with SMTP id y2so3435993pjg.3
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 22:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EHvOvTBQt47/qGfeGo3M2Zp0KFz+SpUXbTJIcIhSFdo=;
 b=CPlFcrvakhsLI11+UXROfPGIGQeJ684YvouSrp+B3gYUQ3fyT+tIykh0E79OZPX3+t
 BFZktEzBSz7EGQaU8Nyne7mB8Ni+aWcYD8nWSPlmJgOTAOFk4FlCKM7K97cFEQZKh3yR
 P8dwe1GRc+bqAyFwkHU+znhopmVwFHVFtUf9BM3G4aC6hCxr2SDMIRWjdSTAguo0gn0j
 Js/nP09Q2sBhMDE5DZituhsbbnr13Il9qGGwvqjeg+GOWSb718xQMGgufNS/ayz+mZvi
 hPNmSh/hxg08iYFU5Iu0WwRG4jlYUkcPwWSQ0vAOx38BriMgE7SjPXAJQm0iE3Qt5iw2
 5FwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=EHvOvTBQt47/qGfeGo3M2Zp0KFz+SpUXbTJIcIhSFdo=;
 b=HyC/2VK410LiVACEt7Cv8LK/uF+eDrAe1wVp7wM/gCRvwp5jitb1yZ2j0c+cbCff/q
 EHK4cytW809PJukZvfLNx6X0p0Dq+c2zCY1NarNXZVk0OZ88DyM3dvSMPCCraOVibN7F
 g299ZdTnt+h7+YX5jT+F8q61MQcCBV9f3TOK2892DRl1Psx7I/C+0jbdh3dkqk0IsGWK
 U6VL3+dynG4YQIHn7e6YXBGBxX80JaJM4mIo9NXeNtU9s4I7/2ObATUyllJHI1ffOC1o
 LDsBIfAPOj+PJgbIanjNDw4TQwY0iJW2sV95tPGZCk+ccH2w1+vLUUcJifTnMdfJvHoz
 n+lw==
X-Gm-Message-State: AO0yUKW3DrBmjOgReVndoNU/YYR/HvqzpGi2p4IajcBlAPdbYjZbaNEI
 mDMCCL3CQn/blEdlgjlKVYeIdA==
X-Google-Smtp-Source: AK7set8NvY4J6QJh/Ua/LpKZD36zAnUh2tx7P7Nf4vjJKU5kyoiE04jwifR2f5Ly87uEIUZRAfdEuA==
X-Received: by 2002:a17:902:d487:b0:19a:a6c4:6403 with SMTP id
 c7-20020a170902d48700b0019aa6c46403mr9642535plg.1.1677047281182; 
 Tue, 21 Feb 2023 22:28:01 -0800 (PST)
Received: from [10.94.53.13] ([139.177.225.249])
 by smtp.gmail.com with ESMTPSA id
 y9-20020a170902ed4900b0019c91d3bdb4sm2596848plb.304.2023.02.21.22.27.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 22:28:00 -0800 (PST)
Message-ID: <44f02b6f-2809-5e2d-bbc4-e4a43a4a8b75@bytedance.com>
Date: Wed, 22 Feb 2023 14:27:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC v5 0/3] migration: reduce time of loading non-iterable
 vmstate
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com
References: <20230117115511.3215273-1-xuchuangxclwt@bytedance.com>
 <877cwizqvy.fsf@secure.mitica>
 <a555b989-27be-006e-0d00-9f1688c5be4e@bytedance.com>
 <abcb08b7-460c-d88c-af48-c1d256f89c54@bytedance.com> <Y++i1NmxUxOPDM/V@x1n>
 <76a253ef-6989-f92d-cb33-6456a270a8d1@bytedance.com>
 <51d862b2-96be-0b93-7ed2-fcd15ffaa76e@bytedance.com> <Y/UrXwRK7rB2KRKO@x1n>
From: Chuang Xu <xuchuangxclwt@bytedance.com>
In-Reply-To: <Y/UrXwRK7rB2KRKO@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hi, Peter

On 2023/2/22 上午4:36, Peter Xu wrote:
>> On 2023/2/21 上午11:38, Chuang Xu wrote:
>>> I think we need a memory_region_transaction_commit_force() to force
>>> commit
>>> some transactions when load vmstate. This function is designed like this:
>>>
>>> /*
>>>   * memory_region_transaction_commit_force() is desgined to
>>>   * force the mr transaction to be commited in the process
>>>   * of loading vmstate.
>>>   */
>>> void memory_region_transaction_commit_force(void)
> I would call this memory_region_transaction_do_commit(), and I don't think
> the manipulation of memory_region_transaction_depth is needed here since we
> don't release BQL during the whole process, so changing that depth isn't
> needed at all to me.
>
> So, I think we can...
>
>>> {
>>>      AddressSpace *as;
>>>      unsigned int memory_region_transaction_depth_copy =
>>> memory_region_transaction_depth;
>>>
>>>      /*
>>>       * Temporarily replace memory_region_transaction_depth with 0 to
>>> prevent
>>>       * memory_region_transaction_commit_force() and
>>> address_space_to_flatview()
>>>       * call each other recursively.
>>>       */
>>>      memory_region_transaction_depth = 0;
> ... drop here ...

Note that as I mentioned in the comment, we temporarily replace this value
to prevent commit() and address_space_to_flatview() call each other recursively,
and eventually stack overflow.

Part of the coredump call stack is attached here:

#8  0x0000558de5a998b5 in memory_region_transaction_do_commit () at ../softmmu/memory.c:1131
#9  0x0000558de5a99dfd in address_space_to_flatview (as=0x558de6516060 <address_space_memory>) at /data00/migration/qemu-open/include/exec/memory.h:1130
#10 address_space_get_flatview (as=as@entry=0x558de6516060 <address_space_memory>) at ../softmmu/memory.c:810
#11 0x0000558de5a9a199 in address_space_update_ioeventfds (as=as@entry=0x558de6516060 <address_space_memory>) at ../softmmu/memory.c:836
#12 0x0000558de5a99900 in memory_region_transaction_do_commit () at ../softmmu/memory.c:1137
#13 memory_region_transaction_do_commit () at ../softmmu/memory.c:1125
#14 0x0000558de5a99dfd in address_space_to_flatview (as=0x558de6516060 <address_space_memory>) at /data00/migration/qemu-open/include/exec/memory.h:1130
#15 address_space_get_flatview (as=as@entry=0x558de6516060 <address_space_memory>) at ../softmmu/memory.c:810
#16 0x0000558de5a9a199 in address_space_update_ioeventfds (as=as@entry=0x558de6516060 <address_space_memory>) at ../softmmu/memory.c:836
#17 0x0000558de5a99900 in memory_region_transaction_do_commit () at ../softmmu/memory.c:1137
#18 memory_region_transaction_do_commit () at ../softmmu/memory.c:1125
#19 0x0000558de5a99dfd in address_space_to_flatview (as=0x558de6516060 <address_space_memory>) at /data00/migration/qemu-open/include/exec/memory.h:1130
#20 address_space_get_flatview (as=as@entry=0x558de6516060 <address_space_memory>) at ../softmmu/memory.c:810
#21 0x0000558de5a9a199 in address_space_update_ioeventfds (as=as@entry=0x558de6516060 <address_space_memory>) at ../softmmu/memory.c:836
#22 0x0000558de5a99900 in memory_region_transaction_do_commit () at ../softmmu/memory.c:1137
#23 memory_region_transaction_do_commit () at ../softmmu/memory.c:1125
#24 0x0000558de5a99dfd in address_space_to_flatview (as=0x558de6516060 <address_space_memory>) at /data00/migration/qemu-open/include/exec/memory.h:1130

So I think we need to change the depth here.

>
>>>      assert(qemu_mutex_iothread_locked());
>>>
>>>
>>>      if (memory_region_update_pending) {
>>>          flatviews_reset();
>>>
>>>          MEMORY_LISTENER_CALL_GLOBAL(begin, Forward);
>>>
>>>          QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
>>>              address_space_set_flatview(as);
>>>              address_space_update_ioeventfds(as);
>>>          }
>>>          memory_region_update_pending = false;
>>>          ioeventfd_update_pending = false;
>>>          MEMORY_LISTENER_CALL_GLOBAL(commit, Forward);
>>>      } else if (ioeventfd_update_pending) {
>>>          QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
>>>              address_space_update_ioeventfds(as);
>>>          }
>>>          ioeventfd_update_pending = false;
>>>      }
>>>
>>>      /* recover memory_region_transaction_depth */
>>>      memory_region_transaction_depth =
>>> memory_region_transaction_depth_copy;
> ... drop here ...
>
>>> }
> ... then call this new memory_region_transaction_do_commit() in
> memory_region_transaction_commit().
>
> void memory_region_transaction_commit(void)
> {
>      AddressSpace *as;
>
>      assert(memory_region_transaction_depth);
>      --memory_region_transaction_depth;
>      memory_region_transaction_do_commit();
> }
>
> Then...
>
>>> Now there are two options to use this function:
>>> 1. call it in address_space_to_flatview():
>>>
>>> static inline FlatView *address_space_to_flatview(AddressSpace *as)
>>> {
>>>      /*
>>>       * Before using any flatview, check whether we're during a memory
>>>       * region transaction. If so, force commit the memory region
>>> transaction.
>>>       */
>>>      if (memory_region_transaction_in_progress())
>> Here we need to add the condition of BQL holding, or some threads without
>> BQL held running here will trigger the assertion in
>> memory_region_transaction_commit_force().
>>
>> I'm not sure whether this condition is sufficient, at least for the mr access
>> in the load thread it is sufficient (because the load thread will hold the BQL
>> when accessing mr). But for other cases, it seems that we will return to
>> our discussion on sanity check..
> Yes, I think the sanity checks are actually good stuff.
>
> I would think it's nice to impl address_space_to_flatview() like this.  I
> guess we don't have an use case to fetch the flatview during a memory
> update procedure, but I also don't see why it can't be supported.
>
> /* Need to be called with either BQL or RCU read lock held */
> static inline FlatView *address_space_to_flatview(AddressSpace *as)
> {
>      if (qemu_mutex_iothread_locked()) {
>          /* We exclusively own the flatview now.. */
>          if (memory_region_transaction_in_progress()) {
>              /*
>               * Fetch the flatview within a transaction in-progress, it
>               * means current_map may not be the latest, we need to update
>               * immediately to make sure the caller won't see obsolete
>               * mapping.
>               */
>              memory_region_transaction_do_commit();
>          }
>
>          /* No further protection needed to access current_map */
>          return as->current_map;
>      }
>
>      /* Otherwise we must have had the RCU lock or something went wrong */
>      assert(rcu_read_is_locked());
>
>      return qatomic_rcu_read(&as->current_map);
> }
>
> Then IIUC everything should start to run normal again, with the same hope
> that it will keep the benefit of your whole idea.  Does that look sane to
> you?
>
Yes, I mostly agree with you, except for the part about transaction_depth.

Thanks!



