Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F07864A3DE
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 16:00:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4kGs-0004PF-OT; Mon, 12 Dec 2022 09:59:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p4kGY-0004NK-9E
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 09:58:50 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p4kGV-0001Lt-RP
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 09:58:50 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 ay14-20020a05600c1e0e00b003cf6ab34b61so5400175wmb.2
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 06:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=g4TN9OWzUKBwbGLYbyNtztzR8lR8Srm/z0Jp+C6j0QM=;
 b=g9HlKtODl+WmmH80sTkoCCVaU578HT41MsExoMZgHzR9K/M+g+oeLN86ogkTbENpIk
 FcC9Lf3fKlhKUpXMNpWqbLNM8G0QaykCLJYb1st4BubyU8Jn8Nb8OKASh4LaKZAxCJBc
 tBwW3RZv32B3urcVLVSGtAUQzbJS6+fEPjABJKqK1qHJIdxMzIteG8NQm94N/nUmn3V6
 HqTqssnkaIYwtmKQFq2/349ScDR6gEadpDKD/j6YnesJP1KuFZZvp4beFaPGZbzuEPkt
 OYa0opcjIOlW+wQgx1sgARdGVr3XFlplAvKeGMi/eO1DVX/O7Qq43rcxCx+kzu5Xej9w
 CLaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g4TN9OWzUKBwbGLYbyNtztzR8lR8Srm/z0Jp+C6j0QM=;
 b=rvWJkWHEevnCVESl9WkDW8MdEAn2diM+86UqGs5WN2Y/m4++VpJFImBPd5jGxus0+g
 ENxZyQAtHmKK3B5kt6TapVq/MFwos+j53K9axZmPBJBYmIPY4xgyJ/Dl+d6bSwvBSiXv
 y5ezc2Q+uPznG4//pXx7XXodKNnkuCn7FbjVftyKa5t7I/bdZgNidiHuZeS+6dzk+5Ka
 jMX1ZznoBa0ubg43p6+QRL2YRa8MDIxaMx9l5KJue9W6BQ92NpyxtHHgIvksC2qao9uQ
 6odOf9Y6q/Zd7DEkwOpOru3D55p4DDA1vF25+IjEneCPEbF9ywA4BdehwU7k+ub9wgZF
 Vf/g==
X-Gm-Message-State: ANoB5pkVfeoJkbT/M5Nyq0ouiYqsc70q1VzXPlId7fbKuQQWo7HDQbSx
 onvVxojr7hF6YKF4IySea4I=
X-Google-Smtp-Source: AA0mqf6UGKFpU63UhXOw7/9ExO8xue2JI+cJp8Vv3BBF6GGhfLGx3E84MvfIC35Ol8CrZhSvQH3IBQ==
X-Received: by 2002:a05:600c:6010:b0:3d1:f496:e25f with SMTP id
 az16-20020a05600c601000b003d1f496e25fmr12234744wmb.16.1670857122968; 
 Mon, 12 Dec 2022 06:58:42 -0800 (PST)
Received: from ?IPV6:2a00:23c5:5785:9a01:a16d:8ab1:4623:169?
 ([2a00:23c5:5785:9a01:a16d:8ab1:4623:169])
 by smtp.gmail.com with ESMTPSA id
 r7-20020a05600c458700b003b47b80cec3sm10204931wmo.42.2022.12.12.06.58.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 06:58:42 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <689e729a-3c5e-5380-c010-44ca37bf5497@xen.org>
Date: Mon, 12 Dec 2022 14:58:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH v2 16/22] i386/xen: handle VCPUOP_register_vcpu_info
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
References: <20221209095612.689243-1-dwmw2@infradead.org>
 <20221209095612.689243-17-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20221209095612.689243-17-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 09/12/2022 09:56, David Woodhouse wrote:
