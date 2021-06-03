Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 171D2399E6B
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 12:03:54 +0200 (CEST)
Received: from localhost ([::1]:51178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lokCe-0005yR-Kj
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 06:03:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.purdie@linuxfoundation.org>)
 id 1lokBK-0005Ad-Bh
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 06:02:30 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:42682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.purdie@linuxfoundation.org>)
 id 1lokBE-0006OQ-N6
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 06:02:30 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 o2-20020a05600c4fc2b029019a0a8f959dso3348635wmq.1
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 03:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=message-id:subject:from:to:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=MvqSQ+WPtw4q9jW31MNLjAuEhAJ+6iBAie8uWN0Nb8g=;
 b=RF0YEHyMar969qF6WthzK0Xf/aJ4HJnnbndEvoVHhuZBxLDooYG9zmusglS3uVvPWb
 gV1sUfHz9WQjaSqyMjgJsRrxkI6bT04685TcqWqH9NYiqNhWVptl7DkHi1xa8A/mWljf
 vMmEr2wqfFpKt93AkdnrBfIrq/dEiLZBi488s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:user-agent
 :mime-version:content-transfer-encoding;
 bh=MvqSQ+WPtw4q9jW31MNLjAuEhAJ+6iBAie8uWN0Nb8g=;
 b=DSduX0PLTiKJ+Kc75naUhaBHTLNnvNshaVZXm+JTAxNFh9pPy6Aj7pmfM1YdAs+b16
 HkINHc4OcQimnIHsi6CpyzrXMYxrcmo31Wp/AB6aMD3eAMUuatchZqf8p7AeJIAD4VoO
 nddNk7MYTCcz3gPyuIjvGKGT0nA7AMr/DdYWMeu5MoqatNU75c1qSZep/E7HTSsi2s3e
 ZZmT7qAZKjlS2Naa5Z+FxXFo40QGqInhhRVQl2gguBpP+ySYme4VXY6QLZINdQht95RA
 L9K1zmMZEjTNc8bvmtWYCavPf/1tp5aTlh5psZjustw+GZWGhKaN3vXKBrdM1IlnoJ4E
 J+hg==
X-Gm-Message-State: AOAM5316cnVDZ30IVtpMlvVG7X9t5lt4IyX3M66e2a4NtWpBg6Viw3E8
 3W0Wld05znzgXhaWCffT5/6DNRPoz4MZeg==
X-Google-Smtp-Source: ABdhPJyNcDriG9oTh6bLlVpNZptv9uctW1o/9ywAQfm5qIPpT4OTM40kajnkTihQsLc11Q872ie7Tg==
X-Received: by 2002:a1c:f60f:: with SMTP id w15mr9334928wmc.5.1622714541667;
 Thu, 03 Jun 2021 03:02:21 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:aa71:4934:cc48:7546?
 ([2001:8b0:aba:5f3c:aa71:4934:cc48:7546])
 by smtp.gmail.com with ESMTPSA id a11sm2785333wrr.48.2021.06.03.03.02.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 03:02:21 -0700 (PDT)
Message-ID: <89f4220fd2b973ebfed4bf4be0afbdefc44a9d4d.camel@linuxfoundation.org>
Subject: VMs hanging with rcu stall problems
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: qemu-devel <qemu-devel@nongnu.org>
Date: Thu, 03 Jun 2021 11:02:20 +0100
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.purdie@linuxfoundation.org;
 helo=mail-wm1-x336.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

We're seeing intermittent rcu stalls in qemu system mode emulation which is 
causing CI issues for us (Yocto Project). We're struggling to understand
the cause and have tried several things to mitigate without much success. 
The stalls are odd in that the log messages look incomplete. An example
from last night:

[  133.333475] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
[  133.337109]  (detected by 2, t=25864 jiffies, g=1529, q=10)
[  133.339025] rcu: All QSes seen, last rcu_preempt kthread activity 4865 (4294800423-4294795558), jiffies_till_next_fqs=3, root ->qsmask 0x0
[  133.343445] rcu: rcu_preempt kthread starved for 4870 jiffies! g1529 f0x2 RCU_GP_WAIT_FQS(5) ->state=0x200 ->cpu=2
[  133.346976] rcu:     Unless rcu_preempt kthread gets sufficient CPU time, OOM is now expected behavior.
[  133.350262] rcu: RCU grace-period kthread stack dump:
[  133.352704] task:rcu_preempt     state:R stack:    0 pid:   13 ppid:     2 flags:0x00004000
[  133.355581] Call Trace:
[  133.356488]  __schedule+0x1dc/0x570
[  133.357693]  ? __mod_timer+0x220/0x3c0
[  133.359018]  schedule+0x68/0xe0
[  133.360000]  schedule_timeout+0x8f/0x160
[  133.361267]  ? force_qs_rnp+0x8d/0x1c0
[  133.362515]  ? __next_timer_interrupt+0x100/0x100
[  133.364264]  rcu_gp_kthread+0x55f/0xba0
[  133.365701]  ? note_gp_changes+0x70/0x70
[  133.367356]  kthread+0x145/0x170
[  133.368597]  ? kthread_associate_blkcg+0xc0/0xc0
[  133.370686]  ret_from_fork+0x22/0x30
[  133.371976] BUG: scheduling while atomic: swapper/2/0/0x00000002
[  133.374066] Modules linked in: bnep
[  133.375324] CPU: 2 PID: 0 Comm: swapper/2 Not tainted 5.10.41-yocto-standard #1
[  133.377813] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.14.0-0-g155821a1990b-prebuilt.qemu.org 04/01/2014
[  133.381882] Call Trace:
[  133.382744]  dump_stack+0x5e/0x74
[  133.384027]  __schedule_bug.cold+0x4b/0x59
[  133.385362]  __schedule+0x3f6/0x570
[  133.386655]  schedule_idle+0x2c/0x40
[  133.388033]  do_idle+0x15a/0x250
[  133.389257]  ? complete+0x3f/0x50
[  133.390406]  cpu_startup_entry+0x20/0x30
[  133.391827]  start_secondary+0xf1/0x100
[  133.393143]  secondary_startup_64_no_verify+0xc2/0xcb
[  191.482302] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
[  255.155323] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:

(full kernel+boot log is below)

What strikes me as odd is the scheduling whilst atomic (which we don't normally 
see) and the lack of task info (which is never there).

We have some evidence that the qemus are using say 350% of cpu when this happens
so it doesn't actually appear to be staved of cpu in reality. Unfortunately catching
that data is hard.

We only see this issue intermittently, it does seem to coincide with load but
equally, the kernel messages seem odd and ps output suggests the qemu processes
are getting ample cpu time.

This is for x86_64 and using kvm but this isn't kvm on kvm. We have many
different base distros (Centos, Debian, OpenSUSE, Ubuntu), it happens on them 
all.

