Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F9739EB9B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 03:44:01 +0200 (CEST)
Received: from localhost ([::1]:34876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqQmd-000248-N0
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 21:43:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqQlF-00010F-VH
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 21:42:33 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:39857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqQlD-0006DY-BD
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 21:42:33 -0400
Received: by mail-pg1-x529.google.com with SMTP id y12so3422947pgk.6
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 18:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=r4d80LJidM/GpuQqXW5SxWFt8l1wAPDeqaoJ5rAjvTg=;
 b=l8aNy4wMBag/mnoZZIVnMk2yvweBzMzZC9Htk0XJuUAyAAozBr4/+0fgPWsQDsv0al
 bXflksPrYizuOt7XbevulvNnkxT7/9FUJXmAVZRAGH620JlWg2eNbDrLK1PZvDV7KIt4
 jy/PxXnn7OlLjHc9kCSDBfOPwZ+WG9pxh7FGlAEZUMKtXSShhxfiZ5Fvofxd4aHbcPLA
 CygqEr0BjxOYsn5CtxNkOKRR4dFMwmGR47tHNlOIW3+XmAsOaIO3w3+hlwKApceuLdIv
 ZklSCY0z6EpKB/Dz1g2G6GpUMaI8lKw+QyX+JBznTOFg0WEIylVI5X5t48DxE6Uv2N3H
 c3oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r4d80LJidM/GpuQqXW5SxWFt8l1wAPDeqaoJ5rAjvTg=;
 b=foIfED1I9n7jTPebdLAjE6CN+XHmAztRWtU/BO+KQcx3+M4rNO29/JNNc5kThgAAxI
 IkptfTbqdhItZ3GX7ql1RbmpLsBgcXOvij+AM8V74nmPhLZdsqrLycBSQ34tTn2GuIkJ
 RONWgUL9SPNxYkZgEp1wjxZRv4teH0n2NN8dMESYFs0XGH/J/7HmtGc3OssFT7CBi3R+
 UhmBSdfC06o6a1oC8/KeD1H42duoWbs/snIr5vvvmfasm6j7n8WkpSCxpM72/V2t+2ee
 nJ9FwJc/oRgMqRoF11CdEeTUZHYILj8pEu7+ZXIZDQDsL3KTQw5fmhj1GMIyJ5zZrgQF
 FRGQ==
X-Gm-Message-State: AOAM531j/9fjpt1Y/V/5GoJFF/ymu1OcmuoUiHgqRtUOmzGCJ1EALvtk
 mqVEr5J+Sw5/kOjtCm8sLI9+Fo+wBgHYSg==
X-Google-Smtp-Source: ABdhPJzm4ERma1iy0+lHh/1x3KL0amMvhGwOM0KFo4hFFP4mtBe9tVgU9BqJilRd00vdTRxD/U83mg==
X-Received: by 2002:a63:798e:: with SMTP id
 u136mr20931096pgc.264.1623116549430; 
 Mon, 07 Jun 2021 18:42:29 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 d22sm9798398pgb.15.2021.06.07.18.42.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 18:42:29 -0700 (PDT)
Subject: Re: [PATCH 07/55] target/arm: Implement MVE WLSTP insn
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6e832785-40ec-99cf-5915-179924fc50f9@linaro.org>
Date: Mon, 7 Jun 2021 18:42:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 9:57 AM, Peter Maydell wrote:
> +    WLS          1111 0 0000 100     rn:4 1100 . .......... 1 imm=%lob_imm size=4
> +    {
> +      # This is WLSTP
> +      WLS        1111 0 0000 0 size:2 rn:4 1100 . .......... 1 imm=%lob_imm
> +      LE         1111 0 0000 0 f:1 0 1111 1100 . .......... 1 imm=%lob_imm
> +    }

I guess it doesn't matter, but I'd swap these two, as LE is the more specific 
encoding.

> @@ -8148,10 +8152,40 @@ static bool trans_WLS(DisasContext *s, arg_WLS *a)
>            */
>           return false;
>       }
> +    if (a->size != 4) {
> +        /* WLSTP */
> +        if (!dc_isar_feature(aa32_mve, s)) {
> +            return false;
> +        }
> +        /*
> +         * We need to check that the FPU is enabled here, but mustn't
> +         * call vfp_access_check() to do that because we don't want to
> +         * do the lazy state preservation in the "loop count is zero" case.
> +         * Do the check-and-raise-exception by hand.
> +         */
> +        if (s->fp_excp_el) {
> +            gen_exception_insn(s, s->pc_curr, EXCP_NOCP,
> +                               syn_uncategorized(), s->fp_excp_el);
> +        }

Surely return true here...

> +    if (a->size != 4) {
> +        /*
> +         * WLSTP: set FPSCR.LTPSIZE. This requires that we do the
> +         * lazy state preservation, new FP context creation, etc,
> +         * that vfp_access_check() does. We know that the actual
> +         * access check will succeed (ie it won't generate code that
> +         * throws an exception) because we did that check by hand earlier.
> +         */
> +        bool ok = vfp_access_check(s);
> +        assert(ok);

... otherwise this assert will trigger.


r~
r~

