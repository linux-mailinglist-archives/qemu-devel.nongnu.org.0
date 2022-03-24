Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9ED74E607A
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 09:39:15 +0100 (CET)
Received: from localhost ([::1]:58150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXIzy-0001Oj-Lb
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 04:39:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nXIkJ-0001Ps-Om
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 04:23:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nXIkG-0004Cn-86
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 04:23:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648110176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ce/sYJOlEeAaterw04roSyPSCMzvF9QlVXgvBSLlclE=;
 b=DG4g4ZbHYkqvHs0XaED9qE992/YcqaRjF6W589eq3Om3oKz8BIlP8Gkl5h+kxgKcrzXDE6
 VVUZtKOVmIJhnhrhAv2TCsrMt6YRidtuv/XCoFzpUVvUiehy6EIVMnuYTDfQrPnoGyHBoR
 vbP+X9JTc22sJXjbeyQVJ5KRy24Xicc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-qpLDBCRXMT6Hqa94RgyxSQ-1; Thu, 24 Mar 2022 04:22:54 -0400
X-MC-Unique: qpLDBCRXMT6Hqa94RgyxSQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 n4-20020a5099c4000000b00418ed58d92fso2589006edb.0
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 01:22:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ce/sYJOlEeAaterw04roSyPSCMzvF9QlVXgvBSLlclE=;
 b=3sRX1+1XgefauT+1PqWk3yHsyZjAcriNnGhIdatfoGUQd2GTwh2Sg/GWcvywDczuRT
 QXfPP4VhZWnV0IHYoTntIt5cYnMzbZ9Eg1J8lQ9lm+Lwgk49x9jjXAvosvPeY+uZCvxN
 8nfceJE5ScZ9i3SF1v1tGbHFL1rFiH08gjo1WwjifVktIOwBXhWtx/9uH+lUtE+tew3z
 zgnsAF1olBi+JlJHSZH8LOjACMbem63QmJ1lhGzYJxj1/wSaFxn8EDIYBSwPbMO9P5sJ
 YfDgoYtieVHziH1D6jib4rNbc94vNvSpHTv7CbkNrdp7u4vKDTX04jKnx1U3Np8euhKQ
 KSUg==
X-Gm-Message-State: AOAM5300Nun9y2QKXiJ1oFgfvlamtOcmkzdzeY/9F/bMl0kOnIdqMXbS
 BTAdCUGfMLwJAKNn+ELjefaA1VpEfnthWOaHW0wVMF0XhVK96IgnbmPscAHch8Shir4seNjbCZj
 dIiBxywPfFsVMcz0=
X-Received: by 2002:a05:6402:1388:b0:419:3d1a:9844 with SMTP id
 b8-20020a056402138800b004193d1a9844mr5291674edv.256.1648110173497; 
 Thu, 24 Mar 2022 01:22:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVxtZbh67VS/J2Cf91VV6Ion+h6PGKcbhv2njjJr1koOOEmLevBlv3Dod7da+nDmLh9xQOZQ==
X-Received: by 2002:a05:6402:1388:b0:419:3d1a:9844 with SMTP id
 b8-20020a056402138800b004193d1a9844mr5291662edv.256.1648110173257; 
 Thu, 24 Mar 2022 01:22:53 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 b19-20020aa7dc13000000b00418eef0a019sm1064060edu.34.2022.03.24.01.22.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 01:22:52 -0700 (PDT)
Date: Thu, 24 Mar 2022 09:22:51 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Robert Hoo <robert.hu@linux.intel.com>
Subject: Re: [PATCH] i386/cpu: Remove the deprecated cpu model 'Icelake-Client'
Message-ID: <20220324092251.12e01ee6@redhat.com>
In-Reply-To: <1647247859-4947-1-git-send-email-robert.hu@linux.intel.com>
References: <1647247859-4947-1-git-send-email-robert.hu@linux.intel.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com, robert.hu@intel.com, richard.henderson@linaro.org,
 ehabkost@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Mar 2022 16:50:59 +0800
Robert Hoo <robert.hu@linux.intel.com> wrote:

> Icelake, is the codename for Intel 3rd generation Xeon Scalable server
> processors. There isn't ever client variants. This "Icelake-Client" CPU
> model was added wrongly and imaginarily.
> 
> It has been deprecated since v5.2, now it's time to remove it completely
> from code.
> 
> Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
> Note: This patch is a reword, rebase and resend of
> https://lore.kernel.org/qemu-devel/1619660147-136679-1-git-send-email-robert.hu@linux.intel.com/
> ---
>  docs/about/deprecated.rst       |   6 --
>  docs/about/removed-features.rst |   6 ++
>  target/i386/cpu.c               | 122 --------------------------------
>  3 files changed, 6 insertions(+), 128 deletions(-)
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index cf02ef6821..1adc762958 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -289,12 +289,6 @@ from Linux upstream kernel, declare it deprecated.
>  System emulator CPUS
>  --------------------
>  
> -``Icelake-Client`` CPU Model (since 5.2)
> -''''''''''''''''''''''''''''''''''''''''
> -
> -``Icelake-Client`` CPU Models are deprecated. Use ``Icelake-Server`` CPU
> -Models instead.
> -
>  MIPS ``I7200`` CPU Model (since 5.2)
>  ''''''''''''''''''''''''''''''''''''
>  
> diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
> index 4b831ea291..3fb5b28518 100644
> --- a/docs/about/removed-features.rst
> +++ b/docs/about/removed-features.rst
> @@ -538,6 +538,12 @@ Support for this CPU was removed from the upstream Linux kernel, and
>  there is no available upstream toolchain to build binaries for it.
>  Removed without replacement.
>  
> +x86 ``Icelake-Client`` CPU (removed in 7.1)
> +'''''''''''''''''''''''''''''''''''''''''''
> +
> +There isn't ever Icelake Client CPU, it is some wrong and imaginary one.
> +Use ``Icelake-Server`` instead.
> +
>  System emulator machines
>  ------------------------
>  
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 6c7ef1099b..82f1cecf76 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -3238,128 +3238,6 @@ static const X86CPUDefinition builtin_x86_defs[] = {
>              { /* end of list */ }
>          }
>      },
> -    {
> -        .name = "Icelake-Client",
> -        .level = 0xd,
> -        .vendor = CPUID_VENDOR_INTEL,
> -        .family = 6,
> -        .model = 126,
> -        .stepping = 0,
> -        .features[FEAT_1_EDX] =
> -            CPUID_VME | CPUID_SSE2 | CPUID_SSE | CPUID_FXSR | CPUID_MMX |
> -            CPUID_CLFLUSH | CPUID_PSE36 | CPUID_PAT | CPUID_CMOV | CPUID_MCA |
> -            CPUID_PGE | CPUID_MTRR | CPUID_SEP | CPUID_APIC | CPUID_CX8 |
> -            CPUID_MCE | CPUID_PAE | CPUID_MSR | CPUID_TSC | CPUID_PSE |
> -            CPUID_DE | CPUID_FP87,
> -        .features[FEAT_1_ECX] =
> -            CPUID_EXT_AVX | CPUID_EXT_XSAVE | CPUID_EXT_AES |
> -            CPUID_EXT_POPCNT | CPUID_EXT_X2APIC | CPUID_EXT_SSE42 |
> -            CPUID_EXT_SSE41 | CPUID_EXT_CX16 | CPUID_EXT_SSSE3 |
> -            CPUID_EXT_PCLMULQDQ | CPUID_EXT_SSE3 |
> -            CPUID_EXT_TSC_DEADLINE_TIMER | CPUID_EXT_FMA | CPUID_EXT_MOVBE |
> -            CPUID_EXT_PCID | CPUID_EXT_F16C | CPUID_EXT_RDRAND,
> -        .features[FEAT_8000_0001_EDX] =
> -            CPUID_EXT2_LM | CPUID_EXT2_RDTSCP | CPUID_EXT2_NX |
> -            CPUID_EXT2_SYSCALL,
> -        .features[FEAT_8000_0001_ECX] =
> -            CPUID_EXT3_ABM | CPUID_EXT3_LAHF_LM | CPUID_EXT3_3DNOWPREFETCH,
> -        .features[FEAT_8000_0008_EBX] =
> -            CPUID_8000_0008_EBX_WBNOINVD,
> -        .features[FEAT_7_0_EBX] =
> -            CPUID_7_0_EBX_FSGSBASE | CPUID_7_0_EBX_BMI1 |
> -            CPUID_7_0_EBX_HLE | CPUID_7_0_EBX_AVX2 | CPUID_7_0_EBX_SMEP |
> -            CPUID_7_0_EBX_BMI2 | CPUID_7_0_EBX_ERMS | CPUID_7_0_EBX_INVPCID |
> -            CPUID_7_0_EBX_RTM | CPUID_7_0_EBX_RDSEED | CPUID_7_0_EBX_ADX |
> -            CPUID_7_0_EBX_SMAP,
> -        .features[FEAT_7_0_ECX] =
> -            CPUID_7_0_ECX_AVX512_VBMI | CPUID_7_0_ECX_UMIP | CPUID_7_0_ECX_PKU |
> -            CPUID_7_0_ECX_AVX512_VBMI2 | CPUID_7_0_ECX_GFNI |
> -            CPUID_7_0_ECX_VAES | CPUID_7_0_ECX_VPCLMULQDQ |
> -            CPUID_7_0_ECX_AVX512VNNI | CPUID_7_0_ECX_AVX512BITALG |
> -            CPUID_7_0_ECX_AVX512_VPOPCNTDQ,
> -        .features[FEAT_7_0_EDX] =
> -            CPUID_7_0_EDX_SPEC_CTRL | CPUID_7_0_EDX_SPEC_CTRL_SSBD,
> -        /* XSAVES is added in version 3 */
> -        .features[FEAT_XSAVE] =
> -            CPUID_XSAVE_XSAVEOPT | CPUID_XSAVE_XSAVEC |
> -            CPUID_XSAVE_XGETBV1,
> -        .features[FEAT_6_EAX] =
> -            CPUID_6_EAX_ARAT,
> -        /* Missing: Mode-based execute control (XS/XU), processor tracing, TSC scaling */
> -        .features[FEAT_VMX_BASIC] = MSR_VMX_BASIC_INS_OUTS |
> -             MSR_VMX_BASIC_TRUE_CTLS,
> -        .features[FEAT_VMX_ENTRY_CTLS] = VMX_VM_ENTRY_IA32E_MODE |
> -             VMX_VM_ENTRY_LOAD_IA32_PERF_GLOBAL_CTRL | VMX_VM_ENTRY_LOAD_IA32_PAT |
> -             VMX_VM_ENTRY_LOAD_DEBUG_CONTROLS | VMX_VM_ENTRY_LOAD_IA32_EFER,
> -        .features[FEAT_VMX_EPT_VPID_CAPS] = MSR_VMX_EPT_EXECONLY |
> -             MSR_VMX_EPT_PAGE_WALK_LENGTH_4 | MSR_VMX_EPT_WB | MSR_VMX_EPT_2MB |
> -             MSR_VMX_EPT_1GB | MSR_VMX_EPT_INVEPT |
> -             MSR_VMX_EPT_INVEPT_SINGLE_CONTEXT | MSR_VMX_EPT_INVEPT_ALL_CONTEXT |
> -             MSR_VMX_EPT_INVVPID | MSR_VMX_EPT_INVVPID_SINGLE_ADDR |
> -             MSR_VMX_EPT_INVVPID_SINGLE_CONTEXT | MSR_VMX_EPT_INVVPID_ALL_CONTEXT |
> -             MSR_VMX_EPT_INVVPID_SINGLE_CONTEXT_NOGLOBALS | MSR_VMX_EPT_AD_BITS,
> -        .features[FEAT_VMX_EXIT_CTLS] =
> -             VMX_VM_EXIT_ACK_INTR_ON_EXIT | VMX_VM_EXIT_SAVE_DEBUG_CONTROLS |
> -             VMX_VM_EXIT_LOAD_IA32_PERF_GLOBAL_CTRL |
> -             VMX_VM_EXIT_LOAD_IA32_PAT | VMX_VM_EXIT_LOAD_IA32_EFER |
> -             VMX_VM_EXIT_SAVE_IA32_PAT | VMX_VM_EXIT_SAVE_IA32_EFER |
> -             VMX_VM_EXIT_SAVE_VMX_PREEMPTION_TIMER,
> -        .features[FEAT_VMX_MISC] = MSR_VMX_MISC_ACTIVITY_HLT |
> -             MSR_VMX_MISC_STORE_LMA | MSR_VMX_MISC_VMWRITE_VMEXIT,
> -        .features[FEAT_VMX_PINBASED_CTLS] = VMX_PIN_BASED_EXT_INTR_MASK |
> -             VMX_PIN_BASED_NMI_EXITING | VMX_PIN_BASED_VIRTUAL_NMIS |
> -             VMX_PIN_BASED_VMX_PREEMPTION_TIMER,
> -        .features[FEAT_VMX_PROCBASED_CTLS] = VMX_CPU_BASED_VIRTUAL_INTR_PENDING |
> -             VMX_CPU_BASED_USE_TSC_OFFSETING | VMX_CPU_BASED_HLT_EXITING |
> -             VMX_CPU_BASED_INVLPG_EXITING | VMX_CPU_BASED_MWAIT_EXITING |
> -             VMX_CPU_BASED_RDPMC_EXITING | VMX_CPU_BASED_RDTSC_EXITING |
> -             VMX_CPU_BASED_CR8_LOAD_EXITING | VMX_CPU_BASED_CR8_STORE_EXITING |
> -             VMX_CPU_BASED_TPR_SHADOW | VMX_CPU_BASED_MOV_DR_EXITING |
> -             VMX_CPU_BASED_UNCOND_IO_EXITING | VMX_CPU_BASED_USE_IO_BITMAPS |
> -             VMX_CPU_BASED_MONITOR_EXITING | VMX_CPU_BASED_PAUSE_EXITING |
> -             VMX_CPU_BASED_VIRTUAL_NMI_PENDING | VMX_CPU_BASED_USE_MSR_BITMAPS |
> -             VMX_CPU_BASED_CR3_LOAD_EXITING | VMX_CPU_BASED_CR3_STORE_EXITING |
> -             VMX_CPU_BASED_MONITOR_TRAP_FLAG |
> -             VMX_CPU_BASED_ACTIVATE_SECONDARY_CONTROLS,
> -        .features[FEAT_VMX_SECONDARY_CTLS] =
> -             VMX_SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES |
> -             VMX_SECONDARY_EXEC_WBINVD_EXITING | VMX_SECONDARY_EXEC_ENABLE_EPT |
> -             VMX_SECONDARY_EXEC_DESC | VMX_SECONDARY_EXEC_RDTSCP |
> -             VMX_SECONDARY_EXEC_ENABLE_VPID | VMX_SECONDARY_EXEC_UNRESTRICTED_GUEST |
> -             VMX_SECONDARY_EXEC_RDRAND_EXITING | VMX_SECONDARY_EXEC_ENABLE_INVPCID |
> -             VMX_SECONDARY_EXEC_ENABLE_VMFUNC | VMX_SECONDARY_EXEC_SHADOW_VMCS |
> -             VMX_SECONDARY_EXEC_RDSEED_EXITING | VMX_SECONDARY_EXEC_ENABLE_PML,
> -        .features[FEAT_VMX_VMFUNC] = MSR_VMX_VMFUNC_EPT_SWITCHING,
> -        .xlevel = 0x80000008,
> -        .model_id = "Intel Core Processor (Icelake)",
> -        .versions = (X86CPUVersionDefinition[]) {
> -            {
> -                .version = 1,
> -                .note = "deprecated"
> -            },
> -            {
> -                .version = 2,
> -                .note = "no TSX, deprecated",
> -                .alias = "Icelake-Client-noTSX",
> -                .props = (PropValue[]) {
> -                    { "hle", "off" },
> -                    { "rtm", "off" },
> -                    { /* end of list */ }
> -                },
> -            },
> -            {
> -                .version = 3,
> -                .note = "no TSX, XSAVES, deprecated",
> -                .props = (PropValue[]) {
> -                    { "xsaves", "on" },
> -                    { "vmx-xsaves", "on" },
> -                    { /* end of list */ }
> -                },
> -            },
> -            { /* end of list */ }
> -        },
> -        .deprecation_note = "use Icelake-Server instead"
> -    },
>      {
>          .name = "Icelake-Server",
>          .level = 0xd,
> 
> base-commit: 1416688c53be6535be755b44c15fb2eb9defd20f


