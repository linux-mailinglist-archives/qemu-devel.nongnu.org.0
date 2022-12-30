Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E62C655863
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 05:23:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8w2s-0005Vp-EP; Fri, 23 Dec 2022 23:22:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=zjrg=4W=zx2c4.com=Jason@kernel.org>)
 id 1p8w2o-0005RF-Nr
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 23:21:58 -0500
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=zjrg=4W=zx2c4.com=Jason@kernel.org>)
 id 1p8w2j-0000sd-VY
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 23:21:58 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5100C6006F;
 Sat, 24 Dec 2022 04:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 332DDC433D2;
 Sat, 24 Dec 2022 04:21:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="IY8ie7RO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1671855707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wMVEWgAImpaXOXkbRJR5Q/isX0SCyP6IRhnpnkOD6IQ=;
 b=IY8ie7ROPhL0l1bC8QrEukCxsEgYOuBGOKR4oYz4VAhpfWpfeJUbq7mNX31D1+gBDsdubC
 kYchS619lE/LrYXzb9Vbdj1kp/T0zJLmZCbMzB9lUudw/+dMAA5g01Eo0opYVH4j2TWcDW
 sdSEe1tXX8NYCqSy0jG0npgQgTtak3g=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ff9fbfc8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Sat, 24 Dec 2022 04:21:47 +0000 (UTC)
Date: Sat, 24 Dec 2022 05:21:46 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, "Michael S . Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 kasan-dev@googlegroups.com, Dmitry Vyukov <dvyukov@google.com>
Subject: Re: [PATCH v5 4/4] x86: re-enable rng seeding via SetupData
Message-ID: <Y6Z+WpqN59ZjIKkk@zx2c4.com>
References: <20220921093134.2936487-1-Jason@zx2c4.com>
 <20220921093134.2936487-4-Jason@zx2c4.com>
 <Y6ZESPx4ettBLuMt@sol.localdomain> <Y6ZtVGtFpUNQP+KU@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y6ZtVGtFpUNQP+KU@zx2c4.com>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=zjrg=4W=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=ham autolearn_force=no
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

On Sat, Dec 24, 2022 at 04:09:08AM +0100, Jason A. Donenfeld wrote:
> Hi Eric,
> 
> Replying to you from my telephone, and I'm traveling the next two days,
> but I thought I should mention some preliminary results right away from
> doing some termux compiles:
> 
> On Fri, Dec 23, 2022 at 04:14:00PM -0800, Eric Biggers wrote:
> > Hi Jason,
> > 
> > On Wed, Sep 21, 2022 at 11:31:34AM +0200, Jason A. Donenfeld wrote:
> > > This reverts 3824e25db1 ("x86: disable rng seeding via setup_data"), but
> > > for 7.2 rather than 7.1, now that modifying setup_data is safe to do.
> > > 
> > > Cc: Laurent Vivier <laurent@vivier.eu>
> > > Cc: Michael S. Tsirkin <mst@redhat.com>
> > > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > > Cc: Peter Maydell <peter.maydell@linaro.org>
> > > Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> > > Cc: Richard Henderson <richard.henderson@linaro.org>
> > > Cc: Ard Biesheuvel <ardb@kernel.org>
> > > Acked-by: Gerd Hoffmann <kraxel@redhat.com>
> > > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> > > ---
> > >  hw/i386/microvm.c | 2 +-
> > >  hw/i386/pc_piix.c | 3 ++-
> > >  hw/i386/pc_q35.c  | 3 ++-
> > >  3 files changed, 5 insertions(+), 3 deletions(-)
> > > 
> > 
> > After upgrading to QEMU 7.2, Linux 6.1 no longer boots with some configs.  There
> > is no output at all.  I bisected it to this commit, and I verified that the
> > following change to QEMU's master branch makes the problem go away:
> > 
> > diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> > index b48047f50c..42f5b07d2f 100644
> > --- a/hw/i386/pc_piix.c
> > +++ b/hw/i386/pc_piix.c
> > @@ -441,6 +441,7 @@ static void pc_i440fx_8_0_machine_options(MachineClass *m)
> >      pc_i440fx_machine_options(m);
> >      m->alias = "pc";
> >      m->is_default = true;
> > +    PC_MACHINE_CLASS(m)->legacy_no_rng_seed = true;
> >  }
> > 
> > I've attached the kernel config I am seeing the problem on.
> > 
> > For some reason, the problem also goes away if I disable CONFIG_KASAN.
> > 
> > Any idea what is causing this?
> 
> - Commenting out the call to parse_setup_data() doesn't fix the issue.
>   So there's no KASAN issue with the actual parser.
> 
> - Using KASAN_OUTLINE rather than INLINE does fix the issue!
> 
> That makes me suspect that it's file size related, and QEMU or the BIOS
> is placing setup data at an overlapping offset by accident, or something
> similar.

I removed the file systems from your config to bring the kernel size
back down, and voila, it works, even with KASAN_INLINE. So perhaps I'm
on the right track here...


