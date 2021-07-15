Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E323CAE28
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 22:54:06 +0200 (CEST)
Received: from localhost ([::1]:53962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m48Mw-0008Mn-1T
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 16:54:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m48Lb-0007X1-AE
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 16:52:43 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:34556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m48LZ-0005Yz-N7
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 16:52:42 -0400
Received: by mail-ed1-x52f.google.com with SMTP id ec55so10075520edb.1
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 13:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S+jMjj9qv4VxWA396ta3IcoAYh5PnskFQSMxJ3fw0f4=;
 b=TUWNYihnlIls0fFeL6dexTbqE4JqQAuzkRSbc2DUH8pqugJDTZ7XWQaBQ8z/d6hVcl
 bT5YkRF3RSp7/Z3QN9cVi9iPsyJsfBIkTPhBGgSwBfJ8R/28lECzapf8lPJ8/KOmWkjW
 Wg3lKDN0jzxbfzpN8SYDyh6Bk2N3P9MROrCFpWsl7WWZfBLhvdqtl2ZIVPvjYPUlsGxQ
 E0KPjm93ZCw7CtW7AeuG9Z4drtKcFsakb6/P26obWfbyP2jMCmOgo9uPOFu00a6/6vbP
 2/uaWh1Q2dU+l+p/+8LBn2vyK+NIEEHFFjWqi4qCKxb6tbVp/OtP2XIHTg71MauHhoXF
 7etQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S+jMjj9qv4VxWA396ta3IcoAYh5PnskFQSMxJ3fw0f4=;
 b=ic9RdPHQPETKiCvwWIBLYUzUziyIRYfZhF3we2Mvkx80uoDOk/n+0FCPsnkTs+u71i
 d2+ADKsFBh5W7wIbF9rZqcSeEuPEdwe4pyZfD4tH60IE9B0l+3W75s3kxuP3UhQsm8kd
 /DMLrJ1e4Af3JCGgZ8TYQ6gHhMjn/hXVYoEdpEx968QzsozetzE1BpERM8xgeqXtcDOj
 5NeJO8EsRd3XefdTauM0rfPV7n/HWemsVnPq7YTNivwg/XxRjQZIC7Zo9oF0nHu9hXWt
 EJQaGwJHWkryKFJr/eXGUZpTM8Mt0kyLG2o1ID16p2LbWjF2mg8me1u0x9Q7keOr+tfm
 C6Aw==
X-Gm-Message-State: AOAM532PbdIAAKAqg9VSxX0A8H+0eLpvdfMRj3ECYbD1HY3x64wsHikU
 g3lZUdZbDc8Tl1qr0NI2OdFS7r7IjD2/Tm2oG0wqQA==
X-Google-Smtp-Source: ABdhPJz2mtagHGX9lBAGtkbV3Y0KFvZcpSxy4NdJHVRU3VXpQYGXw5/iqaS8N4T2qcNvFLRZd8kUuC6QII8/JY0yQuw=
X-Received: by 2002:aa7:d809:: with SMTP id v9mr9808210edq.146.1626382358395; 
 Thu, 15 Jul 2021 13:52:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210713160957.3269017-1-ehabkost@redhat.com>
 <20210713160957.3269017-5-ehabkost@redhat.com>
In-Reply-To: <20210713160957.3269017-5-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Jul 2021 21:51:58 +0100
Message-ID: <CAFEAcA-nif_Z0guHx4q4NUg=FEyhUz8kkAvfZ58916yp6TXT7Q@mail.gmail.com>
Subject: Re: [PULL 04/11] i386: expand Hyper-V features during CPU feature
 expansion time
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kvm-devel <kvm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 13 Jul 2021 at 17:19, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> From: Vitaly Kuznetsov <vkuznets@redhat.com>
>
> To make Hyper-V features appear in e.g. QMP query-cpu-model-expansion we
> need to expand and set the corresponding CPUID leaves early. Modify
> x86_cpu_get_supported_feature_word() to call newly intoduced Hyper-V
> specific kvm_hv_get_supported_cpuid() instead of
> kvm_arch_get_supported_cpuid(). We can't use kvm_arch_get_supported_cpuid()
> as Hyper-V specific CPUID leaves intersect with KVM's.
>
> Note, early expansion will only happen when KVM supports system wide
> KVM_GET_SUPPORTED_HV_CPUID ioctl (KVM_CAP_SYS_HYPERV_CPUID).
>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> Message-Id: <20210608120817.1325125-6-vkuznets@redhat.com>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Hi; Coverity reports an issue in this code (CID 1458243):

> -static bool hyperv_expand_features(CPUState *cs, Error **errp)
> +bool kvm_hyperv_expand_features(X86CPU *cpu, Error **errp)
>  {
> -    X86CPU *cpu = X86_CPU(cs);
> +    CPUState *cs = CPU(cpu);
>
>      if (!hyperv_enabled(cpu))
>          return true;
>
> +    /*
> +     * When kvm_hyperv_expand_features is called at CPU feature expansion
> +     * time per-CPU kvm_state is not available yet so we can only proceed
> +     * when KVM_CAP_SYS_HYPERV_CPUID is supported.
> +     */
> +    if (!cs->kvm_state &&
> +        !kvm_check_extension(kvm_state, KVM_CAP_SYS_HYPERV_CPUID))
> +        return true;

Here we check whether cs->kvm_state is NULL, but even if it is
NULL we can still continue execution further through the function.

Later in the function we call hv_cpuid_get_host(), which in turn
can call get_supported_hv_cpuid_legacy(), which can dereference
cs->kvm_state without checking it.

So either the check on cs->kvm_state above is unnecessary, or we
need to handle it being NULL in some way other than falling through.

Side note: this change isn't in line with our coding style, which
requires braces around the body of the if().

thanks
-- PMM