We're using qemu 6.0.0 although we saw the same issue with 5.2.0. Our
kernel is mainly a 5.10 although we do have a 5.4 kernel and have also tested
a 5.12 and they all seem to do this.

We can have periods of significant load on the autobuilders from build processes
however we have taken steps to mitigate this. The qemu processes are priority -5, 
the builds are at 5 and we also ioprio 2,0 for qemu. We don't use cgroups since
not all of our builders have support for v2 and it complicates permission issues
as our builds are not virtualised and don't run as root. I'm not convinced it would
really help.

In an effort to try and mitigate issues we moved the images we're booting onto
a tmpfs. We have also ended up "pre-caching" all the mmaped libraries used by 
the binary just in case something was stalling on IO whilst qemu was running. 
To do that we start with qmp, wait for the port, read through the files in 
/proc/<pid>/map_files.

We also did try disabling kvmclock but that doesn't appear to help.

We also did change the systems from a single cpu to having 4 cpus. This changed
the trace output to be multi cpu but the basic issue seems to remain. We wanted
to use multiple cores anyway so will keep that but it doesn't help this issue.

The systems running these qemu images are 48 core dual socket Xeons E5-2697
with 128GB memory.

We have seen some stalls in arm/mips/ppc qemu system testing without KVM too
although not since the above mitigations were added. I've suspected there are 
multiple causes.

The corresponding build in CI was this:
https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/3538
I've detailed more about the background on how we're using this below.

Does anyone have any idea what might be causing this and how we might 
fix or mitigate it?

We're at the point where a component of our CI fails on pretty much every run
and I'm struggling with ideas on how to proceed at this point other than reducing 
the load on the build systems and taking a hit on build speed/testing time. Seems
sad to do that when things are working most of the time and it doesn't feel quite
that this is really a true load issue anyway...

Cheers,

Richard


Project background:

I work on the Yocto Project. We cross compile Linux (and other OSs) for
many different architectures and support many configurations (different C 
libraries, init systems and so on). We use qemu extensively to test that 
what we're building works. We do use user mode in places but it is the 
system mode which we're having a rather puzzling issue with at present.

We run our tests on a buildbot based test environment with around 20 worker
machines running three targets in parallel and a full pre-integration test run
has 50 targets. A given target run could start up to 3-4 qemu instances in parallel.
Most qemu instances are x86-64 so we can use KVM. We do have ARM systems as well as 
x86 which also use kvm for acceleration.

To give an idea of scale, our test builds take around 6-8 hours and include
running ltp and the gcc+glibc test suites as well as the tests included with
many pieces of software. We get around 2.6 million test results from the system.
An example report:

https://autobuilder.yocto.io/pub/non-release/20210602-19/testresults/testresult-report.txt






