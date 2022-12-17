Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED1064F647
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 01:28:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6L3q-0001DE-PM; Fri, 16 Dec 2022 19:28:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6L3n-0001Cs-1f
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 19:28:15 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6L3l-00030r-An
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 19:28:14 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 z8-20020a17090abd8800b00219ed30ce47so7670195pjr.3
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 16:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HDhsKZHfuqUNMSX9urbcifEWfhPYxHuNfIQ1M3OmjVc=;
 b=g/Ab07/GycQYUrotiz4yubH5NwGDTExZBr0yFWOpPCQrFK/4bkTmvElbK7EkdePWN3
 Xo6jl3RahkYuI96U+hSOrzHs+Dl+c/tt6DFCb5RU/Iq9FpGiOedmySI/h8gbYnibG8Yl
 So+qh0BNpq3I45POomANVJAPnl94Ox+QFNvhdTec9ow+VFVoS6u/6GMhtdsbHSAsnpna
 uXVNpeRb+Le9TpRlh3AGkqH1B4wx6aJhcraYZwYe9xUFEagqpOqMZ68uopAkwQ4Md0tS
 ClqpP0XhFMTZvWSGTgdCNexPqdg719ULyUPjoQG1eyAcACKoqDrqzrJ4TNA3jvqRVLA0
 GXFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HDhsKZHfuqUNMSX9urbcifEWfhPYxHuNfIQ1M3OmjVc=;
 b=xkC2m6NtI2C+xuhBCyCA6jtyvNShSZcFtN9ohVWH7Q2miwGZX6LH3P82i1rSd89Lgm
 HlFFUeMz2+6Fb2ZGcIgQUiOrZ97uG/XkBeoGfH/XZKvVRHsPfGLqPsa9OpqY/WnrQcvm
 cc0N+tM7rkj6q+6ReY3fjLut/xkIq+dvUXfuZXujIhjKMangvw5uWXPz6gHk8r7DH5FR
 1LLIm0KLXqumyKlGHminwPx0Y0LGfUEzl3JiyeEMX8WAfccFZA4Lj01U2NXWBIOo3kNH
 2PngdtKVZT9hWt1ZlOCYOPoVXJDrytwjH9d+EZl93nbOFdBGKBfV4CT2pAT6wnVlJCMy
 hmOg==
X-Gm-Message-State: ANoB5pk44oqkvk9lhVnbNW0nSa0D+s/SLxsjGyEKoWHlJuySsL2M6GQM
 pcfXqDTUyW176JJgAGP6pb8DxA==
X-Google-Smtp-Source: AA0mqf624f5KinsjkPkQbOhYbb3Vj/Ub2KIm+y6ratnfOe4aE3d1ouF0nbiSe/dUePV2L2N/ms2e4g==
X-Received: by 2002:a17:902:728e:b0:189:ba67:4739 with SMTP id
 d14-20020a170902728e00b00189ba674739mr33550109pll.66.1671236891689; 
 Fri, 16 Dec 2022 16:28:11 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:c606:9489:98df:6a3b?
 ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 n10-20020a170902e54a00b00188fce6e8absm2161137plf.280.2022.12.16.16.28.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 16:28:11 -0800 (PST)
Message-ID: <b1317b71-d8a9-c04b-93db-12f24a35a09c@linaro.org>
Date: Fri, 16 Dec 2022 16:28:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/2] sysemu/kvm: Reduce target-specific declarations
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org
References: <20221216220738.7355-1-philmd@linaro.org>
 <20221216220738.7355-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221216220738.7355-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/16/22 14:07, Philippe Mathieu-Daudé wrote:
> Only the declarations using the target_ulong type are
> target specific.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/sysemu/kvm.h | 25 ++++++++++++-------------
>   1 file changed, 12 insertions(+), 13 deletions(-)
> 
> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
> index c8281c07a7..a53d6dab49 100644
> --- a/include/sysemu/kvm.h
> +++ b/include/sysemu/kvm.h
> @@ -242,9 +242,6 @@ bool kvm_arm_supports_user_irq(void);
>   int kvm_on_sigbus_vcpu(CPUState *cpu, int code, void *addr);
>   int kvm_on_sigbus(int code, void *addr);
>   
> -#ifdef NEED_CPU_H
> -#include "cpu.h"
> -
>   void kvm_flush_coalesced_mmio_buffer(void);
>   
>   /**
> @@ -410,6 +407,9 @@ void kvm_get_apic_state(DeviceState *d, struct kvm_lapic_state *kapic);
>   struct kvm_guest_debug;
>   struct kvm_debug_exit_arch;
>   
> +#ifdef NEED_CPU_H
> +#include "cpu.h"
> +
>   struct kvm_sw_breakpoint {
>       target_ulong pc;
>       target_ulong saved_insn;
> @@ -436,6 +436,15 @@ void kvm_arch_update_guest_debug(CPUState *cpu, struct kvm_guest_debug *dbg);
>   
>   bool kvm_arch_stop_on_emulation_error(CPUState *cpu);
>   
> +uint32_t kvm_arch_get_supported_cpuid(KVMState *env, uint32_t function,
> +                                      uint32_t index, int reg);
> +uint64_t kvm_arch_get_supported_msr_feature(KVMState *s, uint32_t index);
> +
> +int kvm_physical_memory_addr_from_host(KVMState *s, void *ram_addr,
> +                                       hwaddr *phys_addr);

Why did these need to move?


r~

> +
> +#endif /* NEED_CPU_H */
> +
>   int kvm_check_extension(KVMState *s, unsigned int extension);
>   
>   int kvm_vm_check_extension(KVMState *s, unsigned int extension);
> @@ -464,18 +473,8 @@ int kvm_vm_check_extension(KVMState *s, unsigned int extension);
>           kvm_vcpu_ioctl(cpu, KVM_ENABLE_CAP, &cap);                   \
>       })
>   
> -uint32_t kvm_arch_get_supported_cpuid(KVMState *env, uint32_t function,
> -                                      uint32_t index, int reg);
> -uint64_t kvm_arch_get_supported_msr_feature(KVMState *s, uint32_t index);
> -
> -
>   void kvm_set_sigmask_len(KVMState *s, unsigned int sigmask_len);
>   
> -int kvm_physical_memory_addr_from_host(KVMState *s, void *ram_addr,
> -                                       hwaddr *phys_addr);
> -
> -#endif /* NEED_CPU_H */
> -
>   void kvm_cpu_synchronize_state(CPUState *cpu);
>   
>   void kvm_init_cpu_signals(CPUState *cpu);


