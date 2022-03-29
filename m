Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B174EACEE
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 14:16:18 +0200 (CEST)
Received: from localhost ([::1]:58222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZAle-0001hZ-0S
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 08:16:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZAgf-0007Qj-Fm
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 08:11:03 -0400
Received: from [2607:f8b0:4864:20::22f] (port=33517
 helo=mail-oi1-x22f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZAgc-00086Q-Sf
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 08:11:00 -0400
Received: by mail-oi1-x22f.google.com with SMTP id k10so18819812oia.0
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 05:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3BedTp6M5DvX8RHv4j4gdSvQ4etS1feh+PYdJfce63c=;
 b=VBzH4MlAixvUI7w+qpS2RuTv2Ndznxx660dgkq89cRmMBXEl7GLYgZ4aO7Be9aMSOB
 GD2SZ3R4n9gh6kh6MK7YkbnTtiszOwIIzZaTe3e721FyL3eWvCEITdVbRiOdMmoDhniO
 zjBpNbBwLtzv9BXoF1V+V7Z2+lEXVwuo0o+m2gJw8TY/5ppIiaQVbnSOt6TyRgXTl/9J
 qAbzOuUPUBPmZ9rXiSLx+RwzaycdoSOzdz1tD8E/cNXqP1T3jBVmK7bajaziOTAUiLr5
 QhY7mdA9B9fpXQDJXN4Clx34ICqjN8iJ2Kd0iJoxulV1dPyESRnZNDGxhNDNnPU4iKtJ
 4wGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3BedTp6M5DvX8RHv4j4gdSvQ4etS1feh+PYdJfce63c=;
 b=GNsDsSIII3MBIwYJ1dFHyPZjTlvH2Ix85d4ixObrkSsRRxmlQpKCKXf784vE8wfr2R
 +/3nzfa9IU1GvwYM+ClfQL4OinhGQi4fUXdHBREmszadrmAVJQevkp5LP07fIMtzFwI2
 Gw9HKWi2h3oMKkjvuCVuDi2OXfZBSWEB65fdgCiPxHCTC5OUtvI3i+Tha2kkeRhIe/2t
 edFxksiEymDJt6UJodPY3pWKS+ReXLuJiYR2acuAlD8wQKQfYFqwyWpNSUoxLzXpDSUQ
 kdAQE6Lixh2kqusnZMQhJrIJyU8aLE3wxoi5bSkSZYcTVNvwc633hVFSfii70nTP6r4l
 EyqQ==
X-Gm-Message-State: AOAM5335/o0ADS7BtCFhSwjMe137n8V/t1MaMFHaw9qPviZQ6Vrq6W0j
 ejEH4btA66hWv0EpkSyvwfCHNg==
X-Google-Smtp-Source: ABdhPJznI53XgpX1qRFB/D4hSX2AZokdwqYJwrHrbbGxCQxrRw8P4EWimbhrWavswDAVw7674jzTxg==
X-Received: by 2002:a54:4390:0:b0:2ec:e47e:95bf with SMTP id
 u16-20020a544390000000b002ece47e95bfmr1946747oiv.131.1648555857613; 
 Tue, 29 Mar 2022 05:10:57 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 s26-20020a4ac81a000000b00322a2b5d943sm8350633ooq.37.2022.03.29.05.10.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 05:10:56 -0700 (PDT)
Message-ID: <753d2c93-329f-56c1-33e2-8a7fa6142ff9@linaro.org>
Date: Tue, 29 Mar 2022 06:10:53 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH 4/6] softfloat: add float*_to_int128 conversion methods
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220328201442.175206-1-matheus.ferst@eldorado.org.br>
 <20220328201442.175206-5-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220328201442.175206-5-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, danielhb413@gmail.com,
 groug@kaod.org, clg@kaod.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/28/22 14:14, matheus.ferst@eldorado.org.br wrote:
> +static int64_t partsN(float_to_sint2)(FloatPartsN *p, FloatRoundMode rmode,
> +                                      int scale, float_status *s, uint64_t *lo)
> +{
> +    int flags = 0;
> +    uint64_t hi;

Similar comment about 'lo' vs '*lo'.

> +        if (p->exp <= DECOMPOSED_BINARY_POINT) {
> +            hi = 0;
> +            *lo = p->frac_hi >> (DECOMPOSED_BINARY_POINT - p->exp);
> +        } else if (p->exp <= 127) {
> +            int shift = 127 - p->exp;
> +            hi = shr_double(0, p->frac_hi, shift);

Same comment about double-shift w/ 0.

> +            if (N > 64) {
> +                *lo = shr_double(p->frac_hi, p->frac_lo, shift);
> +            } else {
> +                *lo = shr_double(p->frac_hi, 0, shift);
> +            }
> +        } else {
> +            hi = UINT64_MAX;
> +            *lo = UINT64_MAX;
> +        }
> +        if (p->sign) {
> +            if (hi < INT64_MIN || (hi == INT64_MIN && *lo == 0)) {
> +                *lo = -*lo;
> +                hi = ~hi + !*lo;
> +            } else {
> +                flags = float_flag_invalid | float_flag_invalid_cvti;
> +                hi = INT64_MIN;
> +                *lo = 0;
> +            }
> +        } else if (hi > INT64_MAX) {
> +            flags = float_flag_invalid | float_flag_invalid_cvti;
> +            hi = INT64_MAX;
> +            *lo = UINT64_MAX;
> +        }

Hmm.  It seemed easy to arrange the code this way with just a uint64_t, but here I think 
it might be worth detecting overflow earlier, via exp.

     if (p->exp < 127) {
         /* No overflow possible */
         int shift = 127 - p->exp;
         if (shift >= 64) {
             hi = 0;
             lo = p->frac_hi >> (shift - 64);
         } else {
             hi = p->frac_hi >> shift;
             lo = shr_double(p->frac_hi, N > 64 ? p->frac_lo : 0, shift);
         }
         if (p->sign) {
             lo = -lo;
             hi = ~hi + !lo;
         }
         break;
     }
     /* The only valid 127-bit number is UINT128_MIN. */
     if (p->exp == 127 &&
         p->sign &&
         p->frac_hi == DECOMPOSED_IMPLICIT_BIT &&
         (N <= 64 || p->frac_lo == 0)) {
         hi = INT64_MIN;
         lo = 0;
         break;
     }
     /* Overflow. */
     flags = ...;
     if (p->sign)
         ...


r~

