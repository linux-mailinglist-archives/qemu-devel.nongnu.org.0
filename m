Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3557540477
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 19:13:29 +0200 (CEST)
Received: from localhost ([::1]:52512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyclk-0005Xa-9z
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 13:13:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nycf2-0004mY-OR
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 13:06:34 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:36501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nycf0-0006GM-Jq
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 13:06:31 -0400
Received: by mail-pf1-x436.google.com with SMTP id 15so16069287pfy.3
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 10:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7dPrc/FHT+ZJ8++/SoEkQNi1Jx8plBxqSbckYaPsmsg=;
 b=z1xBGuWufmPsXF70zFOlgx+u3bIPKQ46bKkPL+Uv5IREHucGty/iaLq2vov06/YDxA
 s1OxjDXyd8x6aF5WBUHzTGJvJtSvP4WbyEfKQauZnH3+x4tDcMs4ibvQDNG/YVROxhA2
 kB51JGpAtM3+o2Ne3IQ99fBcefNEfZBaH+P759Ul5Q54moDhmIr7xEJLK/oIxKfGFYK4
 hUOcPzCFpUaWRHpKpz8jpkMRTDm3sPmUFftABYv5rL/3K2ksezahgiGJ/H33FZjwFkKO
 HRgHLsNB36wkcaqy51JNux6Lg3UZxGxHXskmUY9axaZN2V2a2b/GL6P2sMuIRr7E7SMd
 wQpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7dPrc/FHT+ZJ8++/SoEkQNi1Jx8plBxqSbckYaPsmsg=;
 b=pirFf8Y5o/pmdMhJPloaR+bOJrnnYQOrV8WOWu0o73TzX1U5SCX9siNWJTWZq6nLQ8
 kPSyfWCGcoo29cuje/QAi0v4HB5XXFLIgLbKlwoKqa1HWaeqIvDjoNq8eH6KxyUlHmyI
 xXbynM2Ori6azhQ/3wLagAafUeDLxjAe1R6p9FeObdSYfVq/6Zl17INj7h28piJa0Ulw
 7tIwkIziVv2+y4f9938yJgHGGBm5xQaD8qqJH6bejU6hkxt6RDDXhiN/Sd2Q0cLU5HJ7
 Q9asG5S0TRd+41vtyYKPjuXjyx4ZVuFxRDExWy7+f01rcPbJgiXNB259KbV9ARJSHNEq
 xhgg==
X-Gm-Message-State: AOAM532SQRxbFGw1BWiK6ccSY1xtMyqWwY7GPpEg7ILX2Gmn1KP/zWEI
 S0VL5KyYYemKLZxkbxojrwCLtpfEY48VKA==
X-Google-Smtp-Source: ABdhPJzuvaagdpFrOBYnaA8RkmDUBI4pQADP1FuZn7uhfcHSO9dvNb86ZAv9n/5zNgwcK3zTSLFDXA==
X-Received: by 2002:a05:6a00:140e:b0:4e1:c81a:625c with SMTP id
 l14-20020a056a00140e00b004e1c81a625cmr30536295pfu.39.1654621587999; 
 Tue, 07 Jun 2022 10:06:27 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:3cf2:c634:5b19:25f6?
 ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 t27-20020aa7947b000000b0051c0fe8fb8csm5397619pfq.95.2022.06.07.10.06.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 10:06:27 -0700 (PDT)
Message-ID: <e168c1d2-ad41-5d6a-396a-c04af3831e30@linaro.org>
Date: Tue, 7 Jun 2022 10:06:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/3] target/mips: implement Octeon-specific BBIT
 instructions
Content-Language: en-US
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
Cc: f4bug@amsat.org, jiaxun.yang@flygoat.com, aurelien@aurel32.net,
 aleksandar.rikalo@syrmia.com
References: <165459235408.143371.17715826203190085295.stgit@pasha-ThinkPad-X280>
 <165459236498.143371.12833007759486308114.stgit@pasha-ThinkPad-X280>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <165459236498.143371.12833007759486308114.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 6/7/22 01:59, Pavel Dovgalyuk wrote:
> +# Branch on bit set or clear
> +# BBIT0      110010 ..... ..... ................
> +# BBIT032    110110 ..... ..... ................
> +# BBIT1      111010 ..... ..... ................
> +# BBIT132    111110 ..... ..... ................
> +
> +BBIT         11 set:1 shift:1 10 rs:5 p:5 offset:16

shift + p are logically one field -- all you need to do is concatenate them.

%bbit_p         28:1 16:5
BBIT            11 set:1 . 10 rs:5 ..... offset:16  p=%bbit_p

> +    if (ctx->hflags & MIPS_HFLAG_BMASK) {
> +#ifdef MIPS_DEBUG_DISAS
> +        LOG_DISAS("Branch in delay / forbidden slot at PC 0x"
> +                  TARGET_FMT_lx "\n", ctx->base.pc_next);
> +#endif

Ifdef isn't needed -- it's always defined, even to 0.

> +    tcg_gen_andi_tl(t0, t0, 1ULL << p);
> +
> +    /* Jump conditions */
> +    if (a->set) {
> +        tcg_gen_setcondi_tl(TCG_COND_NE, bcond, t0, 0);
> +    } else {
> +        tcg_gen_setcondi_tl(TCG_COND_EQ, bcond, t0, 0);
> +    }

You don't need to produce a boolean, MIPS_HFLAG_BC tests for non-zero.  Thus you can 
simplify this to

     p = tcg_constant_tl(1ull << a->p);
     if (a->set) {
         tcg_gen_and_tl(bcond, rs, p);
     } else {
         tcg_gen_andc_tl(bcond, p, rs);
     }


r~

