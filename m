Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE8E4A3EAF
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 09:35:42 +0100 (CET)
Received: from localhost ([::1]:48202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nESA0-00059k-Va
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 03:35:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nERmM-0006xC-Aa
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 03:11:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nERmH-0004YJ-FX
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 03:11:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643616667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rHGEyfFFc3lbg9kA97e/Bx/cUzX39n5w7yHR8GUqNxQ=;
 b=RDpYHppFbSnvs9FKBSJvZbI9+KiDw1bkGrx1g/fTUtfP9O2AGiQp32rn/sglh0OEfkpbR1
 7yi+Z+xggyck9MAk+NDgw6NrNW0jdJNNDwDubia+qNqxso+L7J7hEXGH2IBewmhMW7L5Kj
 LCzXiGDfr4RJtso1DggZy0v8dOdH9Sk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-rrcBkUrxMhS38PLKgyJXrA-1; Mon, 31 Jan 2022 03:11:05 -0500
X-MC-Unique: rrcBkUrxMhS38PLKgyJXrA-1
Received: by mail-wm1-f71.google.com with SMTP id
 v185-20020a1cacc2000000b0034906580813so10003046wme.1
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 00:11:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=rHGEyfFFc3lbg9kA97e/Bx/cUzX39n5w7yHR8GUqNxQ=;
 b=mJMBpWCkG8DMB3qNMuW9YgBAxrv03d41vJ61WNKa4aa4UlNdlniVxWZa29woib3vqq
 r0jglZZmeuW34OcYRdjNFNhABXfSBXBRFZhUUEr4KJXL/yHDXL+iG9CWSZJql4/X3icy
 gGe5JVvkhilLxNdrT0KOPwkCzzgBFmKb4VQDXa5okdmeYpKezbbF03l3yX5605jkas/K
 iMx7EFQzwCuUchegMkSkVGVBssJPHw+s6OV/FeMz3Z2D4QrUMWMf5tJ6pAFBN/Aei/2H
 O1M2z8iaFY//HFuV0BD7x9gvDkAmjTGHQCqCZFtpxn8TRY3XJHbsNLOkiCJTkVCx5397
 XffA==
X-Gm-Message-State: AOAM530jNDuc0Jh2b4DJUTtngtaa313qlJOmkc5FzS0cY6N0SfnwQ1H+
 cWpdWJftbgN7Ov3sVZ6uLGM25ohpYwiqKgSf+tWtbbhwxVhQDZI0SWcwb/fqm9MFbR7s3mX8WAv
 /Q/bO0TWwIQBrCbI=
X-Received: by 2002:a05:6000:1881:: with SMTP id
 a1mr15788738wri.561.1643616664767; 
 Mon, 31 Jan 2022 00:11:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzdbaZL1CXzu4zZFNpEtMyV8y6FaA31qozAo3UWuvUiCWFKOgFpvZF0d7g+m4yaekDw1MTCLw==
X-Received: by 2002:a05:6000:1881:: with SMTP id
 a1mr15788712wri.561.1643616664495; 
 Mon, 31 Jan 2022 00:11:04 -0800 (PST)
Received: from ?IPV6:2003:cb:c709:b200:f007:5a26:32e7:8ef5?
 (p200300cbc709b200f0075a2632e78ef5.dip0.t-ipconnect.de.
 [2003:cb:c709:b200:f007:5a26:32e7:8ef5])
 by smtp.gmail.com with ESMTPSA id i19sm9206821wmq.45.2022.01.31.00.11.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 00:11:03 -0800 (PST)
Message-ID: <3f971963-8424-ba36-7723-1d60251c10cd@redhat.com>
Date: Mon, 31 Jan 2022 09:11:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
To: Niek Linnenbank <nieklinnenbank@gmail.com>
References: <20211102164317.45658-1-david@redhat.com>
 <20211102164317.45658-3-david@redhat.com>
 <CAPan3Wpgm94iHRCz3uGvUZYV37W=e4_d7UMqc81hY1cxB-zs1w@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v3 2/3] memory: Make memory_region_is_mapped() succeed
 when mapped via an alias
In-Reply-To: <CAPan3Wpgm94iHRCz3uGvUZYV37W=e4_d7UMqc81hY1cxB-zs1w@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30.01.22 23:50, Niek Linnenbank wrote:
> Hi David,

Hi Niek,

thanks for the report.

