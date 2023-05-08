Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4F76FB944
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 23:19:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw8Fg-0004Y9-D6; Mon, 08 May 2023 17:18:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.liu.linux@gmail.com>)
 id 1pw8Ff-0004Y1-0u
 for qemu-devel@nongnu.org; Mon, 08 May 2023 17:18:35 -0400
Received: from mail-pg1-f176.google.com ([209.85.215.176])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wei.liu.linux@gmail.com>)
 id 1pw8Fd-0006cN-G9
 for qemu-devel@nongnu.org; Mon, 08 May 2023 17:18:34 -0400
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-52c30fbccd4so4605534a12.0
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 14:18:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683580712; x=1686172712;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z9LwMl3SaVI5b8sezFDQVcUBEvYrPsuHk5i8fgGhI70=;
 b=c85HjcBuWUMQ0cTsaiwVtDnU2xfpovBKh3cZJaXI4vNXI17IV+uWTEkUF461rQHkcH
 e/ugHEmObP9DV6RtG6VcdPwKHGMqhGhiwb6DatMOR/DCWTlv8/yl88umG53C2hYCbuhv
 wEAIXqbk/air+J60P1Al0wPTYvAIyzZUZItxvXPCR8QHzp/mlE4MV8KPjM5LvSP/t733
 Eik/pUq3KWemjNb6Xy4BwTVj/PM5mksgXnVVJMWmqLC0NLtOIeyC9IX573vt2jeUlBVf
 ZhzzTd85ZW272gr4TOFTuBZYILXptOhFGRgDcKq9vMecYHZ6iTSehm1Mh57AwuHakAKM
 0xcw==
X-Gm-Message-State: AC+VfDzgqRAfBcLH4idQB2zp+Of1LGYUL2bdqFHfk12LSZ1Skk0frrfr
 kCSgXJCVEHCUtlWgr9Cq/yI=
X-Google-Smtp-Source: ACHHUZ6kteuJnNZnZsRe+bisWrFQUndJSqajeCoEM2/rFLcMVskwkNxu1jPZifG3ayQwvJCBSdGnnA==
X-Received: by 2002:a05:6a20:1591:b0:f0:ec64:f3de with SMTP id
 h17-20020a056a20159100b000f0ec64f3demr15058351pzj.25.1683580711711; 
 Mon, 08 May 2023 14:18:31 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([20.69.120.36])
 by smtp.gmail.com with ESMTPSA id
 c35-20020a631c23000000b00513ec871c01sm6699252pgc.16.2023.05.08.14.18.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 May 2023 14:18:31 -0700 (PDT)
Date: Mon, 8 May 2023 21:18:29 +0000
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
Subject: Re: [PATCH v1 6/9] KVM: x86: Add Heki hypervisor support
Message-ID: <ZFlnJRsJh2fX3IJb@liuwe-devbox-debian-v2>
References: <20230505152046.6575-1-mic@digikod.net>
 <20230505152046.6575-7-mic@digikod.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230505152046.6575-7-mic@digikod.net>
Received-SPF: pass client-ip=209.85.215.176;
 envelope-from=wei.liu.linux@gmail.com; helo=mail-pg1-f176.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, May 05, 2023 at 05:20:43PM +0200, Mickaël Salaün wrote:
> From: Madhavan T. Venkataraman <madvenka@linux.microsoft.com>
> 
> Each supported hypervisor in x86 implements a struct x86_hyper_init to
> define the init functions for the hypervisor.  Define a new init_heki()
> entry point in struct x86_hyper_init.  Hypervisors that support Heki
> must define this init_heki() function.  Call init_heki() of the chosen
> hypervisor in init_hypervisor_platform().
> 
> Create a heki_hypervisor structure that each hypervisor can fill
> with its data and functions. This will allow the Heki feature to work
> in a hypervisor agnostic way.
> 
> Declare and initialize a "heki_hypervisor" structure for KVM so KVM can
> support Heki.  Define the init_heki() function for KVM.  In init_heki(),
> set the hypervisor field in the generic "heki" structure to the KVM
> "heki_hypervisor".  After this point, generic Heki code can access the
> KVM Heki data and functions.
> 
[...]
> +static void kvm_init_heki(void)
> +{
> +	long err;
> +
> +	if (!kvm_para_available())
> +		/* Cannot make KVM hypercalls. */
> +		return;
> +
> +	err = kvm_hypercall3(KVM_HC_LOCK_MEM_PAGE_RANGES, -1, -1, -1);

Why not do a proper version check or capability check here? If the ABI
or supported features ever change then we have something to rely on?

Thanks,
Wei.