[    0.000000] Linux version 5.10.41-yocto-standard (oe-user@oe-host) (x86_64-poky-linux-gcc (GCC) 11.1.1 20210523, GNU ld (GNU Binutils) 2.36.1.20210209) #1 SMP PREEMPT Fri May 28 18:17:12 UTC 2021
[    0.000000] Command line: root=/dev/vda rw  mem=512M ip=192.168.7.2::192.168.7.1:255.255.255.0 console=ttyS0 console=ttyS1 oprofile.timer=1 tsc=reliable no_timer_check rcupdate.rcu_expedited=1  printk.time=1
[    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.000000] x86/fpu: Enabled xstate features 0x7, context size is 832 bytes, using 'standard' format.
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
[    0.000000] BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x000000001ffd7fff] usable
[    0.000000] BIOS-e820: [mem 0x000000001ffd8000-0x000000001fffffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000b0000000-0x00000000bfffffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fed1c000-0x00000000fed1ffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000feffc000-0x00000000feffffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] reserved
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] user-defined physical RAM map:
[    0.000000] user: [mem 0x0000000000000000-0x000000000009fbff] usable
[    0.000000] user: [mem 0x000000000009fc00-0x000000000009ffff] reserved
[    0.000000] user: [mem 0x00000000000f0000-0x00000000000fffff] reserved
[    0.000000] user: [mem 0x0000000000100000-0x000000001ffd7fff] usable
[    0.000000] user: [mem 0x000000001ffd8000-0x000000001fffffff] reserved
[    0.000000] user: [mem 0x00000000b0000000-0x00000000bfffffff] reserved
[    0.000000] user: [mem 0x00000000fed1c000-0x00000000fed1ffff] reserved
[    0.000000] user: [mem 0x00000000feffc000-0x00000000feffffff] reserved
[    0.000000] user: [mem 0x00000000fffc0000-0x00000000ffffffff] reserved
[    0.000000] SMBIOS 2.8 present.
[    0.000000] DMI: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.14.0-0-g155821a1990b-prebuilt.qemu.org 04/01/2014
[    0.000000] Hypervisor detected: KVM
[    0.000000] kvm-clock: Using msrs 4b564d01 and 4b564d00
[    0.000000] kvm-clock: cpu 0, msr 4dcb001, primary cpu clock
[    0.000000] kvm-clock: using sched offset of 73940191460 cycles
[    0.000008] clocksource: kvm-clock: mask: 0xffffffffffffffff max_cycles: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
[    0.000015] tsc: Detected 2699.998 MHz processor
[    0.001033] last_pfn = 0x1ffd8 max_arch_pfn = 0x400000000
[    0.001144] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT  
[    0.010828] found SMP MP-table at [mem 0x000f5a40-0x000f5a4f]
[    0.010910] check: Scanning 1 areas for low memory corruption
[    0.011130] ACPI: Early table checksum verification disabled
[    0.011153] ACPI: RSDP 0x00000000000F57A0 000014 (v00 BOCHS )
[    0.011162] ACPI: RSDT 0x000000001FFE22C1 000038 (v01 BOCHS  BXPC     00000001 BXPC 00000001)
[    0.011178] ACPI: FACP 0x000000001FFE20A1 0000F4 (v03 BOCHS  BXPC     00000001 BXPC 00000001)
[    0.011188] ACPI: DSDT 0x000000001FFE0040 002061 (v01 BOCHS  BXPC     00000001 BXPC 00000001)
[    0.011193] ACPI: FACS 0x000000001FFE0000 000040
[    0.011197] ACPI: APIC 0x000000001FFE2195 000090 (v01 BOCHS  BXPC     00000001 BXPC 00000001)
[    0.011202] ACPI: HPET 0x000000001FFE2225 000038 (v01 BOCHS  BXPC     00000001 BXPC 00000001)
[    0.011206] ACPI: MCFG 0x000000001FFE225D 00003C (v01 BOCHS  BXPC     00000001 BXPC 00000001)
[    0.011211] ACPI: WAET 0x000000001FFE2299 000028 (v01 BOCHS  BXPC     00000001 BXPC 00000001)
[    0.011215] ACPI: Reserving FACP table memory at [mem 0x1ffe20a1-0x1ffe2194]
[    0.011216] ACPI: Reserving DSDT table memory at [mem 0x1ffe0040-0x1ffe20a0]
[    0.011217] ACPI: Reserving FACS table memory at [mem 0x1ffe0000-0x1ffe003f]
[    0.011218] ACPI: Reserving APIC table memory at [mem 0x1ffe2195-0x1ffe2224]
[    0.011219] ACPI: Reserving HPET table memory at [mem 0x1ffe2225-0x1ffe225c]
[    0.011220] ACPI: Reserving MCFG table memory at [mem 0x1ffe225d-0x1ffe2298]
[    0.011221] ACPI: Reserving WAET table memory at [mem 0x1ffe2299-0x1ffe22c0]
[    0.011324] Zone ranges:
[    0.011326]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.011328]   DMA32    [mem 0x0000000001000000-0x000000001ffd7fff]
[    0.011329]   Normal   empty
[    0.011331] Movable zone start for each node
[    0.011331] Early memory node ranges
[    0.011332]   node   0: [mem 0x0000000000001000-0x000000000009efff]
[    0.011336]   node   0: [mem 0x0000000000100000-0x000000001ffd7fff]
[    0.011341] Initmem setup node 0 [mem 0x0000000000001000-0x000000001ffd7fff]
[    0.012239]   DMA zone: 28770 pages in unavailable ranges
[    0.014719]   DMA32 zone: 40 pages in unavailable ranges
[    0.015423] ACPI: PM-Timer IO Port: 0x608
[    0.015438] ACPI: LAPIC_NMI (acpi_id[0xff] dfl dfl lint[0x1])
[    0.015493] IOAPIC[0]: apic_id 0, version 17, address 0xfec00000, GSI 0-23
[    0.015497] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.015499] ACPI: INT_SRC_OVR (bus 0 bus_irq 5 global_irq 5 high level)
[    0.015500] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.015533] ACPI: INT_SRC_OVR (bus 0 bus_irq 10 global_irq 10 high level)
[    0.015535] ACPI: INT_SRC_OVR (bus 0 bus_irq 11 global_irq 11 high level)
[    0.015543] Using ACPI (MADT) for SMP configuration information
[    0.015546] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[    0.015551] TSC deadline timer available
[    0.015553] smpboot: Allowing 4 CPUs, 0 hotplug CPUs
[    0.015581] [mem 0x20000000-0xafffffff] available for PCI devices
[    0.015583] Booting paravirtualized kernel on KVM
[    0.015590] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1910969940391419 ns
[    0.015601] setup_percpu: NR_CPUS:64 nr_cpumask_bits:64 nr_cpu_ids:4 nr_node_ids:1
[    0.016457] percpu: Embedded 53 pages/cpu s176728 r8192 d32168 u524288
[    0.016499] kvm-guest: stealtime: cpu 0, msr 1f417600
[    0.016506] Built 1 zonelists, mobility grouping on.  Total pages: 128865
[    0.016508] Kernel command line: root=/dev/vda rw  mem=512M ip=192.168.7.2::192.168.7.1:255.255.255.0 console=ttyS0 console=ttyS1 oprofile.timer=1 tsc=reliable no_timer_check rcupdate.rcu_expedited=1  printk.time=1
[    0.016959] Dentry cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    0.017167] Inode-cache hash table entries: 32768 (order: 6, 262144 bytes, linear)
[    0.017252] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.019003] Memory: 484812K/523736K available (16396K kernel code, 2094K rwdata, 3444K rodata, 1532K init, 2364K bss, 38664K reserved, 0K cma-reserved)
[    0.019063] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
[    0.019079] Kernel/User page tables isolation: enabled
[    0.019103] ftrace: allocating 44389 entries in 174 pages
[    0.040229] ftrace: allocated 174 pages with 5 groups
[    0.041031] rcu: Preemptible hierarchical RCU implementation.
[    0.041033] rcu: 	RCU restricting CPUs from NR_CPUS=64 to nr_cpu_ids=4.
[    0.041035] 	All grace periods are expedited (rcu_expedited).
[    0.041036] 	Trampoline variant of Tasks RCU enabled.
[    0.041036] 	Rude variant of Tasks RCU enabled.
[    0.041037] 	Tracing variant of Tasks RCU enabled.
[    0.041039] rcu: RCU calculated value of scheduler-enlistment delay is 100 jiffies.
[    0.041040] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
[    0.044588] NR_IRQS: 4352, nr_irqs: 456, preallocated irqs: 16
[    0.044824] random: get_random_bytes called from start_kernel+0x367/0x522 with crng_init=0
[    0.057260] Console: colour VGA+ 80x25
[    0.204957] printk: console [ttyS0] enabled
[    0.205818] ACPI: Core revision 20200925
[    0.206845] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604467 ns
[    0.208811] APIC: Switch to symmetric I/O mode setup
[    0.210237] x2apic enabled
[    0.211236] Switched APIC routing to physical x2apic.
[    0.213826] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
[    0.215106] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x26eb3cc21a9, max_idle_ns: 440795299783 ns
[    0.217239] Calibrating delay loop (skipped) preset value.. 5399.99 BogoMIPS (lpj=2699998)
[    0.218241] pid_max: default: 32768 minimum: 301
[    0.219277] LSM: Security Framework initializing
[    0.220271] Mount-cache hash table entries: 1024 (order: 1, 8192 bytes, linear)
[    0.221244] Mountpoint-cache hash table entries: 1024 (order: 1, 8192 bytes, linear)
[    0.222652] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
[    0.223243] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
[    0.224241] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
[    0.225241] Spectre V2 : Mitigation: Full generic retpoline
[    0.226240] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
[    0.227240] Speculative Store Bypass: Vulnerable
[    0.228241] SRBDS: Unknown: Dependent on hypervisor status
[    0.229240] MDS: Vulnerable: Clear CPU buffers attempted, no microcode
[    0.230546] Freeing SMP alternatives memory: 48K
[    0.232381] smpboot: CPU0: Intel Xeon E3-12xx v2 (Ivy Bridge) (family: 0x6, model: 0x3a, stepping: 0x9)
[    0.233390] Performance Events: unsupported p6 CPU model 58 no PMU driver, software events only.
[    0.234304] rcu: Hierarchical SRCU implementation.
[    0.235479] smp: Bringing up secondary CPUs ...
[    0.236350] x86: Booting SMP configuration:
[    0.237199] .... node  #0, CPUs:      #1
[    0.168460] kvm-clock: cpu 1, msr 4dcb041, secondary cpu clock
[    0.168460] smpboot: CPU 1 Converting physical 0 to logical die 1
[    0.240619] kvm-guest: stealtime: cpu 1, msr 1f497600
[    0.241353]  #2
[    0.168460] kvm-clock: cpu 2, msr 4dcb081, secondary cpu clock
[    0.168460] smpboot: CPU 2 Converting physical 0 to logical die 2
[    0.247550] kvm-guest: stealtime: cpu 2, msr 1f517600
[    0.249348]  #3
[    0.168460] kvm-clock: cpu 3, msr 4dcb0c1, secondary cpu clock
[    0.168460] smpboot: CPU 3 Converting physical 0 to logical die 3
[    0.252380] kvm-guest: stealtime: cpu 3, msr 1f597600
[    0.253250] smp: Brought up 1 node, 4 CPUs
[    0.254244] smpboot: Max logical packages: 4
[    0.255079] smpboot: Total of 4 processors activated (21599.98 BogoMIPS)
[    0.255568] devtmpfs: initialized
[    0.256428] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1911260446275000 ns
[    0.257248] futex hash table entries: 1024 (order: 4, 65536 bytes, linear)
[    0.258300] pinctrl core: initialized pinctrl subsystem
[    0.259484] NET: Registered protocol family 16
[    0.260384] thermal_sys: Registered thermal governor 'step_wise'
[    0.260386] thermal_sys: Registered thermal governor 'user_space'
[    0.261290] cpuidle: using governor menu
[    0.263073] ACPI: bus type PCI registered
[    0.263375] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xb0000000-0xbfffffff] (base 0xb0000000)
[    0.264245] PCI: MMCONFIG at [mem 0xb0000000-0xbfffffff] reserved in E820
[    0.265261] PCI: Using configuration type 1 for base access
[    0.267451] Kprobes globally optimized
[    0.287244] raid6: sse2x4   gen()  7640 MB/s
[    0.305246] raid6: sse2x4   xor()  4509 MB/s
[    0.322245] raid6: sse2x2   gen()  5144 MB/s
[    0.339246] raid6: sse2x2   xor()  7719 MB/s
[    0.356253] raid6: sse2x1   gen()  5160 MB/s
[    0.373244] raid6: sse2x1   xor()  7156 MB/s
[    0.374168] raid6: using algorithm sse2x4 gen() 7640 MB/s
[    0.374252] raid6: .... xor() 4509 MB/s, rmw enabled
[    0.375242] raid6: using ssse3x2 recovery algorithm
[    0.376348] ACPI: Added _OSI(Module Device)
[    0.377237] ACPI: Added _OSI(Processor Device)
[    0.377242] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.378204] ACPI: Added _OSI(Processor Aggregator Device)
[    0.378242] ACPI: Added _OSI(Linux-Dell-Video)
[    0.379134] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    0.379243] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
[    0.381122] ACPI: 1 ACPI AML tables successfully acquired and loaded
[    0.382426] ACPI: Interpreter enabled
[    0.383232] ACPI: (supports S0 S3 S5)
[    0.383246] ACPI: Using IOAPIC for interrupt routing
[    0.384275] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    0.385336] ACPI: Enabled 1 GPEs in block 00 to 3F
[    0.388323] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.389250] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI HPX-Type3]
[    0.390310] acpi PNP0A08:00: _OSC: platform does not support [LTR]
[    0.391297] acpi PNP0A08:00: _OSC: OS now controls [PME PCIeCapability]
[    0.392289] PCI host bridge to bus 0000:00
[    0.393127] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    0.393243] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    0.394245] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
[    0.395243] pci_bus 0000:00: root bus resource [mem 0x20000000-0xafffffff window]
[    0.396243] pci_bus 0000:00: root bus resource [mem 0xc0000000-0xfebfffff window]
[    0.397248] pci_bus 0000:00: root bus resource [mem 0x100000000-0x8ffffffff window]
[    0.398245] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.399346] pci 0000:00:00.0: [8086:29c0] type 00 class 0x060000
[    0.400914] pci 0000:00:01.0: [1234:1111] type 00 class 0x030000
[    0.403056] pci 0000:00:01.0: reg 0x10: [mem 0xfd000000-0xfdffffff pref]
[    0.405275] pci 0000:00:01.0: reg 0x18: [mem 0xfebd0000-0xfebd0fff]
[    0.410960] pci 0000:00:01.0: reg 0x30: [mem 0xfebc0000-0xfebcffff pref]
[    0.412283] pci 0000:00:02.0: [1af4:1000] type 00 class 0x020000
[    0.414244] pci 0000:00:02.0: reg 0x10: [io  0xc0c0-0xc0df]
[    0.416243] pci 0000:00:02.0: reg 0x14: [mem 0xfebd1000-0xfebd1fff]
[    0.420244] pci 0000:00:02.0: reg 0x20: [mem 0xfe000000-0xfe003fff 64bit pref]
[    0.422244] pci 0000:00:02.0: reg 0x30: [mem 0xfeb80000-0xfebbffff pref]
[    0.424278] pci 0000:00:03.0: [1af4:1005] type 00 class 0x00ff00
[    0.426177] pci 0000:00:03.0: reg 0x10: [io  0xc0e0-0xc0ff]
[    0.429104] pci 0000:00:03.0: reg 0x20: [mem 0xfe004000-0xfe007fff 64bit pref]
[    0.431063] pci 0000:00:04.0: [1af4:1001] type 00 class 0x010000
[    0.432244] pci 0000:00:04.0: reg 0x10: [io  0xc000-0xc07f]
[    0.434244] pci 0000:00:04.0: reg 0x14: [mem 0xfebd2000-0xfebd2fff]
[    0.438944] pci 0000:00:04.0: reg 0x20: [mem 0xfe008000-0xfe00bfff 64bit pref]
[    0.441337] pci 0000:00:1d.0: [8086:2934] type 00 class 0x0c0300
[    0.444843] pci 0000:00:1d.0: reg 0x20: [io  0xc100-0xc11f]
[    0.446316] pci 0000:00:1d.1: [8086:2935] type 00 class 0x0c0300
[    0.449258] pci 0000:00:1d.1: reg 0x20: [io  0xc120-0xc13f]
[    0.451291] pci 0000:00:1d.2: [8086:2936] type 00 class 0x0c0300
[    0.454460] pci 0000:00:1d.2: reg 0x20: [io  0xc140-0xc15f]
[    0.456292] pci 0000:00:1d.7: [8086:293a] type 00 class 0x0c0320
[    0.457750] pci 0000:00:1d.7: reg 0x10: [mem 0xfebd3000-0xfebd3fff]
[    0.462174] pci 0000:00:1f.0: [8086:2918] type 00 class 0x060100
[    0.462933] pci 0000:00:1f.0: quirk: [io  0x0600-0x067f] claimed by ICH6 ACPI/GPIO/TCO
[    0.463600] pci 0000:00:1f.2: [8086:2922] type 00 class 0x010601
[    0.468245] pci 0000:00:1f.2: reg 0x20: [io  0xc160-0xc17f]
[    0.470063] pci 0000:00:1f.2: reg 0x24: [mem 0xfebd4000-0xfebd4fff]
[    0.471561] pci 0000:00:1f.3: [8086:2930] type 00 class 0x0c0500
[    0.474243] pci 0000:00:1f.3: reg 0x20: [io  0x0700-0x073f]
[    0.476796] ACPI: PCI Interrupt Link [LNKA] (IRQs 5 *10 11)
[    0.477342] ACPI: PCI Interrupt Link [LNKB] (IRQs 5 *10 11)
[    0.478340] ACPI: PCI Interrupt Link [LNKC] (IRQs 5 10 *11)
[    0.479337] ACPI: PCI Interrupt Link [LNKD] (IRQs 5 10 *11)
[    0.480359] ACPI: PCI Interrupt Link [LNKE] (IRQs 5 *10 11)
[    0.481343] ACPI: PCI Interrupt Link [LNKF] (IRQs 5 *10 11)
[    0.483323] ACPI: PCI Interrupt Link [LNKG] (IRQs 5 10 *11)
[    0.484337] ACPI: PCI Interrupt Link [LNKH] (IRQs 5 10 *11)
[    0.485284] ACPI: PCI Interrupt Link [GSIA] (IRQs *16)
[    0.486252] ACPI: PCI Interrupt Link [GSIB] (IRQs *17)
[    0.487253] ACPI: PCI Interrupt Link [GSIC] (IRQs *18)
[    0.488252] ACPI: PCI Interrupt Link [GSID] (IRQs *19)
[    0.489252] ACPI: PCI Interrupt Link [GSIE] (IRQs *20)
[    0.490255] ACPI: PCI Interrupt Link [GSIF] (IRQs *21)
[    0.491267] ACPI: PCI Interrupt Link [GSIG] (IRQs *22)
[    0.492252] ACPI: PCI Interrupt Link [GSIH] (IRQs *23)
[    0.493839] pci 0000:00:01.0: vgaarb: setting as boot VGA device
[    0.494237] pci 0000:00:01.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
[    0.494247] pci 0000:00:01.0: vgaarb: bridge control possible
[    0.495246] vgaarb: loaded
[    0.495919] SCSI subsystem initialized
[    0.496401] ACPI: bus type USB registered
[    0.497274] usbcore: registered new interface driver usbfs
[    0.498257] usbcore: registered new interface driver hub
[    0.499250] usbcore: registered new device driver usb
[    0.500268] pps_core: LinuxPPS API ver. 1 registered
[    0.501242] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.502247] PTP clock support registered
[    0.503529] Bluetooth: Core ver 2.22
[    0.504255] NET: Registered protocol family 31
[    0.505195] Bluetooth: HCI device and connection manager initialized
[    0.505250] Bluetooth: HCI socket layer initialized
[    0.506247] Bluetooth: L2CAP socket layer initialized
[    0.507253] Bluetooth: SCO socket layer initialized
[    0.508294] PCI: Using ACPI for IRQ routing
[    0.604613] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
[    0.605243] hpet0: 3 comparators, 64-bit 100.000000 MHz counter
[    0.609342] clocksource: Switched to clocksource kvm-clock
[    0.742556] pnp: PnP ACPI init
[    0.743576] system 00:07: [mem 0xb0000000-0xbfffffff window] has been reserved
[    0.745337] pnp: PnP ACPI: found 8 devices
[    0.754486] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
[    0.756280] NET: Registered protocol family 2
[    0.757921] IP idents hash table entries: 8192 (order: 4, 65536 bytes, linear)
[    0.759667] tcp_listen_portaddr_hash hash table entries: 256 (order: 0, 4096 bytes, linear)
[    0.761343] TCP established hash table entries: 4096 (order: 3, 32768 bytes, linear)
[    0.762978] TCP bind hash table entries: 4096 (order: 4, 65536 bytes, linear)
[    0.764490] TCP: Hash tables configured (established 4096 bind 4096)
[    0.765858] UDP hash table entries: 256 (order: 1, 8192 bytes, linear)
[    0.767092] UDP-Lite hash table entries: 256 (order: 1, 8192 bytes, linear)
[    0.768488] NET: Registered protocol family 1
[    0.769645] RPC: Registered named UNIX socket transport module.
[    0.770933] RPC: Registered udp transport module.
[    0.771877] RPC: Registered tcp transport module.
[    0.772759] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.774092] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    0.775255] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    0.776385] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]
[    0.777751] pci_bus 0000:00: resource 7 [mem 0x20000000-0xafffffff window]
[    0.779011] pci_bus 0000:00: resource 8 [mem 0xc0000000-0xfebfffff window]
[    0.781621] pci_bus 0000:00: resource 9 [mem 0x100000000-0x8ffffffff window]
[    0.783032] pci 0000:00:01.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
[    0.784863] PCI Interrupt Link [GSIA] enabled at IRQ 16
[    0.786815] PCI Interrupt Link [GSIB] enabled at IRQ 17
[    0.788571] PCI Interrupt Link [GSIC] enabled at IRQ 18
[    0.790367] PCI Interrupt Link [GSID] enabled at IRQ 19
[    0.791989] PCI: CLS 0 bytes, default 64
[    0.792883] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x26eb3cc21a9, max_idle_ns: 440795299783 ns
[    0.795543] check: Scanning for low memory corruption every 60 seconds
[    0.797081] Initialise system trusted keyrings
[    0.798145] workingset: timestamp_bits=46 max_order=17 bucket_order=0
[    0.800465] NFS: Registering the id_resolver key type
[    0.801520] Key type id_resolver registered
[    0.802315] Key type id_legacy registered
[    0.803355] Key type cifs.idmap registered
[    0.813870] xor: automatically using best checksumming function   avx       
[    0.815329] Key type asymmetric registered
[    0.816145] Asymmetric key parser 'x509' registered
[    0.817143] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 250)
[    0.818657] io scheduler mq-deadline registered
[    0.819587] io scheduler kyber registered
[    0.820756] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input0
[    0.837292] ACPI: Power Button [PWRF]
[    0.838876] PCI Interrupt Link [GSIG] enabled at IRQ 22
[    0.842019] PCI Interrupt Link [GSIH] enabled at IRQ 23
[    0.846082] PCI Interrupt Link [GSIE] enabled at IRQ 20
[    0.848686] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[    0.850306] 00:03: ttyS2 at I/O 0x3e8 (irq = 4, base_baud = 115200) is a 16550A
[    0.852042] 00:04: ttyS1 at I/O 0x2f8 (irq = 3, base_baud = 115200) is a 16550A
[    0.853774] 00:05: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
[    0.856293] Linux agpgart interface v0.103
[    0.857436] random: fast init done
[    0.857497] bochs-drm 0000:00:01.0: vgaarb: deactivate vga console
[    0.859560] random: crng init done
[    0.872210] Console: switching to colour dummy device 80x25
[    0.876101] [drm] Found bochs VGA, ID 0xb0c0.
[    0.877289] [drm] Framebuffer size 16384 kB @ 0xfd000000, mmio @ 0xfebd0000.
[    0.879522] [TTM] Zone  kernel: Available graphics memory: 242560 KiB
[    0.881123] [TTM] Initializing pool allocator
[    0.882012] [TTM] Initializing DMA pool allocator
[    0.884703] [drm] Found EDID data blob.
[    0.885755] [drm] Initialized bochs-drm 1.0.0 20130925 for 0000:00:01.0 on minor 0
[    0.888961] fbcon: bochs-drmdrmfb (fb0) is primary device
[    0.895081] Console: switching to colour frame buffer device 128x48
[    0.899366] bochs-drm 0000:00:01.0: [drm] fb0: bochs-drmdrmfb frame buffer device
[    0.903491] brd: module loaded
[    0.909335] loop: module loaded
[    0.926562] virtio_blk virtio2: [vda] 1049936 512-byte logical blocks (538 MB/513 MiB)
[    0.928187] vda: detected capacity change from 0 to 537567232
[    0.931130] Uniform Multi-Platform E-IDE driver
[    0.932110] ide-gd driver 1.18
[    0.932759] ide-cd driver 5.00
[    0.935272] ahci 0000:00:1f.2: AHCI 0001.0000 32 slots 6 ports 1.5 Gbps 0x3f impl SATA mode
[    0.936966] ahci 0000:00:1f.2: flags: 64bit ncq only 
[    0.939620] scsi host0: ahci
[    0.940569] scsi host1: ahci
[    0.941456] scsi host2: ahci
[    0.942337] scsi host3: ahci
[    0.943214] scsi host4: ahci
[    0.944118] scsi host5: ahci
[    0.944809] ata1: SATA max UDMA/133 abar m4096@0xfebd4000 port 0xfebd4100 irq 29
[    0.946332] ata2: SATA max UDMA/133 abar m4096@0xfebd4000 port 0xfebd4180 irq 29
[    0.947825] ata3: SATA max UDMA/133 abar m4096@0xfebd4000 port 0xfebd4200 irq 29
[    0.952262] ata4: SATA max UDMA/133 abar m4096@0xfebd4000 port 0xfebd4280 irq 29
[    0.953762] ata5: SATA max UDMA/133 abar m4096@0xfebd4000 port 0xfebd4300 irq 29
[    0.955251] ata6: SATA max UDMA/133 abar m4096@0xfebd4000 port 0xfebd4380 irq 29
[    0.958727] e100: Intel(R) PRO/100 Network Driver
[    0.959704] e100: Copyright(c) 1999-2006 Intel Corporation
[    0.960827] e1000: Intel(R) PRO/1000 Network Driver
[    0.961836] e1000: Copyright (c) 1999-2006 Intel Corporation.
[    0.963001] e1000e: Intel(R) PRO/1000 Network Driver
[    0.964017] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    0.965229] igb: Intel(R) Gigabit Ethernet Network Driver
[    0.966331] igb: Copyright (c) 2007-2014 Intel Corporation.
[    0.967478] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    0.973922] ehci-pci: EHCI PCI platform driver
[    0.975637] ehci-pci 0000:00:1d.7: EHCI Host Controller
[    0.976740] ehci-pci 0000:00:1d.7: new USB bus registered, assigned bus number 1
[    0.978539] ehci-pci 0000:00:1d.7: irq 19, io mem 0xfebd3000
[    0.986331] ehci-pci 0000:00:1d.7: USB 2.0 started, EHCI 1.00
[    0.987886] hub 1-0:1.0: USB hub found
[    0.988839] hub 1-0:1.0: 6 ports detected
[    0.989917] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    0.991187] ohci-pci: OHCI PCI platform driver
[    0.992094] uhci_hcd: USB Universal Host Controller Interface driver
[    0.994117] uhci_hcd 0000:00:1d.0: UHCI Host Controller
[    0.995184] uhci_hcd 0000:00:1d.0: new USB bus registered, assigned bus number 2
[    0.996837] uhci_hcd 0000:00:1d.0: irq 16, io base 0x0000c100
[    0.998336] hub 2-0:1.0: USB hub found
[    0.999160] hub 2-0:1.0: 2 ports detected
[    1.001615] uhci_hcd 0000:00:1d.1: UHCI Host Controller
[    1.002757] uhci_hcd 0000:00:1d.1: new USB bus registered, assigned bus number 3
[    1.004473] uhci_hcd 0000:00:1d.1: irq 17, io base 0x0000c120
[    1.005928] hub 3-0:1.0: USB hub found
[    1.006753] hub 3-0:1.0: 2 ports detected
[    1.008381] uhci_hcd 0000:00:1d.2: UHCI Host Controller
[    1.009736] uhci_hcd 0000:00:1d.2: new USB bus registered, assigned bus number 4
[    1.011507] uhci_hcd 0000:00:1d.2: irq 18, io base 0x0000c140
[    1.012947] hub 4-0:1.0: USB hub found
[    1.013789] hub 4-0:1.0: 2 ports detected
[    1.014896] usbcore: registered new interface driver usb-storage
[    1.016256] usbcore: registered new interface driver usbserial_generic
[    1.017706] usbserial: USB Serial support registered for generic
[    1.018980] usbcore: registered new interface driver ftdi_sio
[    1.020225] usbserial: USB Serial support registered for FTDI USB Serial Device
[    1.021745] usbcore: registered new interface driver pl2303
[    1.022897] usbserial: USB Serial support registered for pl2303
[    1.024209] i8042: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU] at 0x60,0x64 irq 1,12
[    1.026986] serio: i8042 KBD port at 0x60,0x64 irq 1
[    1.028060] serio: i8042 AUX port at 0x60,0x64 irq 12
[    1.029253] mousedev: PS/2 mouse device common for all mice
[    1.030968] rtc_cmos 00:06: RTC can wake from S4
[    1.031998] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input1
[    1.034980] rtc_cmos 00:06: registered as rtc0
[    1.036860] rtc_cmos 00:06: setting system clock to 2021-06-02T23:32:20 UTC (1622676740)
[    1.039571] rtc_cmos 00:06: alarms up to one day, y3k, 242 bytes nvram, hpet irqs
[    1.043611] i801_smbus 0000:00:1f.3: SMBus using PCI interrupt
[    1.045914] i2c i2c-0: 1/1 memory slots populated (from DMI)
[    1.047908] i2c i2c-0: Memory type 0x07 not supported yet, not instantiating SPD
[    1.051534] device-mapper: ioctl: 4.43.0-ioctl (2020-10-01) initialised: dm-devel@redhat.com
[    1.054592] intel_pstate: CPU model not supported
[    1.056344] sdhci: Secure Digital Host Controller Interface driver
[    1.058438] sdhci: Copyright(c) Pierre Ossman
[    1.060085] sdhci-pltfm: SDHCI platform and OF driver helper
[    1.062203] usbcore: registered new interface driver usbhid
[    1.064095] usbhid: USB HID core driver
[    1.065498] u32 classifier
[    1.066513]     input device check on
[    1.067769]     Actions configured
[    1.069231] NET: Registered protocol family 10
[    1.072831] Segment Routing with IPv6
[    1.074159] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[    1.076470] NET: Registered protocol family 17
[    1.078070] Bridge firewalling registered
[    1.079555] Key type dns_resolver registered
[    1.081175] NET: Registered protocol family 40
[    1.083285] IPI shorthand broadcast: enabled
[    1.084785] sched_clock: Marking stable (917287034, 167460570)->(1180594719, -95847115)
[    1.087394] Loading compiled-in X.509 certificates
[    1.088780] Key type ._fscrypt registered
[    1.090018] Key type .fscrypt registered
[    1.091137] Key type fscrypt-provisioning registered
[    1.092929] Btrfs loaded, crc32c=crc32c-generic
[    1.094986] Key type encrypted registered
[    1.096759] printk: console [netcon0] enabled
[    1.098159] netconsole: network logging started
[    1.268751] ata3: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
[    1.270365] ata2: SATA link down (SStatus 0 SControl 300)
[    1.271687] ata6: SATA link down (SStatus 0 SControl 300)
[    1.272998] ata1: SATA link down (SStatus 0 SControl 300)
[    1.274328] ata4: SATA link down (SStatus 0 SControl 300)
[    1.275490] ata3.00: ATAPI: QEMU DVD-ROM, 2.5+, max UDMA/100
[    1.276652] ata3.00: applying bridge limits
[    1.277700] ata3.00: configured for UDMA/100
[    1.278913] ata5: SATA link down (SStatus 0 SControl 300)
[    1.289105] scsi 2:0:0:0: CD-ROM            QEMU     QEMU DVD-ROM     2.5+ PQ: 0 ANSI: 5
[    1.308642] sr 2:0:0:0: [sr0] scsi3-mmc drive: 4x/4x cd/rw xa/form2 tray
[    1.309287] usb 1-1: new high-speed USB device number 2 using ehci-pci
[    1.310146] cdrom: Uniform CD-ROM driver Revision: 3.20
[    1.451586] input: QEMU QEMU USB Tablet as /devices/pci0000:00/0000:00:1d.7/usb1/1-1/1-1:1.0/0003:0627:0001.0001/input/input4
[    1.454475] hid-generic 0003:0627:0001.0001: input: USB HID v0.01 Mouse [QEMU QEMU USB Tablet] on usb-0000:00:1d.7-1/input0
[    1.677230] input: ImExPS/2 Generic Explorer Mouse as /devices/platform/i8042/serio1/input/input3
[    1.692287] IP-Config: Complete:
[    1.693051]      device=eth0, hwaddr=52:54:00:12:34:02, ipaddr=192.168.7.2, mask=255.255.255.0, gw=192.168.7.1
[    1.695109]      host=192.168.7.2, domain=, nis-domain=(none)
[    1.696262]      bootserver=255.255.255.255, rootserver=255.255.255.255, rootpath=
[    1.696842] md: Waiting for all devices to be available before autodetect
[    1.699829] md: If you don't use raid, use raid=noautodetect
[    1.700996] md: Autodetecting RAID arrays.
[    1.701851] md: autorun ...
[    1.702424] md: ... autorun DONE.
[    1.705441] EXT4-fs (vda): mounted filesystem with ordered data mode. Opts: (null)
[    1.707057] VFS: Mounted root (ext4 filesystem) on device 253:0.
[    1.708549] devtmpfs: mounted
[    1.710834] Freeing unused kernel image (initmem) memory: 1532K
[    1.713271] Write protecting the kernel read-only data: 22528k
[    1.716228] Freeing unused kernel image (text/rodata gap) memory: 2032K
[    1.717959] Freeing unused kernel image (rodata/data gap) memory: 652K
[    1.719379] Run /sbin/init as init process