> 
> While I realize my response is quite late, I wanted to report this error
> I found when running the acceptance
> tests for the orangepi-pc machine using avocado:
> 
> ARMBIAN_ARTIFACTS_CACHED=yes AVOCADO_ALLOW_LARGE_STORAGE=yes avocado
> --show=app,console run -t machine:orangepi-pc
> tests/avocado/boot_linux_console.py
> ...
>  (4/5)
> tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_bionic_20_08:
> -console: U-Boot SPL 2020.04-armbian (Sep 02 2020 - 10:16:13 +0200)
> \console: DRAM:
> INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred: Timeout
> reached\nOriginal status: ERROR\n{'name':
> '4-tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_bionic_20_08',
> 'logdir': '/home/fox/avocado/job-results/job-2022-01-30T23.09-af49e...
> (90.64 s)
>  (5/5)
> tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_uboot_netbsd9:
> /console: U-Boot SPL 2020.01+dfsg-1 (Jan 08 2020 - 08:19:44 +0000)
> console: DRAM:
> INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred: Timeout
> reached\nOriginal status: ERROR\n{'name':
> '5-tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_uboot_netbsd9',
> 'logdir': '/home/fox/avocado/job-results/job-2022-01-30T23.09-af49...
> (90.64 s)
> RESULTS    : PASS 3 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 2 |
> CANCEL 0
> JOB TIME   : 221.25 s
> 
> Basically the two tests freeze during the part where the U-Boot
> bootloader needs to detect the amount of memory. We model this in the
> hw/misc/allwinner-h3-dramc.c file.
> And when running the machine manually it shows an assert on
> 'alias->mapped_via_alias >= 0'. When running manually via gdb, I was
> able to collect this backtrace:
> 
> $ gdb ./build/qemu-system-arm
> ...
> gdb) run -M orangepi-pc -nographic
> ./Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img
> ...
> U-Boot SPL 2020.04-armbian (Sep 02 2020 - 10:16:13 +0200)
> DRAM:
> qemu-system-arm: ../softmmu/memory.c:2588: memory_region_del_subregion:
> Assertion `alias->mapped_via_alias >= 0' failed.
> 
> Thread 4 "qemu-system-arm" received signal SIGABRT, Aborted.
> [Switching to Thread 0x7ffff5f72700 (LWP 32866)]
> __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
> 50 ../sysdeps/unix/sysv/linux/raise.c: No such file or directory.
> (gdb) bt
> #0  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
> #1  0x00007ffff7535859 in __GI_abort () at abort.c:79
> #2  0x00007ffff7535729 in __assert_fail_base
>     (fmt=0x7ffff76cb588 "%s%s%s:%u: %s%sAssertion `%s' failed.\n%n",
> assertion=0x55555642fd65 "alias->mapped_via_alias >= 0",
> file=0x55555642f8cd "../softmmu/memory.c", line=2588,
> function=<optimized out>)
>     at assert.c:92
> #3  0x00007ffff7546f36 in __GI___assert_fail
>     (assertion=0x55555642fd65 "alias->mapped_via_alias >= 0",
> file=0x55555642f8cd "../softmmu/memory.c", line=2588,
> function=0x555556430690 <__PRETTY_FUNCTION__.8>
> "memory_region_del_subregion") at assert.c:101
> #4  0x0000555555e587e0 in memory_region_del_subregion
> (mr=0x555556f0bc00, subregion=0x7ffff5fa1090) at ../softmmu/memory.c:2588
> #5  0x0000555555e589f3 in memory_region_readd_subregion
> (mr=0x7ffff5fa1090) at ../softmmu/memory.c:2630
> #6  0x0000555555e58a5f in memory_region_set_address (mr=0x7ffff5fa1090,
> addr=1090519040) at ../softmmu/memory.c:2642
> #7  0x0000555555ac352b in allwinner_h3_dramc_map_rows (s=0x7ffff5fa0c50,
> row_bits=16 '\020', bank_bits=2 '\002', page_size=512) at
> ../hw/misc/allwinner-h3-dramc.c:92
> #8  0x0000555555ac36c2 in allwinner_h3_dramcom_write
> (opaque=0x7ffff5fa0c50, offset=0, val=4396785, size=4) at
> ../hw/misc/allwinner-h3-dramc.c:131
> #9  0x0000555555e52561 in memory_region_write_accessor
> (mr=0x7ffff5fa11a0, addr=0, value=0x7ffff5f710e8, size=4, shift=0,
> mask=4294967295, attrs=...) at ../softmmu/memory.c:492
> #10 0x0000555555e527ad in access_with_adjusted_size (addr=0,
> value=0x7ffff5f710e8, size=4, access_size_min=4, access_size_max=4,
> access_fn=
>     0x555555e52467 <memory_region_write_accessor>, mr=0x7ffff5fa11a0,
> attrs=...) at ../softmmu/memory.c:554
> #11 0x0000555555e55935 in memory_region_dispatch_write
> (mr=0x7ffff5fa11a0, addr=0, data=4396785, op=MO_32, attrs=...) at
> ../softmmu/memory.c:1514
> #12 0x0000555555f891ae in io_writex (env=0x7ffff5f7ce30,
> iotlbentry=0x7fffec0275f0, mmu_idx=7, val=4396785, addr=29761536,
> retaddr=140734938367479, op=MO_32) at ../accel/tcg/cputlb.c:1420
> #13 0x0000555555f8ba10 in store_helper (env=0x7ffff5f7ce30,
> addr=29761536, val=4396785, oi=3623, retaddr=140734938367479, op=MO_32)
> at ../accel/tcg/cputlb.c:2355
> #14 0x0000555555f8bdda in full_le_stl_mmu (env=0x7ffff5f7ce30,
> addr=29761536, val=4396785, oi=3623, retaddr=140734938367479) at
> ../accel/tcg/cputlb.c:2443
> #15 0x0000555555f8be16 in helper_le_stl_mmu (env=0x7ffff5f7ce30,
> addr=29761536, val=4396785, oi=3623, retaddr=140734938367479) at
> ../accel/tcg/cputlb.c:2449
> #16 0x00007fff680245f7 in code_gen_buffer ()
> #17 0x0000555555f754cb in cpu_tb_exec (cpu=0x7ffff5f730a0,
> itb=0x7fffa802b400, tb_exit=0x7ffff5f7182c) at ../accel/tcg/cpu-exec.c:357
> #18 0x0000555555f76366 in cpu_loop_exec_tb (cpu=0x7ffff5f730a0,
> tb=0x7fffa802b400, last_tb=0x7ffff5f71840, tb_exit=0x7ffff5f7182c) at
> ../accel/tcg/cpu-exec.c:842
> #19 0x0000555555f76720 in cpu_exec (cpu=0x7ffff5f730a0) at
> ../accel/tcg/cpu-exec.c:1001
> #20 0x0000555555f993dd in tcg_cpus_exec (cpu=0x7ffff5f730a0) at
> ../accel/tcg/tcg-accel-ops.c:67
> #21 0x0000555555f9976d in mttcg_cpu_thread_fn (arg=0x7ffff5f730a0) at
> ../accel/tcg/tcg-accel-ops-mttcg.c:95
> #22 0x000055555624bf4d in qemu_thread_start (args=0x5555572b6780) at
> ../util/qemu-thread-posix.c:556
> #23 0x00007ffff770b609 in start_thread (arg=<optimized out>) at
> pthread_create.c:477
> #24 0x00007ffff7632293 in clone () at
> ../sysdeps/unix/sysv/linux/x86_64/clone.S:95
> 
> So it seems that the hw/misc/allwinner-h3-dramc.c file is using the call
> memory_region_set_address, where internally we are calling
> memory_region_del_subregion.

Okay, so we're using memory_region_set_address() on an alias after
marking it as enabled.

memory_region_readd_subregion() detect if the region is already added
via "mr->container" ... so in the old code, the

memory_region_del_subregion()
mr->container = container;
memory_region_update_container_subregions(mr);

I think the issue is that we want to do a "del+add" but we do a
"del+hack", not a proper add.

Would something like the following do the trick (untested)?:


diff --git a/softmmu/memory.c b/softmmu/memory.c
index 0d39cf3da6..7a1c8158c5 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2633,8 +2633,7 @@ static void
memory_region_readd_subregion(MemoryRegion *mr)
         memory_region_transaction_begin();
         memory_region_ref(mr);
         memory_region_del_subregion(container, mr);
-        mr->container = container;
-        memory_region_update_container_subregions(mr);
+        memory_region_add_subregion_common(container, mr->addr, mr);
         memory_region_unref(mr);
         memory_region_transaction_commit();
     }


-- 
Thanks,

David / dhildenb


