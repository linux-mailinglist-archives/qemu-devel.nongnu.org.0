Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F44E492767
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 14:45:18 +0100 (CET)
Received: from localhost ([::1]:33904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9onV-0003Ly-Ho
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 08:45:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n9nyx-0002Be-VR
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 07:53:05 -0500
Received: from [2a00:1450:4864:20::32a] (port=35698
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n9nyw-00062p-6Z
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 07:53:03 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 q9-20020a7bce89000000b00349e697f2fbso5637918wmj.0
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 04:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Tq5QBbvJL3nvpJ14vbT7ux1TBu4szrjWqZOXeHamumo=;
 b=Mg9FJwBcSTwRmcnQf2w3yM+ZmUPxdeaAXQykSD8bgxW+RK5GMb43N2EW7CLCBFuIcQ
 5HX0nSHuWxYbCkH6HL+zFL7fGdc5o6hIC1r+J/JrgZjccC7aMGMUg9s/8VgAgceufryU
 5QnFsUK/I3hltKER9UiitQCSLSmRwmP4Vo03wmRxt/Y8XvBkYZ20v60M4r0Dct75B8Tj
 3w5up5ll+7k0gHH2K0c5RE4uWxdGtZDYDrkJnI8J9MJDEnvPdn8o4wJV9N1S7xzqcs7u
 nTwttGg2LZRlVRTSjY5PxhmweMbkMD1bB9Ha+fxYKESqcprc9d40kbncfimN6LllGPdk
 PNPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Tq5QBbvJL3nvpJ14vbT7ux1TBu4szrjWqZOXeHamumo=;
 b=QpYbTQEq9NHwBadXw4P6L1pWjKIgghMl2qJCpt2B9ZFrPeViilxYEQONN+xUnuPu8y
 RTA/iAJ7afw/NGbOdMvRCLiJB6/eHwd1g+wh7YsfP/INRAKLVqj3Y5azFVBpFBkH318O
 LqpZhcjNXLa5cn3TQM1LDrmFgpvTsZbymUPTe7x9Xcz8bkcqlZTo3vCHpI1rmFqhHdWr
 H0/6qHCl7b6hZofGHhL5OCcpTVpdgoi9VTo6r8TIbWcXseNsr9jMA/Ua8x4rFCe+bxfn
 aqNupc9lj2Ijo8C5psvrDYDgLBi8tElNzP7Z1K8VEwh7LCUzQgGGzUKWQrOzFTvMAkEf
 UcUg==
X-Gm-Message-State: AOAM531pgg7xeyCh5QWLSyt3Nk8TFpXB0H4qKNaVWknIG/LQG969G8Rx
 Wnu6E/R0pL+U9hLSL/OpScc=
X-Google-Smtp-Source: ABdhPJwzu3egeD0HZPQFoi1HKste37AJNauhdOZFB8JIFWQnVCSF2JYHP8pw/joKyqcDvxRZ1wQZLg==
X-Received: by 2002:a5d:4089:: with SMTP id o9mr2344721wrp.299.1642510380539; 
 Tue, 18 Jan 2022 04:53:00 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id z5sm3005850wmp.10.2022.01.18.04.52.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 04:53:00 -0800 (PST)
Message-ID: <29573e51-aa21-dbf3-b626-facf72e5b9c6@redhat.com>
Date: Tue, 18 Jan 2022 13:52:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH 3/7] x86: Grant AMX permission for guest
Content-Language: en-US
To: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
References: <20220107093134.136441-1-yang.zhong@intel.com>
 <20220107093134.136441-4-yang.zhong@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220107093134.136441-4-yang.zhong@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: seanjc@google.com, kevin.tian@intel.com, jing2.liu@linux.intel.com,
 wei.w.wang@intel.com, guang.zeng@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/7/22 10:31, Yang Zhong wrote:
> +static void x86_xsave_req_perm(void)
> +{
> +    unsigned long bitmask;
> +
> +    long rc = syscall(SYS_arch_prctl, ARCH_REQ_XCOMP_GUEST_PERM,
> +                      XSTATE_XTILE_DATA_BIT);
> +    if (rc) {
> +        /*
> +         * The older kernel version(<5.15) can't support
> +         * ARCH_REQ_XCOMP_GUEST_PERM and directly return.
> +         */
> +        return;
> +    }
> +
> +    rc = syscall(SYS_arch_prctl, ARCH_GET_XCOMP_GUEST_PERM, &bitmask);
> +    if (rc) {
> +        error_report("prctl(ARCH_GET_XCOMP_GUEST_PERM) error: %ld", rc);
> +    } else if (!(bitmask & XFEATURE_XTILE_MASK)) {
> +        error_report("prctl(ARCH_REQ_XCOMP_GUEST_PERM) failure "
> +                     "and bitmask=0x%lx", bitmask);
> +        exit(EXIT_FAILURE);
> +    }
> +}
> +
>   void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
>   {
>       int i;
> @@ -124,6 +150,8 @@ void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
>       MachineState *ms = MACHINE(x86ms);
>       MachineClass *mc = MACHINE_GET_CLASS(x86ms);
>   
> +    /* Request AMX pemission for guest */
> +    x86_xsave_req_perm();
>       x86_cpu_set_default_version(default_cpu_version);
>   

This should be done before creating a CPU with support for state 
component 18.  It happens in kvm_init_vcpu, with the following call stack:

	kvm_init_vcpu
	kvm_vcpu_thread_fn
	kvm_start_vcpu_thread
	qemu_init_vcpu
	x86_cpu_realizefn

The issue however is that this has to be done before 
KVM_GET_SUPPORTED_CPUID and KVM_CHECK_EXTENSION(KVM_CAP_XSAVE2).

For the former, you can assume that anything returned by 
ARCH_GET_XCOMP_GUEST_PERM will be returned by KVM_GET_SUPPORTED_CPUID in 
CPUID[0xD].EDX:EAX, so you can:

- add it to kvm_arch_get_supported_cpuid

