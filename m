Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F4469A6AB
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 09:12:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSvqH-0001pE-Ag; Fri, 17 Feb 2023 03:11:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pSvq8-0001oq-DY
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 03:11:33 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1pSvq5-00080m-I6
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 03:11:32 -0500
Received: by mail-pg1-x531.google.com with SMTP id m13so195074pgq.12
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 00:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gQfnfoDWEJZU3HI37vwBGKVxRvuy8YfKku6N4JhSsNM=;
 b=XxS6j0fciqXseZn62m4sifFKNDeGJLhr+eQLOoaylDz0FJkkwnn2e0malQPuJdSxvQ
 tugeycqwiNEQqGnd5XRjBa4WHFuRl8CuERU8zD/gYgeOIxaR0w5UyKkDCsbFtfMXGZE7
 flRYZ+pcMV0tO5h8h/kcImO59MPvI5DwwxJlaZE4BKZBi4o8lNHqtJagrwTCvuSjf+YE
 gZGVZuK3l+mf94TE+kp5nRvjQ6r90INI8mcJtLpZMh0tN8flu2qJvXjcerC51dJ5dbZ+
 EGL5dKTpsqTfvh64DPQ+nPsew/g7bkPFgOJ1a6KcCrVrvkbqDqscdmt6Y/RJIYNkvNSm
 HG9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=gQfnfoDWEJZU3HI37vwBGKVxRvuy8YfKku6N4JhSsNM=;
 b=rG1ykBwnhripk0Nzc9Ow1Kj5/DLSZ5pvYDl3iOVwvm+mD9/KGDh8mzLUs8eibkUeoR
 iFLEFevqDuw9ABZBnC1/UOSbebz9kEyqBVQzn6BfYDUFIstPOiOv/+3xqpZQ/BJpbs5I
 FlUce73hXSJ1g+JCpwEVBG0Id1vNQCznH5huODDhrPhSxwJisbD7E2Ontvf68ZKkiTPq
 pLM8p/lcqNC2LSu+fXz1ZcLrQ+L5FoE5icXP4tw3NcISkLRi5OW/KVzG1A/78N9BnMVc
 3poY+v18i/RkN1euPHWSIXV1yDlwBy9xCkI3TSSXcc2nlhQjF2NQ2Xy57Gt0lyt6rua3
 3T2g==
X-Gm-Message-State: AO0yUKU7Jej9bxjVy4tQlUxmk6DA+GttCytjEx4wlx4hXHSP0pzxhcs1
 fluGh27wE9v/1h8VHgZ4avt8pg==
X-Google-Smtp-Source: AK7set/xDDOyih1cGQv2AsItbh1imdzS6300d9VlBGoarUkorDA8dNZl13WkvuUeldGy5oNSPjHE/g==
X-Received: by 2002:aa7:96f8:0:b0:5a8:ab62:28fc with SMTP id
 i24-20020aa796f8000000b005a8ab6228fcmr7772300pfq.9.1676621486120; 
 Fri, 17 Feb 2023 00:11:26 -0800 (PST)
Received: from [10.94.53.13] ([139.177.225.249])
 by smtp.gmail.com with ESMTPSA id
 q16-20020a62ae10000000b005939de7104asm2469878pff.215.2023.02.17.00.11.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 00:11:25 -0800 (PST)
Message-ID: <abcb08b7-460c-d88c-af48-c1d256f89c54@bytedance.com>
Date: Fri, 17 Feb 2023 16:11:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC v5 0/3] migration: reduce time of loading non-iterable
 vmstate
From: Chuang Xu <xuchuangxclwt@bytedance.com>
To: peterx@redhat.com
Cc: qemu-devel@nongnu.org, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com
References: <20230117115511.3215273-1-xuchuangxclwt@bytedance.com>
 <877cwizqvy.fsf@secure.mitica>
 <a555b989-27be-006e-0d00-9f1688c5be4e@bytedance.com>
In-Reply-To: <a555b989-27be-006e-0d00-9f1688c5be4e@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.649, NICE_REPLY_A=-0.351, RCVD_IN_DNSWL_NONE=-0.0001,
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

Hi, Peter!

In my last email to Juan, I mentioned two errors.
Now I want to discuss them with you.

