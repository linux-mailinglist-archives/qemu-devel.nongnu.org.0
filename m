Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9E369D954
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 04:40:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUJUE-0004FR-Lp; Mon, 20 Feb 2023 22:38:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pUJUA-0004Ed-QS
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 22:38:35 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pUJU8-0005Dw-0f
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 22:38:34 -0500
Received: by mail-pg1-x52f.google.com with SMTP id p6so1700706pga.0
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 19:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=57EPRyhSAvwNrMatG2fZSwAoKOSs5zMEG2PQnlehsWY=;
 b=zOzijMHHcEuG2QPkQHAa/nCJErQk7XzNZsB2HZjrx4TnVOgi2r5ipmzy/BHrTaImQh
 KrN2ukzVRuVfPJVXjcuy/hKUkZ4IooQlH364WqQeJF04KGCKGjzXGNbsxd2Oue5qVxHi
 luWkAmAW9Y0DkFEXLZxUrAJK5EwUP0O+uCqdPqIM3ZUQZrYMWmzPx8Jsfg/E8a99l6lY
 bwDc2DHplKR1Tj8Wkfe6/N7ihShSYAFfzL5rRpL6ws8s3tKYJUyitzHiAQFWhYIkKbOW
 CLwX3pHMoU3DhsvT/x9iRWnAddyAt2lZwCfN5mZsNx/e2klfIDJ8k5Ccc+reVd/LAwYt
 yMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=57EPRyhSAvwNrMatG2fZSwAoKOSs5zMEG2PQnlehsWY=;
 b=dG0ceLW93T63GW4DGCRc8vom7hr5k2SU0ti99E5wtMglOMHqlIsbYN0T3J9CBfMJAj
 PfXyKkTE/0A7U4tVHAj1Q/sB5Rww1ZgTbENgrBWeXju310gac6H0VfPaan/7HV7/Ucew
 fN7xMCGfyPMI89Qz+zf9s3As0Wc+2bir9T2yZkQISgvTd7+Dz20pbO3NZmANSpMLv15X
 Jlqq8fTH4nB32g+MVwNL2F5dUEuDfMhDt51F3whSwOv4PsTBQsrcpRiXf6/0FNjTf/Xl
 7FSIUp2xU6SHTZ18ZiDL0s6DxSFuSUyEqOkjyuA7/Iez2lxWT1tdII07dVFB6dmk4pHc
 CMNA==
X-Gm-Message-State: AO0yUKXuZPMaoqiQvhhl5hjIcfYe1HY4AKDwIk6qwQMbNjfQbc0lI5Rf
 P2uW/8lEmDSS0nGzVBGdUpbMkQ==
X-Google-Smtp-Source: AK7set8t9v4b9vqrdy0oCx/MAtgsOg3xO4bE+sqYpckzjlyaAQmD7tKyq7/sYtTuLU+ULy8xALaPRA==
X-Received: by 2002:a62:1605:0:b0:5a8:ba8d:8040 with SMTP id
 5-20020a621605000000b005a8ba8d8040mr3990203pfw.23.1676950709093; 
 Mon, 20 Feb 2023 19:38:29 -0800 (PST)
Received: from [10.94.53.13] ([139.177.225.249])
 by smtp.gmail.com with ESMTPSA id
 a10-20020a65654a000000b005022111ab31sm1318845pgw.71.2023.02.20.19.38.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 19:38:28 -0800 (PST)
Message-ID: <76a253ef-6989-f92d-cb33-6456a270a8d1@bytedance.com>
Date: Tue, 21 Feb 2023 11:38:23 +0800
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
From: Chuang Xu <xuchuangxclwt@bytedance.com>
In-Reply-To: <Y++i1NmxUxOPDM/V@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001,
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

It seems that there is a problem with the code format in my last email.
I adjusted the format and resend this to you. Hope the format of this
email won't be wrong again..  :)

