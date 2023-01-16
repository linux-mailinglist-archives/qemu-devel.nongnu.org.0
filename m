Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BD966C6D8
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 17:25:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHSI1-000243-7Y; Mon, 16 Jan 2023 11:24:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHSHz-00023q-WD
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 11:24:52 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHSHy-0001GT-7T
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 11:24:51 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 m5-20020a05600c4f4500b003db03b2559eso497911wmq.5
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 08:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9X/5a+o8wPopfh+RhDxbrJgiSByMHrAs9p4TXbbuH68=;
 b=j3FVMmMnli4+zIW2fGi69u0GTJrx19Sg+iM4s6LRSyN4Fe2Ziww0iwdj/UAPfGHURS
 yX0YSGjgqnfaxze9YQ+AZkiHekIKPCbL0gev+ZUi+5tuobwrIgsZlFimga4SDqnh7TVm
 vqOk/B5QQiYsXzFfRUdwl4qSXy/t5R+R1kRbLUH+3DUCwzVDfDT6i/6v0kVG4U1E2BL4
 C2dzfR01sctANlBDgdwPcGytEfkZKWQzq+OpdAIWPuv4Ft68qU8NvaFVFv6uPdsx3fXt
 Xw4pGQVeubACgpqiD0Ux5Bs5uqbM+xj93Zn5JDbZz/K8bKjFZbx3TqHGHeRp2AAhme7h
 LcgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9X/5a+o8wPopfh+RhDxbrJgiSByMHrAs9p4TXbbuH68=;
 b=5mSrO2C/CM3pzueo+BJkWq6XRl71UL86v7I7jZgg5M0WSfAJYWWj3bLm3D2iJZ1Bfn
 CYb8dapYyBgb4sxQjKT+kzlGfsP/1+YifzaO8AI+KMRvzYvUyYnPK1MmXPaUEVikLWA0
 SMylnH3D0sK0quq8yRp4TgjPv117Gfmt/CmJFUeH0YzpQCssDZ58ErOzkw+va6uL5aO3
 HwMELo/IWz0PKQN6+LTk4p2pkM1Lf2bF1N3p7m5orfeq+Stqo+DtCNKoeAr2AHlAZJ1O
 8EfuiEQvGeiiU/rmv9s2PAcA0xeD33dEpPRjNpZmJlhTm9C9vKp2ZCJLtFGCUgUzttzF
 ZL4Q==
X-Gm-Message-State: AFqh2kpz4skcCcsZbJjT2Q4r6oQa0fpvwQ5BtprbrHwbE3/I86sdl7Um
 sFAa/cRCmFriXO8y2hq1j/A=
X-Google-Smtp-Source: AMrXdXuWKrK9VXTabPN4xU2SPdmoaFIvko2khcVRFX148/tLYqOc8faAq65EE7U+HqxP1svc8wAgeA==
X-Received: by 2002:a1c:6a07:0:b0:3cf:7197:e68a with SMTP id
 f7-20020a1c6a07000000b003cf7197e68amr8802579wmc.18.1673886288518; 
 Mon, 16 Jan 2023 08:24:48 -0800 (PST)
Received: from [192.168.6.176] (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id
 l14-20020a05600c4f0e00b003d96c811d6dsm42312353wmq.30.2023.01.16.08.24.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 08:24:47 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <cb607bd9-09dc-802c-fdf4-fce72cedb8bb@xen.org>
Date: Mon, 16 Jan 2023 16:24:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6 09/51] i386/xen: handle guest hypercalls
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>
References: <20230110122042.1562155-1-dwmw2@infradead.org>
 <20230110122042.1562155-10-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230110122042.1562155-10-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/01/2023 12:20, David Woodhouse wrote:
