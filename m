Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CA537F6D1
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 13:33:06 +0200 (CEST)
Received: from localhost ([::1]:43054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh9aS-0005z3-NR
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 07:33:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lh9Yz-0004qY-4Z
 for qemu-devel@nongnu.org; Thu, 13 May 2021 07:31:33 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:34444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lh9Yx-0005OQ-3E
 for qemu-devel@nongnu.org; Thu, 13 May 2021 07:31:32 -0400
Received: by mail-qt1-x82d.google.com with SMTP id v4so10644530qtp.1
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 04:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Dp7OcvOFLsKnd+EEK4fUzI7KzGEANzyp2MptRTlq9O8=;
 b=CRPiAgA6M/RYxodQQ3dkHCPy8OqBTaRAwOcAg3ihcmlTuFYv84J73H6DQM8AOTP5E1
 tXq7reRN9esYCZ+UYZgr6xKYAycqwpDsi3Ia3OZvpF9qWA4RKGIDlwvRo/iZCZA4Egs4
 A9a9mVcQbEv44cGQXwXwZpx12tjixE471aFwASN+oJtbpgChnCgBDCmQscoAAfPbaD93
 ifD3Qy3Z7o+ckLHYM488LiF7UwE7RSx8umywk+DbZRee1eZeJ7o6Frd5E+ne+G/mJufT
 PTRSYN8NPL0SkItnJBFz/InimDK6oyEwvr3pKBk7bbE64J3UseiCLCjs4wjYAD+UfM1e
 NXcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Dp7OcvOFLsKnd+EEK4fUzI7KzGEANzyp2MptRTlq9O8=;
 b=bZJmkvetIii29hS5bnGqq4eUVWkpFz+/yQaAano1rkx7s0MiaqihEvE2Mqci3pmKxi
 PdQwUoUa3ZeijsoPaYteo1AkH5oGUU2sf4rmZdIcRY2lQrbtpHC2wtmJO0zqBAChgoHS
 hbdPe8HgX5t8Vn4y23GxaiZLNKsrfkh4SWzdMNdObvT3eMn/7gBfiMgvJZj9T8q6e/U1
 iHP27F83VL5d1kuBFjs4crJpzU7OcVvq0wd+ofwZaqoYrP7l2fDJ+58VyBh+oiCkht4K
 GaRo9nV8nM6ey3SG38U6/M0l70GF+ZmcQ0ey9+8sfAa6uRtlwANObwusIAhuhSz8M8bG
 ktkQ==
X-Gm-Message-State: AOAM532fuHtwLFHbVZdRES7WhmmUspviqxGSMM/Hg3Lacwiti2+TXYRi
 HrrW40XumdSPpQkGFStyYrBZdw==
X-Google-Smtp-Source: ABdhPJzTh9h9lgxKbLoZBot5yFiREhllXpF5kmuJ9pI0hDt2BL1SWUTPIwVBf3ovP2kSCEaWxerhwg==
X-Received: by 2002:ac8:118d:: with SMTP id d13mr36762941qtj.294.1620905490048; 
 Thu, 13 May 2021 04:31:30 -0700 (PDT)
Received: from [192.168.183.155] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id o26sm2161883qkm.4.2021.05.13.04.31.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 04:31:29 -0700 (PDT)
Subject: Re: [PATCH v4 29/31] target/ppc: Implement cfuged instruction
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
 <20210512185441.3619828-30-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <49b2a677-a3cc-b944-dd4d-edd115c81039@linaro.org>
Date: Thu, 13 May 2021 06:31:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210512185441.3619828-30-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 luis.pires@eldorado.org.br, f4bug@amsat.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/21 1:54 PM, matheus.ferst@eldorado.org.br wrote:
> +    while (i) {
> +        n = ctz64(mask);
> +        if (n > i) {
> +            n = i;
> +        }
> +
> +        m = (1ll << n) - 1;
> +        if (bit) {
> +            right = ror64(right | (src & m), n);
> +        } else {
> +            left = ror64(left | (src & m), n);
> +        }
> +
> +        src >>= n;
> +        mask >>= n;
> +        i -= n;
> +        bit = !bit;
> +        mask = ~mask;
> +    }
> +
> +    if (bit) {
> +        n = ctpop64(mask);
> +    } else {
> +        n = 64 - ctpop64(mask);
> +    }
> +
> +    return left | (right >> n);
> +}

This doesn't correspond to the algorithm presented in the manual.  Thus this 
requires lots of extra commentary.

I guess I see how you're trying to process blocks at a time, instead of single 
bits at a time.  But I don't think the merging of data into "right" and "left" 
looks right.  I would have expected

     right = (right << n) | (src & m);

and similarly for left.

It doesn't look like that the ctpop at the end is correct, given how mask has 
been modified.  I would have thought that

     n = ctpop64(orig_mask);
     return (left << n) | right;

would be the correct answer.

I could be wrong about the above, but that's what the missing commentary should 
have helped me understand.

> +static bool trans_CFUGED(DisasContext *ctx, arg_X *a)
> +{
> +    REQUIRE_64BIT(ctx);
> +    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
> +#if defined(TARGET_PPC64)
> +    gen_helper_cfuged(cpu_gpr[a->ra], cpu_gpr[a->rt], cpu_gpr[a->rb]);
> +#else
> +    gen_invalid(ctx);
> +#endif
> +    return true;
> +}

Given that this helper will also be used by vcfuged, there's no point in hiding 
it in a TARGET_PPC64 block, and thus you can drop the ifdefs.


r~


