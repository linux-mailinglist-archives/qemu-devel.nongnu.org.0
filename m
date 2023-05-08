Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7506FB820
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 22:09:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw7Am-0007Q7-Ew; Mon, 08 May 2023 16:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.liu.linux@gmail.com>)
 id 1pw4gF-0008M1-0Z
 for qemu-devel@nongnu.org; Mon, 08 May 2023 13:29:47 -0400
Received: from mail-pf1-f180.google.com ([209.85.210.180])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wei.liu.linux@gmail.com>)
 id 1pw4gD-0004ev-Ew
 for qemu-devel@nongnu.org; Mon, 08 May 2023 13:29:46 -0400
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-6439bbc93b6so3004202b3a.1
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 10:29:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683566983; x=1686158983;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3rfke9qB1DRHiCuMEOyzzXuV8oi0P7zjijqnIYynp3o=;
 b=DAXdMg0Fg+awVEB+UIKUBF69+aqdne7WNdHtIjDIEiAeQuTRXlDd+AYGG7R+U1OQKs
 xm1eLrYuwNPTWtPUB2J1L4fqk7ZgoPN4IDAYQI6IRZwlqC3nOXj+QoIM/BX8O2nGOe0L
 utzvVmhJ21IlsHOV8LSoXcEhfbnf7WYwonDEKN47Ib5qvP7XSm2nN+4XKusSBqtKHVoT
 RrPO4BB7rRFr4OHtRJSMz/YfET/qSHihB0BpN7l84E5zSSEE8qWMFX1KziHTPtUQLi7s
 ckX5RBS2ICmGPidDA2HxBJTH+v901BkTgQhFshlKeHpbz2H1EQMah75JpDTbe5+AhKTV
 xZHQ==
X-Gm-Message-State: AC+VfDz/6uJuwDapuXQhRKnoPXf8bLHzQ5Af+H26H3okk3W5j2zCT/0m
 rlEyTiLadbHGz4F09ior9NQ=
X-Google-Smtp-Source: ACHHUZ75U4lCk4iijzyP5tOZ0JsVrz/EkvkWJ7HQDBXg3iSt23KVdFrierjfNZySz59EZ1uNpntsKQ==
X-Received: by 2002:a05:6a20:a107:b0:ff:7c74:a799 with SMTP id
 q7-20020a056a20a10700b000ff7c74a799mr11302220pzk.9.1683566983497; 
 Mon, 08 May 2023 10:29:43 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([20.69.120.36])
 by smtp.gmail.com with ESMTPSA id
 i4-20020aa787c4000000b0063d2d9990ecsm232036pfo.87.2023.05.08.10.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 May 2023 10:29:43 -0700 (PDT)
Date: Mon, 8 May 2023 17:29:41 +0000
From: Wei Liu <wei.liu@kernel.org>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Kees Cook <keescook@chromium.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Alexander Graf <graf@amazon.com>, Forrest Yuan Yu <yuanyu@google.com>,
 James Morris <jamorris@linux.microsoft.com>,
 John Andersen <john.s.andersen@intel.com>,
 Liran Alon <liran.alon@oracle.com>,
 "Madhavan T . Venkataraman" <madvenka@linux.microsoft.com>,
 Marian Rotariu <marian.c.rotariu@gmail.com>,
 Mihai =?utf-8?B?RG9uyJt1?= <mdontu@bitdefender.com>,
 =?utf-8?B?TmljdciZb3IgQ8OuyJt1?= <nicu.citu@icloud.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Thara Gopinath <tgopinath@microsoft.com>, Will Deacon <will@kernel.org>,
 Zahra Tarkhani <ztarkhani@microsoft.com>,
 =?utf-8?Q?=C8=98tefan_=C8=98icleru?= <ssicleru@bitdefender.com>,
 dev@lists.cloudhypervisor.org, kvm@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 qemu-devel@nongnu.org, virtualization@lists.linux-foundation.org,
 x86@kernel.org, xen-devel@lists.xenproject.org,
 Wei Liu <wei.liu@kernel.org>