> From: Joao Martins <joao.m.martins@oracle.com>
> 
> This means handling the new exit reason for Xen but still
> crashing on purpose. As we implement each of the hypercalls
> we will then return the right return code.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> [dwmw2: Add CPL to hypercall tracing, disallow hypercalls from CPL > 0]
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   target/i386/kvm/kvm.c        |  5 ++++
>   target/i386/kvm/trace-events |  3 +++
>   target/i386/kvm/xen-emu.c    | 44 ++++++++++++++++++++++++++++++++++++
>   target/i386/kvm/xen-emu.h    |  1 +
>   4 files changed, 53 insertions(+)
> 
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index 4ab2c08af6..7cbfbed492 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -5477,6 +5477,11 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
>           assert(run->msr.reason == KVM_MSR_EXIT_REASON_FILTER);
>           ret = kvm_handle_wrmsr(cpu, run);
>           break;
> +#ifdef CONFIG_XEN_EMU
> +    case KVM_EXIT_XEN:
> +        ret = kvm_xen_handle_exit(cpu, &run->xen);
> +        break;
> +#endif
>       default:
>           fprintf(stderr, "KVM: unknown exit reason %d\n", run->exit_reason);
>           ret = -1;
> diff --git a/target/i386/kvm/trace-events b/target/i386/kvm/trace-events
> index 7c369db1e1..cd6f842b1f 100644
> --- a/target/i386/kvm/trace-events
> +++ b/target/i386/kvm/trace-events
> @@ -5,3 +5,6 @@ kvm_x86_fixup_msi_error(uint32_t gsi) "VT-d failed to remap interrupt for GSI %"
>   kvm_x86_add_msi_route(int virq) "Adding route entry for virq %d"
>   kvm_x86_remove_msi_route(int virq) "Removing route entry for virq %d"
>   kvm_x86_update_msi_routes(int num) "Updated %d MSI routes"
> +
> +# xen-emu.c
> +kvm_xen_hypercall(int cpu, uint8_t cpl, uint64_t input, uint64_t a0, uint64_t a1, uint64_t a2, uint64_t ret) "xen_hypercall: cpu %d cpl %d input %" PRIu64 " a0 0x%" PRIx64 " a1 0x%" PRIx64 " a2 0x%" PRIx64" ret 0x%" PRIx64
> diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
> index 4883b95d9d..476f464ee2 100644
> --- a/target/i386/kvm/xen-emu.c
> +++ b/target/i386/kvm/xen-emu.c
> @@ -10,10 +10,12 @@
>    */
>   
>   #include "qemu/osdep.h"
> +#include "qemu/log.h"
>   #include "sysemu/kvm_int.h"
>   #include "sysemu/kvm_xen.h"
>   #include "kvm/kvm_i386.h"
>   #include "xen-emu.h"
> +#include "trace.h"
>   
>   int kvm_xen_init(KVMState *s, uint32_t hypercall_msr)
>   {
> @@ -84,3 +86,45 @@ uint32_t kvm_xen_get_caps(void)
>   {
>       return kvm_state->xen_caps;
>   }
> +
> +static bool do_kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
> +{
> +    uint16_t code = exit->u.hcall.input;
> +
> +    if (exit->u.hcall.cpl > 0) {
> +        exit->u.hcall.result = -EPERM;
> +        return true;
> +    }
> +
> +    switch (code) {
> +    default:
> +        return false;
> +    }
> +}
> +
> +int kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
> +{
> +    if (exit->type != KVM_EXIT_XEN_HCALL) {
> +        return -1;
> +    }
> +
> +    if (!do_kvm_xen_handle_exit(cpu, exit)) {
> +        /*
> +         * Some hypercalls will be deliberately "implemented" by returning
> +         * -ENOSYS. This case is for hypercalls which are unexpected.
> +         */
> +        exit->u.hcall.result = -ENOSYS;
> +        qemu_log_mask(LOG_UNIMP, "Unimplemented Xen hypercall %"
> +                      PRId64 " (0x%" PRIx64 " 0x%" PRIx64 " 0x%" PRIx64 ")\n",
> +                      (uint64_t)exit->u.hcall.input,
> +                      (uint64_t)exit->u.hcall.params[0],
> +                      (uint64_t)exit->u.hcall.params[1],
> +                      (uint64_t)exit->u.hcall.params[2]);
> +    }
> +
> +    trace_kvm_xen_hypercall(CPU(cpu)->cpu_index, exit->u.hcall.cpl,
> +                            exit->u.hcall.input, exit->u.hcall.params[0],
> +                            exit->u.hcall.params[1], exit->u.hcall.params[2],
> +                            exit->u.hcall.result);

It seems odd to have the trace message after the hypercall is handled. 
Any additional tracing in the handler if going to come out before we're 
told what hypercall it is.

   Paul

> +    return 0;
> +}
> diff --git a/target/i386/kvm/xen-emu.h b/target/i386/kvm/xen-emu.h
> index d62f1d8ed8..21faf6bf38 100644
> --- a/target/i386/kvm/xen-emu.h
> +++ b/target/i386/kvm/xen-emu.h
> @@ -25,5 +25,6 @@
>   
>   int kvm_xen_init(KVMState *s, uint32_t hypercall_msr);
>   int kvm_xen_init_vcpu(CPUState *cs);
> +int kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit);
>   
>   #endif /* QEMU_I386_KVM_XEN_EMU_H */


