Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1316D3563
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Apr 2023 05:32:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pioRV-00089i-CW; Sat, 01 Apr 2023 23:31:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pioRT-00089U-U9
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 23:31:43 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pioRR-0000cn-SE
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 23:31:43 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 o6-20020a17090a9f8600b0023f32869993so29408202pjp.1
 for <qemu-devel@nongnu.org>; Sat, 01 Apr 2023 20:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680406300;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WwHphvH/9jh7QZ4D7g1aWq80gOxlXLuFd11vewtbBKU=;
 b=koNBKy8wjrD4jyUrGLKsvyJ+XPwzVO8V43CNr/74XlsTjhSPaZbtZHT9YGGwH9RDwb
 ZxgYvnqWPSrxVhA8aiMZAE5M93z+0jr/wjDJHtOOWcEnuHcKK0GJdBrxHJE/5iHtPSi1
 oP8LJRKtmiTZHetIaQnLG717ypUSHKw5fiGF8CqeHZ5YYuvE1cPea8TzPOOZqnYUM8ZW
 VRGVFn+LFVv5q3lx1yioLBgmJZ9UluUbYq/XGKIG5Ycavl5Gh4XcgQUNHv1jpO0zzdQl
 qs/xk3++DASSEQzpg2qbdwCtHTL+jbbc+Xa9ho/if/oqKw2WLo04MtM5ghPVlMsEC5mP
 yqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680406300;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WwHphvH/9jh7QZ4D7g1aWq80gOxlXLuFd11vewtbBKU=;
 b=JVnlgOMN8Jhrnh1/2/sH0Ydh3aATKbRGnrS5a5abkSnI/BOLmxtNUxStunx5pD2Kxi
 7H5v//xv2ZTB96J7WxkE7ztuUPsuKjFBsGgiJ6OYMROyFTI0iFdxZbw6duLLLoMdt45r
 /cJj9JXzS/90Mo9IfctEYbEnmQ3iJJAPlqcIu+q+7z3bbcFanjXzoNMHAcZUGhwMNLQ0
 Lk2ep44BKXgehpOhP3MemrEqrvxwl4rQkv5R28q4Rx9a4jRMD+L8bhmmR3helJUgOn3i
 lMfrNnUzOYpC7PL86E/lbEuqgVSDXyXVheykiutIJr+M6W1ObBgttkbL05pG5ezlEX/9
 e5vw==
X-Gm-Message-State: AAQBX9exli9kc6FBOu6KcmEUsurjGnuj96Ri9JTrgTdgE3SMKU5aUnAE
 oyaMvocnXRtkazV2FfKakZLaIQ==
X-Google-Smtp-Source: AKy350byy1iVLx8IUuAJa9O8F1QhxxKXQs6czQXfwg4gXlnTari4wOjHVS7V7IkP5Rb8jV/cCmjS+g==
X-Received: by 2002:a17:90b:164b:b0:23d:50c6:2d17 with SMTP id
 il11-20020a17090b164b00b0023d50c62d17mr37063452pjb.10.1680406300229; 
 Sat, 01 Apr 2023 20:31:40 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:f30a:3ab0:889f:f03d?
 ([2602:ae:1541:f901:f30a:3ab0:889f:f03d])
 by smtp.gmail.com with ESMTPSA id
 g3-20020a170902740300b001a19f2f81a3sm4035126pll.175.2023.04.01.20.31.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Apr 2023 20:31:39 -0700 (PDT)
Message-ID: <ceb4a2d8-c56c-0e4f-7fb7-a565c42ceb84@linaro.org>
Date: Sat, 1 Apr 2023 20:31:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH v2 29/44] target/loongarch: Implement vssrlrn vssrarn
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-30-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328030631.3117129-30-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/27/23 20:06, Song Gao wrote:
> +#define SSRLRNS(E1, E2, T1, T2, T3)                \
> +static T1 do_ssrlrns_ ## E1(T2 e2, int sa, int sh) \
> +{                                                  \
> +    T1 shft_res;                                   \
> +                                                   \
> +    shft_res = do_vsrlr_ ## E2(e2, sa);            \
> +    T1 mask;                                       \
> +    mask = (1ul << sh) -1;                         \

I've probably missed other instances in review, but "ul" and "l" are *always* incorrect.

For 32-bit hosts, this is not wide enough.
If it were, "u" or no suffix would have been sufficient.

For uses like this, MAKE_64BIT_MASK(0, sh) is what you want.
For other kinds of uses, "ull" or "ll" is correct.


r~

