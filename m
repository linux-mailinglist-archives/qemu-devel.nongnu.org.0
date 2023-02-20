Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4393869CC31
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 14:38:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU6LY-0000af-VQ; Mon, 20 Feb 2023 08:36:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pU6LU-0000aA-QR
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 08:36:44 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pU6LS-0002KB-2P
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 08:36:44 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 f9-20020a17090a9b0900b00236679bc70cso2033623pjp.4
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 05:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zsjUpnKz/M5ZM7vM3XqrtqEwCN5MIfQG/YGmt7dXc9U=;
 b=w1rs8swxhWg/y2oVsFjGJxV576Iw9adO5HlLRi069PReW3R1RNMeW0FYaJhb1koyBB
 CIJCHnSCiUOsBorDh+c8dHv07Lt2Pd5OfSqLmFEBI0kv8DADyF7itzlsOCQb4bV6edl+
 +AXKl5Lf6WewPJKYPpg7wshnZ8Iy5/uidBa6pLtqe6pYLOeTV0sDryTvZUlPD3PBc8pL
 RWNkCbUWWyNQjo4GHE38GDb9wPQb864V7EyqwtN4uGfGftHa+e/biq6CgAoCR+tOslVz
 DGp4fG2FT7zAY++x1ZImaZnpJrJkOBkriYlG7e5pfWP+Lqc+IJrypiiEKVN3ELmwREB+
 jBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zsjUpnKz/M5ZM7vM3XqrtqEwCN5MIfQG/YGmt7dXc9U=;
 b=UirnVcyjM+L0OQP/0m4dpMb2ehDnmr+WJI5PkW+5ENZ+HqwLnX3w7K29RsJTIVCRcU
 2ISuxd6JHZsSP+FstZAtjcFc4Nm16ckW2+/Dku5b6wvCxC9MAH7W7Gjd+BUkuiIQQ0gG
 cjY9/33v9C+fh9sbsWonwQnz20gzN58h4rKlpOykgnq/t6vx6QpQfeBH447uHdAUpET4
 XR4Z8zyrJ7HMRc0+v6j2AJPI/KLiKedGJOZ4437SNM01Uhso2YOp2tCr0C4kZgbgZkN2
 EDTpvUHB+BPTlByutgNRFiz0PdkPLkkcRigK6nIqNs9UuO7PtNo3AeaFTyckxNF8oKDj
 cH8w==
X-Gm-Message-State: AO0yUKX9HhY4e1ojiin+cHWncM6GCum6qLT6HK5XHcRiJfx6N8ORvJ60
 8M9z+jpi+5e1EuHLTb4hTjf4/A==
X-Google-Smtp-Source: AK7set/vUos5WHu2imCdmutOVDL2HQ7JaaOE3+v1om5FrGRZXRrC8+8VoZPgqrQ55VwoS8csQUf9lg==
X-Received: by 2002:a17:902:c40d:b0:19a:8284:83a2 with SMTP id
 k13-20020a170902c40d00b0019a828483a2mr2682110plk.10.1676900196764; 
 Mon, 20 Feb 2023 05:36:36 -0800 (PST)
Received: from [10.94.53.13] ([139.177.225.233])
 by smtp.gmail.com with ESMTPSA id
 ja4-20020a170902efc400b001948ff5cc32sm7341947plb.215.2023.02.20.05.36.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 05:36:36 -0800 (PST)
Message-ID: <8c0fe4e9-2df0-9340-06aa-d01f9bc215d4@bytedance.com>
Date: Mon, 20 Feb 2023 21:36:31 +0800
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pj1-x1036.google.com
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

But now I am facing a new problem. Our sanity check is not as reliable as we think.

Although my current code can pass all the tests that Juan told me in the email.
But if I configure with nothing and run 'make check', My patch triggers
error in ahci migrate test:

G_TEST_DBUS_DAEMON=/data00/migration/qemu-open/tests/dbus-vmstate-daemon.sh QTEST_QEMU_BINARY=./qemu-system-x86_64 QTEST_QEMU_IMG=./qemu-img MALLOC_PERTURB_=1 QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon /data00/migration/qemu-open/build/tests/qtest/ahci-test --tap -k
―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― ✀  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
stderr:
qemu-system-x86_64: AHCI: Failed to start FIS receive engine: bad FIS receive buffer address
qemu-system-x86_64: Failed to load ich9_ahci:ahci
qemu-system-x86_64: error while loading state for instance 0x0 of device '0000:00:1f.2/ich9_ahci'
qemu-system-x86_64: load of migration failed: Operation not permitted
Migration did not complete, status: failed

It seems that ahci_state_post_load() will call memory_access_is_direct() and access mr->ram.
Due to mr transaction delay, this value doesn't meet expectations.
And Here is the call chain for you to read the code:
->ahci_state_post_load
->ahci_cond_start_engines
->ahci_map_fis_address
->map_page
->dma_memory_map
->address_space_map
->memory_access_is_direct

I think we need a memory_region_transaction_commit_force() to force commit
some transactions when load vmstate. This function is designed like this:

|
/* memory_region_transaction_commit_force() is desgined to * force the 
mr transaction to be commited in the process * of loading vmstate. */ 
void memory_region_transaction_commit_force(void) { AddressSpace *as; 
unsigned int memory_region_transaction_depth_copy = 
memory_region_transaction_depth; /* Temporarily replace 
memory_region_transaction_depth with 0 to prevent * 
memory_region_transaction_commit_force() and address_space_to_flatview() 
* call each other recursively. */ memory_region_transaction_depth = 0; 
assert(qemu_mutex_iothread_locked()); if (memory_region_update_pending) 
{ flatviews_reset(); MEMORY_LISTENER_CALL_GLOBAL(begin, Forward); 
QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) { 
address_space_set_flatview(as); address_space_update_ioeventfds(as); } 
memory_region_update_pending = false; ioeventfd_update_pending = false; 
MEMORY_LISTENER_CALL_GLOBAL(commit, Forward); } else if 
(ioeventfd_update_pending) { QTAILQ_FOREACH(as, &address_spaces, 
address_spaces_link) { address_space_update_ioeventfds(as); } 
ioeventfd_update_pending = false; } /* recover 
memory_region_transaction_depth */ memory_region_transaction_depth = 
memory_region_transaction_depth_copy; }
Now there are two options to use this function:
1. call it in address_space_to_flatview():

|
static inline FlatView *address_space_to_flatview(AddressSpace *as) {
/* * Before using any flatview, check whether we're during a memory * 
region transaction. If so, force commit the memory transaction. */
if (memory_region_transaction_in_progress()) 
memory_region_transaction_commit_force();
return qatomic_rcu_read(&as->current_map); }
2. call it before each post_load()
I prefer to use the former one, it is more general than the latter.
And with this function, the sanity check is not necessary any more.
Although we may inevitably call 
memory_region_transaction_commit_force()||||
several times, in my actual test, the number of calls to ||
|memory_region_transaction_commit_force|() is still insignificant compared
with the number of calls to|memory_region_transaction_commit()| before
optimization. As a result, This code won't affect the optimization effect,
but it can ensure reliability. |

|

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

