Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC72578705
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 18:10:29 +0200 (CEST)
Received: from localhost ([::1]:43264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDTKH-0003eZ-0D
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 12:10:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oDTId-0001Bk-Mu
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 12:08:47 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:34643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oDTIc-00076y-6S
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 12:08:47 -0400
Received: by mail-ed1-x531.google.com with SMTP id x91so15996624ede.1
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 09:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Q01p3XNFWNVTvHthfZbUiZLYHqp67sG0V5S5/DDnf+Q=;
 b=Urd3bzgA6D46sxiUTr/U9EXRieWlt7ROFzYGQUCBZTThvEQtsfmvEpo3uE98/cGaIv
 aoEp9lGGTGsNpXq1LDlEBijhQhLE9VoNpLKyrd3fGJcuKZAE9+YOOHLike4r914iVMtW
 njNqt06qSjqhETp4oYE6SQ7PicocvQUYN4bLuieBTApL5oF9eHksaJ1K2hRG3ukkM+WG
 6PVmF2NOfxlFy5BBnc77/uyyhsX6ysS1OFIUIemc0kEUlJDnpG0GKvmGwoI0a/rDM7Lr
 S8MEAEddoAyJMvFWEQ+BeU2r1DBl7nCfpmhSb+LFLsWyegwwFWn1m+3VLg6DZbJezxnv
 Vltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Q01p3XNFWNVTvHthfZbUiZLYHqp67sG0V5S5/DDnf+Q=;
 b=j/AZ3DIHvaJ2F61ao56+JYxsJVgnBseTLolYEyKAy1wvrWwZmKEKbv5Zb+EeQOJGoi
 HPLAVModw7zaNHzEPQkwTV8ewoL4EfUxeXneU3A0jwFDIOgxujVymkE5u2BlMCNiViz0
 RgSxeuyP9uoRy0RVG+ygU4ljGiMDFcmfQW7uGyPgaTA1m3iWtUpIPUUcQMLjlO7/KW5n
 ned/086R5ws3IZeNHTZyA92I4Z42ns1gnEUGcoAp1mECrAw8KlSRciR7/K+CyXLBjQNK
 nYieY/WUIv25OQ/XYQKoKF1n6ARg69G+ToRqVEfGuofyP7loh6RrqSfaA4OV8JTrdM0O
 x3UA==
X-Gm-Message-State: AJIora87FS0EmgJKg1F+OKrO5H6uSENJJwkQDTsBX+T22SkHKtqnWGpi
 4ojl5uAvKn33n7PMGJMHdh0=
X-Google-Smtp-Source: AGRyM1vij9qUkLEPU5MOlbSP9YzoHbKpYX6SNgaC4VaZ3E/dvoIIpIJqVqcNtY2SWgiz6L5VRJ6eJA==
X-Received: by 2002:aa7:d044:0:b0:43b:47c9:4310 with SMTP id
 n4-20020aa7d044000000b0043b47c94310mr20821533edo.120.1658160524774; 
 Mon, 18 Jul 2022 09:08:44 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 i23-20020a056402055700b0043a2338ca10sm8720846edx.92.2022.07.18.09.08.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jul 2022 09:08:44 -0700 (PDT)
Message-ID: <a7bccbc5-fcb7-eaa8-ce95-fa7f380b8af9@redhat.com>
Date: Mon, 18 Jul 2022 18:08:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] i386: Disable BTS and PEBS
Content-Language: en-US
To: Zhenzhong Duan <zhenzhong.duan@intel.com>, qemu-devel@nongnu.org
Cc: mtosatti@redhat.com, seanjc@google.com, likexu@tencent.com,
 xiangfeix.ma@intel.com
References: <20220718032206.34488-1-zhenzhong.duan@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220718032206.34488-1-zhenzhong.duan@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/18/22 05:22, Zhenzhong Duan wrote:
> Since below KVM commit, KVM hided BTS as it's not supported yet.
> b9181c8ef356 ("KVM: x86/pmu: Avoid exposing Intel BTS feature")
> 
> After below KVM commit, it gave control of MSR_IA32_MISC_ENABLES to userspace.
> 9fc222967a39 ("KVM: x86: Give host userspace full control of MSR_IA32_MISC_ENABLES")
> 
> So qemu takes the responsibility to hide BTS.
> Without fix, we get below warning in guest kernel:
> 
> [] unchecked MSR access error: WRMSR to 0x1d9 (tried to write 0x00000000000001c0) at rIP: 0xffffffffaa070644 (native_write_msr+0x4/0x20)
> [] Call Trace:
> []  <TASK>
> []  intel_pmu_enable_bts+0x5d/0x70
> []  bts_event_add+0x77/0x90
> []  event_sched_in.isra.135+0x99/0x1e0
> 
> Tested-by: Xiangfei Ma <xiangfeix.ma@intel.com>
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> ---
>   target/i386/cpu.h     | 6 ++++--
>   target/i386/kvm/kvm.c | 4 ++++
>   2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 82004b65b944..8a83d0995c66 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -434,8 +434,10 @@ typedef enum X86Seg {
>   
>   #define MSR_IA32_MISC_ENABLE            0x1a0
>   /* Indicates good rep/movs microcode on some processors: */
> -#define MSR_IA32_MISC_ENABLE_DEFAULT    1
> -#define MSR_IA32_MISC_ENABLE_MWAIT      (1ULL << 18)
> +#define MSR_IA32_MISC_ENABLE_DEFAULT      1
> +#define MSR_IA32_MISC_ENABLE_BTS_UNAVAIL  (1ULL << 11)
> +#define MSR_IA32_MISC_ENABLE_PEBS_UNAVAIL (1ULL << 12)
> +#define MSR_IA32_MISC_ENABLE_MWAIT        (1ULL << 18)
>   
>   #define MSR_MTRRphysBase(reg)           (0x200 + 2 * (reg))
>   #define MSR_MTRRphysMask(reg)           (0x200 + 2 * (reg) + 1)
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index f148a6d52fa4..002e0520dd76 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -2180,6 +2180,10 @@ void kvm_arch_reset_vcpu(X86CPU *cpu)
>   {
>       CPUX86State *env = &cpu->env;
>   
> +    /* Disable BTS feature which is unsupported on KVM */
> +    env->msr_ia32_misc_enable |= MSR_IA32_MISC_ENABLE_BTS_UNAVAIL;
> +    env->msr_ia32_misc_enable |= MSR_IA32_MISC_ENABLE_PEBS_UNAVAIL;
> +
>       env->xcr0 = 1;
>       if (kvm_irqchip_in_kernel()) {
>           env->mp_state = cpu_is_bsp(cpu) ? KVM_MP_STATE_RUNNABLE :

This needs to be fixed in the kernel because old QEMU/new KVM is 
supported.  But apart from that, where does Linux check 
MSR_IA32_MISC_ENABLE_BTS_UNAVAIL and MSR_IA32_MISC_ENABLE_PEBS_UNAVAIL?

Paolo