> From: Joao Martins <joao.m.martins@oracle.com>
> 
> Handle the hypercall to set a per vcpu info, and also wire up the default
> vcpu_info in the shared_info page for the first 32 vCPUs.
> 
> To avoid deadlock within KVM a vCPU thread must set its *own* vcpu_info
> rather than it being set from the context in which the hypercall is
> invoked.
> 
> Add the vcpu_info (and default) GPA to the vmstate_x86_cpu for migration,
> and restore it in kvm_arch_put_registers() appropriately.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   target/i386/cpu.h        |  2 ++
>   target/i386/kvm/kvm.c    | 19 +++++++++++
>   target/i386/machine.c    | 21 ++++++++++++
>   target/i386/trace-events |  1 +
>   target/i386/xen.c        | 74 +++++++++++++++++++++++++++++++++++++---
>   target/i386/xen.h        |  1 +
>   6 files changed, 113 insertions(+), 5 deletions(-)
> 
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index c6c57baed5..109b2e5669 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -1788,6 +1788,8 @@ typedef struct CPUArchState {
>   #endif
>   #if defined(CONFIG_KVM)
>       struct kvm_nested_state *nested_state;
> +    uint64_t xen_vcpu_info_gpa;
> +    uint64_t xen_vcpu_info_default_gpa;
>   #endif
>   #if defined(CONFIG_HVF)
>       HVFX86LazyFlags hvf_lflags;
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index ebde6bc204..fa45e2f99a 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -1811,6 +1811,9 @@ int kvm_arch_init_vcpu(CPUState *cs)
>           has_msr_hv_hypercall = true;
>       }
>   
> +    env->xen_vcpu_info_gpa = UINT64_MAX;
> +    env->xen_vcpu_info_default_gpa = UINT64_MAX;


There was an INVALID_GPA definition for shared info. Looks like we could 
use it here too.

> +
>       xen_version = kvm_arch_xen_version(MACHINE(qdev_get_machine()));
>       if (xen_version) {
>   #ifdef CONFIG_XEN_EMU
> @@ -4728,6 +4731,22 @@ int kvm_arch_put_registers(CPUState *cpu, int level)
>           kvm_arch_set_tsc_khz(cpu);
>       }
>   
> +#ifdef CONFIG_XEN_EMU
> +    if (level == KVM_PUT_FULL_STATE) {
> +        uint64_t gpa = x86_cpu->env.xen_vcpu_info_gpa;
> +        if (gpa == UINT64_MAX) {
> +            gpa = x86_cpu->env.xen_vcpu_info_default_gpa;
> +        }
> +
> +        if (gpa != UINT64_MAX) {
> +            ret = kvm_xen_set_vcpu_attr(cpu, KVM_XEN_VCPU_ATTR_TYPE_VCPU_INFO, gpa);
> +            if (ret < 0) {
> +                return ret;
> +            }
> +        }
> +    }
> +#endif
> +
>       ret = kvm_getput_regs(x86_cpu, 1);
>       if (ret < 0) {
>           return ret;
[snip]
> @@ -195,19 +240,38 @@ static bool kvm_xen_hcall_hvm_op(struct kvm_xen_exit *exit,
>       }
>   }
>   
> +static int vcpuop_register_vcpu_info(CPUState *cs, CPUState *target,
> +                                     uint64_t arg)
> +{
> +    struct vcpu_register_vcpu_info rvi;
> +    uint64_t gpa;
> +
> +    if (!target)
> +            return -ENOENT;
> +
> +    if (kvm_copy_from_gva(cs, arg, &rvi, sizeof(rvi))) {
> +        return -EFAULT;
> +    }
> +
> +    gpa = ((rvi.mfn << TARGET_PAGE_BITS) + rvi.offset);

Some sanity checks wouldn't go a miss here...

rvi.offset should:
a) be < TARGET_PAGE_SIZE, and
b) ba aligned to vcpu_info_t size

   Paul

> +    async_run_on_cpu(target, do_set_vcpu_info_gpa, RUN_ON_CPU_HOST_ULONG(gpa));
> +    return 0;
> +}
> +


