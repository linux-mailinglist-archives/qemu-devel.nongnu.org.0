Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEBE3DBEBE
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 21:09:16 +0200 (CEST)
Received: from localhost ([::1]:44910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9Xsh-0006yx-FY
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 15:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9XrM-0006FF-Fv
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 15:07:52 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:41652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9XrE-0003Fu-N5
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 15:07:52 -0400
Received: by mail-pl1-x62b.google.com with SMTP id z3so10886691plg.8
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 12:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=yfLKCIIpYn1alvjSmPznCSEY3D64AXXx3zPB/S+I7XU=;
 b=ucJXku9hG9ny5iGFKhLReE6PAlCwP7K04fYi6Ih5+1bJtv4oMYL3+1xsV8jr+Vb403
 zNp6WnucAEam8wj4Q8247by3ZdgvkwAqHKOVEAKboPlSid5AAjITHXnPMBIHv5c8qaFQ
 7ztx6c1vdFV76/dgtwRNQM0AjcWhiiRksrRqRDY0WIRWhHcecK2Rq4I7vHBJ9X3AYq7w
 UbpQa4PQaCnZZ8A5uxMRD/6lAJDEOQbKMZvz1+N8W+XM0VRCMmviSz96pnR+O3lxgyQs
 r2bW5ipFDYgDU9+dTl6Oy1WSTA8e3gEk23oBY38h2bKEp83dOMqK/QlBO34sOoQzFdbY
 hg4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yfLKCIIpYn1alvjSmPznCSEY3D64AXXx3zPB/S+I7XU=;
 b=qvt0yLWJ7b3Pm7nAky9Gen+1XZVWOH3o2nt9z4UEEHwUdSxHGBDb8Zj508jpjCxolq
 mFtt+FXu8onof1opv83DYTtyBeLPKmMyOsIBMFIymwWiNnJ646aPUW2zhIh61fBFgHvx
 9pOsNLKb+p3GG0mZxq1EQ3Yw3FHS0ZdbGvjvhSwm77orG5S6Ow7Ov0tL5NRRHGqoqPBd
 v/Rse2AEXeAkMXsTorbxG+yhFby1oDovQZfvsErpOLfJbEvtIEcBqEJ6Wr9jZEDNcU1J
 F0LM2gqvuc9W93iXBsgOKb6iMiJdOj5PVXB2rFr7eAZyC5P+8e3dcmqP1Og4QM3gIiuC
 wAyg==
X-Gm-Message-State: AOAM531wItbyL2wVJcHi5AaL8+wRX5g00OXhC2LuuwpnS5bmkcCKMu1W
 3PrVsoo+D97h0zdVWRIca0wxzblZATjHAQ==
X-Google-Smtp-Source: ABdhPJyrwMFI23qF3Ho2DECesAV3W+RPT9/sHbmWn4h9lvNjWNEyO7GFyHDgFQiCpCOzET5P3NuoGw==
X-Received: by 2002:a63:f63:: with SMTP id 35mr1517465pgp.148.1627672063134;
 Fri, 30 Jul 2021 12:07:43 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id s125sm3152527pfb.51.2021.07.30.12.07.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 12:07:42 -0700 (PDT)
Subject: Re: [PATCH for-6.2 07/53] target/arm: Fix MVE 48-bit SQRSHRL for
 small right shifts
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210729111512.16541-1-peter.maydell@linaro.org>
 <20210729111512.16541-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cf01ab07-f7c8-c2f3-9cd2-1a17dab62a8a@linaro.org>
Date: Fri, 30 Jul 2021 09:07:39 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729111512.16541-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/21 1:14 AM, Peter Maydell wrote:
> We got an edge case wrong in the 48-bit SQRSHRL implementation: if
> the shift is to the right, although it always makes the result
> smaller than the input value it might not be within the 48-bit range
> the result is supposed to be if the input had some bits in [63..48]
> set and the shift didn't bring all of those within the [47..0] range.
> 
> Handle this similarly to the way we already do for this case in
> do_uqrshl48_d(): extend the calculated result from 48 bits,
> and return that if not saturating or if it doesn't change the
> result; otherwise fall through to return a saturated value.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Not squashed into the previous patch because that one has already
> been reviewed, so as this fixes a different edge case I thought
> it clearer kept separate.
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

>   target/arm/mve_helper.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
> index 5730b48f35e..1a4b2ef8075 100644
> --- a/target/arm/mve_helper.c
> +++ b/target/arm/mve_helper.c
> @@ -1563,6 +1563,8 @@ uint64_t HELPER(mve_uqrshll)(CPUARMState *env, uint64_t n, uint32_t shift)
>   static inline int64_t do_sqrshl48_d(int64_t src, int64_t shift,
>                                       bool round, uint32_t *sat)
>   {
> +    int64_t val, extval;
> +
>       if (shift <= -48) {
>           /* Rounding the sign bit always produces 0. */
>           if (round) {
> @@ -1572,9 +1574,14 @@ static inline int64_t do_sqrshl48_d(int64_t src, int64_t shift,
>       } else if (shift < 0) {
>           if (round) {
>               src >>= -shift - 1;
> -            return (src >> 1) + (src & 1);
> +            val = (src >> 1) + (src & 1);
> +        } else {
> +            val = src >> -shift;
> +        }
> +        extval = sextract64(val, 0, 48);
> +        if (!sat || val == extval) {
> +            return extval;
>           }
> -        return src >> -shift;

I'll note two things:

(1) The val == extval check could be sunk to the end of the function and shared with the 
left shift,

(2) sat will never be unset, as #48 is encoded as sat=1 in the insn.


r~