On 2023/2/17 下午11:52, Peter Xu wrote:
> Hello, Chuang,
>
> On Fri, Feb 17, 2023 at 04:11:19PM +0800, Chuang Xu wrote:
>> Error 1 was triggered by our sanity check. I try to add RCU_READ_LOCK_GUARD()
>> in address_space_init() and it works. But I'm not sure if this code change is
>> appropriate. If this change is not appropriate, we may need to consider other
>> sanity check.
> I'd suggest not adding RCU locks without a good reason.
>
> address_space_init() is definitely a special context because the AS is
> exclusively owned by the caller before it returns.  It means no RCU
> protection needed at all because no one else is touching it; neither do we
> need qatomic_rcu_read() when read.
>
> So I suggest we directly reference current_map, even though that'll need a
> rich comment:
>
>   static void address_space_set_flatview(AddressSpace *as)
>   {
> -    FlatView *old_view = address_space_to_flatview(as);
> +    /*
> +     * NOTE: we don't use RCU flavoured of address_space_to_flatview()
> +     * because we exclusively own as->current_map here: it's either during
> +     * init of an address space, or during commit() with BQL held.
> +     */
> +    FlatView *old_view = as->current_map;
>
> We can have address_space_to_flatview_raw() but since we'll directly modify
> as->current_map very soon in the same function, so may not even bother.
I agree with you.

But now I am facing a new problem. Our sanity check is not as reliable 
as we think.

Although my current code can pass all the tests that Juan told me in the 
email.
But if I configure with nothing and run 'make check', My patch triggers 
error
in ahci migrate test:

G_TEST_DBUS_DAEMON=/data00/migration/qemu-open/tests/dbus-vmstate-daemon.sh
QTEST_QEMU_BINARY=./qemu-system-x86_64 QTEST_QEMU_IMG=./qemu-img
MALLOC_PERTURB_=1
QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon
/data00/migration/qemu-open/build/tests/qtest/ahci-test --tap -k
―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 

✀
―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 

stderr:
qemu-system-x86_64: AHCI: Failed to start FIS receive engine: bad FIS
receive buffer address
qemu-system-x86_64: Failed to load ich9_ahci:ahci
qemu-system-x86_64: error while loading state for instance 0x0 of device
'0000:00:1f.2/ich9_ahci'
qemu-system-x86_64: load of migration failed: Operation not permitted
Migration did not complete, status: failed

It seems that ahci_state_post_load() will call memory_access_is_direct()
and access mr->ram. Due to mr transaction delay, this value doesn't meet
expectations. And Here is the call chain for you to read the code:
->ahci_state_post_load
->ahci_cond_start_engines
->ahci_map_fis_address
->map_page
->dma_memory_map
->address_space_map
->memory_access_is_direct


I think we need a memory_region_transaction_commit_force() to force commit
some transactions when load vmstate. This function is designed like this:

/*
  * memory_region_transaction_commit_force() is desgined to
  * force the mr transaction to be commited in the process
  * of loading vmstate.
  */
void memory_region_transaction_commit_force(void)
{
     AddressSpace *as;
     unsigned int memory_region_transaction_depth_copy = 
memory_region_transaction_depth;

     /*
      * Temporarily replace memory_region_transaction_depth with 0 to 
prevent
      * memory_region_transaction_commit_force() and 
address_space_to_flatview()
      * call each other recursively.
      */
     memory_region_transaction_depth = 0;

     assert(qemu_mutex_iothread_locked());


     if (memory_region_update_pending) {
         flatviews_reset();

         MEMORY_LISTENER_CALL_GLOBAL(begin, Forward);

         QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
             address_space_set_flatview(as);
             address_space_update_ioeventfds(as);
         }
         memory_region_update_pending = false;
         ioeventfd_update_pending = false;
         MEMORY_LISTENER_CALL_GLOBAL(commit, Forward);
     } else if (ioeventfd_update_pending) {
         QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
             address_space_update_ioeventfds(as);
         }
         ioeventfd_update_pending = false;
     }

     /* recover memory_region_transaction_depth */
     memory_region_transaction_depth = 
memory_region_transaction_depth_copy;
}

Now there are two options to use this function:
1. call it in address_space_to_flatview():

static inline FlatView *address_space_to_flatview(AddressSpace *as)
{
     /*
      * Before using any flatview, check whether we're during a memory
      * region transaction. If so, force commit the memory region 
transaction.
      */
     if (memory_region_transaction_in_progress())
         memory_region_transaction_commit_force();
     return qatomic_rcu_read(&as->current_map);
}

2. call it before each post_load()

I prefer to use the former one, it is more general than the latter.
And with this function, the sanity check is not necessary any more.
Although we may inevitably call memory_region_transaction_commit_force()
several times, in my actual test, the number of calls to
memory_region_transaction_commit_force() is still insignificant compared
with the number of calls to memory_region_transaction_commit() before
optimization. As a result, This code won't affect the optimization effect,
but it can ensure reliability.
>> Error 2 was related to postcopy. I read the official document of postcopy
>> (I hope it is the latest) and learned that two threads will call
>> qemu_loadvm_state_main() in the process of postcopy. The one called by main thread
>> will take the BQL, and the one called by ram_listen thread won't take the BQL.
>> The latter checks whether the BQL is held when calling memory_region_transaction_commit(),
>> thus triggering the assertion. Creating a new function qemu_loadvm_state_ram_listen()
>> without memory_region_transaction_commit() will solve this error.
> Sounds right, because the whole qemu_loadvm_state_main() process shouldn't
> load any device state or anything that requires BQL at all; in most cases
> that should be only RAM states leftovers.
>
> I think we only want to optimize precopy but not the postcopy phase. Note!
> it should include the phase when transferring precopy -> postcopy too, so
> it's covering postcopy, just not covering the "post" phase of migration -
> if you see that's a nested call to qemu_loadvm_state_main() with a whole
> MIG_CMD_PACKAGED package which is actually got covered, which is the real
> meat for postcopy on device transitions.
>
> So in short: instead of creating qemu_loadvm_state_ram_listen(), how about
> modifying your patch 3, instead of changing inside qemu_loadvm_state_main()
> we can do that for qemu_loadvm_state() only (so you can wrap the begin()
> and commit() over qemu_loadvm_state_main() there)?
In Patch v6 I'll adopt the change you suggested, Thanks!
>> I don't know if you suggest using this patch in postcopy. If this patch is applicable to
>> postcopy, considering the difference between how postcopy and precheck load device state,
>> do we need to consider more details?
> See above.  Yes I definitely hope postcopy will be covered too.
>
> Thanks!
>

