Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EF44EC0D4
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 13:54:05 +0200 (CEST)
Received: from localhost ([::1]:58008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZWto-0005DT-Er
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 07:54:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZWp0-00020v-DI
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 07:49:09 -0400
Received: from [2a00:1450:4864:20::332] (port=40851
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZWoy-0006CW-1u
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 07:49:05 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 v64-20020a1cac43000000b0038cfd1b3a6dso1045788wme.5
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 04:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8iNrniDi6aFkRlbcQCvMNxM+WRCZch6rRlBNU5znFa0=;
 b=M9far2WR8jJIXx6fwLKVBKNfl4pOL/pHMTeWxhCAimzF2Pi1iOkccPZuXkTh7JadPm
 CZp2SRDUMj3JIPdK3z3vTaSYzDnFFIocO268npjNgF8bKmGeI4b602DNnKlwE0IJGLDf
 fSxFQBMcCTyXoS6u99D/B970bGjIuZ3WyqQLhnsxBXkc4x/OD8CEfZ533R2eMr5Akmeu
 jT3U9PpyoXY4ihHiMeQeraBUkVJzpM8j2o3bnfH3lJ1DvvQMv0vlkhr0h97OwcU57gwM
 4s8S0CffSn6F3qwIG6CtvR6LUGmYIdv9MIXJclYtOQASGat3gZFSeKJwrJFDNHUwp2nh
 9PQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8iNrniDi6aFkRlbcQCvMNxM+WRCZch6rRlBNU5znFa0=;
 b=S5+KOPod/oZc39UCixwSXxsIl8Ru6IHuo6q46s3aHDmQZbs7/TS2x6hMqVK97v582B
 mHP38qjBsUQGfWQeViR4db0wiJJ//gBdO4w4EuvEfn37TaUZnrkjOL8xJjLfdG+OaK/K
 wbLqHv4cavXl5QLuuVT3WgomG32N58zNFfIN3eLh8kvn3RX8Eaxg44rfzvJcelTEh8nW
 dcOUQzdjtpM2PtW+ud63tJbSg0EdcZ4vIZvxV2n74+znIZhQzoHVe6pF2warUeS8+6cg
 zf9I0gUiIqx0YRb0c8zsOKIU9JN0/zR9cjZ+k3OwEhEXChR8t86J/aHqIAGR0VaH+AFF
 qYWg==
X-Gm-Message-State: AOAM532/elkKxnZ4QckbvbTfhAtsWvVbUJqL0GrAnVjLpfkyGr3N0efP
 McO7NWnf7bEKx/PGDBfcBZI=
X-Google-Smtp-Source: ABdhPJwVq22skYGIyFTTyAa4zxcg1qOHpcn5dRV/wS30QuHmpe85ZdzMh7mer/XvMaoP2GxF3sXlxg==
X-Received: by 2002:a1c:2904:0:b0:37b:ea53:4cbf with SMTP id
 p4-20020a1c2904000000b0037bea534cbfmr4066674wmp.46.1648640940207; 
 Wed, 30 Mar 2022 04:49:00 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:403e:ab57:ee68:20ea?
 ([2600:70ff:f07f:0:403e:ab57:ee68:20ea])
 by smtp.gmail.com with ESMTPSA id
 q16-20020adfea10000000b00203e0735791sm17185962wrm.39.2022.03.30.04.48.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 04:48:59 -0700 (PDT)
Message-ID: <47dea31e-48e6-4342-11c4-b9f28affceb8@gmail.com>
Date: Wed, 30 Mar 2022 13:48:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.0?] tcg/aarch64: Use 'ull' suffix to force 64-bit
 constant
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220329234956.43558-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220329234956.43558-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/3/22 01:49, Richard Henderson wrote:
> Typo used only 'ul' suffix, which is still 32-bits for windows host.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/947
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/aarch64/tcg-target.c.inc | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
> index 077fc51401..5e67f881f1 100644
> --- a/tcg/aarch64/tcg-target.c.inc
> +++ b/tcg/aarch64/tcg-target.c.inc
> @@ -1086,9 +1086,9 @@ static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
>           opc = I3405_MOVZ;
>       }
>       s0 = ctz64(t0) & (63 & -16);
> -    t1 = t0 & ~(0xffffUL << s0);
> +    t1 = t0 & ~(0xffffull << s0);
>       s1 = ctz64(t1) & (63 & -16);
> -    t2 = t1 & ~(0xffffUL << s1);
> +    t2 = t1 & ~(0xffffull << s1);
>       if (t2 == 0) {
>           tcg_out_insn_3405(s, opc, type, rd, t0 >> s0, s0);
>           if (t1 != 0) {

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

