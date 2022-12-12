Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1489A649FDB
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 14:16:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4idi-0004ka-68; Mon, 12 Dec 2022 08:14:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p4idB-0004dD-NG
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:14:10 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p4id7-0004zx-TJ
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:14:05 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 ay14-20020a05600c1e0e00b003cf6ab34b61so5092033wmb.2
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 05:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=mJzGzq0Y0P2zwuiOKR3kXZAzUEFxxQdYmSrYWkHoLf0=;
 b=d/fXXpLewbsOYliDvGAOn77LsXMsAJwrwNy59OiYvd1xADq2QBKlrGoQZJKbkQFKw+
 SMwVi/twEvDUAaiTeWpePazS/qqN9whl6Pz3xgg2LF7QNBOwCl/8yI6SB7QGiE5B3pwy
 5JhZgsNOCnj1ymItr740aHaadVLKLZSnfPvRVBsh/nkORhxR7p3v2cWxgiTq7lKlqtws
 CNVq/zwaLAl2KsGw7sD4b06IIuieapF8NSyLMFRaXX7W9tlcpoKTKl/hc40veLOZ1fOa
 bnIQvCIUaxtATYFyefi2qwlEyvLVUwS6XH2Oaqp6uaXQh5JhjUYOoVrCN4YSzM/FTHxJ
 j/UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mJzGzq0Y0P2zwuiOKR3kXZAzUEFxxQdYmSrYWkHoLf0=;
 b=lFRdx3MwBz5PZK08m4r8LLZfCTlc5x+HRemJhPUUDsiMU4HvYkVrcRSHOdeh3qF3YW
 jlJxTWSBuy0620reRJTzXJhe20/1jiB3E4By4CIGVnEuBea0XNRQu67yjFjolLUNAeAA
 N4rw9fopSFIy3dJfO6tdajgvUYe2HdnDR9CAynTR/I/tBzZhthqlS8Gsivf6Qds0ANhN
 h23Ua/50xnbaxp0f31bJcIsrqDVaRiK9ily3rHmqG1g/yYkyNpZ+3XQkrFNayHCxV6bQ
 oVkRGlnTwvgquAtuN32E/jhhoGl/SHXfBJenhBGBOnTq9/pHLtCdp5GAzuQjd7DDg1zQ
 ah/g==
X-Gm-Message-State: ANoB5pl/lVa9iCbVtbtj6MYiRFXYNUieC2xZ/0lBXpZcisybFyT8t8YP
 /I9N6k3q4YkM4Lvd6XNjnAc=
X-Google-Smtp-Source: AA0mqf5ooTkxKbVRktqfLn5MwgKfRFcW2lcaYKxN07SoB1CGuwMQyhV5KJy3WYrSbHessQIgjDNYWQ==
X-Received: by 2002:a05:600c:1c93:b0:3d0:7026:f0ad with SMTP id
 k19-20020a05600c1c9300b003d07026f0admr12289348wms.38.1670850836936; 
 Mon, 12 Dec 2022 05:13:56 -0800 (PST)
Received: from ?IPV6:2a00:23c5:5785:9a01:a16d:8ab1:4623:169?
 ([2a00:23c5:5785:9a01:a16d:8ab1:4623:169])
 by smtp.gmail.com with ESMTPSA id
 n22-20020a05600c3b9600b003cfd0bd8c0asm10000106wms.30.2022.12.12.05.13.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 05:13:56 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <52d82630-f1e6-1381-6f34-7d912171b4eb@xen.org>
Date: Mon, 12 Dec 2022 13:13:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH v2 04/22] i386/kvm: handle Xen HVM cpuid leaves
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
 <20221209095612.689243-5-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20221209095612.689243-5-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32a.google.com
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

On 09/12/2022 09:55, David Woodhouse wrote:
> From: Joao Martins <joao.m.martins@oracle.com>
> 
> Introduce support for emulating CPUID for Xen HVM guests. It doesn't make
> sense to advertise the KVM leaves to a Xen guest, so do it unconditionally
> when the xen-version machine property is set.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> [dwmw2: Obtain xen_version from machine property, make it automatic]
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
[snip]
> -    if (cpu->expose_kvm) {
> +    xen_version = kvm_arch_xen_version(MACHINE(qdev_get_machine()));
> +    if (xen_version) {
> +#ifdef CONFIG_XEN_EMU
> +        struct kvm_cpuid_entry2 *xen_max_leaf;
> +
> +        memcpy(signature, "XenVMMXenVMM", 12);
> +
> +        xen_max_leaf = c = &cpuid_data.entries[cpuid_i++];
> +        c->function = kvm_base + XEN_CPUID_SIGNATURE;
> +        c->eax = kvm_base + XEN_CPUID_TIME;
> +        c->ebx = signature[0];
> +        c->ecx = signature[1];
> +        c->edx = signature[2];
> +
> +        c = &cpuid_data.entries[cpuid_i++];
> +        c->function = kvm_base + XEN_CPUID_VENDOR;
> +        c->eax = xen_version;
> +        c->ebx = 0;
> +        c->ecx = 0;
> +        c->edx = 0;
> +
> +        c = &cpuid_data.entries[cpuid_i++];
> +        c->function = kvm_base + XEN_CPUID_HVM_MSR;
> +        /* Number of hypercall-transfer pages */
> +        c->eax = 1;
> +        /* Hypercall MSR base address */
> +        c->ebx = XEN_HYPERCALL_MSR;
> +        c->ecx = 0;
> +        c->edx = 0;
> +
> +        c = &cpuid_data.entries[cpuid_i++];
> +        c->function = kvm_base + XEN_CPUID_TIME;
> +        c->eax = ((!!tsc_is_stable_and_known(env) << 1) |
> +            (!!(env->features[FEAT_8000_0001_EDX] & CPUID_EXT2_RDTSCP) << 2));
> +        /* default=0 (emulate if necessary) */
> +        c->ebx = 0;
> +        /* guest tsc frequency */
> +        c->ecx = env->user_tsc_khz;
> +        /* guest tsc incarnation (migration count) */
> +        c->edx = 0;
> +
> +        c = &cpuid_data.entries[cpuid_i++];
> +        c->function = kvm_base + XEN_CPUID_HVM;
> +        xen_max_leaf->eax = kvm_base + XEN_CPUID_HVM;
> +        if (xen_version >= XEN_VERSION(4,5)) {
> +            c->function = kvm_base + XEN_CPUID_HVM;
> +
> +            if (cpu->xen_vapic) {
> +                c->eax |= XEN_HVM_CPUID_APIC_ACCESS_VIRT;
> +                c->eax |= XEN_HVM_CPUID_X2APIC_VIRT;
> +            }
> +
> +            c->eax |= XEN_HVM_CPUID_IOMMU_MAPPINGS;
> +
> +            if (xen_version >= XEN_VERSION(4,6)) {
> +                c->eax |= XEN_HVM_CPUID_VCPU_ID_PRESENT;
> +                c->ebx = cs->cpu_index;
> +            }
> +        }
> +
> +        kvm_base += 0x100;

Ok, this tells me that we are intending to handle Hyper-V enlightenments 
being simultaneously enabled... in which case that MSR above needs to 
move, along with the cpuid leaves. It should be 0x40000200 in this case.

   Paul