> 
> I'll investigate this hypothesis when I'm back at a real computer.
> 
> Jason
> 
> 
> 
> 
> 
> 
> > 
> > - Eric
> 
> > #
> > # Automatically generated file; DO NOT EDIT.
> > # Linux/x86 6.1.0 Kernel Configuration
> > #
> > CONFIG_CC_VERSION_TEXT="gcc (GCC) 12.2.0"
> > CONFIG_CC_IS_GCC=y
> > CONFIG_GCC_VERSION=120200
> > CONFIG_CLANG_VERSION=0
> > CONFIG_AS_IS_GNU=y
> > CONFIG_AS_VERSION=23900
> > CONFIG_LD_IS_BFD=y
> > CONFIG_LD_VERSION=23900
> > CONFIG_LLD_VERSION=0
> > CONFIG_CC_CAN_LINK=y
> > CONFIG_CC_CAN_LINK_STATIC=y
> > CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
> > CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT=y
> > CONFIG_CC_HAS_ASM_INLINE=y
> > CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
> > CONFIG_PAHOLE_VERSION=0
> > CONFIG_CONSTRUCTORS=y
> > CONFIG_IRQ_WORK=y
> > CONFIG_BUILDTIME_TABLE_SORT=y
> > CONFIG_THREAD_INFO_IN_TASK=y
> > 
> > #
> > # General setup
> > #
> > CONFIG_INIT_ENV_ARG_LIMIT=32
> > # CONFIG_COMPILE_TEST is not set
> > # CONFIG_WERROR is not set
> > CONFIG_LOCALVERSION=""
> > CONFIG_LOCALVERSION_AUTO=y
> > CONFIG_BUILD_SALT=""
> > CONFIG_HAVE_KERNEL_GZIP=y
> > CONFIG_HAVE_KERNEL_BZIP2=y
> > CONFIG_HAVE_KERNEL_LZMA=y
> > CONFIG_HAVE_KERNEL_XZ=y
> > CONFIG_HAVE_KERNEL_LZO=y
> > CONFIG_HAVE_KERNEL_LZ4=y
> > CONFIG_HAVE_KERNEL_ZSTD=y
> > CONFIG_KERNEL_GZIP=y
> > # CONFIG_KERNEL_BZIP2 is not set
> > # CONFIG_KERNEL_LZMA is not set
> > # CONFIG_KERNEL_XZ is not set
> > # CONFIG_KERNEL_LZO is not set
> > # CONFIG_KERNEL_LZ4 is not set
> > # CONFIG_KERNEL_ZSTD is not set
> > CONFIG_DEFAULT_INIT=""
> > CONFIG_DEFAULT_HOSTNAME="(none)"
> > CONFIG_SYSVIPC=y
> > CONFIG_SYSVIPC_SYSCTL=y
> > CONFIG_SYSVIPC_COMPAT=y
> > CONFIG_POSIX_MQUEUE=y
> > CONFIG_POSIX_MQUEUE_SYSCTL=y
> > # CONFIG_WATCH_QUEUE is not set
> > CONFIG_CROSS_MEMORY_ATTACH=y
> > # CONFIG_USELIB is not set
> > # CONFIG_AUDIT is not set
> > CONFIG_HAVE_ARCH_AUDITSYSCALL=y
> > 
> > #
> > # IRQ subsystem
> > #
> > CONFIG_GENERIC_IRQ_PROBE=y
> > CONFIG_GENERIC_IRQ_SHOW=y
> > CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=y
> > CONFIG_GENERIC_PENDING_IRQ=y
> > CONFIG_GENERIC_IRQ_MIGRATION=y
> > CONFIG_HARDIRQS_SW_RESEND=y
> > CONFIG_IRQ_DOMAIN=y
> > CONFIG_IRQ_DOMAIN_HIERARCHY=y
> > CONFIG_GENERIC_MSI_IRQ=y
> > CONFIG_GENERIC_MSI_IRQ_DOMAIN=y
> > CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=y
> > CONFIG_GENERIC_IRQ_RESERVATION_MODE=y
> > CONFIG_IRQ_FORCED_THREADING=y
> > CONFIG_SPARSE_IRQ=y
> > # CONFIG_GENERIC_IRQ_DEBUGFS is not set
> > # end of IRQ subsystem
> > 
> > CONFIG_CLOCKSOURCE_WATCHDOG=y
> > CONFIG_ARCH_CLOCKSOURCE_INIT=y
> > CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=y
> > CONFIG_GENERIC_TIME_VSYSCALL=y
> > CONFIG_GENERIC_CLOCKEVENTS=y
> > CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=y
> > CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=y
> > CONFIG_GENERIC_CMOS_UPDATE=y
> > CONFIG_HAVE_POSIX_CPU_TIMERS_TASK_WORK=y
> > CONFIG_POSIX_CPU_TIMERS_TASK_WORK=y
> > CONFIG_CONTEXT_TRACKING=y
> > CONFIG_CONTEXT_TRACKING_IDLE=y
> > 
> > #
> > # Timers subsystem
> > #
> > CONFIG_TICK_ONESHOT=y
> > CONFIG_NO_HZ_COMMON=y
> > # CONFIG_HZ_PERIODIC is not set
> > CONFIG_NO_HZ_IDLE=y
> > # CONFIG_NO_HZ_FULL is not set
> > CONFIG_NO_HZ=y
> > CONFIG_HIGH_RES_TIMERS=y
> > CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US=100
> > # end of Timers subsystem
> > 
> > CONFIG_BPF=y
> > CONFIG_HAVE_EBPF_JIT=y
> > CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=y
> > 
> > #
> > # BPF subsystem
> > #
> > # CONFIG_BPF_SYSCALL is not set
> > # end of BPF subsystem
> > 
> > CONFIG_PREEMPT_BUILD=y
> > CONFIG_PREEMPT_NONE=y
> > # CONFIG_PREEMPT_VOLUNTARY is not set
> > # CONFIG_PREEMPT is not set
> > CONFIG_PREEMPT_COUNT=y
> > CONFIG_PREEMPTION=y
> > CONFIG_PREEMPT_DYNAMIC=y
> > # CONFIG_SCHED_CORE is not set
> > 
> > #
> > # CPU/Task time and stats accounting
> > #
> > CONFIG_TICK_CPU_ACCOUNTING=y
> > # CONFIG_VIRT_CPU_ACCOUNTING_GEN is not set
> > # CONFIG_IRQ_TIME_ACCOUNTING is not set
> > # CONFIG_BSD_PROCESS_ACCT is not set
> > # CONFIG_TASKSTATS is not set
> > # CONFIG_PSI is not set
> > # end of CPU/Task time and stats accounting
> > 
> > CONFIG_CPU_ISOLATION=y
> > 
> > #
> > # RCU Subsystem
> > #
> > CONFIG_TREE_RCU=y
> > CONFIG_PREEMPT_RCU=y
> > # CONFIG_RCU_EXPERT is not set
> > CONFIG_SRCU=y
> > CONFIG_TREE_SRCU=y
> > CONFIG_TASKS_RCU_GENERIC=y
> > CONFIG_TASKS_RCU=y
> > CONFIG_RCU_STALL_COMMON=y
> > CONFIG_RCU_NEED_SEGCBLIST=y
> > # end of RCU Subsystem
> > 
> > CONFIG_IKCONFIG=y
> > CONFIG_IKCONFIG_PROC=y
> > # CONFIG_IKHEADERS is not set
> > CONFIG_LOG_BUF_SHIFT=17
> > CONFIG_LOG_CPU_MAX_BUF_SHIFT=12
> > CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13
> > # CONFIG_PRINTK_INDEX is not set
> > CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y
> > 
> > #
> > # Scheduler features
> > #
> > # CONFIG_UCLAMP_TASK is not set
> > # end of Scheduler features
> > 
> > CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
> > CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=y
> > CONFIG_CC_HAS_INT128=y
> > CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough=5"
> > CONFIG_GCC12_NO_ARRAY_BOUNDS=y
> > CONFIG_CC_NO_ARRAY_BOUNDS=y
> > CONFIG_ARCH_SUPPORTS_INT128=y
> > # CONFIG_NUMA_BALANCING is not set
> > CONFIG_CGROUPS=y
> > # CONFIG_CGROUP_FAVOR_DYNMODS is not set
> > # CONFIG_MEMCG is not set
> > # CONFIG_BLK_CGROUP is not set
> > # CONFIG_CGROUP_SCHED is not set
> > # CONFIG_CGROUP_PIDS is not set
> > # CONFIG_CGROUP_RDMA is not set
> > # CONFIG_CGROUP_FREEZER is not set
> > # CONFIG_CPUSETS is not set
> > # CONFIG_CGROUP_DEVICE is not set
> > # CONFIG_CGROUP_CPUACCT is not set
> > # CONFIG_CGROUP_PERF is not set
> > # CONFIG_CGROUP_MISC is not set
> > # CONFIG_CGROUP_DEBUG is not set
> > CONFIG_NAMESPACES=y
> > CONFIG_UTS_NS=y
> > CONFIG_TIME_NS=y
> > CONFIG_IPC_NS=y
> > CONFIG_USER_NS=y
> > CONFIG_PID_NS=y
> > CONFIG_NET_NS=y
> > # CONFIG_CHECKPOINT_RESTORE is not set
> > # CONFIG_SCHED_AUTOGROUP is not set
> > # CONFIG_SYSFS_DEPRECATED is not set
> > # CONFIG_RELAY is not set
> > CONFIG_BLK_DEV_INITRD=y
> > CONFIG_INITRAMFS_SOURCE=""
> > CONFIG_RD_GZIP=y
> > CONFIG_RD_BZIP2=y
> > CONFIG_RD_LZMA=y
> > CONFIG_RD_XZ=y
> > CONFIG_RD_LZO=y
> > CONFIG_RD_LZ4=y
> > CONFIG_RD_ZSTD=y
> > # CONFIG_BOOT_CONFIG is not set
> > CONFIG_INITRAMFS_PRESERVE_MTIME=y
> > CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
> > # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
> > CONFIG_LD_ORPHAN_WARN=y
> > CONFIG_SYSCTL=y
> > CONFIG_HAVE_UID16=y
> > CONFIG_SYSCTL_EXCEPTION_TRACE=y
> > CONFIG_HAVE_PCSPKR_PLATFORM=y
> > # CONFIG_EXPERT is not set
> > CONFIG_UID16=y
> > CONFIG_MULTIUSER=y
> > CONFIG_SGETMASK_SYSCALL=y
> > CONFIG_SYSFS_SYSCALL=y
> > CONFIG_FHANDLE=y
> > CONFIG_POSIX_TIMERS=y
> > CONFIG_PRINTK=y
> > CONFIG_BUG=y
> > CONFIG_ELF_CORE=y
> > CONFIG_PCSPKR_PLATFORM=y
> > CONFIG_BASE_FULL=y
> > CONFIG_FUTEX=y
> > CONFIG_FUTEX_PI=y
> > CONFIG_EPOLL=y
> > CONFIG_SIGNALFD=y
> > CONFIG_TIMERFD=y
> > CONFIG_EVENTFD=y
> > CONFIG_SHMEM=y
> > CONFIG_AIO=y
> > CONFIG_IO_URING=y
> > CONFIG_ADVISE_SYSCALLS=y
> > CONFIG_MEMBARRIER=y
> > CONFIG_KALLSYMS=y
> > CONFIG_KALLSYMS_ALL=y
> > CONFIG_KALLSYMS_ABSOLUTE_PERCPU=y
> > CONFIG_KALLSYMS_BASE_RELATIVE=y
> > CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
> > CONFIG_RSEQ=y
> > # CONFIG_EMBEDDED is not set
> > CONFIG_HAVE_PERF_EVENTS=y
> > 
> > #
> > # Kernel Performance Events And Counters
> > #
> > CONFIG_PERF_EVENTS=y
> > # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
> > # end of Kernel Performance Events And Counters
> > 
> > CONFIG_SYSTEM_DATA_VERIFICATION=y
> > # CONFIG_PROFILING is not set
> > CONFIG_TRACEPOINTS=y
> > # end of General setup
> > 
> > CONFIG_64BIT=y
> > CONFIG_X86_64=y
> > CONFIG_X86=y
> > CONFIG_INSTRUCTION_DECODER=y
> > CONFIG_OUTPUT_FORMAT="elf64-x86-64"
> > CONFIG_LOCKDEP_SUPPORT=y
> > CONFIG_STACKTRACE_SUPPORT=y
> > CONFIG_MMU=y
> > CONFIG_ARCH_MMAP_RND_BITS_MIN=28
> > CONFIG_ARCH_MMAP_RND_BITS_MAX=32
> > CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=8
> > CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=16
> > CONFIG_GENERIC_ISA_DMA=y
> > CONFIG_GENERIC_CSUM=y
> > CONFIG_GENERIC_BUG=y
> > CONFIG_GENERIC_BUG_RELATIVE_POINTERS=y
> > CONFIG_ARCH_MAY_HAVE_PC_FDC=y
> > CONFIG_GENERIC_CALIBRATE_DELAY=y
> > CONFIG_ARCH_HAS_CPU_RELAX=y
> > CONFIG_ARCH_HIBERNATION_POSSIBLE=y
> > CONFIG_ARCH_NR_GPIO=1024
> > CONFIG_ARCH_SUSPEND_POSSIBLE=y
> > CONFIG_AUDIT_ARCH=y
> > CONFIG_KASAN_SHADOW_OFFSET=0xdffffc0000000000
> > CONFIG_X86_64_SMP=y
> > CONFIG_ARCH_SUPPORTS_UPROBES=y
> > CONFIG_FIX_EARLYCON_MEM=y
> > CONFIG_PGTABLE_LEVELS=5
> > CONFIG_CC_HAS_SANE_STACKPROTECTOR=y
> > 
> > #
> > # Processor type and features
> > #
> > CONFIG_SMP=y
> > CONFIG_X86_FEATURE_NAMES=y
> > CONFIG_X86_X2APIC=y
> > CONFIG_X86_MPPARSE=y
> > # CONFIG_GOLDFISH is not set
> > # CONFIG_X86_CPU_RESCTRL is not set
> > # CONFIG_X86_EXTENDED_PLATFORM is not set
> > # CONFIG_X86_INTEL_LPSS is not set
> > # CONFIG_X86_AMD_PLATFORM_DEVICE is not set
> > # CONFIG_IOSF_MBI is not set
> > CONFIG_X86_SUPPORTS_MEMORY_FAILURE=y
> > CONFIG_SCHED_OMIT_FRAME_POINTER=y
> > CONFIG_HYPERVISOR_GUEST=y
> > CONFIG_PARAVIRT=y
> > # CONFIG_PARAVIRT_DEBUG is not set
> > # CONFIG_PARAVIRT_SPINLOCKS is not set
> > CONFIG_X86_HV_CALLBACK_VECTOR=y
> > # CONFIG_XEN is not set
> > CONFIG_KVM_GUEST=y
> > CONFIG_ARCH_CPUIDLE_HALTPOLL=y
> > # CONFIG_PVH is not set
> > # CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
> > CONFIG_PARAVIRT_CLOCK=y
> > # CONFIG_JAILHOUSE_GUEST is not set
> > # CONFIG_ACRN_GUEST is not set
> > # CONFIG_INTEL_TDX_GUEST is not set
> > # CONFIG_MK8 is not set
> > # CONFIG_MPSC is not set
> > CONFIG_MCORE2=y
> > # CONFIG_MATOM is not set
> > # CONFIG_GENERIC_CPU is not set
> > CONFIG_X86_INTERNODE_CACHE_SHIFT=6
> > CONFIG_X86_L1_CACHE_SHIFT=6
> > CONFIG_X86_INTEL_USERCOPY=y
> > CONFIG_X86_USE_PPRO_CHECKSUM=y
> > CONFIG_X86_P6_NOP=y
> > CONFIG_X86_TSC=y
> > CONFIG_X86_CMPXCHG64=y
> > CONFIG_X86_CMOV=y
> > CONFIG_X86_MINIMUM_CPU_FAMILY=64
> > CONFIG_X86_DEBUGCTLMSR=y
> > CONFIG_IA32_FEAT_CTL=y
> > CONFIG_X86_VMX_FEATURE_NAMES=y
> > CONFIG_CPU_SUP_INTEL=y
> > CONFIG_CPU_SUP_AMD=y
> > CONFIG_CPU_SUP_HYGON=y
> > CONFIG_CPU_SUP_CENTAUR=y
> > CONFIG_CPU_SUP_ZHAOXIN=y
> > CONFIG_HPET_TIMER=y
> > CONFIG_DMI=y
> > # CONFIG_GART_IOMMU is not set
> > # CONFIG_MAXSMP is not set
> > CONFIG_NR_CPUS_RANGE_BEGIN=2
> > CONFIG_NR_CPUS_RANGE_END=512
> > CONFIG_NR_CPUS_DEFAULT=64
> > CONFIG_NR_CPUS=48
> > CONFIG_SCHED_CLUSTER=y
> > CONFIG_SCHED_SMT=y
> > CONFIG_SCHED_MC=y
> > CONFIG_SCHED_MC_PRIO=y
> > CONFIG_X86_LOCAL_APIC=y
> > CONFIG_X86_IO_APIC=y
> > # CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS is not set
> > CONFIG_X86_MCE=y
> > # CONFIG_X86_MCELOG_LEGACY is not set
> > CONFIG_X86_MCE_INTEL=y
> > CONFIG_X86_MCE_AMD=y
> > CONFIG_X86_MCE_THRESHOLD=y
> > # CONFIG_X86_MCE_INJECT is not set
> > 
> > #
> > # Performance monitoring
> > #
> > CONFIG_PERF_EVENTS_INTEL_UNCORE=y
> > CONFIG_PERF_EVENTS_INTEL_RAPL=y
> > CONFIG_PERF_EVENTS_INTEL_CSTATE=y
> > # CONFIG_PERF_EVENTS_AMD_POWER is not set
> > CONFIG_PERF_EVENTS_AMD_UNCORE=y
> > # CONFIG_PERF_EVENTS_AMD_BRS is not set
> > # end of Performance monitoring
> > 
> > CONFIG_X86_16BIT=y
> > CONFIG_X86_ESPFIX64=y
> > CONFIG_X86_VSYSCALL_EMULATION=y
> > CONFIG_X86_IOPL_IOPERM=y
> > # CONFIG_MICROCODE is not set
> > # CONFIG_X86_MSR is not set
> > # CONFIG_X86_CPUID is not set
> > CONFIG_X86_5LEVEL=y
> > CONFIG_X86_DIRECT_GBPAGES=y
> > # CONFIG_X86_CPA_STATISTICS is not set
> > # CONFIG_AMD_MEM_ENCRYPT is not set
> > CONFIG_NUMA=y
> > CONFIG_AMD_NUMA=y
> > CONFIG_X86_64_ACPI_NUMA=y
> > # CONFIG_NUMA_EMU is not set
> > CONFIG_NODES_SHIFT=6
> > CONFIG_ARCH_SPARSEMEM_ENABLE=y
> > CONFIG_ARCH_SPARSEMEM_DEFAULT=y
> > CONFIG_ILLEGAL_POINTER_VALUE=0xdead000000000000
> > # CONFIG_X86_PMEM_LEGACY is not set
> > # CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
> > CONFIG_MTRR=y
> > CONFIG_MTRR_SANITIZER=y
> > CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=0
> > CONFIG_MTRR_SANITIZER_SPARE_REG_NR_DEFAULT=1
> > CONFIG_X86_PAT=y
> > CONFIG_ARCH_USES_PG_UNCACHED=y
> > CONFIG_X86_UMIP=y
> > CONFIG_CC_HAS_IBT=y
> > # CONFIG_X86_KERNEL_IBT is not set
> > CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS=y
> > CONFIG_X86_INTEL_TSX_MODE_OFF=y
> > # CONFIG_X86_INTEL_TSX_MODE_ON is not set
> > # CONFIG_X86_INTEL_TSX_MODE_AUTO is not set
> > # CONFIG_X86_SGX is not set
> > # CONFIG_EFI is not set
> > # CONFIG_HZ_100 is not set
> > # CONFIG_HZ_250 is not set
> > CONFIG_HZ_300=y
> > # CONFIG_HZ_1000 is not set
> > CONFIG_HZ=300
> > CONFIG_SCHED_HRTICK=y
> > # CONFIG_KEXEC is not set
> > # CONFIG_KEXEC_FILE is not set
> > # CONFIG_CRASH_DUMP is not set
> > CONFIG_PHYSICAL_START=0x1000000
> > CONFIG_RELOCATABLE=y
> > # CONFIG_RANDOMIZE_BASE is not set
> > CONFIG_PHYSICAL_ALIGN=0x200000
> > CONFIG_DYNAMIC_MEMORY_LAYOUT=y
> > CONFIG_HOTPLUG_CPU=y
> > # CONFIG_BOOTPARAM_HOTPLUG_CPU0 is not set
> > # CONFIG_DEBUG_HOTPLUG_CPU0 is not set
> > # CONFIG_COMPAT_VDSO is not set
> > CONFIG_LEGACY_VSYSCALL_XONLY=y
> > # CONFIG_LEGACY_VSYSCALL_NONE is not set
> > # CONFIG_CMDLINE_BOOL is not set
> > CONFIG_MODIFY_LDT_SYSCALL=y
> > # CONFIG_STRICT_SIGALTSTACK_SIZE is not set
> > CONFIG_HAVE_LIVEPATCH=y
> > # end of Processor type and features
> > 
> > CONFIG_CC_HAS_SLS=y
> > CONFIG_CC_HAS_RETURN_THUNK=y
> > CONFIG_SPECULATION_MITIGATIONS=y
> > # CONFIG_PAGE_TABLE_ISOLATION is not set
> > # CONFIG_RETPOLINE is not set
> > CONFIG_CPU_IBPB_ENTRY=y
> > CONFIG_CPU_IBRS_ENTRY=y
> > # CONFIG_SLS is not set
> > CONFIG_ARCH_HAS_ADD_PAGES=y
> > CONFIG_ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE=y
> > 
> > #
> > # Power management and ACPI options
> > #
> > # CONFIG_SUSPEND is not set
> > # CONFIG_HIBERNATION is not set
> > # CONFIG_PM is not set
> > # CONFIG_ENERGY_MODEL is not set
> > CONFIG_ARCH_SUPPORTS_ACPI=y
> > CONFIG_ACPI=y
> > CONFIG_ACPI_LEGACY_TABLES_LOOKUP=y
> > CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=y
> > CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=y
> > # CONFIG_ACPI_DEBUGGER is not set
> > CONFIG_ACPI_SPCR_TABLE=y
> > # CONFIG_ACPI_FPDT is not set
> > CONFIG_ACPI_LPIT=y
> > # CONFIG_ACPI_REV_OVERRIDE_POSSIBLE is not set
> > # CONFIG_ACPI_EC_DEBUGFS is not set
> > CONFIG_ACPI_AC=y
> > CONFIG_ACPI_BATTERY=y
> > CONFIG_ACPI_BUTTON=y
> > CONFIG_ACPI_FAN=y
> > # CONFIG_ACPI_DOCK is not set
> > CONFIG_ACPI_CPU_FREQ_PSS=y
> > CONFIG_ACPI_PROCESSOR_CSTATE=y
> > CONFIG_ACPI_PROCESSOR_IDLE=y
> > CONFIG_ACPI_CPPC_LIB=y
> > CONFIG_ACPI_PROCESSOR=y
> > CONFIG_ACPI_HOTPLUG_CPU=y
> > # CONFIG_ACPI_PROCESSOR_AGGREGATOR is not set
> > CONFIG_ACPI_THERMAL=y
> > CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=y
> > # CONFIG_ACPI_TABLE_UPGRADE is not set
> > # CONFIG_ACPI_DEBUG is not set
> > # CONFIG_ACPI_PCI_SLOT is not set
> > CONFIG_ACPI_CONTAINER=y
> > CONFIG_ACPI_HOTPLUG_IOAPIC=y
> > # CONFIG_ACPI_SBS is not set
> > # CONFIG_ACPI_HED is not set
> > # CONFIG_ACPI_CUSTOM_METHOD is not set
> > # CONFIG_ACPI_NFIT is not set
> > CONFIG_ACPI_NUMA=y
> > # CONFIG_ACPI_HMAT is not set
> > CONFIG_HAVE_ACPI_APEI=y
> > CONFIG_HAVE_ACPI_APEI_NMI=y
> > # CONFIG_ACPI_APEI is not set
> > # CONFIG_ACPI_DPTF is not set
> > # CONFIG_ACPI_CONFIGFS is not set
> > # CONFIG_ACPI_PFRUT is not set
> > CONFIG_ACPI_PCC=y
> > # CONFIG_PMIC_OPREGION is not set
> > CONFIG_X86_PM_TIMER=y
> > 
> > #
> > # CPU Frequency scaling
> > #
> > CONFIG_CPU_FREQ=y
> > CONFIG_CPU_FREQ_GOV_ATTR_SET=y
> > # CONFIG_CPU_FREQ_STAT is not set
> > # CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
> > # CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
> > # CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
> > CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL=y
> > CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
> > # CONFIG_CPU_FREQ_GOV_POWERSAVE is not set
> > # CONFIG_CPU_FREQ_GOV_USERSPACE is not set
> > # CONFIG_CPU_FREQ_GOV_ONDEMAND is not set
> > # CONFIG_CPU_FREQ_GOV_CONSERVATIVE is not set
> > CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y
> > 
> > #
> > # CPU frequency scaling drivers
> > #
> > CONFIG_X86_INTEL_PSTATE=y
> > # CONFIG_X86_PCC_CPUFREQ is not set
> > # CONFIG_X86_AMD_PSTATE is not set
> > # CONFIG_X86_AMD_PSTATE_UT is not set
> > # CONFIG_X86_ACPI_CPUFREQ is not set
> > # CONFIG_X86_SPEEDSTEP_CENTRINO is not set
> > # CONFIG_X86_P4_CLOCKMOD is not set
> > 
> > #
> > # shared options
> > #
> > # end of CPU Frequency scaling
> > 
> > #
> > # CPU Idle
> > #
> > CONFIG_CPU_IDLE=y
> > # CONFIG_CPU_IDLE_GOV_LADDER is not set
> > CONFIG_CPU_IDLE_GOV_MENU=y
> > # CONFIG_CPU_IDLE_GOV_TEO is not set
> > # CONFIG_CPU_IDLE_GOV_HALTPOLL is not set
> > CONFIG_HALTPOLL_CPUIDLE=y
> > # end of CPU Idle
> > 
> > # CONFIG_INTEL_IDLE is not set
> > # end of Power management and ACPI options
> > 
> > #
> > # Bus options (PCI etc.)
> > #
> > CONFIG_PCI_DIRECT=y
> > CONFIG_PCI_MMCONFIG=y
> > CONFIG_MMCONF_FAM10H=y
> > CONFIG_ISA_DMA_API=y
> > CONFIG_AMD_NB=y
> > # end of Bus options (PCI etc.)
> > 
> > #
> > # Binary Emulations
> > #
> > CONFIG_IA32_EMULATION=y
> > # CONFIG_X86_X32_ABI is not set
> > CONFIG_COMPAT_32=y
> > CONFIG_COMPAT=y
> > CONFIG_COMPAT_FOR_U64_ALIGNMENT=y
> > # end of Binary Emulations
> > 
> > CONFIG_HAVE_KVM=y
> > CONFIG_VIRTUALIZATION=y
> > # CONFIG_KVM is not set
> > CONFIG_AS_AVX512=y
> > CONFIG_AS_SHA1_NI=y
> > CONFIG_AS_SHA256_NI=y
> > CONFIG_AS_TPAUSE=y
> > 
> > #
> > # General architecture-dependent options
> > #
> > CONFIG_HOTPLUG_SMT=y
> > CONFIG_GENERIC_ENTRY=y
> > CONFIG_JUMP_LABEL=y
> > # CONFIG_STATIC_KEYS_SELFTEST is not set
> > # CONFIG_STATIC_CALL_SELFTEST is not set
> > CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
> > CONFIG_ARCH_USE_BUILTIN_BSWAP=y
> > CONFIG_HAVE_IOREMAP_PROT=y
> > CONFIG_HAVE_KPROBES=y
> > CONFIG_HAVE_KRETPROBES=y
> > CONFIG_HAVE_OPTPROBES=y
> > CONFIG_HAVE_KPROBES_ON_FTRACE=y
> > CONFIG_ARCH_CORRECT_STACKTRACE_ON_KRETPROBE=y
> > CONFIG_HAVE_FUNCTION_ERROR_INJECTION=y
> > CONFIG_HAVE_NMI=y
> > CONFIG_TRACE_IRQFLAGS_SUPPORT=y
> > CONFIG_TRACE_IRQFLAGS_NMI_SUPPORT=y
> > CONFIG_HAVE_ARCH_TRACEHOOK=y
> > CONFIG_HAVE_DMA_CONTIGUOUS=y
> > CONFIG_GENERIC_SMP_IDLE_THREAD=y
> > CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
> > CONFIG_ARCH_HAS_SET_MEMORY=y
> > CONFIG_ARCH_HAS_SET_DIRECT_MAP=y
> > CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=y
> > CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=y
> > CONFIG_ARCH_WANTS_NO_INSTR=y
> > CONFIG_HAVE_ASM_MODVERSIONS=y
> > CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
> > CONFIG_HAVE_RSEQ=y
> > CONFIG_HAVE_RUST=y
> > CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=y
> > CONFIG_HAVE_HW_BREAKPOINT=y
> > CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=y
> > CONFIG_HAVE_USER_RETURN_NOTIFIER=y
> > CONFIG_HAVE_PERF_EVENTS_NMI=y
> > CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=y
> > CONFIG_HAVE_PERF_REGS=y
> > CONFIG_HAVE_PERF_USER_STACK_DUMP=y
> > CONFIG_HAVE_ARCH_JUMP_LABEL=y
> > CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=y
> > CONFIG_MMU_GATHER_TABLE_FREE=y
> > CONFIG_MMU_GATHER_RCU_TABLE_FREE=y
> > CONFIG_MMU_GATHER_MERGE_VMAS=y
> > CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
> > CONFIG_HAVE_ALIGNED_STRUCT_PAGE=y
> > CONFIG_HAVE_CMPXCHG_LOCAL=y
> > CONFIG_HAVE_CMPXCHG_DOUBLE=y
> > CONFIG_ARCH_WANT_COMPAT_IPC_PARSE_VERSION=y
> > CONFIG_ARCH_WANT_OLD_COMPAT_IPC=y
> > CONFIG_HAVE_ARCH_SECCOMP=y
> > CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
> > CONFIG_SECCOMP=y
> > CONFIG_SECCOMP_FILTER=y
> > # CONFIG_SECCOMP_CACHE_DEBUG is not set
> > CONFIG_HAVE_ARCH_STACKLEAK=y
> > CONFIG_HAVE_STACKPROTECTOR=y
> > CONFIG_STACKPROTECTOR=y
> > CONFIG_STACKPROTECTOR_STRONG=y
> > CONFIG_ARCH_SUPPORTS_LTO_CLANG=y
> > CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN=y
> > CONFIG_LTO_NONE=y
> > CONFIG_ARCH_SUPPORTS_CFI_CLANG=y
> > CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=y
> > CONFIG_HAVE_CONTEXT_TRACKING_USER=y
> > CONFIG_HAVE_CONTEXT_TRACKING_USER_OFFSTACK=y
> > CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
> > CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
> > CONFIG_HAVE_MOVE_PUD=y
> > CONFIG_HAVE_MOVE_PMD=y
> > CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
> > CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=y
> > CONFIG_HAVE_ARCH_HUGE_VMAP=y
> > CONFIG_HAVE_ARCH_HUGE_VMALLOC=y
> > CONFIG_ARCH_WANT_HUGE_PMD_SHARE=y
> > CONFIG_HAVE_ARCH_SOFT_DIRTY=y
> > CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
> > CONFIG_MODULES_USE_ELF_RELA=y
> > CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=y
> > CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=y
> > CONFIG_SOFTIRQ_ON_OWN_STACK=y
> > CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
> > CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
> > CONFIG_HAVE_EXIT_THREAD=y
> > CONFIG_ARCH_MMAP_RND_BITS=28
> > CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS=y
> > CONFIG_ARCH_MMAP_RND_COMPAT_BITS=8
> > CONFIG_HAVE_ARCH_COMPAT_MMAP_BASES=y
> > CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
> > CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
> > CONFIG_HAVE_OBJTOOL=y
> > CONFIG_HAVE_JUMP_LABEL_HACK=y
> > CONFIG_HAVE_NOINSTR_HACK=y
> > CONFIG_HAVE_NOINSTR_VALIDATION=y
> > CONFIG_HAVE_UACCESS_VALIDATION=y
> > CONFIG_HAVE_STACK_VALIDATION=y
> > CONFIG_OLD_SIGSUSPEND3=y
> > CONFIG_COMPAT_OLD_SIGACTION=y
> > CONFIG_COMPAT_32BIT_TIME=y
> > CONFIG_HAVE_ARCH_VMAP_STACK=y
> > CONFIG_VMAP_STACK=y
> > CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=y
> > CONFIG_RANDOMIZE_KSTACK_OFFSET=y
> > # CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT is not set
> > CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
> > CONFIG_STRICT_KERNEL_RWX=y
> > CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
> > CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=y
> > # CONFIG_LOCK_EVENT_COUNTS is not set
> > CONFIG_ARCH_HAS_MEM_ENCRYPT=y
> > CONFIG_HAVE_STATIC_CALL=y
> > CONFIG_HAVE_STATIC_CALL_INLINE=y
> > CONFIG_HAVE_PREEMPT_DYNAMIC=y
> > CONFIG_HAVE_PREEMPT_DYNAMIC_CALL=y
> > CONFIG_ARCH_WANT_LD_ORPHAN_WARN=y
> > CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
> > CONFIG_ARCH_SUPPORTS_PAGE_TABLE_CHECK=y
> > CONFIG_ARCH_HAS_ELFCORE_COMPAT=y
> > CONFIG_ARCH_HAS_PARANOID_L1D_FLUSH=y
> > CONFIG_DYNAMIC_SIGFRAME=y
> > CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG=y
> > 
> > #
> > # GCOV-based kernel profiling
> > #
> > # CONFIG_GCOV_KERNEL is not set
> > CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
> > # end of GCOV-based kernel profiling
> > 
> > CONFIG_HAVE_GCC_PLUGINS=y
> > CONFIG_GCC_PLUGINS=y
> > # CONFIG_GCC_PLUGIN_LATENT_ENTROPY is not set
> > # end of General architecture-dependent options
> > 
> > CONFIG_RT_MUTEXES=y
> > CONFIG_BASE_SMALL=0
> > # CONFIG_MODULES is not set
> > CONFIG_BLOCK=y
> > CONFIG_BLOCK_LEGACY_AUTOLOAD=y
> > # CONFIG_BLK_DEV_BSGLIB is not set
> > # CONFIG_BLK_DEV_INTEGRITY is not set
> > # CONFIG_BLK_DEV_ZONED is not set
> > # CONFIG_BLK_WBT is not set
> > CONFIG_BLK_DEBUG_FS=y
> > # CONFIG_BLK_SED_OPAL is not set
> > # CONFIG_BLK_INLINE_ENCRYPTION is not set
> > 
> > #
> > # Partition Types
> > #
> > # CONFIG_PARTITION_ADVANCED is not set
> > CONFIG_MSDOS_PARTITION=y
> > CONFIG_EFI_PARTITION=y
> > # end of Partition Types
> > 
> > CONFIG_BLOCK_COMPAT=y
> > CONFIG_BLK_MQ_PCI=y
> > CONFIG_BLK_MQ_VIRTIO=y
> > CONFIG_BLOCK_HOLDER_DEPRECATED=y
> > CONFIG_BLK_MQ_STACKING=y
> > 
> > #
> > # IO Schedulers
> > #
> > CONFIG_MQ_IOSCHED_DEADLINE=y
> > CONFIG_MQ_IOSCHED_KYBER=y
> > # CONFIG_IOSCHED_BFQ is not set
> > # end of IO Schedulers
> > 
> > CONFIG_ASN1=y
> > CONFIG_UNINLINE_SPIN_UNLOCK=y
> > CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
> > CONFIG_MUTEX_SPIN_ON_OWNER=y
> > CONFIG_RWSEM_SPIN_ON_OWNER=y
> > CONFIG_LOCK_SPIN_ON_OWNER=y
> > CONFIG_ARCH_USE_QUEUED_SPINLOCKS=y
> > CONFIG_QUEUED_SPINLOCKS=y
> > CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
> > CONFIG_QUEUED_RWLOCKS=y
> > CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=y
> > CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=y
> > CONFIG_ARCH_HAS_SYSCALL_WRAPPER=y
> > 
> > #
> > # Executable file formats
> > #
> > CONFIG_BINFMT_ELF=y
> > CONFIG_COMPAT_BINFMT_ELF=y
> > CONFIG_ELFCORE=y
> > CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=y
> > CONFIG_BINFMT_SCRIPT=y
> > # CONFIG_BINFMT_MISC is not set
> > CONFIG_COREDUMP=y
> > # end of Executable file formats
> > 
> > #
> > # Memory Management options
> > #
> > CONFIG_SWAP=y
> > # CONFIG_ZSWAP is not set
> > 
> > #
> > # SLAB allocator options
> > #
> > # CONFIG_SLAB is not set
> > CONFIG_SLUB=y
> > CONFIG_SLAB_MERGE_DEFAULT=y
> > # CONFIG_SLAB_FREELIST_RANDOM is not set
> > # CONFIG_SLAB_FREELIST_HARDENED is not set
> > # CONFIG_SLUB_STATS is not set
> > CONFIG_SLUB_CPU_PARTIAL=y
> > # end of SLAB allocator options
> > 
> > # CONFIG_SHUFFLE_PAGE_ALLOCATOR is not set
> > # CONFIG_COMPAT_BRK is not set
> > CONFIG_SPARSEMEM=y
> > CONFIG_SPARSEMEM_EXTREME=y
> > CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
> > CONFIG_SPARSEMEM_VMEMMAP=y
> > CONFIG_HAVE_FAST_GUP=y
> > CONFIG_EXCLUSIVE_SYSTEM_RAM=y
> > CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
> > # CONFIG_MEMORY_HOTPLUG is not set
> > CONFIG_SPLIT_PTLOCK_CPUS=4
> > CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y
> > CONFIG_COMPACTION=y
> > CONFIG_COMPACT_UNEVICTABLE_DEFAULT=1
> > # CONFIG_PAGE_REPORTING is not set
> > CONFIG_MIGRATION=y
> > CONFIG_PHYS_ADDR_T_64BIT=y
> > # CONFIG_KSM is not set
> > CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
> > CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=y
> > # CONFIG_MEMORY_FAILURE is not set
> > CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
> > CONFIG_ARCH_WANTS_THP_SWAP=y
> > # CONFIG_TRANSPARENT_HUGEPAGE is not set
> > CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
> > CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
> > CONFIG_USE_PERCPU_NUMA_NODE_ID=y
> > CONFIG_HAVE_SETUP_PER_CPU_AREA=y
> > # CONFIG_CMA is not set
> > CONFIG_GENERIC_EARLY_IOREMAP=y
> > # CONFIG_DEFERRED_STRUCT_PAGE_INIT is not set
> > # CONFIG_IDLE_PAGE_TRACKING is not set
> > CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
> > CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
> > CONFIG_ARCH_HAS_PTE_DEVMAP=y
> > CONFIG_ZONE_DMA=y
> > CONFIG_ZONE_DMA32=y
> > CONFIG_ARCH_USES_HIGH_VMA_FLAGS=y
> > CONFIG_ARCH_HAS_PKEYS=y
> > CONFIG_VM_EVENT_COUNTERS=y
> > # CONFIG_PERCPU_STATS is not set
> > # CONFIG_GUP_TEST is not set
> > CONFIG_ARCH_HAS_PTE_SPECIAL=y
> > CONFIG_SECRETMEM=y
> > # CONFIG_ANON_VMA_NAME is not set
> > # CONFIG_USERFAULTFD is not set
> > # CONFIG_LRU_GEN is not set
> > 
> > #
> > # Data Access Monitoring
> > #
> > # CONFIG_DAMON is not set
> > # end of Data Access Monitoring
> > # end of Memory Management options
> > 
> > CONFIG_NET=y
> > 
> > #
> > # Networking options
> > #
> > CONFIG_PACKET=y
> > CONFIG_PACKET_DIAG=y
> > CONFIG_UNIX=y
> > CONFIG_UNIX_SCM=y
> > CONFIG_AF_UNIX_OOB=y
> > CONFIG_UNIX_DIAG=y
> > # CONFIG_TLS is not set
> > # CONFIG_XFRM_USER is not set
> > # CONFIG_NET_KEY is not set
> > CONFIG_INET=y
> > # CONFIG_IP_MULTICAST is not set
> > # CONFIG_IP_ADVANCED_ROUTER is not set
> > # CONFIG_IP_PNP is not set
> > # CONFIG_NET_IPIP is not set
> > # CONFIG_NET_IPGRE_DEMUX is not set
> > CONFIG_NET_IP_TUNNEL=y
> > # CONFIG_SYN_COOKIES is not set
> > # CONFIG_NET_IPVTI is not set
> > # CONFIG_NET_FOU is not set
> > # CONFIG_NET_FOU_IP_TUNNELS is not set
> > # CONFIG_INET_AH is not set
> > # CONFIG_INET_ESP is not set
> > # CONFIG_INET_IPCOMP is not set
> > CONFIG_INET_TABLE_PERTURB_ORDER=16
> > CONFIG_INET_TUNNEL=y
> > CONFIG_INET_DIAG=y
> > CONFIG_INET_TCP_DIAG=y
> > # CONFIG_INET_UDP_DIAG is not set
> > # CONFIG_INET_RAW_DIAG is not set
> > # CONFIG_INET_DIAG_DESTROY is not set
> > # CONFIG_TCP_CONG_ADVANCED is not set
> > CONFIG_TCP_CONG_CUBIC=y
> > CONFIG_DEFAULT_TCP_CONG="cubic"
> > # CONFIG_TCP_MD5SIG is not set
> > CONFIG_IPV6=y
> > # CONFIG_IPV6_ROUTER_PREF is not set
> > # CONFIG_IPV6_OPTIMISTIC_DAD is not set
> > # CONFIG_INET6_AH is not set
> > # CONFIG_INET6_ESP is not set
> > # CONFIG_INET6_IPCOMP is not set
> > # CONFIG_IPV6_MIP6 is not set
> > # CONFIG_IPV6_VTI is not set
> > CONFIG_IPV6_SIT=y
> > # CONFIG_IPV6_SIT_6RD is not set
> > CONFIG_IPV6_NDISC_NODETYPE=y
> > # CONFIG_IPV6_TUNNEL is not set
> > # CONFIG_IPV6_MULTIPLE_TABLES is not set
> > # CONFIG_IPV6_MROUTE is not set
> > # CONFIG_IPV6_SEG6_LWTUNNEL is not set
> > # CONFIG_IPV6_SEG6_HMAC is not set
> > # CONFIG_IPV6_RPL_LWTUNNEL is not set
> > # CONFIG_IPV6_IOAM6_LWTUNNEL is not set
> > # CONFIG_MPTCP is not set
> > # CONFIG_NETWORK_SECMARK is not set
> > # CONFIG_NETWORK_PHY_TIMESTAMPING is not set
> > # CONFIG_NETFILTER is not set
> > # CONFIG_BPFILTER is not set
> > # CONFIG_IP_DCCP is not set
> > # CONFIG_IP_SCTP is not set
> > # CONFIG_RDS is not set
> > # CONFIG_TIPC is not set
> > # CONFIG_ATM is not set
> > # CONFIG_L2TP is not set
> > # CONFIG_BRIDGE is not set
> > # CONFIG_NET_DSA is not set
> > # CONFIG_VLAN_8021Q is not set
> > # CONFIG_LLC2 is not set
> > # CONFIG_ATALK is not set
> > # CONFIG_X25 is not set
> > # CONFIG_LAPB is not set
> > # CONFIG_PHONET is not set
> > # CONFIG_6LOWPAN is not set
> > # CONFIG_IEEE802154 is not set
> > # CONFIG_NET_SCHED is not set
> > # CONFIG_DCB is not set
> > # CONFIG_DNS_RESOLVER is not set
> > # CONFIG_BATMAN_ADV is not set
> > # CONFIG_OPENVSWITCH is not set
> > # CONFIG_VSOCKETS is not set
> > # CONFIG_NETLINK_DIAG is not set
> > # CONFIG_MPLS is not set
> > # CONFIG_NET_NSH is not set
> > # CONFIG_HSR is not set
> > # CONFIG_NET_SWITCHDEV is not set
> > # CONFIG_NET_L3_MASTER_DEV is not set
> > # CONFIG_QRTR is not set
> > # CONFIG_NET_NCSI is not set
> > CONFIG_PCPU_DEV_REFCNT=y
> > CONFIG_RPS=y
> > CONFIG_RFS_ACCEL=y
> > CONFIG_SOCK_RX_QUEUE_MAPPING=y
> > CONFIG_XPS=y
> > # CONFIG_CGROUP_NET_PRIO is not set
> > # CONFIG_CGROUP_NET_CLASSID is not set
> > CONFIG_NET_RX_BUSY_POLL=y
> > CONFIG_BQL=y
> > CONFIG_NET_FLOW_LIMIT=y
> > 
> > #
> > # Network testing
> > #
> > # CONFIG_NET_PKTGEN is not set
> > # CONFIG_NET_DROP_MONITOR is not set
> > # end of Network testing
> > # end of Networking options
> > 
> > # CONFIG_HAMRADIO is not set
> > # CONFIG_CAN is not set
> > # CONFIG_BT is not set
> > # CONFIG_AF_RXRPC is not set
> > # CONFIG_AF_KCM is not set
> > # CONFIG_MCTP is not set
> > # CONFIG_WIRELESS is not set
> > # CONFIG_RFKILL is not set
> > # CONFIG_NET_9P is not set
> > # CONFIG_CAIF is not set
> > # CONFIG_CEPH_LIB is not set
> > # CONFIG_NFC is not set
> > # CONFIG_PSAMPLE is not set
> > # CONFIG_NET_IFE is not set
> > # CONFIG_LWTUNNEL is not set
> > CONFIG_DST_CACHE=y
> > CONFIG_GRO_CELLS=y
> > CONFIG_FAILOVER=y
> > CONFIG_ETHTOOL_NETLINK=y
> > 
> > #
> > # Device Drivers
> > #
> > CONFIG_HAVE_EISA=y
> > # CONFIG_EISA is not set
> > CONFIG_HAVE_PCI=y
> > CONFIG_PCI=y
> > CONFIG_PCI_DOMAINS=y
> > # CONFIG_PCIEPORTBUS is not set
> > CONFIG_PCIEASPM=y
> > CONFIG_PCIEASPM_DEFAULT=y
> > # CONFIG_PCIEASPM_POWERSAVE is not set
> > # CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
> > # CONFIG_PCIEASPM_PERFORMANCE is not set
> > # CONFIG_PCIE_PTM is not set
> > CONFIG_PCI_MSI=y
> > CONFIG_PCI_MSI_IRQ_DOMAIN=y
> > CONFIG_PCI_QUIRKS=y
> > # CONFIG_PCI_DEBUG is not set
> > # CONFIG_PCI_STUB is not set
> > CONFIG_PCI_LOCKLESS_CONFIG=y
> > # CONFIG_PCI_IOV is not set
> > # CONFIG_PCI_PRI is not set
> > # CONFIG_PCI_PASID is not set
> > CONFIG_PCI_LABEL=y
> > CONFIG_VGA_ARB=y
> > CONFIG_VGA_ARB_MAX_GPUS=16
> > # CONFIG_HOTPLUG_PCI is not set
> > 
> > #
> > # PCI controller drivers
> > #
> > # CONFIG_VMD is not set
> > 
> > #
> > # DesignWare PCI Core Support
> > #
> > # CONFIG_PCIE_DW_PLAT_HOST is not set
> > # CONFIG_PCI_MESON is not set
> > # end of DesignWare PCI Core Support
> > 
> > #
> > # Mobiveil PCIe Core Support
> > #
> > # end of Mobiveil PCIe Core Support
> > 
> > #
> > # Cadence PCIe controllers support
> > #
> > # end of Cadence PCIe controllers support
> > # end of PCI controller drivers
> > 
> > #
> > # PCI Endpoint
> > #
> > # CONFIG_PCI_ENDPOINT is not set
> > # end of PCI Endpoint
> > 
> > #
> > # PCI switch controller drivers
> > #
> > # CONFIG_PCI_SW_SWITCHTEC is not set
> > # end of PCI switch controller drivers
> > 
> > # CONFIG_CXL_BUS is not set
> > # CONFIG_PCCARD is not set
> > # CONFIG_RAPIDIO is not set
> > 
> > #
> > # Generic Driver Options
> > #
> > # CONFIG_UEVENT_HELPER is not set
> > CONFIG_DEVTMPFS=y
> > # CONFIG_DEVTMPFS_MOUNT is not set
> > # CONFIG_DEVTMPFS_SAFE is not set
> > CONFIG_STANDALONE=y
> > CONFIG_PREVENT_FIRMWARE_BUILD=y
> > 
> > #
> > # Firmware loader
> > #
> > CONFIG_FW_LOADER=y
> > CONFIG_EXTRA_FIRMWARE=""
> > # CONFIG_FW_LOADER_USER_HELPER is not set
> > # CONFIG_FW_LOADER_COMPRESS is not set
> > # CONFIG_FW_UPLOAD is not set
> > # end of Firmware loader
> > 
> > CONFIG_ALLOW_DEV_COREDUMP=y
> > # CONFIG_DEBUG_DRIVER is not set
> > # CONFIG_DEBUG_DEVRES is not set
> > # CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
> > CONFIG_GENERIC_CPU_AUTOPROBE=y
> > CONFIG_GENERIC_CPU_VULNERABILITIES=y
> > # end of Generic Driver Options
> > 
> > #
> > # Bus devices
> > #
> > # CONFIG_MHI_BUS is not set
> > # CONFIG_MHI_BUS_EP is not set
> > # end of Bus devices
> > 
> > # CONFIG_CONNECTOR is not set
> > 
> > #
> > # Firmware Drivers
> > #
> > 
> > #
> > # ARM System Control and Management Interface Protocol
> > #
> > # end of ARM System Control and Management Interface Protocol
> > 
> > # CONFIG_EDD is not set
> > CONFIG_FIRMWARE_MEMMAP=y
> > # CONFIG_DMIID is not set
> > # CONFIG_DMI_SYSFS is not set
> > CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=y
> > # CONFIG_FW_CFG_SYSFS is not set
> > # CONFIG_SYSFB_SIMPLEFB is not set
> > # CONFIG_GOOGLE_FIRMWARE is not set
> > 
> > #
> > # Tegra firmware driver
> > #
> > # end of Tegra firmware driver
> > # end of Firmware Drivers
> > 
> > # CONFIG_GNSS is not set
> > CONFIG_MTD=y
> > 
> > #
> > # Partition parsers
> > #
> > # CONFIG_MTD_AR7_PARTS is not set
> > # CONFIG_MTD_CMDLINE_PARTS is not set
> > # CONFIG_MTD_REDBOOT_PARTS is not set
> > # end of Partition parsers
> > 
> > #
> > # User Modules And Translation Layers
> > #
> > # CONFIG_MTD_BLOCK is not set
> > # CONFIG_MTD_BLOCK_RO is not set
> > # CONFIG_FTL is not set
> > # CONFIG_NFTL is not set
> > # CONFIG_INFTL is not set
> > # CONFIG_RFD_FTL is not set
> > # CONFIG_SSFDC is not set
> > # CONFIG_SM_FTL is not set
> > # CONFIG_MTD_OOPS is not set
> > # CONFIG_MTD_SWAP is not set
> > # CONFIG_MTD_PARTITIONED_MASTER is not set
> > 
> > #
> > # RAM/ROM/Flash chip drivers
> > #
> > # CONFIG_MTD_CFI is not set
> > # CONFIG_MTD_JEDECPROBE is not set
> > CONFIG_MTD_MAP_BANK_WIDTH_1=y
> > CONFIG_MTD_MAP_BANK_WIDTH_2=y
> > CONFIG_MTD_MAP_BANK_WIDTH_4=y
> > CONFIG_MTD_CFI_I1=y
> > CONFIG_MTD_CFI_I2=y
> > # CONFIG_MTD_RAM is not set
> > # CONFIG_MTD_ROM is not set
> > # CONFIG_MTD_ABSENT is not set
> > # end of RAM/ROM/Flash chip drivers
> > 
> > #
> > # Mapping drivers for chip access
> > #
> > # CONFIG_MTD_COMPLEX_MAPPINGS is not set
> > # CONFIG_MTD_INTEL_VR_NOR is not set
> > # CONFIG_MTD_PLATRAM is not set
> > # end of Mapping drivers for chip access
> > 
> > #
> > # Self-contained MTD device drivers
> > #
> > # CONFIG_MTD_PMC551 is not set
> > # CONFIG_MTD_SLRAM is not set
> > # CONFIG_MTD_PHRAM is not set
> > # CONFIG_MTD_MTDRAM is not set
> > CONFIG_MTD_BLOCK2MTD=y
> > 
> > #
> > # Disk-On-Chip Device Drivers
> > #
> > # CONFIG_MTD_DOCG3 is not set
> > # end of Self-contained MTD device drivers
> > 
> > #
> > # NAND
> > #
> > # CONFIG_MTD_ONENAND is not set
> > # CONFIG_MTD_RAW_NAND is not set
> > 
> > #
> > # ECC engine support
> > #
> > # CONFIG_MTD_NAND_ECC_SW_HAMMING is not set
> > # CONFIG_MTD_NAND_ECC_SW_BCH is not set
> > # CONFIG_MTD_NAND_ECC_MXIC is not set
> > # end of ECC engine support
> > # end of NAND
> > 
> > #
> > # LPDDR & LPDDR2 PCM memory drivers
> > #
> > # CONFIG_MTD_LPDDR is not set
> > # end of LPDDR & LPDDR2 PCM memory drivers
> > 
> > CONFIG_MTD_UBI=y
> > CONFIG_MTD_UBI_WL_THRESHOLD=4096
> > CONFIG_MTD_UBI_BEB_LIMIT=20
> > # CONFIG_MTD_UBI_FASTMAP is not set
> > # CONFIG_MTD_UBI_GLUEBI is not set
> > # CONFIG_MTD_UBI_BLOCK is not set
> > # CONFIG_MTD_HYPERBUS is not set
> > # CONFIG_OF is not set
> > CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
> > # CONFIG_PARPORT is not set
> > CONFIG_PNP=y
> > CONFIG_PNP_DEBUG_MESSAGES=y
> > 
> > #
> > # Protocols
> > #
> > CONFIG_PNPACPI=y
> > CONFIG_BLK_DEV=y
> > # CONFIG_BLK_DEV_NULL_BLK is not set
> > # CONFIG_BLK_DEV_FD is not set
> > # CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
> > # CONFIG_ZRAM is not set
> > CONFIG_BLK_DEV_LOOP=y
> > CONFIG_BLK_DEV_LOOP_MIN_COUNT=8
> > # CONFIG_BLK_DEV_DRBD is not set
> > # CONFIG_BLK_DEV_NBD is not set
> > # CONFIG_BLK_DEV_RAM is not set
> > # CONFIG_ATA_OVER_ETH is not set
> > CONFIG_VIRTIO_BLK=y
> > # CONFIG_BLK_DEV_RBD is not set
> > # CONFIG_BLK_DEV_UBLK is not set
> > 
> > #
> > # NVME Support
> > #
> > # CONFIG_BLK_DEV_NVME is not set
> > # CONFIG_NVME_FC is not set
> > # CONFIG_NVME_TCP is not set
> > # end of NVME Support
> > 
> > #
> > # Misc devices
> > #
> > # CONFIG_DUMMY_IRQ is not set
> > # CONFIG_IBM_ASM is not set
> > # CONFIG_PHANTOM is not set
> > # CONFIG_TIFM_CORE is not set
> > # CONFIG_ENCLOSURE_SERVICES is not set
> > # CONFIG_HP_ILO is not set
> > # CONFIG_SRAM is not set
> > # CONFIG_DW_XDATA_PCIE is not set
> > # CONFIG_PCI_ENDPOINT_TEST is not set
> > # CONFIG_XILINX_SDFEC is not set
> > # CONFIG_C2PORT is not set
> > 
> > #
> > # EEPROM support
> > #
> > # CONFIG_EEPROM_93CX6 is not set
> > # end of EEPROM support
> > 
> > # CONFIG_CB710_CORE is not set
> > 
> > #
> > # Texas Instruments shared transport line discipline
> > #
> > # end of Texas Instruments shared transport line discipline
> > 
> > #
> > # Altera FPGA firmware download module (requires I2C)
> > #
> > # CONFIG_INTEL_MEI is not set
> > # CONFIG_INTEL_MEI_ME is not set
> > # CONFIG_INTEL_MEI_TXE is not set
> > # CONFIG_VMWARE_VMCI is not set
> > # CONFIG_GENWQE is not set
> > # CONFIG_ECHO is not set
> > # CONFIG_BCM_VK is not set
> > # CONFIG_MISC_ALCOR_PCI is not set
> > # CONFIG_MISC_RTSX_PCI is not set
> > # CONFIG_HABANA_AI is not set
> > # CONFIG_PVPANIC is not set
> > # end of Misc devices
> > 
> > #
> > # SCSI device support
> > #
> > CONFIG_SCSI_MOD=y
> > # CONFIG_RAID_ATTRS is not set
> > # CONFIG_SCSI is not set
> > # end of SCSI device support
> > 
> > # CONFIG_ATA is not set
> > CONFIG_MD=y
> > # CONFIG_BLK_DEV_MD is not set
> > # CONFIG_BCACHE is not set
> > CONFIG_BLK_DEV_DM_BUILTIN=y
> > CONFIG_BLK_DEV_DM=y
> > # CONFIG_DM_DEBUG is not set
> > CONFIG_DM_BUFIO=y
> > # CONFIG_DM_DEBUG_BLOCK_MANAGER_LOCKING is not set
> > CONFIG_DM_BIO_PRISON=y
> > CONFIG_DM_PERSISTENT_DATA=y
> > # CONFIG_DM_UNSTRIPED is not set
> > # CONFIG_DM_CRYPT is not set
> > CONFIG_DM_SNAPSHOT=y
> > CONFIG_DM_THIN_PROVISIONING=y
> > # CONFIG_DM_CACHE is not set
> > # CONFIG_DM_WRITECACHE is not set
> > # CONFIG_DM_EBS is not set
> > # CONFIG_DM_ERA is not set
> > # CONFIG_DM_CLONE is not set
> > # CONFIG_DM_MIRROR is not set
> > # CONFIG_DM_RAID is not set
> > CONFIG_DM_ZERO=y
> > # CONFIG_DM_MULTIPATH is not set
> > # CONFIG_DM_DELAY is not set
> > # CONFIG_DM_DUST is not set
> > # CONFIG_DM_INIT is not set
> > # CONFIG_DM_UEVENT is not set
> > CONFIG_DM_FLAKEY=y
> > # CONFIG_DM_VERITY is not set
> > # CONFIG_DM_SWITCH is not set
> > # CONFIG_DM_LOG_WRITES is not set
> > # CONFIG_DM_INTEGRITY is not set
> > # CONFIG_TARGET_CORE is not set
> > # CONFIG_FUSION is not set
> > 
> > #
> > # IEEE 1394 (FireWire) support
> > #
> > # CONFIG_FIREWIRE is not set
> > # CONFIG_FIREWIRE_NOSY is not set
> > # end of IEEE 1394 (FireWire) support
> > 
> > # CONFIG_MACINTOSH_DRIVERS is not set
> > CONFIG_NETDEVICES=y
> > CONFIG_NET_CORE=y
> > # CONFIG_BONDING is not set
> > # CONFIG_DUMMY is not set
> > # CONFIG_WIREGUARD is not set
> > # CONFIG_EQUALIZER is not set
> > # CONFIG_NET_TEAM is not set
> > # CONFIG_MACVLAN is not set
> > # CONFIG_IPVLAN is not set
> > # CONFIG_VXLAN is not set
> > # CONFIG_GENEVE is not set
> > # CONFIG_BAREUDP is not set
> > # CONFIG_GTP is not set
> > # CONFIG_MACSEC is not set
> > # CONFIG_NETCONSOLE is not set
> > # CONFIG_TUN is not set
> > # CONFIG_TUN_VNET_CROSS_LE is not set
> > # CONFIG_VETH is not set
> > CONFIG_VIRTIO_NET=y
> > # CONFIG_NLMON is not set
> > # CONFIG_ARCNET is not set
> > # CONFIG_ETHERNET is not set
> > # CONFIG_FDDI is not set
> > # CONFIG_HIPPI is not set
> > # CONFIG_NET_SB1000 is not set
> > # CONFIG_PHYLIB is not set
> > # CONFIG_PSE_CONTROLLER is not set
> > # CONFIG_MDIO_DEVICE is not set
> > 
> > #
> > # PCS device drivers
> > #
> > # end of PCS device drivers
> > 
> > # CONFIG_PPP is not set
> > # CONFIG_SLIP is not set
> > 
> > #
> > # Host-side USB support is needed for USB Network Adapter support
> > #
> > # CONFIG_WLAN is not set
> > # CONFIG_WAN is not set
> > 
> > #
> > # Wireless WAN
> > #
> > # CONFIG_WWAN is not set
> > # end of Wireless WAN
> > 
> > # CONFIG_VMXNET3 is not set
> > # CONFIG_FUJITSU_ES is not set
> > # CONFIG_NETDEVSIM is not set
> > CONFIG_NET_FAILOVER=y
> > # CONFIG_ISDN is not set
> > 
> > #
> > # Input device support
> > #
> > CONFIG_INPUT=y
> > # CONFIG_INPUT_FF_MEMLESS is not set
> > # CONFIG_INPUT_SPARSEKMAP is not set
> > # CONFIG_INPUT_MATRIXKMAP is not set
> > CONFIG_INPUT_VIVALDIFMAP=y
> > 
> > #
> > # Userland interfaces
> > #
> > # CONFIG_INPUT_MOUSEDEV is not set
> > # CONFIG_INPUT_JOYDEV is not set
> > # CONFIG_INPUT_EVDEV is not set
> > # CONFIG_INPUT_EVBUG is not set
> > 
> > #
> > # Input Device Drivers
> > #
> > CONFIG_INPUT_KEYBOARD=y
> > CONFIG_KEYBOARD_ATKBD=y
> > # CONFIG_KEYBOARD_LKKBD is not set
> > # CONFIG_KEYBOARD_NEWTON is not set
> > # CONFIG_KEYBOARD_OPENCORES is not set
> > # CONFIG_KEYBOARD_STOWAWAY is not set
> > # CONFIG_KEYBOARD_SUNKBD is not set
> > # CONFIG_KEYBOARD_XTKBD is not set
> > # CONFIG_INPUT_MOUSE is not set
> > # CONFIG_INPUT_JOYSTICK is not set
> > # CONFIG_INPUT_TABLET is not set
> > # CONFIG_INPUT_TOUCHSCREEN is not set
> > # CONFIG_INPUT_MISC is not set
> > # CONFIG_RMI4_CORE is not set
> > 
> > #
> > # Hardware I/O ports
> > #
> > CONFIG_SERIO=y
> > CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
> > CONFIG_SERIO_I8042=y
> > # CONFIG_SERIO_SERPORT is not set
> > # CONFIG_SERIO_CT82C710 is not set
> > # CONFIG_SERIO_PCIPS2 is not set
> > CONFIG_SERIO_LIBPS2=y
> > # CONFIG_SERIO_RAW is not set
> > # CONFIG_SERIO_ALTERA_PS2 is not set
> > # CONFIG_SERIO_PS2MULT is not set
> > # CONFIG_SERIO_ARC_PS2 is not set
> > # CONFIG_USERIO is not set
> > # CONFIG_GAMEPORT is not set
> > # end of Hardware I/O ports
> > # end of Input device support
> > 
> > #
> > # Character devices
> > #
> > CONFIG_TTY=y
> > CONFIG_VT=y
> > CONFIG_CONSOLE_TRANSLATIONS=y
> > CONFIG_VT_CONSOLE=y
> > CONFIG_HW_CONSOLE=y
> > # CONFIG_VT_HW_CONSOLE_BINDING is not set
> > CONFIG_UNIX98_PTYS=y
> > # CONFIG_LEGACY_PTYS is not set
> > CONFIG_LDISC_AUTOLOAD=y
> > 
> > #
> > # Serial drivers
> > #
> > CONFIG_SERIAL_EARLYCON=y
> > CONFIG_SERIAL_8250=y
> > # CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
> > CONFIG_SERIAL_8250_PNP=y
> > # CONFIG_SERIAL_8250_16550A_VARIANTS is not set
> > # CONFIG_SERIAL_8250_FINTEK is not set
> > CONFIG_SERIAL_8250_CONSOLE=y
> > CONFIG_SERIAL_8250_PCI=y
> > CONFIG_SERIAL_8250_EXAR=y
> > CONFIG_SERIAL_8250_NR_UARTS=32
> > CONFIG_SERIAL_8250_RUNTIME_UARTS=32
> > # CONFIG_SERIAL_8250_EXTENDED is not set
> > CONFIG_SERIAL_8250_DWLIB=y
> > # CONFIG_SERIAL_8250_DW is not set
> > # CONFIG_SERIAL_8250_RT288X is not set
> > CONFIG_SERIAL_8250_LPSS=y
> > CONFIG_SERIAL_8250_MID=y
> > CONFIG_SERIAL_8250_PERICOM=y
> > 
> > #
> > # Non-8250 serial port support
> > #
> > # CONFIG_SERIAL_UARTLITE is not set
> > CONFIG_SERIAL_CORE=y
> > CONFIG_SERIAL_CORE_CONSOLE=y
> > # CONFIG_SERIAL_JSM is not set
> > # CONFIG_SERIAL_LANTIQ is not set
> > # CONFIG_SERIAL_SCCNXP is not set
> > # CONFIG_SERIAL_ALTERA_JTAGUART is not set
> > # CONFIG_SERIAL_ALTERA_UART is not set
> > # CONFIG_SERIAL_ARC is not set
> > # CONFIG_SERIAL_RP2 is not set
> > # CONFIG_SERIAL_FSL_LPUART is not set
> > # CONFIG_SERIAL_FSL_LINFLEXUART is not set
> > # end of Serial drivers
> > 
> > # CONFIG_SERIAL_NONSTANDARD is not set
> > # CONFIG_N_GSM is not set
> > # CONFIG_NOZOMI is not set
> > # CONFIG_NULL_TTY is not set
> > # CONFIG_SERIAL_DEV_BUS is not set
> > # CONFIG_VIRTIO_CONSOLE is not set
> > # CONFIG_IPMI_HANDLER is not set
> > CONFIG_HW_RANDOM=y
> > # CONFIG_HW_RANDOM_TIMERIOMEM is not set
> > CONFIG_HW_RANDOM_INTEL=y
> > CONFIG_HW_RANDOM_AMD=y
> > # CONFIG_HW_RANDOM_BA431 is not set
> > CONFIG_HW_RANDOM_VIA=y
> > # CONFIG_HW_RANDOM_VIRTIO is not set
> > # CONFIG_HW_RANDOM_XIPHERA is not set
> > # CONFIG_APPLICOM is not set
> > # CONFIG_MWAVE is not set
> > CONFIG_DEVMEM=y
> > # CONFIG_NVRAM is not set
> > CONFIG_DEVPORT=y
> > # CONFIG_HPET is not set
> > # CONFIG_HANGCHECK_TIMER is not set
> > # CONFIG_TCG_TPM is not set
> > # CONFIG_TELCLOCK is not set
> > # CONFIG_XILLYBUS is not set
> > CONFIG_RANDOM_TRUST_CPU=y
> > CONFIG_RANDOM_TRUST_BOOTLOADER=y
> > # end of Character devices
> > 
> > #
> > # I2C support
> > #
> > # CONFIG_I2C is not set
> > # end of I2C support
> > 
> > # CONFIG_I3C is not set
> > # CONFIG_SPI is not set
> > # CONFIG_SPMI is not set
> > # CONFIG_HSI is not set
> > # CONFIG_PPS is not set
> > 
> > #
> > # PTP clock support
> > #
> > # CONFIG_PTP_1588_CLOCK is not set
> > CONFIG_PTP_1588_CLOCK_OPTIONAL=y
> > 
> > #
> > # Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
> > #
> > # end of PTP clock support
> > 
> > # CONFIG_PINCTRL is not set
> > # CONFIG_GPIOLIB is not set
> > # CONFIG_W1 is not set
> > # CONFIG_POWER_RESET is not set
> > CONFIG_POWER_SUPPLY=y
> > # CONFIG_POWER_SUPPLY_DEBUG is not set
> > # CONFIG_PDA_POWER is not set
> > # CONFIG_TEST_POWER is not set
> > # CONFIG_BATTERY_DS2780 is not set
> > # CONFIG_BATTERY_DS2781 is not set
> > # CONFIG_BATTERY_SAMSUNG_SDI is not set
> > # CONFIG_BATTERY_BQ27XXX is not set
> > # CONFIG_CHARGER_MAX8903 is not set
> > # CONFIG_BATTERY_GOLDFISH is not set
> > # CONFIG_HWMON is not set
> > CONFIG_THERMAL=y
> > # CONFIG_THERMAL_NETLINK is not set
> > # CONFIG_THERMAL_STATISTICS is not set
> > CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
> > # CONFIG_THERMAL_WRITABLE_TRIPS is not set
> > CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=y
> > # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
> > # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
> > # CONFIG_THERMAL_GOV_FAIR_SHARE is not set
> > CONFIG_THERMAL_GOV_STEP_WISE=y
> > # CONFIG_THERMAL_GOV_BANG_BANG is not set
> > # CONFIG_THERMAL_GOV_USER_SPACE is not set
> > # CONFIG_THERMAL_EMULATION is not set
> > 
> > #
> > # Intel thermal drivers
> > #
> > # CONFIG_INTEL_POWERCLAMP is not set
> > CONFIG_X86_THERMAL_VECTOR=y
> > # CONFIG_X86_PKG_TEMP_THERMAL is not set
> > # CONFIG_INTEL_SOC_DTS_THERMAL is not set
> > 
> > #
> > # ACPI INT340X thermal drivers
> > #
> > # CONFIG_INT340X_THERMAL is not set
> > # end of ACPI INT340X thermal drivers
> > 
> > # CONFIG_INTEL_PCH_THERMAL is not set
> > # CONFIG_INTEL_TCC_COOLING is not set
> > # CONFIG_INTEL_MENLOW is not set
> > # CONFIG_INTEL_HFI_THERMAL is not set
> > # end of Intel thermal drivers
> > 
> > # CONFIG_WATCHDOG is not set
> > CONFIG_SSB_POSSIBLE=y
> > # CONFIG_SSB is not set
> > CONFIG_BCMA_POSSIBLE=y
> > # CONFIG_BCMA is not set
> > 
> > #
> > # Multifunction device drivers
> > #
> > # CONFIG_MFD_MADERA is not set
> > # CONFIG_HTC_PASIC3 is not set
> > # CONFIG_LPC_ICH is not set
> > # CONFIG_LPC_SCH is not set
> > # CONFIG_MFD_INTEL_LPSS_ACPI is not set
> > # CONFIG_MFD_INTEL_LPSS_PCI is not set
> > # CONFIG_MFD_JANZ_CMODIO is not set
> > # CONFIG_MFD_KEMPLD is not set
> > # CONFIG_MFD_MT6397 is not set
> > # CONFIG_MFD_RDC321X is not set
> > # CONFIG_MFD_SM501 is not set
> > # CONFIG_MFD_SYSCON is not set
> > # CONFIG_MFD_TI_AM335X_TSCADC is not set
> > # CONFIG_MFD_TQMX86 is not set
> > # CONFIG_MFD_VX855 is not set
> > # end of Multifunction device drivers
> > 
> > # CONFIG_REGULATOR is not set
> > # CONFIG_RC_CORE is not set
> > 
> > #
> > # CEC support
> > #
> > # CONFIG_MEDIA_CEC_SUPPORT is not set
> > # end of CEC support
> > 
> > # CONFIG_MEDIA_SUPPORT is not set
> > 
> > #
> > # Graphics support
> > #
> > # CONFIG_AGP is not set
> > # CONFIG_VGA_SWITCHEROO is not set
> > # CONFIG_DRM is not set
> > 
> > #
> > # ARM devices
> > #
> > # end of ARM devices
> > 
> > #
> > # Frame buffer Devices
> > #
> > # CONFIG_FB is not set
> > # end of Frame buffer Devices
> > 
> > #
> > # Backlight & LCD device support
> > #
> > # CONFIG_LCD_CLASS_DEVICE is not set
> > # CONFIG_BACKLIGHT_CLASS_DEVICE is not set
> > # end of Backlight & LCD device support
> > 
> > #
> > # Console display driver support
> > #
> > CONFIG_VGA_CONSOLE=y
> > CONFIG_DUMMY_CONSOLE=y
> > CONFIG_DUMMY_CONSOLE_COLUMNS=80
> > CONFIG_DUMMY_CONSOLE_ROWS=25
> > # end of Console display driver support
> > # end of Graphics support
> > 
> > # CONFIG_SOUND is not set
> > 
> > #
> > # HID support
> > #
> > # CONFIG_HID is not set
> > 
> > #
> > # Intel ISH HID support
> > #
> > # CONFIG_INTEL_ISH_HID is not set
> > # end of Intel ISH HID support
> > # end of HID support
> > 
> > CONFIG_USB_OHCI_LITTLE_ENDIAN=y
> > # CONFIG_USB_SUPPORT is not set
> > # CONFIG_MMC is not set
> > # CONFIG_MEMSTICK is not set
> > # CONFIG_NEW_LEDS is not set
> > # CONFIG_ACCESSIBILITY is not set
> > # CONFIG_INFINIBAND is not set
> > CONFIG_EDAC_ATOMIC_SCRUB=y
> > CONFIG_EDAC_SUPPORT=y
> > CONFIG_RTC_LIB=y
> > CONFIG_RTC_MC146818_LIB=y
> > # CONFIG_RTC_CLASS is not set
> > # CONFIG_DMADEVICES is not set
> > 
> > #
> > # DMABUF options
> > #
> > # CONFIG_SYNC_FILE is not set
> > # CONFIG_DMABUF_HEAPS is not set
> > # end of DMABUF options
> > 
> > # CONFIG_AUXDISPLAY is not set
> > # CONFIG_UIO is not set
> > # CONFIG_VFIO is not set
> > CONFIG_VIRT_DRIVERS=y
> > CONFIG_VMGENID=y
> > # CONFIG_VBOXGUEST is not set
> > # CONFIG_NITRO_ENCLAVES is not set
> > CONFIG_VIRTIO_ANCHOR=y
> > CONFIG_VIRTIO=y
> > CONFIG_VIRTIO_PCI_LIB=y
> > CONFIG_VIRTIO_PCI_LIB_LEGACY=y
> > CONFIG_VIRTIO_MENU=y
> > CONFIG_VIRTIO_PCI=y
> > CONFIG_VIRTIO_PCI_LEGACY=y
> > # CONFIG_VIRTIO_PMEM is not set
> > # CONFIG_VIRTIO_BALLOON is not set
> > # CONFIG_VIRTIO_INPUT is not set
> > # CONFIG_VIRTIO_MMIO is not set
> > # CONFIG_VDPA is not set
> > CONFIG_VHOST_MENU=y
> > # CONFIG_VHOST_NET is not set
> > # CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set
> > 
> > #
> > # Microsoft Hyper-V guest support
> > #
> > # CONFIG_HYPERV is not set
> > # end of Microsoft Hyper-V guest support
> > 
> > # CONFIG_GREYBUS is not set
> > # CONFIG_COMEDI is not set
> > # CONFIG_STAGING is not set
> > # CONFIG_CHROME_PLATFORMS is not set
> > # CONFIG_MELLANOX_PLATFORM is not set
> > CONFIG_SURFACE_PLATFORMS=y
> > # CONFIG_SURFACE_GPE is not set
> > # CONFIG_SURFACE_PRO3_BUTTON is not set
> > # CONFIG_X86_PLATFORM_DEVICES is not set
> > # CONFIG_P2SB is not set
> > # CONFIG_COMMON_CLK is not set
> > # CONFIG_HWSPINLOCK is not set
> > 
> > #
> > # Clock Source drivers
> > #
> > CONFIG_CLKEVT_I8253=y
> > CONFIG_I8253_LOCK=y
> > CONFIG_CLKBLD_I8253=y
> > # end of Clock Source drivers
> > 
> > CONFIG_MAILBOX=y
> > CONFIG_PCC=y
> > # CONFIG_ALTERA_MBOX is not set
> > # CONFIG_IOMMU_SUPPORT is not set
> > 
> > #
> > # Remoteproc drivers
> > #
> > # CONFIG_REMOTEPROC is not set
> > # end of Remoteproc drivers
> > 
> > #
> > # Rpmsg drivers
> > #
> > # CONFIG_RPMSG_QCOM_GLINK_RPM is not set
> > # CONFIG_RPMSG_VIRTIO is not set
> > # end of Rpmsg drivers
> > 
> > # CONFIG_SOUNDWIRE is not set
> > 
> > #
> > # SOC (System On Chip) specific Drivers
> > #
> > 
> > #
> > # Amlogic SoC drivers
> > #
> > # end of Amlogic SoC drivers
> > 
> > #
> > # Broadcom SoC drivers
> > #
> > # end of Broadcom SoC drivers
> > 
> > #
> > # NXP/Freescale QorIQ SoC drivers
> > #
> > # end of NXP/Freescale QorIQ SoC drivers
> > 
> > #
> > # fujitsu SoC drivers
> > #
> > # end of fujitsu SoC drivers
> > 
> > #
> > # i.MX SoC drivers
> > #
> > # end of i.MX SoC drivers
> > 
> > #
> > # Enable LiteX SoC Builder specific drivers
> > #
> > # end of Enable LiteX SoC Builder specific drivers
> > 
> > #
> > # Qualcomm SoC drivers
> > #
> > # end of Qualcomm SoC drivers
> > 
> > # CONFIG_SOC_TI is not set
> > 
> > #
> > # Xilinx SoC drivers
> > #
> > # end of Xilinx SoC drivers
> > # end of SOC (System On Chip) specific Drivers
> > 
> > # CONFIG_PM_DEVFREQ is not set
> > # CONFIG_EXTCON is not set
> > # CONFIG_MEMORY is not set
> > # CONFIG_IIO is not set
> > # CONFIG_NTB is not set
> > # CONFIG_PWM is not set
> > 
> > #
> > # IRQ chip support
> > #
> > # end of IRQ chip support
> > 
> > # CONFIG_IPACK_BUS is not set
> > # CONFIG_RESET_CONTROLLER is not set
> > 
> > #
> > # PHY Subsystem
> > #
> > # CONFIG_GENERIC_PHY is not set
> > # CONFIG_PHY_CAN_TRANSCEIVER is not set
> > 
> > #
> > # PHY drivers for Broadcom platforms
> > #
> > # CONFIG_BCM_KONA_USB2_PHY is not set
> > # end of PHY drivers for Broadcom platforms
> > 
> > # CONFIG_PHY_PXA_28NM_HSIC is not set
> > # CONFIG_PHY_PXA_28NM_USB2 is not set
> > # CONFIG_PHY_INTEL_LGM_EMMC is not set
> > # end of PHY Subsystem
> > 
> > # CONFIG_POWERCAP is not set
> > # CONFIG_MCB is not set
> > 
> > #
> > # Performance monitor support
> > #
> > # end of Performance monitor support
> > 
> > # CONFIG_RAS is not set
> > # CONFIG_USB4 is not set
> > 
> > #
> > # Android
> > #
> > # CONFIG_ANDROID_BINDER_IPC is not set
> > # end of Android
> > 
> > CONFIG_LIBNVDIMM=y
> > CONFIG_BLK_DEV_PMEM=y
> > CONFIG_ND_CLAIM=y
> > CONFIG_ND_BTT=y
> > CONFIG_BTT=y
> > CONFIG_DAX=y
> > CONFIG_NVMEM=y
> > CONFIG_NVMEM_SYSFS=y
> > # CONFIG_NVMEM_RMEM is not set
> > 
> > #
> > # HW tracing support
> > #
> > # CONFIG_STM is not set
> > # CONFIG_INTEL_TH is not set
> > # end of HW tracing support
> > 
> > # CONFIG_FPGA is not set
> > # CONFIG_TEE is not set
> > # CONFIG_SIOX is not set
> > # CONFIG_SLIMBUS is not set
> > # CONFIG_INTERCONNECT is not set
> > # CONFIG_COUNTER is not set
> > # CONFIG_PECI is not set
> > # CONFIG_HTE is not set
> > # end of Device Drivers
> > 
> > #
> > # File systems
> > #
> > CONFIG_DCACHE_WORD_ACCESS=y
> > # CONFIG_VALIDATE_FS_PARSER is not set
> > CONFIG_FS_IOMAP=y
> > CONFIG_EXT2_FS=y
> > CONFIG_EXT2_FS_XATTR=y
> > CONFIG_EXT2_FS_POSIX_ACL=y
> > CONFIG_EXT2_FS_SECURITY=y
> > # CONFIG_EXT3_FS is not set
> > CONFIG_EXT4_FS=y
> > CONFIG_EXT4_FS_POSIX_ACL=y
> > CONFIG_EXT4_FS_SECURITY=y
> > CONFIG_EXT4_DEBUG=y
> > CONFIG_JBD2=y
> > CONFIG_JBD2_DEBUG=y
> > CONFIG_FS_MBCACHE=y
> > # CONFIG_REISERFS_FS is not set
> > # CONFIG_JFS_FS is not set
> > CONFIG_XFS_FS=y
> > CONFIG_XFS_SUPPORT_V4=y
> > CONFIG_XFS_QUOTA=y
> > CONFIG_XFS_POSIX_ACL=y
> > CONFIG_XFS_RT=y
> > # CONFIG_XFS_ONLINE_SCRUB is not set
> > # CONFIG_XFS_WARN is not set
> > # CONFIG_XFS_DEBUG is not set
> > # CONFIG_GFS2_FS is not set
> > CONFIG_BTRFS_FS=y
> > CONFIG_BTRFS_FS_POSIX_ACL=y
> > # CONFIG_BTRFS_FS_CHECK_INTEGRITY is not set
> > # CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
> > CONFIG_BTRFS_DEBUG=y
> > CONFIG_BTRFS_ASSERT=y
> > # CONFIG_BTRFS_FS_REF_VERIFY is not set
> > # CONFIG_NILFS2_FS is not set
> > CONFIG_F2FS_FS=y
> > CONFIG_F2FS_STAT_FS=y
> > CONFIG_F2FS_FS_XATTR=y
> > CONFIG_F2FS_FS_POSIX_ACL=y
> > CONFIG_F2FS_FS_SECURITY=y
> > CONFIG_F2FS_CHECK_FS=y
> > # CONFIG_F2FS_FAULT_INJECTION is not set
> > CONFIG_F2FS_FS_COMPRESSION=y
> > CONFIG_F2FS_FS_LZO=y
> > CONFIG_F2FS_FS_LZORLE=y
> > CONFIG_F2FS_FS_LZ4=y
> > CONFIG_F2FS_FS_LZ4HC=y
> > CONFIG_F2FS_FS_ZSTD=y
> > CONFIG_F2FS_IOSTAT=y
> > CONFIG_FS_POSIX_ACL=y
> > CONFIG_EXPORTFS=y
> > # CONFIG_EXPORTFS_BLOCK_OPS is not set
> > CONFIG_FILE_LOCKING=y
> > CONFIG_FS_ENCRYPTION=y
> > CONFIG_FS_ENCRYPTION_ALGS=y
> > CONFIG_FS_VERITY=y
> > # CONFIG_FS_VERITY_DEBUG is not set
> > CONFIG_FS_VERITY_BUILTIN_SIGNATURES=y
> > CONFIG_FSNOTIFY=y
> > CONFIG_DNOTIFY=y
> > CONFIG_INOTIFY_USER=y
> > # CONFIG_FANOTIFY is not set
> > CONFIG_QUOTA=y
> > CONFIG_QUOTA_NETLINK_INTERFACE=y
> > # CONFIG_PRINT_QUOTA_WARNING is not set
> > # CONFIG_QUOTA_DEBUG is not set
> > CONFIG_QUOTA_TREE=y
> > # CONFIG_QFMT_V1 is not set
> > CONFIG_QFMT_V2=y
> > CONFIG_QUOTACTL=y
> > CONFIG_AUTOFS4_FS=y
> > CONFIG_AUTOFS_FS=y
> > # CONFIG_FUSE_FS is not set
> > CONFIG_OVERLAY_FS=y
> > # CONFIG_OVERLAY_FS_REDIRECT_DIR is not set
> > CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW=y
> > # CONFIG_OVERLAY_FS_INDEX is not set
> > # CONFIG_OVERLAY_FS_XINO_AUTO is not set
> > # CONFIG_OVERLAY_FS_METACOPY is not set
> > 
> > #
> > # Caches
> > #
> > # CONFIG_FSCACHE is not set
> > # end of Caches
> > 
> > #
> > # CD-ROM/DVD Filesystems
> > #
> > # CONFIG_ISO9660_FS is not set
> > # CONFIG_UDF_FS is not set
> > # end of CD-ROM/DVD Filesystems
> > 
> > #
> > # DOS/FAT/EXFAT/NT Filesystems
> > #
> > CONFIG_FAT_FS=y
> > # CONFIG_MSDOS_FS is not set
> > CONFIG_VFAT_FS=y
> > CONFIG_FAT_DEFAULT_CODEPAGE=437
> > CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
> > # CONFIG_FAT_DEFAULT_UTF8 is not set
> > # CONFIG_EXFAT_FS is not set
> > # CONFIG_NTFS_FS is not set
> > # CONFIG_NTFS3_FS is not set
> > # end of DOS/FAT/EXFAT/NT Filesystems
> > 
> > #
> > # Pseudo filesystems
> > #
> > CONFIG_PROC_FS=y
> > # CONFIG_PROC_KCORE is not set
> > CONFIG_PROC_SYSCTL=y
> > CONFIG_PROC_PAGE_MONITOR=y
> > # CONFIG_PROC_CHILDREN is not set
> > CONFIG_PROC_PID_ARCH_STATUS=y
> > CONFIG_KERNFS=y
> > CONFIG_SYSFS=y
> > CONFIG_TMPFS=y
> > CONFIG_TMPFS_POSIX_ACL=y
> > CONFIG_TMPFS_XATTR=y
> > # CONFIG_TMPFS_INODE64 is not set
> > # CONFIG_HUGETLBFS is not set
> > CONFIG_ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP=y
> > CONFIG_MEMFD_CREATE=y
> > CONFIG_ARCH_HAS_GIGANTIC_PAGE=y
> > # CONFIG_CONFIGFS_FS is not set
> > # end of Pseudo filesystems
> > 
> > CONFIG_MISC_FILESYSTEMS=y
> > # CONFIG_ORANGEFS_FS is not set
> > # CONFIG_ADFS_FS is not set
> > # CONFIG_AFFS_FS is not set
> > # CONFIG_ECRYPT_FS is not set
> > # CONFIG_HFS_FS is not set
> > # CONFIG_HFSPLUS_FS is not set
> > # CONFIG_BEFS_FS is not set
> > # CONFIG_BFS_FS is not set
> > # CONFIG_EFS_FS is not set
> > # CONFIG_JFFS2_FS is not set
> > CONFIG_UBIFS_FS=y
> > # CONFIG_UBIFS_FS_ADVANCED_COMPR is not set
> > CONFIG_UBIFS_FS_LZO=y
> > CONFIG_UBIFS_FS_ZLIB=y
> > CONFIG_UBIFS_FS_ZSTD=y
> > # CONFIG_UBIFS_ATIME_SUPPORT is not set
> > CONFIG_UBIFS_FS_XATTR=y
> > CONFIG_UBIFS_FS_SECURITY=y
> > # CONFIG_UBIFS_FS_AUTHENTICATION is not set
> > # CONFIG_CRAMFS is not set
> > # CONFIG_SQUASHFS is not set
> > # CONFIG_VXFS_FS is not set
> > # CONFIG_MINIX_FS is not set
> > # CONFIG_OMFS_FS is not set
> > # CONFIG_HPFS_FS is not set
> > # CONFIG_QNX4FS_FS is not set
> > # CONFIG_QNX6FS_FS is not set
> > # CONFIG_ROMFS_FS is not set
> > # CONFIG_PSTORE is not set
> > # CONFIG_SYSV_FS is not set
> > # CONFIG_UFS_FS is not set
> > # CONFIG_EROFS_FS is not set
> > # CONFIG_NETWORK_FILESYSTEMS is not set
> > CONFIG_NLS=y
> > CONFIG_NLS_DEFAULT="iso8859-1"
> > CONFIG_NLS_CODEPAGE_437=y
> > # CONFIG_NLS_CODEPAGE_737 is not set
> > # CONFIG_NLS_CODEPAGE_775 is not set
> > # CONFIG_NLS_CODEPAGE_850 is not set
> > # CONFIG_NLS_CODEPAGE_852 is not set
> > # CONFIG_NLS_CODEPAGE_855 is not set
> > # CONFIG_NLS_CODEPAGE_857 is not set
> > # CONFIG_NLS_CODEPAGE_860 is not set
> > # CONFIG_NLS_CODEPAGE_861 is not set
> > # CONFIG_NLS_CODEPAGE_862 is not set
> > # CONFIG_NLS_CODEPAGE_863 is not set
> > # CONFIG_NLS_CODEPAGE_864 is not set
> > # CONFIG_NLS_CODEPAGE_865 is not set
> > # CONFIG_NLS_CODEPAGE_866 is not set
> > # CONFIG_NLS_CODEPAGE_869 is not set
> > # CONFIG_NLS_CODEPAGE_936 is not set
> > # CONFIG_NLS_CODEPAGE_950 is not set
> > # CONFIG_NLS_CODEPAGE_932 is not set
> > # CONFIG_NLS_CODEPAGE_949 is not set
> > # CONFIG_NLS_CODEPAGE_874 is not set
> > # CONFIG_NLS_ISO8859_8 is not set
> > # CONFIG_NLS_CODEPAGE_1250 is not set
> > # CONFIG_NLS_CODEPAGE_1251 is not set
> > # CONFIG_NLS_ASCII is not set
> > CONFIG_NLS_ISO8859_1=y
> > # CONFIG_NLS_ISO8859_2 is not set
> > # CONFIG_NLS_ISO8859_3 is not set
> > # CONFIG_NLS_ISO8859_4 is not set
> > # CONFIG_NLS_ISO8859_5 is not set
> > # CONFIG_NLS_ISO8859_6 is not set
> > # CONFIG_NLS_ISO8859_7 is not set
> > # CONFIG_NLS_ISO8859_9 is not set
> > # CONFIG_NLS_ISO8859_13 is not set
> > # CONFIG_NLS_ISO8859_14 is not set
> > # CONFIG_NLS_ISO8859_15 is not set
> > # CONFIG_NLS_KOI8_R is not set
> > # CONFIG_NLS_KOI8_U is not set
> > # CONFIG_NLS_MAC_ROMAN is not set
> > # CONFIG_NLS_MAC_CELTIC is not set
> > # CONFIG_NLS_MAC_CENTEURO is not set
> > # CONFIG_NLS_MAC_CROATIAN is not set
> > # CONFIG_NLS_MAC_CYRILLIC is not set
> > # CONFIG_NLS_MAC_GAELIC is not set
> > # CONFIG_NLS_MAC_GREEK is not set
> > # CONFIG_NLS_MAC_ICELAND is not set
> > # CONFIG_NLS_MAC_INUIT is not set
> > # CONFIG_NLS_MAC_ROMANIAN is not set
> > # CONFIG_NLS_MAC_TURKISH is not set
> > # CONFIG_NLS_UTF8 is not set
> > CONFIG_UNICODE=y
> > # CONFIG_UNICODE_NORMALIZATION_SELFTEST is not set
> > CONFIG_IO_WQ=y
> > # end of File systems
> > 
> > #
> > # Security options
> > #
> > CONFIG_KEYS=y
> > # CONFIG_KEYS_REQUEST_CACHE is not set
> > # CONFIG_PERSISTENT_KEYRINGS is not set
> > # CONFIG_TRUSTED_KEYS is not set
> > # CONFIG_ENCRYPTED_KEYS is not set
> > # CONFIG_KEY_DH_OPERATIONS is not set
> > # CONFIG_SECURITY_DMESG_RESTRICT is not set
> > # CONFIG_SECURITY is not set
> > # CONFIG_SECURITYFS is not set
> > CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
> > CONFIG_HARDENED_USERCOPY=y
> > CONFIG_FORTIFY_SOURCE=y
> > # CONFIG_STATIC_USERMODEHELPER is not set
> > CONFIG_DEFAULT_SECURITY_DAC=y
> > CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,integrity,bpf"
> > 
> > #
> > # Kernel hardening options
> > #
> > 
> > #
> > # Memory initialization
> > #
> > CONFIG_CC_HAS_AUTO_VAR_INIT_PATTERN=y
> > CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO_BARE=y
> > CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y
> > # CONFIG_INIT_STACK_NONE is not set
> > # CONFIG_INIT_STACK_ALL_PATTERN is not set
> > CONFIG_INIT_STACK_ALL_ZERO=y
> > # CONFIG_GCC_PLUGIN_STACKLEAK is not set
> > # CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
> > # CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
> > CONFIG_CC_HAS_ZERO_CALL_USED_REGS=y
> > CONFIG_ZERO_CALL_USED_REGS=y
> > # end of Memory initialization
> > 
> > # CONFIG_RANDSTRUCT_NONE is not set
> > CONFIG_RANDSTRUCT_FULL=y
> > # CONFIG_RANDSTRUCT_PERFORMANCE is not set
> > CONFIG_RANDSTRUCT=y
> > CONFIG_GCC_PLUGIN_RANDSTRUCT=y
> > # end of Kernel hardening options
> > # end of Security options
> > 
> > CONFIG_XOR_BLOCKS=y
> > CONFIG_CRYPTO=y
> > 
> > #
> > # Crypto core or helper
> > #
> > CONFIG_CRYPTO_ALGAPI=y
> > CONFIG_CRYPTO_ALGAPI2=y
> > CONFIG_CRYPTO_AEAD=y
> > CONFIG_CRYPTO_AEAD2=y
> > CONFIG_CRYPTO_SKCIPHER=y
> > CONFIG_CRYPTO_SKCIPHER2=y
> > CONFIG_CRYPTO_HASH=y
> > CONFIG_CRYPTO_HASH2=y
> > CONFIG_CRYPTO_RNG2=y
> > CONFIG_CRYPTO_AKCIPHER2=y
> > CONFIG_CRYPTO_AKCIPHER=y
> > CONFIG_CRYPTO_KPP2=y
> > CONFIG_CRYPTO_ACOMP2=y
> > CONFIG_CRYPTO_MANAGER=y
> > CONFIG_CRYPTO_MANAGER2=y
> > # CONFIG_CRYPTO_USER is not set
> > CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
> > CONFIG_CRYPTO_GF128MUL=y
> > CONFIG_CRYPTO_NULL=y
> > CONFIG_CRYPTO_NULL2=y
> > # CONFIG_CRYPTO_PCRYPT is not set
> > # CONFIG_CRYPTO_CRYPTD is not set
> > CONFIG_CRYPTO_AUTHENC=y
> > # end of Crypto core or helper
> > 
> > #
> > # Public-key cryptography
> > #
> > CONFIG_CRYPTO_RSA=y
> > # CONFIG_CRYPTO_DH is not set
> > # CONFIG_CRYPTO_ECDH is not set
> > # CONFIG_CRYPTO_ECDSA is not set
> > # CONFIG_CRYPTO_ECRDSA is not set
> > # CONFIG_CRYPTO_SM2 is not set
> > # CONFIG_CRYPTO_CURVE25519 is not set
> > # end of Public-key cryptography
> > 
> > #
> > # Block ciphers
> > #
> > CONFIG_CRYPTO_AES=y
> > # CONFIG_CRYPTO_AES_TI is not set
> > # CONFIG_CRYPTO_ARIA is not set
> > # CONFIG_CRYPTO_BLOWFISH is not set
> > # CONFIG_CRYPTO_CAMELLIA is not set
> > # CONFIG_CRYPTO_CAST5 is not set
> > # CONFIG_CRYPTO_CAST6 is not set
> > # CONFIG_CRYPTO_DES is not set
> > # CONFIG_CRYPTO_FCRYPT is not set
> > # CONFIG_CRYPTO_SERPENT is not set
> > # CONFIG_CRYPTO_SM4_GENERIC is not set
> > # CONFIG_CRYPTO_TWOFISH is not set
> > # end of Block ciphers
> > 
> > #
> > # Length-preserving ciphers and modes
> > #
> > CONFIG_CRYPTO_ADIANTUM=y
> > CONFIG_CRYPTO_CHACHA20=y
> > CONFIG_CRYPTO_CBC=y
> > # CONFIG_CRYPTO_CFB is not set
> > # CONFIG_CRYPTO_CTR is not set
> > CONFIG_CRYPTO_CTS=y
> > CONFIG_CRYPTO_ECB=y
> > CONFIG_CRYPTO_HCTR2=y
> > # CONFIG_CRYPTO_KEYWRAP is not set
> > # CONFIG_CRYPTO_LRW is not set
> > # CONFIG_CRYPTO_OFB is not set
> > # CONFIG_CRYPTO_PCBC is not set
> > CONFIG_CRYPTO_XCTR=y
> > CONFIG_CRYPTO_XTS=y
> > CONFIG_CRYPTO_NHPOLY1305=y
> > # end of Length-preserving ciphers and modes
> > 
> > #
> > # AEAD (authenticated encryption with associated data) ciphers
> > #
> > # CONFIG_CRYPTO_AEGIS128 is not set
> > # CONFIG_CRYPTO_CHACHA20POLY1305 is not set
> > # CONFIG_CRYPTO_CCM is not set
> > # CONFIG_CRYPTO_GCM is not set
> > # CONFIG_CRYPTO_SEQIV is not set
> > # CONFIG_CRYPTO_ECHAINIV is not set
> > CONFIG_CRYPTO_ESSIV=y
> > # end of AEAD (authenticated encryption with associated data) ciphers
> > 
> > #
> > # Hashes, digests, and MACs
> > #
> > CONFIG_CRYPTO_BLAKE2B=y
> > # CONFIG_CRYPTO_CMAC is not set
> > # CONFIG_CRYPTO_GHASH is not set
> > CONFIG_CRYPTO_HMAC=y
> > # CONFIG_CRYPTO_MD4 is not set
> > # CONFIG_CRYPTO_MD5 is not set
> > # CONFIG_CRYPTO_MICHAEL_MIC is not set
> > CONFIG_CRYPTO_POLYVAL=y
> > # CONFIG_CRYPTO_POLY1305 is not set
> > # CONFIG_CRYPTO_RMD160 is not set
> > # CONFIG_CRYPTO_SHA1 is not set
> > CONFIG_CRYPTO_SHA256=y
> > CONFIG_CRYPTO_SHA512=y
> > # CONFIG_CRYPTO_SHA3 is not set
> > # CONFIG_CRYPTO_SM3_GENERIC is not set
> > # CONFIG_CRYPTO_STREEBOG is not set
> > # CONFIG_CRYPTO_VMAC is not set
> > # CONFIG_CRYPTO_WP512 is not set
> > # CONFIG_CRYPTO_XCBC is not set
> > CONFIG_CRYPTO_XXHASH=y
> > # end of Hashes, digests, and MACs
> > 
> > #
> > # CRCs (cyclic redundancy checks)
> > #
> > CONFIG_CRYPTO_CRC32C=y
> > CONFIG_CRYPTO_CRC32=y
> > # CONFIG_CRYPTO_CRCT10DIF is not set
> > # end of CRCs (cyclic redundancy checks)
> > 
> > #
> > # Compression
> > #
> > CONFIG_CRYPTO_DEFLATE=y
> > CONFIG_CRYPTO_LZO=y
> > # CONFIG_CRYPTO_842 is not set
> > # CONFIG_CRYPTO_LZ4 is not set
> > # CONFIG_CRYPTO_LZ4HC is not set
> > CONFIG_CRYPTO_ZSTD=y
> > # end of Compression
> > 
> > #
> > # Random number generation
> > #
> > # CONFIG_CRYPTO_ANSI_CPRNG is not set
> > # CONFIG_CRYPTO_DRBG_MENU is not set
> > # CONFIG_CRYPTO_JITTERENTROPY is not set
> > # end of Random number generation
> > 
> > #
> > # Userspace interface
> > #
> > # CONFIG_CRYPTO_USER_API_HASH is not set
> > # CONFIG_CRYPTO_USER_API_SKCIPHER is not set
> > # CONFIG_CRYPTO_USER_API_RNG is not set
> > # CONFIG_CRYPTO_USER_API_AEAD is not set
> > # end of Userspace interface
> > 
> > CONFIG_CRYPTO_HASH_INFO=y
> > 
> > #
> > # Accelerated Cryptographic Algorithms for CPU (x86)
> > #
> > # CONFIG_CRYPTO_CURVE25519_X86 is not set
> > # CONFIG_CRYPTO_AES_NI_INTEL is not set
> > # CONFIG_CRYPTO_BLOWFISH_X86_64 is not set
> > # CONFIG_CRYPTO_CAMELLIA_X86_64 is not set
> > # CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64 is not set
> > # CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64 is not set
> > # CONFIG_CRYPTO_CAST5_AVX_X86_64 is not set
> > # CONFIG_CRYPTO_CAST6_AVX_X86_64 is not set
> > # CONFIG_CRYPTO_DES3_EDE_X86_64 is not set
> > # CONFIG_CRYPTO_SERPENT_SSE2_X86_64 is not set
> > # CONFIG_CRYPTO_SERPENT_AVX_X86_64 is not set
> > # CONFIG_CRYPTO_SERPENT_AVX2_X86_64 is not set
> > # CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64 is not set
> > # CONFIG_CRYPTO_SM4_AESNI_AVX2_X86_64 is not set
> > # CONFIG_CRYPTO_TWOFISH_X86_64 is not set
> > # CONFIG_CRYPTO_TWOFISH_X86_64_3WAY is not set
> > # CONFIG_CRYPTO_TWOFISH_AVX_X86_64 is not set
> > # CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64 is not set
> > # CONFIG_CRYPTO_CHACHA20_X86_64 is not set
> > # CONFIG_CRYPTO_AEGIS128_AESNI_SSE2 is not set
> > # CONFIG_CRYPTO_NHPOLY1305_SSE2 is not set
> > # CONFIG_CRYPTO_NHPOLY1305_AVX2 is not set
> > # CONFIG_CRYPTO_BLAKE2S_X86 is not set
> > # CONFIG_CRYPTO_POLYVAL_CLMUL_NI is not set
> > # CONFIG_CRYPTO_POLY1305_X86_64 is not set
> > # CONFIG_CRYPTO_SHA1_SSSE3 is not set
> > # CONFIG_CRYPTO_SHA256_SSSE3 is not set
> > # CONFIG_CRYPTO_SHA512_SSSE3 is not set
> > # CONFIG_CRYPTO_SM3_AVX_X86_64 is not set
> > # CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL is not set
> > # CONFIG_CRYPTO_CRC32C_INTEL is not set
> > # CONFIG_CRYPTO_CRC32_PCLMUL is not set
> > # end of Accelerated Cryptographic Algorithms for CPU (x86)
> > 
> > CONFIG_CRYPTO_HW=y
> > # CONFIG_CRYPTO_DEV_PADLOCK is not set
> > # CONFIG_CRYPTO_DEV_CCP is not set
> > # CONFIG_CRYPTO_DEV_QAT_DH895xCC is not set
> > # CONFIG_CRYPTO_DEV_QAT_C3XXX is not set
> > # CONFIG_CRYPTO_DEV_QAT_C62X is not set
> > # CONFIG_CRYPTO_DEV_QAT_4XXX is not set
> > # CONFIG_CRYPTO_DEV_QAT_DH895xCCVF is not set
> > # CONFIG_CRYPTO_DEV_QAT_C3XXXVF is not set
> > # CONFIG_CRYPTO_DEV_QAT_C62XVF is not set
> > # CONFIG_CRYPTO_DEV_NITROX_CNN55XX is not set
> > # CONFIG_CRYPTO_DEV_VIRTIO is not set
> > # CONFIG_CRYPTO_DEV_SAFEXCEL is not set
> > # CONFIG_CRYPTO_DEV_AMLOGIC_GXL is not set
> > CONFIG_ASYMMETRIC_KEY_TYPE=y
> > CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
> > CONFIG_X509_CERTIFICATE_PARSER=y
> > # CONFIG_PKCS8_PRIVATE_KEY_PARSER is not set
> > CONFIG_PKCS7_MESSAGE_PARSER=y
> > # CONFIG_PKCS7_TEST_KEY is not set
> > # CONFIG_SIGNED_PE_FILE_VERIFICATION is not set
> > # CONFIG_FIPS_SIGNATURE_SELFTEST is not set
> > 
> > #
> > # Certificates for signature checking
> > #
> > CONFIG_SYSTEM_TRUSTED_KEYRING=y
> > CONFIG_SYSTEM_TRUSTED_KEYS=""
> > # CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
> > # CONFIG_SECONDARY_TRUSTED_KEYRING is not set
> > # CONFIG_SYSTEM_BLACKLIST_KEYRING is not set
> > # end of Certificates for signature checking
> > 
> > CONFIG_BINARY_PRINTF=y
> > 
> > #
> > # Library routines
> > #
> > CONFIG_RAID6_PQ=y
> > CONFIG_RAID6_PQ_BENCHMARK=y
> > # CONFIG_PACKING is not set
> > CONFIG_BITREVERSE=y
> > CONFIG_GENERIC_STRNCPY_FROM_USER=y
> > CONFIG_GENERIC_STRNLEN_USER=y
> > CONFIG_GENERIC_NET_UTILS=y
> > # CONFIG_CORDIC is not set
> > # CONFIG_PRIME_NUMBERS is not set
> > CONFIG_RATIONAL=y
> > CONFIG_GENERIC_PCI_IOMAP=y
> > CONFIG_GENERIC_IOMAP=y
> > CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y
> > CONFIG_ARCH_HAS_FAST_MULTIPLIER=y
> > CONFIG_ARCH_USE_SYM_ANNOTATIONS=y
> > 
> > #
> > # Crypto library routines
> > #
> > CONFIG_CRYPTO_LIB_UTILS=y
> > CONFIG_CRYPTO_LIB_AES=y
> > CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
> > CONFIG_CRYPTO_LIB_CHACHA_GENERIC=y
> > # CONFIG_CRYPTO_LIB_CHACHA is not set
> > # CONFIG_CRYPTO_LIB_CURVE25519 is not set
> > CONFIG_CRYPTO_LIB_POLY1305_RSIZE=11
> > CONFIG_CRYPTO_LIB_POLY1305_GENERIC=y
> > # CONFIG_CRYPTO_LIB_POLY1305 is not set
> > # CONFIG_CRYPTO_LIB_CHACHA20POLY1305 is not set
> > CONFIG_CRYPTO_LIB_SHA1=y
> > CONFIG_CRYPTO_LIB_SHA256=y
> > # end of Crypto library routines
> > 
> > # CONFIG_CRC_CCITT is not set
> > CONFIG_CRC16=y
> > # CONFIG_CRC_T10DIF is not set
> > # CONFIG_CRC64_ROCKSOFT is not set
> > # CONFIG_CRC_ITU_T is not set
> > CONFIG_CRC32=y
> > # CONFIG_CRC32_SELFTEST is not set
> > CONFIG_CRC32_SLICEBY8=y
> > # CONFIG_CRC32_SLICEBY4 is not set
> > # CONFIG_CRC32_SARWATE is not set
> > # CONFIG_CRC32_BIT is not set
> > # CONFIG_CRC64 is not set
> > # CONFIG_CRC4 is not set
> > # CONFIG_CRC7 is not set
> > CONFIG_LIBCRC32C=y
> > # CONFIG_CRC8 is not set
> > CONFIG_XXHASH=y
> > # CONFIG_RANDOM32_SELFTEST is not set
> > CONFIG_ZLIB_INFLATE=y
> > CONFIG_ZLIB_DEFLATE=y
> > CONFIG_LZO_COMPRESS=y
> > CONFIG_LZO_DECOMPRESS=y
> > CONFIG_LZ4_COMPRESS=y
> > CONFIG_LZ4HC_COMPRESS=y
> > CONFIG_LZ4_DECOMPRESS=y
> > CONFIG_ZSTD_COMMON=y
> > CONFIG_ZSTD_COMPRESS=y
> > CONFIG_ZSTD_DECOMPRESS=y
> > CONFIG_XZ_DEC=y
> > CONFIG_XZ_DEC_X86=y
> > CONFIG_XZ_DEC_POWERPC=y
> > CONFIG_XZ_DEC_IA64=y
> > CONFIG_XZ_DEC_ARM=y
> > CONFIG_XZ_DEC_ARMTHUMB=y
> > CONFIG_XZ_DEC_SPARC=y
> > # CONFIG_XZ_DEC_MICROLZMA is not set
> > CONFIG_XZ_DEC_BCJ=y
> > # CONFIG_XZ_DEC_TEST is not set
> > CONFIG_DECOMPRESS_GZIP=y
> > CONFIG_DECOMPRESS_BZIP2=y
> > CONFIG_DECOMPRESS_LZMA=y
> > CONFIG_DECOMPRESS_XZ=y
> > CONFIG_DECOMPRESS_LZO=y
> > CONFIG_DECOMPRESS_LZ4=y
> > CONFIG_DECOMPRESS_ZSTD=y
> > CONFIG_GENERIC_ALLOCATOR=y
> > CONFIG_ASSOCIATIVE_ARRAY=y
> > CONFIG_HAS_IOMEM=y
> > CONFIG_HAS_IOPORT_MAP=y
> > CONFIG_HAS_DMA=y
> > CONFIG_NEED_SG_DMA_LENGTH=y
> > CONFIG_NEED_DMA_MAP_STATE=y
> > CONFIG_ARCH_DMA_ADDR_T_64BIT=y
> > CONFIG_SWIOTLB=y
> > # CONFIG_DMA_API_DEBUG is not set
> > # CONFIG_DMA_MAP_BENCHMARK is not set
> > CONFIG_SGL_ALLOC=y
> > # CONFIG_FORCE_NR_CPUS is not set
> > CONFIG_CPU_RMAP=y
> > CONFIG_DQL=y
> > CONFIG_GLOB=y
> > # CONFIG_GLOB_SELFTEST is not set
> > CONFIG_NLATTR=y
> > CONFIG_CLZ_TAB=y
> > # CONFIG_IRQ_POLL is not set
> > CONFIG_MPILIB=y
> > CONFIG_OID_REGISTRY=y
> > CONFIG_HAVE_GENERIC_VDSO=y
> > CONFIG_GENERIC_GETTIMEOFDAY=y
> > CONFIG_GENERIC_VDSO_TIME_NS=y
> > CONFIG_SG_POOL=y
> > CONFIG_ARCH_HAS_PMEM_API=y
> > CONFIG_MEMREGION=y
> > CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=y
> > CONFIG_ARCH_HAS_COPY_MC=y
> > CONFIG_ARCH_STACKWALK=y
> > CONFIG_STACKDEPOT=y
> > CONFIG_STACKDEPOT_ALWAYS_INIT=y
> > CONFIG_SBITMAP=y
> > # end of Library routines
> > 
> > #
> > # Kernel hacking
> > #
> > 
> > #
> > # printk and dmesg options
> > #
> > CONFIG_PRINTK_TIME=y
> > # CONFIG_PRINTK_CALLER is not set
> > # CONFIG_STACKTRACE_BUILD_ID is not set
> > CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
> > CONFIG_CONSOLE_LOGLEVEL_QUIET=4
> > CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
> > # CONFIG_BOOT_PRINTK_DELAY is not set
> > CONFIG_DYNAMIC_DEBUG=y
> > CONFIG_DYNAMIC_DEBUG_CORE=y
> > CONFIG_SYMBOLIC_ERRNAME=y
> > CONFIG_DEBUG_BUGVERBOSE=y
> > # end of printk and dmesg options
> > 
> > CONFIG_DEBUG_KERNEL=y
> > CONFIG_DEBUG_MISC=y
> > 
> > #
> > # Compile-time checks and compiler options
> > #
> > CONFIG_DEBUG_INFO=y
> > CONFIG_AS_HAS_NON_CONST_LEB128=y
> > # CONFIG_DEBUG_INFO_NONE is not set
> > # CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT is not set
> > # CONFIG_DEBUG_INFO_DWARF4 is not set
> > CONFIG_DEBUG_INFO_DWARF5=y
> > CONFIG_DEBUG_INFO_REDUCED=y
> > # CONFIG_DEBUG_INFO_COMPRESSED is not set
> > # CONFIG_DEBUG_INFO_SPLIT is not set
> > # CONFIG_GDB_SCRIPTS is not set
> > CONFIG_FRAME_WARN=2048
> > # CONFIG_STRIP_ASM_SYMS is not set
> > # CONFIG_READABLE_ASM is not set
> > # CONFIG_HEADERS_INSTALL is not set
> > CONFIG_DEBUG_SECTION_MISMATCH=y
> > CONFIG_SECTION_MISMATCH_WARN_ONLY=y
> > CONFIG_FRAME_POINTER=y
> > CONFIG_OBJTOOL=y
> > # CONFIG_STACK_VALIDATION is not set
> > # CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
> > # end of Compile-time checks and compiler options
> > 
> > #
> > # Generic Kernel Debugging Instruments
> > #
> > # CONFIG_MAGIC_SYSRQ is not set
> > CONFIG_DEBUG_FS=y
> > CONFIG_DEBUG_FS_ALLOW_ALL=y
> > # CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
> > # CONFIG_DEBUG_FS_ALLOW_NONE is not set
> > CONFIG_HAVE_ARCH_KGDB=y
> > # CONFIG_KGDB is not set
> > CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
> > # CONFIG_UBSAN is not set
> > CONFIG_HAVE_ARCH_KCSAN=y
> > CONFIG_HAVE_KCSAN_COMPILER=y
> > # end of Generic Kernel Debugging Instruments
> > 
> > #
> > # Networking Debugging
> > #
> > # CONFIG_NET_DEV_REFCNT_TRACKER is not set
> > # CONFIG_NET_NS_REFCNT_TRACKER is not set
> > # CONFIG_DEBUG_NET is not set
> > # end of Networking Debugging
> > 
> > #
> > # Memory Debugging
> > #
> > # CONFIG_PAGE_EXTENSION is not set
> > CONFIG_DEBUG_PAGEALLOC=y
> > # CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT is not set
> > CONFIG_SLUB_DEBUG=y
> > # CONFIG_SLUB_DEBUG_ON is not set
> > # CONFIG_PAGE_OWNER is not set
> > # CONFIG_PAGE_TABLE_CHECK is not set
> > # CONFIG_PAGE_POISONING is not set
> > # CONFIG_DEBUG_PAGE_REF is not set
> > # CONFIG_DEBUG_RODATA_TEST is not set
> > CONFIG_ARCH_HAS_DEBUG_WX=y
> > CONFIG_DEBUG_WX=y
> > CONFIG_GENERIC_PTDUMP=y
> > CONFIG_PTDUMP_CORE=y
> > # CONFIG_PTDUMP_DEBUGFS is not set
> > # CONFIG_DEBUG_OBJECTS is not set
> > # CONFIG_SHRINKER_DEBUG is not set
> > CONFIG_HAVE_DEBUG_KMEMLEAK=y
> > # CONFIG_DEBUG_KMEMLEAK is not set
> > # CONFIG_DEBUG_STACK_USAGE is not set
> > # CONFIG_SCHED_STACK_END_CHECK is not set
> > CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
> > CONFIG_DEBUG_VM_IRQSOFF=y
> > CONFIG_DEBUG_VM=y
> > # CONFIG_DEBUG_VM_MAPLE_TREE is not set
> > # CONFIG_DEBUG_VM_RB is not set
> > # CONFIG_DEBUG_VM_PGFLAGS is not set
> > CONFIG_DEBUG_VM_PGTABLE=y
> > CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
> > # CONFIG_DEBUG_VIRTUAL is not set
> > CONFIG_DEBUG_MEMORY_INIT=y
> > # CONFIG_DEBUG_PER_CPU_MAPS is not set
> > CONFIG_ARCH_SUPPORTS_KMAP_LOCAL_FORCE_MAP=y
> > # CONFIG_DEBUG_KMAP_LOCAL_FORCE_MAP is not set
> > CONFIG_HAVE_ARCH_KASAN=y
> > CONFIG_HAVE_ARCH_KASAN_VMALLOC=y
> > CONFIG_CC_HAS_KASAN_GENERIC=y
> > CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
> > CONFIG_KASAN=y
> > CONFIG_KASAN_GENERIC=y
> > # CONFIG_KASAN_OUTLINE is not set
> > CONFIG_KASAN_INLINE=y
> > CONFIG_KASAN_STACK=y
> > CONFIG_KASAN_VMALLOC=y
> > CONFIG_HAVE_ARCH_KFENCE=y
> > # CONFIG_KFENCE is not set
> > CONFIG_HAVE_ARCH_KMSAN=y
> > # end of Memory Debugging
> > 
> > # CONFIG_DEBUG_SHIRQ is not set
> > 
> > #
> > # Debug Oops, Lockups and Hangs
> > #
> > # CONFIG_PANIC_ON_OOPS is not set
> > CONFIG_PANIC_ON_OOPS_VALUE=0
> > CONFIG_PANIC_TIMEOUT=5
> > CONFIG_LOCKUP_DETECTOR=y
> > CONFIG_SOFTLOCKUP_DETECTOR=y
> > # CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
> > CONFIG_HARDLOCKUP_DETECTOR_PERF=y
> > CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=y
> > CONFIG_HARDLOCKUP_DETECTOR=y
> > # CONFIG_BOOTPARAM_HARDLOCKUP_PANIC is not set
> > CONFIG_DETECT_HUNG_TASK=y
> > CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=30
> > # CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
> > CONFIG_WQ_WATCHDOG=y
> > # end of Debug Oops, Lockups and Hangs
> > 
> > #
> > # Scheduler Debugging
> > #
> > CONFIG_SCHED_DEBUG=y
> > # CONFIG_SCHEDSTATS is not set
> > # end of Scheduler Debugging
> > 
> > # CONFIG_DEBUG_TIMEKEEPING is not set
> > CONFIG_DEBUG_PREEMPT=y
> > 
> > #
> > # Lock Debugging (spinlocks, mutexes, etc...)
> > #
> > CONFIG_LOCK_DEBUGGING_SUPPORT=y
> > CONFIG_PROVE_LOCKING=y
> > # CONFIG_PROVE_RAW_LOCK_NESTING is not set
> > # CONFIG_LOCK_STAT is not set
> > CONFIG_DEBUG_RT_MUTEXES=y
> > CONFIG_DEBUG_SPINLOCK=y
> > CONFIG_DEBUG_MUTEXES=y
> > CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y
> > CONFIG_DEBUG_RWSEMS=y
> > CONFIG_DEBUG_LOCK_ALLOC=y
> > CONFIG_LOCKDEP=y
> > CONFIG_LOCKDEP_BITS=15
> > CONFIG_LOCKDEP_CHAINS_BITS=16
> > CONFIG_LOCKDEP_STACK_TRACE_BITS=19
> > CONFIG_LOCKDEP_STACK_TRACE_HASH_BITS=14
> > CONFIG_LOCKDEP_CIRCULAR_QUEUE_BITS=12
> > # CONFIG_DEBUG_LOCKDEP is not set
> > CONFIG_DEBUG_ATOMIC_SLEEP=y
> > # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
> > # CONFIG_LOCK_TORTURE_TEST is not set
> > # CONFIG_WW_MUTEX_SELFTEST is not set
> > # CONFIG_SCF_TORTURE_TEST is not set
> > # CONFIG_CSD_LOCK_WAIT_DEBUG is not set
> > # end of Lock Debugging (spinlocks, mutexes, etc...)
> > 
> > CONFIG_TRACE_IRQFLAGS=y
> > CONFIG_TRACE_IRQFLAGS_NMI=y
> > # CONFIG_DEBUG_IRQFLAGS is not set
> > CONFIG_STACKTRACE=y
> > # CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
> > # CONFIG_DEBUG_KOBJECT is not set
> > 
> > #
> > # Debug kernel data structures
> > #
> > CONFIG_DEBUG_LIST=y
> > # CONFIG_DEBUG_PLIST is not set
> > CONFIG_DEBUG_SG=y
> > # CONFIG_DEBUG_NOTIFIERS is not set
> > # CONFIG_BUG_ON_DATA_CORRUPTION is not set
> > # CONFIG_DEBUG_MAPLE_TREE is not set
> > # end of Debug kernel data structures
> > 
> > CONFIG_DEBUG_CREDENTIALS=y
> > 
> > #
> > # RCU Debugging
> > #
> > CONFIG_PROVE_RCU=y
> > # CONFIG_RCU_SCALE_TEST is not set
> > # CONFIG_RCU_TORTURE_TEST is not set
> > # CONFIG_RCU_REF_SCALE_TEST is not set
> > CONFIG_RCU_CPU_STALL_TIMEOUT=10
> > CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=0
> > CONFIG_RCU_TRACE=y
> > CONFIG_RCU_EQS_DEBUG=y
> > # end of RCU Debugging
> > 
> > # CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
> > # CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
> > # CONFIG_LATENCYTOP is not set
> > CONFIG_USER_STACKTRACE_SUPPORT=y
> > CONFIG_NOP_TRACER=y
> > CONFIG_HAVE_RETHOOK=y
> > CONFIG_HAVE_FUNCTION_TRACER=y
> > CONFIG_HAVE_DYNAMIC_FTRACE=y
> > CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
> > CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
> > CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS=y
> > CONFIG_HAVE_DYNAMIC_FTRACE_NO_PATCHABLE=y
> > CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
> > CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
> > CONFIG_HAVE_FENTRY=y
> > CONFIG_HAVE_OBJTOOL_MCOUNT=y
> > CONFIG_HAVE_C_RECORDMCOUNT=y
> > CONFIG_HAVE_BUILDTIME_MCOUNT_SORT=y
> > CONFIG_TRACE_CLOCK=y
> > CONFIG_RING_BUFFER=y
> > CONFIG_EVENT_TRACING=y
> > CONFIG_CONTEXT_SWITCH_TRACER=y
> > CONFIG_PREEMPTIRQ_TRACEPOINTS=y
> > CONFIG_TRACING=y
> > CONFIG_TRACING_SUPPORT=y
> > # CONFIG_FTRACE is not set
> > # CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
> > # CONFIG_SAMPLES is not set
> > CONFIG_HAVE_SAMPLE_FTRACE_DIRECT=y
> > CONFIG_HAVE_SAMPLE_FTRACE_DIRECT_MULTI=y
> > CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
> > CONFIG_STRICT_DEVMEM=y
> > # CONFIG_IO_STRICT_DEVMEM is not set
> > 
> > #
> > # x86 Debugging
> > #
> > CONFIG_X86_VERBOSE_BOOTUP=y
> > CONFIG_EARLY_PRINTK=y
> > # CONFIG_EARLY_PRINTK_DBGP is not set
> > # CONFIG_EARLY_PRINTK_USB_XDBC is not set
> > # CONFIG_DEBUG_TLBFLUSH is not set
> > CONFIG_HAVE_MMIOTRACE_SUPPORT=y
> > # CONFIG_X86_DECODER_SELFTEST is not set
> > CONFIG_IO_DELAY_0X80=y
> > # CONFIG_IO_DELAY_0XED is not set
> > # CONFIG_IO_DELAY_UDELAY is not set
> > # CONFIG_IO_DELAY_NONE is not set
> > # CONFIG_DEBUG_BOOT_PARAMS is not set
> > # CONFIG_CPA_DEBUG is not set
> > # CONFIG_DEBUG_ENTRY is not set
> > # CONFIG_DEBUG_NMI_SELFTEST is not set
> > CONFIG_X86_DEBUG_FPU=y
> > # CONFIG_PUNIT_ATOM_DEBUG is not set
> > # CONFIG_UNWINDER_ORC is not set
> > CONFIG_UNWINDER_FRAME_POINTER=y
> > # end of x86 Debugging
> > 
> > #
> > # Kernel Testing and Coverage
> > #
> > # CONFIG_KUNIT is not set
> > # CONFIG_NOTIFIER_ERROR_INJECTION is not set
> > CONFIG_FAULT_INJECTION=y
> > CONFIG_FAILSLAB=y
> > CONFIG_FAIL_PAGE_ALLOC=y
> > # CONFIG_FAULT_INJECTION_USERCOPY is not set
> > CONFIG_FAIL_MAKE_REQUEST=y
> > # CONFIG_FAIL_IO_TIMEOUT is not set
> > CONFIG_FAIL_FUTEX=y
> > CONFIG_FAULT_INJECTION_DEBUG_FS=y
> > CONFIG_ARCH_HAS_KCOV=y
> > CONFIG_CC_HAS_SANCOV_TRACE_PC=y
> > # CONFIG_KCOV is not set
> > CONFIG_RUNTIME_TESTING_MENU=y
> > # CONFIG_LKDTM is not set
> > # CONFIG_TEST_MIN_HEAP is not set
> > # CONFIG_TEST_DIV64 is not set
> > # CONFIG_BACKTRACE_SELF_TEST is not set
> > # CONFIG_TEST_REF_TRACKER is not set
> > # CONFIG_RBTREE_TEST is not set
> > # CONFIG_REED_SOLOMON_TEST is not set
> > # CONFIG_INTERVAL_TREE_TEST is not set
> > # CONFIG_ATOMIC64_SELFTEST is not set
> > # CONFIG_TEST_HEXDUMP is not set
> > # CONFIG_STRING_SELFTEST is not set
> > # CONFIG_TEST_STRING_HELPERS is not set
> > # CONFIG_TEST_STRSCPY is not set
> > # CONFIG_TEST_KSTRTOX is not set
> > # CONFIG_TEST_PRINTF is not set
> > # CONFIG_TEST_SCANF is not set
> > # CONFIG_TEST_BITMAP is not set
> > # CONFIG_TEST_UUID is not set
> > # CONFIG_TEST_XARRAY is not set
> > # CONFIG_TEST_MAPLE_TREE is not set
> > # CONFIG_TEST_RHASHTABLE is not set
> > # CONFIG_TEST_SIPHASH is not set
> > # CONFIG_TEST_IDA is not set
> > # CONFIG_FIND_BIT_BENCHMARK is not set
> > # CONFIG_TEST_FIRMWARE is not set
> > # CONFIG_TEST_SYSCTL is not set
> > # CONFIG_TEST_UDELAY is not set
> > # CONFIG_TEST_DYNAMIC_DEBUG is not set
> > # CONFIG_TEST_MEMCAT_P is not set
> > # CONFIG_TEST_MEMINIT is not set
> > # CONFIG_TEST_FREE_PAGES is not set
> > # CONFIG_TEST_FPU is not set
> > # CONFIG_TEST_CLOCKSOURCE_WATCHDOG is not set
> > CONFIG_ARCH_USE_MEMTEST=y
> > # CONFIG_MEMTEST is not set
> > # end of Kernel Testing and Coverage
> > 
> > #
> > # Rust hacking
> > #
> > # end of Rust hacking
> > # end of Kernel hacking