INIT: version 2.99 booting
FBIOPUT_VSCREENINFO failed, double buffering disabledStarting udev
[    1.786606] udevd[160]: starting version 3.2.10
[    1.795344] udevd[161]: starting eudev-3.2.10
[    1.971320] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
[    2.956524] EXT4-fs (vda): re-mounted. Opts: (null)
ALSA: Restoring mixer settings...
/usr/sbin/alsactl: load_state:1735: No soundcards found...

INIT: Entering runlevel: 5

Configuring network interfaces... ip: RTNETLINK answers: File exists
Starting system message bus: dbus.
Starting Connection Manager
Starting Xserver
Starting Dropbear SSH server: 
Generating 2048 bit rsa key, this may take a while...

X.Org X Server 1.20.11
X Protocol Version 11, Revision 0
Build Operating System: Linux 
Current Operating System: Linux qemux86-64 5.10.41-yocto-standard #1 SMP PREEMPT Fri May 28 18:17:12 UTC 2021 x86_64
Kernel command line: root=/dev/vda rw  mem=512M ip=192.168.7.2::192.168.7.1:255.255.255.0 console=ttyS0 console=ttyS1 oprofile.timer=1 tsc=reliable no_timer_check rcupdate.rcu_expedited=1  printk.time=1
Build Date: 13 April 2021  02:12:37PM
 