Subject: Re: [PATCH v1 3/9] virt: Implement Heki common code
Message-ID: <ZFkxhWhjyIzrPkt8@liuwe-devbox-debian-v2>
References: <20230505152046.6575-1-mic@digikod.net>
 <20230505152046.6575-4-mic@digikod.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230505152046.6575-4-mic@digikod.net>
Received-SPF: pass client-ip=209.85.210.180;
 envelope-from=wei.liu.linux@gmail.com; helo=mail-pf1-f180.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 08 May 2023 16:09:26 -0400
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

On Fri, May 05, 2023 at 05:20:40PM +0200, Mickaël Salaün wrote:
> From: Madhavan T. Venkataraman <madvenka@linux.microsoft.com>
> 
> Hypervisor Enforced Kernel Integrity (Heki) is a feature that will use
> the hypervisor to enhance guest virtual machine security.
> 
> Configuration
> =============
> 
> Define the config variables for the feature. This feature depends on
> support from the architecture as well as the hypervisor.
> 
> Enabling HEKI
> =============
> 
> Define a kernel command line parameter "heki" to turn the feature on or
> off. By default, Heki is on.

For such a newfangled feature can we have it off by default? Especially
when there are unsolved issues around dynamically loaded code.

> 
[...]
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 3604074a878b..5cf5a7a97811 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -297,6 +297,7 @@ config X86
>  	select FUNCTION_ALIGNMENT_4B
>  	imply IMA_SECURE_AND_OR_TRUSTED_BOOT    if EFI
>  	select HAVE_DYNAMIC_FTRACE_NO_PATCHABLE
> +	select ARCH_SUPPORTS_HEKI		if X86_64

Why is there a restriction on X86_64?

>  
>  config INSTRUCTION_DECODER
>  	def_bool y
> diff --git a/arch/x86/include/asm/sections.h b/arch/x86/include/asm/sections.h
> index a6e8373a5170..42ef1e33b8a5 100644
> --- a/arch/x86/include/asm/sections.h
> +++ b/arch/x86/include/asm/sections.h
[...]
>  
> +#ifdef CONFIG_HEKI
> +
> +/*
> + * Gather all of the statically defined sections so heki_late_init() can
> + * protect these sections in the host page table.
> + *
> + * The sections are defined under "SECTIONS" in vmlinux.lds.S
> + * Keep this array in sync with SECTIONS.
> + */

This seems a bit fragile, because it requires constant attention from
people who care about this functionality. Can this table be
automatically generated?

Thanks,
Wei.

> +struct heki_va_range __initdata heki_va_ranges[] = {
> +	{
> +		.va_start = _stext,
> +		.va_end = _etext,
> +		.attributes = HEKI_ATTR_MEM_NOWRITE | HEKI_ATTR_MEM_EXEC,
> +	},
> +	{
> +		.va_start = __start_rodata,
> +		.va_end = __end_rodata,
> +		.attributes = HEKI_ATTR_MEM_NOWRITE,
> +	},
> +#ifdef CONFIG_UNWINDER_ORC
> +	{
> +		.va_start = __start_orc_unwind_ip,
> +		.va_end = __stop_orc_unwind_ip,
> +		.attributes = HEKI_ATTR_MEM_NOWRITE,
> +	},
> +	{
> +		.va_start = __start_orc_unwind,
> +		.va_end = __stop_orc_unwind,
> +		.attributes = HEKI_ATTR_MEM_NOWRITE,
> +	},
> +	{
> +		.va_start = orc_lookup,
> +		.va_end = orc_lookup_end,
> +		.attributes = HEKI_ATTR_MEM_NOWRITE,
> +	},
> +#endif /* CONFIG_UNWINDER_ORC */
> +};
> +

