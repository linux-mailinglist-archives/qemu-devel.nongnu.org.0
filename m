Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3E9300206
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 12:54:47 +0100 (CET)
Received: from localhost ([::1]:60796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2v1a-0001RS-MG
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 06:54:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2v0H-0000Zx-3x
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 06:53:25 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:42527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2v0F-0003gC-Cx
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 06:53:24 -0500
Received: by mail-ej1-x62a.google.com with SMTP id r12so7234079ejb.9
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 03:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S/niuOmXyqXBJZ6gv5bg6OJguEBxsoTsFEx93XPe4cU=;
 b=FuA93NIt3+g1bPxHi0uu4mi5HiFXM3ff9lfAGMTU+Q0jvUCQ6iwn0rY1PTjutH7kil
 tt83YYGdOA8tjS3AFeLWrzW3rPQhuRLuq76Av7gI9x2yxLul2MrhInTfkY0TUHSJSFir
 6vDeMIRNySsI1SFEGXS4oq5thKkgredcSnLF9orfUghc63Pe/jyXf1Z3GJ5JZiqLCdyv
 qLADIpZuYS4hOEYgJf+9tuM3rZ0hRyj+uRdXW7xFNOA9vu95CSxltoFTEC48hWSN4icT
 fXqJb9L2N8gR5HhI1XeX4+OUO+228UBpqC4zQsaenoiD4aJiOjBbfJydmiCdKJLsb6Bd
 9+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S/niuOmXyqXBJZ6gv5bg6OJguEBxsoTsFEx93XPe4cU=;
 b=Mxbn4Z4dCGSohw+cwQb5oBgsv1ZPOFYoOCyKtdCG4vsMK3e/xtWKPF8NL6nHQEXEmX
 mLeymusRSBSkbY5VZGeS0EEhqZFUY7pc3xu3UUUQcfLtHxDmK1uGaytvoJ9Wk9jg5KFK
 ksdv2dmVFSe6zd+AQmxnMQBohVJph51V0CfJsntFP+uPn/l1H94oIk/x+VwMAPnA/x2M
 cjkkHE6kZ/0d/Ycv2prceJwQRUh2ixhH4+c+k6eBbOY7xDHofk1qYtiwDaJC3wvTUeH0
 V2hsUaFBkVLzbUoitnUgjsIWpf5kmBIwXyfmVa0O1i4yAc2n5Y7txq/54C2+WKrBu293
 +c5Q==
X-Gm-Message-State: AOAM530DtmNQvR8jemyykiI0A6jpSlbvKao+10+K3S0Iotp7SRT+Hvoa
 cN2meKI9TeCUNuU9HdKbCikQnqdaie84NXt+nIBgVA==
X-Google-Smtp-Source: ABdhPJx4JgjnRiBfFU8Dj0X1WuoxcLd73EBIXHhB8ZFqZ5+pLCSxqjrRIVSes4VuCgjUfsrsfEztKgk46zvr00BwJ7o=
X-Received: by 2002:a17:907:1b10:: with SMTP id
 mp16mr2764347ejc.482.1611316402084; 
 Fri, 22 Jan 2021 03:53:22 -0800 (PST)
MIME-Version: 1.0
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
 <20210115224645.1196742-13-richard.henderson@linaro.org>
In-Reply-To: <20210115224645.1196742-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Jan 2021 11:53:11 +0000
Message-ID: <CAFEAcA-hyjfb399qWC4ORNtoLxNs71G=paurrVX4g+aRO2=26w@mail.gmail.com>
Subject: Re: [PATCH v3 12/21] linux-user/aarch64: Implement
 PR_TAGGED_ADDR_ENABLE
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Jan 2021 at 22:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is the prctl bit that controls whether syscalls accept tagged
> addresses.  See Documentation/arm64/tagged-address-abi.rst in the
> linux kernel.

> +#ifdef TARGET_TAGGED_ADDRESSES
> +/**
> + * cpu_untagged_addr:
> + * @cs: CPU context
> + * @x: tagged address
> + *
> + * Remove any address tag from @x.  This is explicitly related to the
> + * linux syscall TIF_TAGGED_ADDR setting, not TBI in general.
> + *
> + * There should be a better place to put this, but we need this in
> + * include/exec/cpu_ldst.h, and not some place linux-user specific.
> + */
> +static inline target_ulong cpu_untagged_addr(CPUState *cs, target_ulong x)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    return x & cpu->env.untagged_addr_mask;
> +}
> +#endif

Forgot to mention: this only does the right thing on addresses
in the lower half of the address space. I guess that's mostly
OK for our purposes? It probably means that if a guest program
deliberately dereferences a bad address in the top half of the
address space we'll report the wrong (ie different to what a real
kernel reports) address value to it in the SEGV signal handler.

The kernel's "untagged_addr()" implementation:
https://elixir.bootlin.com/linux/latest/source/arch/arm64/include/asm/memory.h#L203
slightly confusingly does "untag the addr if it's in the userspace
half, leave the tag bits alone if in the kernel half".

thanks
-- PMM