Current version of pixman: 0.40.0
	Before reporting problems, check http://wiki.x.org
	to make sure that you have the latest version.
Markers: (--) probed, (**) from config file, (==) default setting,
	(++) from command line, (!!) notice, (II) informational,
	(WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(==) Log file: "/var/log/Xorg.0.log", Time: Wed Jun  2 23:32:37 2021
(==) Using config file: "/etc/X11/xorg.conf"
(==) Using system config directory "/usr/share/X11/xorg.conf.d"
pci id for fd 12: 1234:1111, driver (null)
MESA-LOADER: failed to open bochs-drm: /usr/lib/dri/bochs-drm_dri.so: cannot open shared object file: No such file or directory (search paths /usr/lib/dri)
failed to load driver: bochs-drm
(II) modeset(0): Initializing kms color map for depth 24, 8 bpc.
D-BUS per-session daemon address is: unix:abstract=/tmp/dbus-XBrEEjLfGM,guid=dfea5026e71968e5605dff1c60b81515
Using calibration data stored in /etc/pointercal.xinput
Using calibration data stored in /etc/pointercal.xinput
libGL error: pci id for fd 4: 1234:1111, driver (null)
libGL error: MESA-LOADER: failed to open bochs-drm: /usr/lib/dri/bochs-drm_dri.so: cannot open shared object file: No such file or directory (search paths /usr/lib/dri)
libGL error: failed to load driver: bochs-drm
libGL error: pci id for fd 4: 1234:1111, driver (null)
libGL error: MESA-LOADER: failed to open bochs-drm: /usr/lib/dri/bochs-drm_dri.so: cannot open shared object file: No such file or directory (search paths /usr/lib/dri)
libGL error: failed to load driver: bochs-drm
libGL error: pci id for fd 4: 1234:1111, driver (null)
libGL error: MESA-LOADER: failed to open bochs-drm: /usr/lib/dri/bochs-drm_dri.so: cannot open shared object file: No such file or directory (search paths /usr/lib/dri)
libGL error: failed to load driver: bochs-drm
libGL error: pci id for fd 4: 1234:1111, driver (null)
libGL error: MESA-LOADER: failed to open bochs-drm: /usr/lib/dri/bochs-drm_dri.so: cannot open shared object file: No such file or directory (search paths /usr/lib/dri)
libGL error: failed to load driver: bochs-drm
matchbox: Cant find a keycode for keysym 269025056
matchbox: ignoring key shortcut XF86Calendar=!$contacts

matchbox: Cant find a keycode for keysym 2809
matchbox: ignoring key shortcut telephone=!$dates

matchbox: Cant find a keycode for keysym 269025050
matchbox: ignoring key shortcut XF86Start=!matchbox-remote -desktop

libGL error: pci id for fd 4: 1234:1111, driver (null)
libGL error: MESA-LOADER: failed to open bochs-drm: /usr/lib/dri/bochs-drm_dri.so: cannot open shared object file: No such file or directory (search paths /usr/lib/dri)
libGL error: failed to load driver: bochs-drm
libGL error: pci id for fd 4: 1234:1111, driver (null)
libGL error: MESA-LOADER: failed to open bochs-drm: /usr/lib/dri/bochs-drm_dri.so: cannot open shared object file: No such file or directory (search paths /usr/lib/dri)
libGL error: failed to load driver: bochs-drm
[settings daemon] Forking. run with -n to prevent fork
dbus-daemon[601]: Activating service name='org.a11y.atspi.Registry' requested by ':1.1' (uid=0 pid=620 comm="matchbox-panel --start-applets showdesktop,windows")
dbus-daemon[601]: Successfully activated service 'org.a11y.atspi.Registry'
SpiRegistry daemon is running with well-known name - org.a11y.atspi.Registry

(connman-applet:586): Gdk-[1;35mCRITICAL[0m **: [34m23:32:38.638[0m: gdk_window_thaw_toplevel_updates: assertion 'window->update_and_descendants_freeze_count > 0' failed

** (matchbox-desktop:619): [1;33mWARNING[0m **: [34m23:32:39.141[0m: Error loading icon: Icon 'terminal' not present in theme Sato

** (matchbox-desktop:619): [1;33mWARNING[0m **: [34m23:32:39.144[0m: Error loading icon: Icon 'net-48d24' not present in theme Sato
Public key portion is:
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCF036z+sp4BlswNQnowU6bGiegjZLUSLYYBIQUYg70892V3kCviKIGWSDjofMJcJporbFb8bt6NjvEo1WPYQ1YbqPyvuxwVwHu8TxhW5fsZ31Dp+/+HhwE7T9rEWULWMdHdPSJS/P+nwrwpkjPhyAYBIeT9/WQgdemb5lKkRW29wP/fTkU3Zziq2xTzt7R6V0bRpGv7bVwx8whNRH5mGIm+6jyPmZe4irtm15gs6iz4yKwwXTkN66ceTDYEyTcx3EvnrlppcnyA1hioS7uXufnWUfEvq8FEsB59dZZs9axcnIPgcZ9GqjnjBL4GyIH7qZXBL6Fpw0tHya9rqsHzzhR root@qemux86-64
Fingerprint: sha1!! 74:7f:dc:64:da:93:11:4d:7d:22:c9:f9:ce:73:c6:68:6a:6c:a7:ca
dropbear.
Starting rpcbind daemon...done.
Starting bluetooth: bluetoothd.
Starting syslogd/klogd: [   26.673626] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[   26.678686] Bluetooth: BNEP filters: protocol multicast
[   26.680506] Bluetooth: BNEP socket layer initialized
done
 * Starting Avahi mDNS/DNS-SD Daemon: avahi-daemon
   ...done.
Starting Telephony daemon

Poky (Yocto Project Reference Distro) 3.3+snapshot-0e86146898d0883352a0a1d46257239dc79cccc7 qemux86-64 /dev/ttyS0


qemux86-64 login: [  133.333475] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
[  133.337109] 	(detected by 2, t=25864 jiffies, g=1529, q=10)
[  133.339025] rcu: All QSes seen, last rcu_preempt kthread activity 4865 (4294800423-4294795558), jiffies_till_next_fqs=3, root ->qsmask 0x0
[  133.343445] rcu: rcu_preempt kthread starved for 4870 jiffies! g1529 f0x2 RCU_GP_WAIT_FQS(5) ->state=0x200 ->cpu=2
[  133.346976] rcu: 	Unless rcu_preempt kthread gets sufficient CPU time, OOM is now expected behavior.
[  133.350262] rcu: RCU grace-period kthread stack dump:
[  133.352704] task:rcu_preempt     state:R stack:    0 pid:   13 ppid:     2 flags:0x00004000
[  133.355581] Call Trace:
[  133.356488]  __schedule+0x1dc/0x570
[  133.357693]  ? __mod_timer+0x220/0x3c0
[  133.359018]  schedule+0x68/0xe0
[  133.360000]  schedule_timeout+0x8f/0x160
[  133.361267]  ? force_qs_rnp+0x8d/0x1c0
[  133.362515]  ? __next_timer_interrupt+0x100/0x100
[  133.364264]  rcu_gp_kthread+0x55f/0xba0
[  133.365701]  ? note_gp_changes+0x70/0x70
[  133.367356]  kthread+0x145/0x170
[  133.368597]  ? kthread_associate_blkcg+0xc0/0xc0
[  133.370686]  ret_from_fork+0x22/0x30
[  133.371976] BUG: scheduling while atomic: swapper/2/0/0x00000002
[  133.374066] Modules linked in: bnep
[  133.375324] CPU: 2 PID: 0 Comm: swapper/2 Not tainted 5.10.41-yocto-standard #1
[  133.377813] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.14.0-0-g155821a1990b-prebuilt.qemu.org 04/01/2014
[  133.381882] Call Trace:
[  133.382744]  dump_stack+0x5e/0x74
[  133.384027]  __schedule_bug.cold+0x4b/0x59
[  133.385362]  __schedule+0x3f6/0x570
[  133.386655]  schedule_idle+0x2c/0x40
[  133.388033]  do_idle+0x15a/0x250
[  133.389257]  ? complete+0x3f/0x50
[  133.390406]  cpu_startup_entry+0x20/0x30
[  133.391827]  start_secondary+0xf1/0x100
[  133.393143]  secondary_startup_64_no_verify+0xc2/0xcb
[  191.482302] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
[  255.155323] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:




