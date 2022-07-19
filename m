Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E44F257A692
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 20:35:30 +0200 (CEST)
Received: from localhost ([::1]:36942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDs48-0005tG-SD
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 14:35:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oDro4-0005cH-LE
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:18:52 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:45924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oDro3-0003Mk-0x
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:18:52 -0400
Received: by mail-ej1-x631.google.com with SMTP id fy29so27611155ejc.12
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 11:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=o8UXEF5028EH4VTVG0uFro08B1gxx4xKQVgJSZy3qyI=;
 b=ktq+n9PkKkcnlHk242C3xBSePxtcUet5vkjHU76h1vWNShWm3Lf7t0V+EgrwYAO/RN
 ZGV6RqebSV//WsdVYrUEVwb5vrk9GBryXTfngOrd/S/Oc4w2kkHU2shGCUAUhekNnD8n
 4eH+LiRPH2ItgSSLfjGwCpeUB1aMk8/o/kwjZiDIjNy3vas6RWQhib5wIq7ywi7IzzvF
 EEueQaVOtMFVtr4/eZaQXP+fNOquhkmKO7YROpPm9gziE4/LryNFV00EJfQ0xddhVHec
 vrf0uuRHxoE3t7HMDWfNnBsqGayMtvDXlYDJQ1G3CIYTq1epa+ijC0GPIQ7cZH1kjv91
 6YHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=o8UXEF5028EH4VTVG0uFro08B1gxx4xKQVgJSZy3qyI=;
 b=f+FUF7ukD29BMETFFaXSCYmZcZrcaB+Pop0mt8/nt1qeNAo1hqCplJR6GXLE26l61g
 OGH1ofXNTrMJCEZ+NpnCJSQX8tliLqp+Z85zGBjURq3FMtSN8FuFLL3UUS3YZ66JVbJi
 Km5jTXmxnDWcKPT+e4YKpP1MHWSQ9fUu0zp2QuofIh5FwqgjbIqPFXHThXi3dlWLgw0b
 ogzr2Kk0AAr8Nb0oZ6oaWp+xDbsCaQNg8CCI2O93yr++W71qyXm2XjaLfh5ZWqx7LVKK
 mkJiWpPZveAhLSFNZ43El54epWD6zcI2oBb0BShKTfZ0CC8GjDIzbFqCnn60cfxBEKfv
 x60g==
X-Gm-Message-State: AJIora/KuCGc4Waha1kr6J/4lvc2df3aJXTp/OOe2BoH/iOBUhxOVcQe
 Ezc88L9WH6MBZ/QdvRr/CCk=
X-Google-Smtp-Source: AGRyM1snV6M6l/JMwaQahc9QvqEUHWMSbixJTD+DjpcZJ52hKSXjB08QaSZz86J8Iz8+7gB1vsqq6Q==
X-Received: by 2002:a17:906:730b:b0:72b:2f3d:299a with SMTP id
 di11-20020a170906730b00b0072b2f3d299amr31328311ejc.583.1658254729174; 
 Tue, 19 Jul 2022 11:18:49 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 h9-20020aa7c609000000b0043ab1ad0b6bsm10895734edq.37.2022.07.19.11.18.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 11:18:48 -0700 (PDT)
Message-ID: <9dbe748c-57b4-eab5-3933-0e9891b031c1@redhat.com>
Date: Tue, 19 Jul 2022 20:18:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] i386: Disable BTS and PEBS
Content-Language: en-US
To: Sean Christopherson <seanjc@google.com>
Cc: Zhenzhong Duan <zhenzhong.duan@intel.com>, qemu-devel@nongnu.org,
 mtosatti@redhat.com, likexu@tencent.com, xiangfeix.ma@intel.com
References: <20220718032206.34488-1-zhenzhong.duan@intel.com>
 <a7bccbc5-fcb7-eaa8-ce95-fa7f380b8af9@redhat.com>
 <YtW+ymE654W662X4@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YtW+ymE654W662X4@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x631.google.com
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

On 7/18/22 22:12, Sean Christopherson wrote:
> On Mon, Jul 18, 2022, Paolo Bonzini wrote:
>> This needs to be fixed in the kernel because old QEMU/new KVM is supported.
> 
> I can't object to adding a quirk for this since KVM is breaking userspace, but on
> the KVM side we really need to stop "sanitizing" userspace inputs unless it puts
> the host at risk, because inevitably it leads to needing a quirk.

The problem is not the sanitizing, it's that userspace literally cannot 
know that this needs to be done because the feature bits are "backwards" 
(1 = unavailable).

The right way to fix it is probably to use feature MSRs and, by default, 
leave the features marked as unavailable.  I'll think it through and 
post a patch tomorrow for both KVM and QEMU (to enable PEBS).

>> But apart from that, where does Linux check MSR_IA32_MISC_ENABLE_BTS_UNAVAIL
>> and MSR_IA32_MISC_ENABLE_PEBS_UNAVAIL?
> 
> The kernel uses synthetic feature flags that are set by:
> 
>    static void init_intel(struct cpuinfo_x86 *c)
> 
> 	if (boot_cpu_has(X86_FEATURE_DS)) {
> 		unsigned int l1, l2;
> 
> 		rdmsr(MSR_IA32_MISC_ENABLE, l1, l2);
> 		if (!(l1 & (1<<11)))
> 			set_cpu_cap(c, X86_FEATURE_BTS);
> 		if (!(l1 & (1<<12)))
> 			set_cpu_cap(c, X86_FEATURE_PEBS);
> 	}

Gah, shift constants are evil.   I sent 
https://lore.kernel.org/all/20220719174714.2410374-1-pbonzini@redhat.com/ to 
clean this up.

Paolo

> and consumed by:
> 
>    void __init intel_ds_init(void)
> 
> 	/*
> 	 * No support for 32bit formats
> 	 */
> 	if (!boot_cpu_has(X86_FEATURE_DTES64))
> 		return;
> 
> 	x86_pmu.bts  = boot_cpu_has(X86_FEATURE_BTS);
> 	x86_pmu.pebs = boot_cpu_has(X86_FEATURE_PEBS);
> 	x86_pmu.pebs_buffer_size = PEBS_BUFFER_SIZE;
> 


