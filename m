Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A8F446743
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 17:46:37 +0100 (CET)
Received: from localhost ([::1]:38236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj2MO-0003WF-O9
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 12:46:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mj2K8-0001m4-Mn
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 12:44:16 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:34763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mj2K7-0004vv-4N
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 12:44:16 -0400
Received: by mail-qt1-x82f.google.com with SMTP id u7so7705149qtc.1
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 09:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OekaPAbIrJHIfllYo87gKBsmN/7YMxMuVjE7h57dUAg=;
 b=BjfO+jkMj1br+o8Zx4YhgsO2ahqRYTdUx1bxSNAqX9ds0NOOWMmUlivm0bbnBOd/3q
 obkA2dm62pRiGvFqMUVHjmCqaKGVaNRKKrRjOLjqjlycBPRCAXOSwyv1IlgAfypyxQsB
 jD/Qr+ahuHkQ4GBI/qIgjxPOORRIRjCXDmV4q8fmVbVJErOwE87YPKxZoYcPGSRt1v7b
 jOXZmnAjaqdaWTom2CWe2g1OCNfqNd+8/T0g/oR4dCOYc4g3qAx81n4FqvWFwrPI/k9z
 Fr2PCS1O25lcXRG3d/H5T1/dUwNkaSDNmiMFKJyfLsK1ziMYvG9Rrwzw5tgvZebNrdwM
 3zag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OekaPAbIrJHIfllYo87gKBsmN/7YMxMuVjE7h57dUAg=;
 b=kJG6MaK/eSqtg4WrChDe2mkgOtw4Sedh5ydg+TdNLKND/Vt/R7ujJfmTHg0ZBgRwBN
 fU9IYHjFVDxao0ajIJ3lsabsNaD+oZ7E3Na7rC7QQ2Lh49+XUozRXYPGp5bJrzkaV2oD
 xWe8nVE6BSVgUAE92q92Dry+bTGWJaY/eT3DnThEz0DW1mwOsxd0WWMeQBWWXdOD8sHG
 M68GcSFjEnk6/thFn+MR1KMeyab+yfbv64u3QdAF/j6ROpXjoL78NfDDNcqew5+HFEbJ
 ufbxUcllXwrUKgi4pCFCvN3TzFcK8e3vzp32vXOYhcQt/B2JxTH9lPK7tz2E0Z6WMGD6
 6dvg==
X-Gm-Message-State: AOAM531zxARLU6vu4pzjRhBe1Ip23EGXJXgCcARWXLu7Ez02FC4WKJeB
 y24FoXRGSlS1r+ZztoIZYjX6Kw==
X-Google-Smtp-Source: ABdhPJwkQZOif4+dkYYUdGnTGq0ukC30+oD9ENebf4QDXtpc3QwT/G1Zj8zdIRcCcLoVRMZaggODRA==
X-Received: by 2002:a05:622a:94:: with SMTP id
 o20mr62896776qtw.169.1636130654001; 
 Fri, 05 Nov 2021 09:44:14 -0700 (PDT)
Received: from [10.200.5.34] ([38.66.81.217])
 by smtp.gmail.com with ESMTPSA id i14sm6346859qti.25.2021.11.05.09.44.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 09:44:13 -0700 (PDT)
Subject: Re: [PATCH v4 33/36] bsd-user/arm/target_arch_signal.c: arm
 set_mcontext
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211105031917.87837-1-imp@bsdimp.com>
 <20211105031917.87837-34-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1fd1396f-56d6-1a60-6786-797623827dd9@linaro.org>
Date: Fri, 5 Nov 2021 12:44:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211105031917.87837-34-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82f.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.093,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/4/21 11:19 PM, Warner Losh wrote:
> +/* Compare to arm/arm/exec_machdep.c set_mcontext() */
> +abi_long set_mcontext(CPUARMState *env, target_mcontext_t *mcp, int srflag)
> +{
> +    int err = 0;
> +    const uint32_t *gr = mcp->__gregs;
> +    uint32_t cpsr, ccpsr = cpsr_read(env);
> +    uint32_t fpscr, mask;
> +
> +    cpsr = tswap32(gr[TARGET_REG_CPSR]);
> +    /*
> +     * Only allow certain bits to change, reject attempted changes to non-user
> +     * bits. In addition, make sure we're headed for user mode and none of the
> +     * interrupt bits are set.
> +     */
> +    if ((ccpsr & ~CPSR_USER) != (cpsr & ~CPSR_USER)) {
> +        return -TARGET_EINVAL;
> +    }
> +    if ((cpsr & CPSR_M) != ARM_CPU_MODE_USR ||
> +        (cpsr & (CPSR_I | CPSR_F)) != 0) {
> +        return -TARGET_EINVAL;
> +    }
> +    mask = cpsr & CPSR_T ? 0x1 : 0x3;

Should add a sentence or so here, pointing to the exception return instruction used by the 
freebsd kernel, which does this masking.

> +    /*
> +     * Make sure T mode matches the PC's notion of thumb mode, although
> +     * FreeBSD lets the processor sort this out, so we may need remove
> +     * this check, or generate a signal...
> +     */
> +    if (!!(tswap32(gr[TARGET_REG_PC]) & 1) != !!(cpsr & CPSR_T)) {
> +        return -TARGET_EINVAL;
> +    }

Remove this.

> +    env->regs[15] = tswap32(gr[TARGET_REG_PC] & mask);

You wanted ~mask.


r~