On 2023/2/16 下午11:41, Chuang Xu wrote:
> I ran qtest with reference to your environment, and finally reported 
> two errors.
>
> Error 1(the same as yours):
>
>  QTEST_QEMU_BINARY=./qemu-system-x86_64 MALLOC_PERTURB_=87 
> G_TEST_DBUS_DAEMON=/data00/migration/qemu-open/tests/dbus-vmstate-daemon.sh 
> /data00/migration/qemu-open/build/tests/qtest/virtio-net-failover 
> --tap -k
> ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
> ✀ 
> ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
> stderr:
> qemu-system-x86_64: 
> /data00/migration/qemu-open/include/exec/memory.h:1114: 
> address_space_to_flatview: Assertion 
> `(!memory_region_transaction_in_progress() && 
> qemu_mutex_iothread_locked()) || rcu_read_is_locked()' failed.
> Broken pipe
> ../tests/qtest/libqtest.c:190: kill_qemu() detected QEMU death from 
> signal 6 (Aborted) (core dumped)
>
> (test program exited with status code -6)
>
> TAP parsing error: Too few tests run (expected 23, got 12)
>
> Coredump backtrace:
> #0  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
> #1  0x00007f3af64a8535 in __GI_abort () at abort.c:79
> #2  0x00007f3af64a840f in __assert_fail_base (fmt=0x7f3af6609ef0 
> "%s%s%s:%u: %s%sAssertion `%s' failed.\n%n", assertion=0x55d9425f48a8 
> "(!memory_region_transaction_in_progress() && 
> qemu_mutex_iothread_locked()) || rcu_read_is_locked()",
>     file=0x55d9425f4870 
> "/data00/migration/qemu-open/include/exec/memory.h", line=1114, 
> function=<optimized out>) at assert.c:92
> #3  0x00007f3af64b61a2 in __GI___assert_fail 
> (assertion=assertion@entry=0x55d9425f48a8 
> "(!memory_region_transaction_in_progress() && 
> qemu_mutex_iothread_locked()) || rcu_read_is_locked()",
>     file=file@entry=0x55d9425f4870 
> "/data00/migration/qemu-open/include/exec/memory.h", 
> line=line@entry=1114, function=function@entry=0x55d9426cdce0 
> <__PRETTY_FUNCTION__.20039> "address_space_to_flatview") at assert.c:101
> #4  0x000055d942373853 in address_space_to_flatview 
> (as=0x55d944738648) at 
> /data00/migration/qemu-open/include/exec/memory.h:1112
> #5  0x000055d9423746f5 in address_space_to_flatview 
> (as=0x55d944738648) at /data00/migration/qemu-open/include/qemu/rcu.h:126
> #6  address_space_set_flatview (as=as@entry=0x55d944738648) at 
> ../softmmu/memory.c:1029
> #7  0x000055d94237ace3 in address_space_update_topology 
> (as=0x55d944738648) at ../softmmu/memory.c:1080
> #8  address_space_init (as=as@entry=0x55d944738648, 
> root=root@entry=0x55d9447386a0, name=name@entry=0x55d9447384f0 
> "virtio-net-pci") at ../softmmu/memory.c:3082
> #9  0x000055d942151e43 in do_pci_register_device (errp=0x7f3aef7fe850, 
> devfn=<optimized out>, name=0x55d9444b6c40 "virtio-net-pci", 
> pci_dev=0x55d944738410) at ../hw/pci/pci.c:1145
> #10 pci_qdev_realize (qdev=0x55d944738410, errp=0x7f3aef7fe850) at 
> ../hw/pci/pci.c:2036
> #11 0x000055d942404a8f in device_set_realized (obj=<optimized out>, 
> value=true, errp=0x7f3aef7feae0) at ../hw/core/qdev.c:510
> #12 0x000055d942407e36 in property_set_bool (obj=0x55d944738410, 
> v=<optimized out>, name=<optimized out>, opaque=0x55d9444c71d0, 
> errp=0x7f3aef7feae0) at ../qom/object.c:2285
> #13 0x000055d94240a0e3 in object_property_set 
> (obj=obj@entry=0x55d944738410, name=name@entry=0x55d942670c23 
> "realized", v=v@entry=0x55d9452f7a00, errp=errp@entry=0x7f3aef7feae0) 
> at ../qom/object.c:1420
> #14 0x000055d94240d15f in object_property_set_qobject 
> (obj=obj@entry=0x55d944738410, name=name@entry=0x55d942670c23 
> "realized", value=value@entry=0x55d945306cb0, 
> errp=errp@entry=0x7f3aef7feae0) at ../qom/qom-qobject.c:28
> #15 0x000055d94240a354 in object_property_set_bool 
> (obj=0x55d944738410, name=name@entry=0x55d942670c23 "realized", 
> value=value@entry=true, errp=errp@entry=0x7f3aef7feae0) at 
> ../qom/object.c:1489
> #16 0x000055d94240427c in qdev_realize (dev=<optimized out>, 
> bus=bus@entry=0x55d945141400, errp=errp@entry=0x7f3aef7feae0) at 
> ../hw/core/qdev.c:292
> #17 0x000055d9421ef4a0 in qdev_device_add_from_qdict 
> (opts=0x55d945309c00, from_json=<optimized out>, errp=<optimized out>, 
> errp@entry=0x7f3aef7feae0) at 
> /data00/migration/qemu-open/include/hw/qdev-core.h:17
> #18 0x000055d942311c85 in failover_add_primary (errp=0x7f3aef7fead8, 
> n=0x55d9454e8530) at ../hw/net/virtio-net.c:933
> #19 virtio_net_set_features (vdev=<optimized out>, 
> features=4611687122246533156) at ../hw/net/virtio-net.c:1004
> #20 0x000055d94233d248 in virtio_set_features_nocheck 
> (vdev=vdev@entry=0x55d9454e8530, val=val@entry=4611687122246533156) at 
> ../hw/virtio/virtio.c:2851
> #21 0x000055d942342eae in virtio_load (vdev=0x55d9454e8530, 
> f=0x55d944700de0, version_id=11) at ../hw/virtio/virtio.c:3027
> #22 0x000055d942207601 in vmstate_load_state 
> (f=f@entry=0x55d944700de0, vmsd=0x55d9429baba0 <vmstate_virtio_net>, 
> opaque=0x55d9454e8530, version_id=11) at ../migration/vmstate.c:137
> #23 0x000055d942222672 in vmstate_load (f=0x55d944700de0, 
> se=0x55d94561b700) at ../migration/savevm.c:919
> #24 0x000055d942222927 in qemu_loadvm_section_start_full 
> (f=f@entry=0x55d944700de0, mis=0x55d9444c23e0) at 
> ../migration/savevm.c:2503
> #25 0x000055d942225cc8 in qemu_loadvm_state_main 
> (f=f@entry=0x55d944700de0, mis=mis@entry=0x55d9444c23e0) at 
> ../migration/savevm.c:2729
> #26 0x000055d942227195 in qemu_loadvm_state (f=0x55d944700de0) at 
> ../migration/savevm.c:2816
> #27 0x000055d94221480e in process_incoming_migration_co 
> (opaque=<optimized out>) at ../migration/migration.c:606
> #28 0x000055d94257d2ab in coroutine_trampoline (i0=<optimized out>, 
> i1=<optimized out>) at ../util/coroutine-ucontext.c:177
> #29 0x00007f3af64d2c80 in __correctly_grouped_prefixwc (begin=0x2 
> <error: Cannot access memory at address 0x2>, end=0x0, thousands=0 
> L'\000', grouping=0x7f3af64bd8eb <__GI_raise+267> "H\213\214$\b\001") 
> at grouping.c:171
> #30 0x0000000000000000 in ?? ()
>
>
> It seems that when address_space_to_flatview() is called, there is mr 
> transaction
> in progress, and the rcu read lock is not held.
>
> I need to further consider the conditions for sanity check or whether 
> we can hold the
> rcu read lock before address_space_init() to solve the problem.
>
>
> Error 2:
>
> ERROR:../tests/qtest/migration-helpers.c:205:wait_for_migration_status: 
> assertion failed: (g_test_timer_elapsed() < 
> MIGRATION_STATUS_WAIT_TIMEOUT) ERROR
> 180/180 qemu:qtest+qtest-x86_64 / 
> qtest-x86_64/migration-test                  ERROR 146.32s   killed by 
> signal 6 SIGABRT
>>>> QTEST_QEMU_BINARY=./qemu-system-x86_64 MALLOC_PERTURB_=250 
>>>> G_TEST_DBUS_DAEMON=/data00/migration/qemu-open/tests/dbus-vmstate-daemon.sh 
>>>> /data00/migration/qemu-open/build/tests/qtest/migration-test --tap -k
> ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
> ✀ 
> ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
> qemu-system-x86_64: ../softmmu/memory.c:1094: 
> memory_region_transaction_commit: Assertion 
> `qemu_mutex_iothread_locked()' failed.
> **
> ERROR:../tests/qtest/migration-helpers.c:205:wait_for_migration_status: 
> assertion failed: (g_test_timer_elapsed() < 
> MIGRATION_STATUS_WAIT_TIMEOUT)
> ../tests/qtest/libqtest.c:190: kill_qemu() detected QEMU death from 
> signal 6 (Aborted) (core dumped)
>
> (test program exited with status code -6)
>
> Coredump backtrace:
> #0  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
> #1  0x00007fed5c14d535 in __GI_abort () at abort.c:79
> #2  0x00007fed5c14d40f in __assert_fail_base (fmt=0x7fed5c2aeef0 
> "%s%s%s:%u: %s%sAssertion `%s' failed.\n%n", assertion=0x561bc4152424 
> "qemu_mutex_iothread_locked()", file=0x561bc41ae94b 
> "../softmmu/memory.c", line=1094, function=<optimized out>) at 
> assert.c:92
> #3  0x00007fed5c15b1a2 in __GI___assert_fail 
> (assertion=assertion@entry=0x561bc4152424 
> "qemu_mutex_iothread_locked()", file=file@entry=0x561bc41ae94b 
> "../softmmu/memory.c", line=line@entry=1094,
>     function=function@entry=0x561bc41afca0 <__PRETTY_FUNCTION__.38746> 
> "memory_region_transaction_commit") at assert.c:101
> #4  0x0000561bc3e5a053 in memory_region_transaction_commit () at 
> ../softmmu/memory.c:1094
> #5  0x0000561bc3d07b55 in qemu_loadvm_state_main 
> (f=f@entry=0x561bc6443aa0, mis=mis@entry=0x561bc62028a0) at 
> ../migration/savevm.c:2789
> #6  0x0000561bc3d08e46 in postcopy_ram_listen_thread 
> (opaque=opaque@entry=0x561bc62028a0) at ../migration/savevm.c:1922
> #7  0x0000561bc404b3da in qemu_thread_start (args=<optimized out>) at 
> ../util/qemu-thread-posix.c:505
> #8  0x00007fed5c2f2fa3 in start_thread (arg=<optimized out>) at 
> pthread_create.c:486
> #9  0x00007fed5c22406f in clone () at 
> ../sysdeps/unix/sysv/linux/x86_64/clone.S:95
>
>
> Error2 is related to postcopy. I don't know much about the code of 
> postcopy.
> So I need some time to look at this part of code.
>
> And later I will send another email to discuss it with Peter.
>
> Copy Peter.
>
> Thanks!

Error 1 was triggered by our sanity check. I try to add RCU_READ_LOCK_GUARD()
in address_space_init() and it works. But I'm not sure if this code change is
appropriate. If this change is not appropriate, we may need to consider other
sanity check.

Error 2 was related to postcopy. I read the official document of postcopy
(I hope it is the latest) and learned that two threads will call
qemu_loadvm_state_main() in the process of postcopy. The one called by main thread
will take the BQL, and the one called by ram_listen thread won't take the BQL.
The latter checks whether the BQL is held when calling memory_region_transaction_commit(),
thus triggering the assertion. Creating a new function qemu_loadvm_state_ram_listen()
without memory_region_transaction_commit() will solve this error.

I don't know if you suggest using this patch in postcopy. If this patch is applicable to
postcopy, considering the difference between how postcopy and precheck load device state,
do we need to consider more details?

Looking forward to your reply.

Thanks.





