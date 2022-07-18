Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC62578B93
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 22:17:32 +0200 (CEST)
Received: from localhost ([::1]:42324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDXBJ-0002iO-SA
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 16:17:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1oDX74-0007zN-3K
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 16:13:09 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:43609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1oDX72-00068V-Ga
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 16:13:05 -0400
Received: by mail-pf1-x432.google.com with SMTP id b9so11631751pfp.10
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 13:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Qgp+RqVlHRhPEtWpeq8/uLOxKAiezTv6+iHdz4FIBqM=;
 b=THbFV8UnE5PiIpp1TzqfRk6mFOc+LVWuXLKleisEgFC8zc5bmt5LlmwFaVMklkc6rN
 b74yztuSy3OfrNMBkGPF2jel301nnoUtZad/QrR/+vmiT7hvZEvqIy6cfeciAl8O2OlT
 AgvZ5g/gG+sLdP7PXPKxT5gq9bMN3qtVVf5vcGYOIc7DY9wKkMK0JyAQu8Vo5nKEdIdy
 rt25UwdQYXCVEKPsFwC7nBSt7cjTzKotc4fnbsvfSPbQiI8aVC72eoMEgKoQZ6cv3SSb
 LOVvUFxWfqF2G0USrb0qcWn6p9uYs+pwqIiMOEA0pVFMzRZiNVpkNYSnrrGguvYq8OC2
 g+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Qgp+RqVlHRhPEtWpeq8/uLOxKAiezTv6+iHdz4FIBqM=;
 b=LdSM4HxN5VRZtrAU+f6tvoew5RH38MUhQaqXxkGr8wwBY4X4LXaJ3BDllYR+a+Vnl3
 2Q1/qqWum+7oA4ejlx7SwWv7AHzcLta5zhRzwYHyopojhO6T0nGFOYWllftnnvBppW/E
 Oop49CLzlRrH9LhoC5sADObuNEZSTNQlwaJVWn4gpqPQ6y/UlZIUzLVR8NZJjIvHZGdx
 nQuPRRzbUkSZAdwkHwyOGzVpz3cpqNSQxQoh4iNwM+J68DbdgBMMliEo5xVWDPbqtrg/
 lhX+FO8Es+dREE0t9FMCEKIgupYIRPlD5FqESr4oHrkDWtZ1kZYVZxdN9cuulQKCJ3FJ
 5tKQ==
X-Gm-Message-State: AJIora/wLOfqz+k1krkCTXeo8gtH+dhZAX7Ob+1p92h0RhMxkBUMdG+X
 B3FeI5tT1xMWGucz6JxL4WxHkQ==
X-Google-Smtp-Source: AGRyM1uPuOnbSssdH/1cs6QY8qsmnS5Cm15K8PpUYGu23rxQPxr/A6Z1WNcwGbe2jw4+1B2lOUyZdA==
X-Received: by 2002:a63:5f4e:0:b0:417:ba9d:c513 with SMTP id
 t75-20020a635f4e000000b00417ba9dc513mr26398097pgb.434.1658175182778; 
 Mon, 18 Jul 2022 13:13:02 -0700 (PDT)
Received: from google.com (123.65.230.35.bc.googleusercontent.com.
 [35.230.65.123]) by smtp.gmail.com with ESMTPSA id
 t3-20020a6549c3000000b00411acdb1625sm8343810pgs.92.2022.07.18.13.13.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 13:13:02 -0700 (PDT)
Date: Mon, 18 Jul 2022 20:12:58 +0000
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Zhenzhong Duan <zhenzhong.duan@intel.com>, qemu-devel@nongnu.org,
 mtosatti@redhat.com, likexu@tencent.com, xiangfeix.ma@intel.com
Subject: Re: [PATCH] i386: Disable BTS and PEBS
Message-ID: <YtW+ymE654W662X4@google.com>
References: <20220718032206.34488-1-zhenzhong.duan@intel.com>
 <a7bccbc5-fcb7-eaa8-ce95-fa7f380b8af9@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7bccbc5-fcb7-eaa8-ce95-fa7f380b8af9@redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=seanjc@google.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

On Mon, Jul 18, 2022, Paolo Bonzini wrote:
> This needs to be fixed in the kernel because old QEMU/new KVM is supported.

I can't object to adding a quirk for this since KVM is breaking userspace, but on
the KVM side we really need to stop "sanitizing" userspace inputs unless it puts
the host at risk, because inevitably it leads to needing a quirk.

> But apart from that, where does Linux check MSR_IA32_MISC_ENABLE_BTS_UNAVAIL
> and MSR_IA32_MISC_ENABLE_PEBS_UNAVAIL?

The kernel uses synthetic feature flags that are set by:

  static void init_intel(struct cpuinfo_x86 *c)

	if (boot_cpu_has(X86_FEATURE_DS)) {
		unsigned int l1, l2;

		rdmsr(MSR_IA32_MISC_ENABLE, l1, l2);
		if (!(l1 & (1<<11)))
			set_cpu_cap(c, X86_FEATURE_BTS);
		if (!(l1 & (1<<12)))
			set_cpu_cap(c, X86_FEATURE_PEBS);
	}

and consumed by:

  void __init intel_ds_init(void)

	/*
	 * No support for 32bit formats
	 */
	if (!boot_cpu_has(X86_FEATURE_DTES64))
		return;

	x86_pmu.bts  = boot_cpu_has(X86_FEATURE_BTS);
	x86_pmu.pebs = boot_cpu_has(X86_FEATURE_PEBS);
	x86_pmu.pebs_buffer_size = PEBS_BUFFER_SIZE;

