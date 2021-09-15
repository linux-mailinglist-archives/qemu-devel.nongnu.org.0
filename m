Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B56440CF37
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 00:07:09 +0200 (CEST)
Received: from localhost ([::1]:48904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQd3c-0006VN-6b
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 18:07:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mQd21-0005nQ-H4
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 18:05:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mQd1z-0001Gu-Mw
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 18:05:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631743526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dMp/sI2Rm01zPuZNRVi86nS+PEgZAAga45IqZVfIBjw=;
 b=AMrqAaDnoVijZPVpu+cNhkqsySprwsIfRrglDY8RHjcr3QvQlY8dvXCXSwLsqXZnkzWQzR
 wpgmRRSacxImrBnTP+34jAepnxkThQy4tkTPBqzI9ds5XNKVRNjH0p0OxoJZJbzWksC02R
 JAkuvKiIDv1DfkRJbVp4Tns48PLY9CU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-SQk9kpJNOWyMLqgtTNwZqA-1; Wed, 15 Sep 2021 18:05:25 -0400
X-MC-Unique: SQk9kpJNOWyMLqgtTNwZqA-1
Received: by mail-ed1-f71.google.com with SMTP id
 b7-20020a50e787000000b003d59cb1a923so2201894edn.5
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 15:05:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dMp/sI2Rm01zPuZNRVi86nS+PEgZAAga45IqZVfIBjw=;
 b=fER9pZOQb9hUXLOAFuV3q/bO7Fxq+2s0nSPo9vvV3brlZe3GhaBZ1nY7AtNNbkhDTH
 TVWc/kTYuMliN3d9fD8qpu5/bF+y7TlzZVLyhBhBfrRaG3/E/rH64HSnr2poXkwmJTtt
 k2Jt3PUQve8owdhX4ml4gYkaVq9efcwcOePOpgvHH/L1Ys2Vm3qgOmlY9iM0cNqJZN5L
 VNrjRSiSuJ7Kl91zvLJoZ18YEEDleUUbkJ/D2DUsXd3gxoPCYJPnGm/Pgr9kj1deRUVf
 fy/IwQ+qb1+u4czislkTbrqnuee2IR5X/JaX+b82jLwYTLQnQNk7Nf9OJAnNJZ1Ru+RB
 86CQ==
X-Gm-Message-State: AOAM533i1ZbHnb08PLsst6RfCNjtAsoQBWD0QeN3cXssCdCLahgkxljb
 zKgzIGWRYJFkgJQbiEYWnUN3nJR7k8io3Zp3irbOr1wBL6WjRueq6QqLHrkTu3IqnbzNu/UxmSo
 b4unDT/GswyXVBcA=
X-Received: by 2002:a05:6402:289b:: with SMTP id
 eg27mr2606329edb.25.1631743523465; 
 Wed, 15 Sep 2021 15:05:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAFxCW/oySlfxsQ5AZ0GlEIAFftfmqz/FOcxMikLcmLmH/47igneYFiCf/Wqo8Q5b7US3b5g==
X-Received: by 2002:a05:6402:289b:: with SMTP id
 eg27mr2606296edb.25.1631743523224; 
 Wed, 15 Sep 2021 15:05:23 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id c2sm542467edk.50.2021.09.15.15.05.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 15:05:22 -0700 (PDT)
Subject: Re: [PATCH] target/i386: Include 'hw/i386/apic.h' locally
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902152243.386118-1-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a4cba848-e668-7cf1-fe93-b5da3a4ac6dc@redhat.com>
Date: Thu, 16 Sep 2021 00:05:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210902152243.386118-1-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.698, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Cameron Esfahani <dirty@apple.com>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Colin Xu <colin.xu@intel.com>, haxm-team@intel.com,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Wenchao Wang <wenchao.wang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/09/21 17:22, Philippe Mathieu-Daudé wrote:
> Instead of including a sysemu-specific header in "cpu.h"
> (which is shared with user-mode emulations), include it
> locally when required.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Based-on: <20210902151715.383678-1-f4bug@amsat.org>
> "accel/tcg: Restrict TCGCPUOps::cpu_exec_interrupt() to sysemu"

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo

> ---
>   target/i386/cpu.h                    | 4 ----
>   hw/i386/kvmvapic.c                   | 1 +
>   hw/i386/x86.c                        | 1 +
>   target/i386/cpu-sysemu.c             | 1 +
>   target/i386/cpu.c                    | 1 +
>   target/i386/gdbstub.c                | 4 ++++
>   target/i386/hax/hax-all.c            | 1 +
>   target/i386/helper.c                 | 1 +
>   target/i386/hvf/x86_emu.c            | 1 +
>   target/i386/nvmm/nvmm-all.c          | 1 +
>   target/i386/tcg/seg_helper.c         | 4 ++++
>   target/i386/tcg/sysemu/misc_helper.c | 1 +
>   target/i386/whpx/whpx-all.c          | 1 +
>   13 files changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index c7cc65e92d5..eddafd1acd5 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -2046,10 +2046,6 @@ typedef X86CPU ArchCPU;
>   #include "exec/cpu-all.h"
>   #include "svm.h"
>   
> -#if !defined(CONFIG_USER_ONLY)
> -#include "hw/i386/apic.h"
> -#endif
> -
>   static inline void cpu_get_tb_cpu_state(CPUX86State *env, target_ulong *pc,
>                                           target_ulong *cs_base, uint32_t *flags)
>   {
> diff --git a/hw/i386/kvmvapic.c b/hw/i386/kvmvapic.c
> index 43f8a8f679e..7333818bdd1 100644
> --- a/hw/i386/kvmvapic.c
> +++ b/hw/i386/kvmvapic.c
> @@ -16,6 +16,7 @@
>   #include "sysemu/hw_accel.h"
>   #include "sysemu/kvm.h"
>   #include "sysemu/runstate.h"
> +#include "hw/i386/apic.h"
>   #include "hw/i386/apic_internal.h"
>   #include "hw/sysbus.h"
>   #include "hw/boards.h"
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index 00448ed55aa..e0218f8791f 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -43,6 +43,7 @@
>   #include "target/i386/cpu.h"
>   #include "hw/i386/topology.h"
>   #include "hw/i386/fw_cfg.h"
> +#include "hw/i386/apic.h"
>   #include "hw/intc/i8259.h"
>   #include "hw/rtc/mc146818rtc.h"
>   
> diff --git a/target/i386/cpu-sysemu.c b/target/i386/cpu-sysemu.c
> index 1078e3d157f..65709e41903 100644
> --- a/target/i386/cpu-sysemu.c
> +++ b/target/i386/cpu-sysemu.c
> @@ -30,6 +30,7 @@
>   #include "hw/qdev-properties.h"
>   
>   #include "exec/address-spaces.h"
> +#include "hw/i386/apic.h"
>   #include "hw/i386/apic_internal.h"
>   
>   #include "cpu-internal.h"
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 97e250e8760..04f59043804 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -33,6 +33,7 @@
>   #include "standard-headers/asm-x86/kvm_para.h"
>   #include "hw/qdev-properties.h"
>   #include "hw/i386/topology.h"
> +#include "hw/i386/apic.h"
>   #ifndef CONFIG_USER_ONLY
>   #include "exec/address-spaces.h"
>   #include "hw/boards.h"
> diff --git a/target/i386/gdbstub.c b/target/i386/gdbstub.c
> index 098a2ad15a9..5438229c1a9 100644
> --- a/target/i386/gdbstub.c
> +++ b/target/i386/gdbstub.c
> @@ -21,6 +21,10 @@
>   #include "cpu.h"
>   #include "exec/gdbstub.h"
>   
> +#ifndef CONFIG_USER_ONLY
> +#include "hw/i386/apic.h"
> +#endif
> +
>   #ifdef TARGET_X86_64
>   static const int gpr_map[16] = {
>       R_EAX, R_EBX, R_ECX, R_EDX, R_ESI, R_EDI, R_EBP, R_ESP,
> diff --git a/target/i386/hax/hax-all.c b/target/i386/hax/hax-all.c
> index bf65ed6fa92..cd89e3233a9 100644
> --- a/target/i386/hax/hax-all.c
> +++ b/target/i386/hax/hax-all.c
> @@ -32,6 +32,7 @@
>   #include "sysemu/reset.h"
>   #include "sysemu/runstate.h"
>   #include "hw/boards.h"
> +#include "hw/i386/apic.h"
>   
>   #include "hax-accel-ops.h"
>   
> diff --git a/target/i386/helper.c b/target/i386/helper.c
> index 533b29cb91b..874beda98ae 100644
> --- a/target/i386/helper.c
> +++ b/target/i386/helper.c
> @@ -26,6 +26,7 @@
>   #ifndef CONFIG_USER_ONLY
>   #include "sysemu/hw_accel.h"
>   #include "monitor/monitor.h"
> +#include "hw/i386/apic.h"
>   #endif
>   
>   void cpu_sync_bndcs_hflags(CPUX86State *env)
> diff --git a/target/i386/hvf/x86_emu.c b/target/i386/hvf/x86_emu.c
> index 7c8203b21fb..fb3e88959d4 100644
> --- a/target/i386/hvf/x86_emu.c
> +++ b/target/i386/hvf/x86_emu.c
> @@ -45,6 +45,7 @@
>   #include "x86_flags.h"
>   #include "vmcs.h"
>   #include "vmx.h"
> +#include "hw/i386/apic.h"
>   
>   void hvf_handle_io(struct CPUState *cpu, uint16_t port, void *data,
>                      int direction, int size, uint32_t count);
> diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
> index 28dee4c5ee3..4c07cfc7194 100644
> --- a/target/i386/nvmm/nvmm-all.c
> +++ b/target/i386/nvmm/nvmm-all.c
> @@ -22,6 +22,7 @@
>   #include "qemu/queue.h"
>   #include "migration/blocker.h"
>   #include "strings.h"
> +#include "hw/i386/apic.h"
>   
>   #include "nvmm-accel-ops.h"
>   
> diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
> index 13c6e6ee62e..71fd2bf8d06 100644
> --- a/target/i386/tcg/seg_helper.c
> +++ b/target/i386/tcg/seg_helper.c
> @@ -28,6 +28,10 @@
>   #include "helper-tcg.h"
>   #include "seg_helper.h"
>   
> +#ifndef CONFIG_USER_ONLY
> +#include "hw/i386/apic.h"
> +#endif
> +
>   /* return non zero if error */
>   static inline int load_segment_ra(CPUX86State *env, uint32_t *e1_ptr,
>                                  uint32_t *e2_ptr, int selector,
> diff --git a/target/i386/tcg/sysemu/misc_helper.c b/target/i386/tcg/sysemu/misc_helper.c
> index e7a2ebde813..dbeda8d0b0f 100644
> --- a/target/i386/tcg/sysemu/misc_helper.c
> +++ b/target/i386/tcg/sysemu/misc_helper.c
> @@ -24,6 +24,7 @@
>   #include "exec/cpu_ldst.h"
>   #include "exec/address-spaces.h"
>   #include "tcg/helper-tcg.h"
> +#include "hw/i386/apic.h"
>   
>   void helper_outb(CPUX86State *env, uint32_t port, uint32_t data)
>   {
> diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
> index 3e925b9da70..9ab844fd05d 100644
> --- a/target/i386/whpx/whpx-all.c
> +++ b/target/i386/whpx/whpx-all.c
> @@ -20,6 +20,7 @@
>   #include "qemu/main-loop.h"
>   #include "hw/boards.h"
>   #include "hw/i386/ioapic.h"
> +#include "hw/i386/apic.h"
>   #include "hw/i386/apic_internal.h"
>   #include "qemu/error-report.h"
>   #include "qapi/error.h"
> 


