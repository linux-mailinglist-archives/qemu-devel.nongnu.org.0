Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 514523A6F48
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 21:40:54 +0200 (CEST)
Received: from localhost ([::1]:36734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lssS5-0003cI-Do
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 15:40:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lssQt-0002XO-Sx
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 15:39:39 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:33513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lssQr-0000pl-T0
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 15:39:39 -0400
Received: by mail-pl1-x634.google.com with SMTP id u18so6535044plc.0
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 12:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=4E53SlHsd3C5DPVJZfn/FYWVpAAaPQlS/Qwhm9fx3xg=;
 b=BGOA+AqZE5H3HZz7ob6CLDaetEIhCksOHMgnNb01LNDVagiVn+YVCVTSrH+OikRVxF
 laqhS11AK3PNBBEgM9JsiNmd6pQs+f2emJoyG43yX5xxDf6Fg529nNVqhSlRicAxHyVR
 o0LtK3wp5tv+Z8YjwiatMDJvOAPscap8vTtD3IVjXr+rr+Zk5iqJMcakQ7jyW46Dreoz
 joqeoMJ0eKQWWpem7CfwfZKod+4xoZdBZhtTsBxvMvG3jOO0pN7i7RPJp0ZY/IhuiZIF
 DktBzXBHGpKx2oR0FPSJbJ3tsRPIY97hlv7GfPq3Q6gFReaO/bspImBDjZtrxlgN3MVI
 j/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4E53SlHsd3C5DPVJZfn/FYWVpAAaPQlS/Qwhm9fx3xg=;
 b=oEKmFH2ub0QQDhVTmoTs8+ouIT/40cbgkW//3Y93p40iCQUWg+lVM7YYRxsiaDPtUX
 G+07EhAkOx+0hTOGj1xUtQYkgH6XS/kPWgLhA5crwACOLDiAmXobl2nTEaZxB7s4Pczp
 MWweHZ9FbzVa2USIA80UCiNzVDvURQ2gnUi4YShrKM9+xXLNQbVfgdH8YxO3RSv24dwU
 zUnUWKj3wNcbFQ0MxpUQo8tDIc03W6S9Ez9sVw701vyY5B4btXua6+MWJ3OuekJ2a6rq
 42A3DERKkC6hKBd4hk22EoeHDkjUVOru2jeIWOZzV3HPgTIWIRd45WrLreKXekE6TNhF
 BIvQ==
X-Gm-Message-State: AOAM533OrTh5v2wu9MikHPOQqJjQ1owiB/I7SekjeAfpJQ982tdTeydp
 docGVixDieSueLqXqX7sK3Og5NfOUGxnsA==
X-Google-Smtp-Source: ABdhPJytT04rHaLgEvY2U4B8Si0hmI9txFvN0tLww6XAlmBvrJNOezQ8CcA09z9aUaUMtoZwyjsG/g==
X-Received: by 2002:a17:90a:880c:: with SMTP id
 s12mr20925454pjn.66.1623699576331; 
 Mon, 14 Jun 2021 12:39:36 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 125sm12905580pfg.52.2021.06.14.12.39.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 12:39:36 -0700 (PDT)
Subject: Re: [PATCH v2 12/57] target/arm: Implement widening/narrowing MVE
 VLDR/VSTR insns
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210614151007.4545-1-peter.maydell@linaro.org>
 <20210614151007.4545-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8d917c5a-0c50-927d-522c-9ae48db5926e@linaro.org>
Date: Mon, 14 Jun 2021 12:39:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210614151007.4545-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.489,
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

On 6/14/21 8:09 AM, Peter Maydell wrote:
> diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
> index c07110a145b..7282f56b18d 100644
> --- a/target/arm/mve_helper.c
> +++ b/target/arm/mve_helper.c
> @@ -168,5 +168,16 @@ DO_VSTR(vstrb, stb, 1, uint8_t)
>   DO_VSTR(vstrh, stw, 2, uint16_t)
>   DO_VSTR(vstrw, stl, 4, uint32_t)
>   
> +DO_VLDR(vldrb_sh, ldsb, 2, int16_t)
> +DO_VLDR(vldrb_sw, ldsb, 4, int32_t)
> +DO_VLDR(vldrb_uh, ldub, 2, uint16_t)
> +DO_VLDR(vldrb_uw, ldub, 4, uint32_t)
> +DO_VLDR(vldrh_sw, ldsw, 4, int32_t)
> +DO_VLDR(vldrh_uw, lduw, 4, uint32_t)
> +
> +DO_VSTR(vstrb_h, stb, 2, int16_t)
> +DO_VSTR(vstrb_w, stb, 4, int32_t)
> +DO_VSTR(vstrh_w, stw, 4, int32_t)

Hmm, from the previous patch,

> +#define DO_VLDR(OP, LDTYPE, ESIZE, TYPE)                                \
> +    void HELPER(mve_##OP)(CPUARMState *env, void *vd, uint32_t addr)    \
> +    {                                                                   \
> +        TYPE *d = vd;                                                   \
> +        uint16_t mask = mve_element_mask(env);                          \
> +        unsigned b, e;                                                  \
> +        /*                                                              \
> +         * R_SXTM allows the dest reg to become UNKNOWN for abandoned   \
> +         * beats so we don't care if we update part of the dest and     \
> +         * then take an exception.                                      \
> +         */                                                             \
> +        for (b = 0, e = 0; b < 16; b += ESIZE, e++) {                   \
> +            if (mask & (1 << b)) {                                      \
> +                d[H##ESIZE(e)] = cpu_##LDTYPE##_data_ra(env, addr, GETPC()); \
> +                addr += ESIZE;                                          \
> +            }                                                           \
> +        }                                                               \
> +        mve_advance_vpt(env);                                           \
> +    }

we are advancing ADDR by ESIZE, and not but the MSIZE of the memory access.
Further, we're advancing ADDR under predication, whereas the increment should be 
unconditional (e * mbytes).


r~

