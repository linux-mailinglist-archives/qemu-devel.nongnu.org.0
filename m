Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCCF590620
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 19:57:58 +0200 (CEST)
Received: from localhost ([::1]:57704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMCRR-0003Cr-2O
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 13:57:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMCFT-0001R2-Ol
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:45:41 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:39578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMCFR-0005Ud-H5
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:45:35 -0400
Received: by mail-pg1-x52e.google.com with SMTP id q16so17711778pgq.6
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 10:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=tj+kcBZAMEwFi2YqVHw9QomSBhCtv6/nTd9fckzU2ys=;
 b=LGMC+WIwAeJ2EIEAFOHQABNh2eTwyId+mkclDA3H/61xDacDcOUEw/A7/1qT/noxIy
 pwn5i993UxRyOOBs5afwDTtcje8Y0fTPQyhw9gQtiIL9nvU9uEjpcJNI3u5fX3iMOxvg
 /B+mHhJuulj+yRWSiafEVZBVX9XpR63Xf6LQ6WWDu0PRQ2mycq+XGQ7wfRzkNLEk4F9l
 mcH4Gm/6HSSb7jdBgYeBgtlI6j45MBG4VjXVmFVTqUIba2VccVCMUMhodCpkJKglaUJa
 KQemTg2nQJnLCw4KWONMBfMi+szYtYmWTUdhwwkFsWOodXBthl1hH8PQPvx1G/lbkVj3
 SVBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=tj+kcBZAMEwFi2YqVHw9QomSBhCtv6/nTd9fckzU2ys=;
 b=WPobzYoEqrr+B/XjtvyMxYvi/oMGHhvDQeUmh41QCJZTEgv+od/iJO67w4EXqtzfAd
 xn6aF1CJZG4qt9doXh+lMf6P4p5wYx8ULLKJDEODHEJjMevJxwDiMOu6J/tbaLJ/j4Zw
 s2tg1ZLjJkzLaxwgXKCZslwE2oY/XXLNGTFV5hV/7g7Wa14rrRggTmR/BjPv2DnyM3Z0
 6b+82PNs3snxZ2ncNtDqqskqdOqkIpNApeIajJciDG8ZtsieAkZVGOID5LC8t9/CHdIY
 YgQ4IAKXmk7QJ1o5P0Fh+j7TN7oZ62Oire1dEpvDCymQe3x33lv1ApXCYbfRbYt2CjYz
 PObw==
X-Gm-Message-State: ACgBeo3VTB9cUo+SvONxPNtav2nfVBfK3Mf2fDFTxm5RDyr/tBLpjlEj
 QqaNdgHXhI20kE/Zs/qd7suXSQ==
X-Google-Smtp-Source: AA6agR6oqDtYIEalkNpvxruWtecoGR3/jRUjwUu/DSBFcZyWv0OsQKKt3nUHfpzk6Aep0gevgW1Mlg==
X-Received: by 2002:a62:1a56:0:b0:52d:4352:3ae0 with SMTP id
 a83-20020a621a56000000b0052d43523ae0mr240270pfa.35.1660239932115; 
 Thu, 11 Aug 2022 10:45:32 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:72e2:2d06:c2b1:b106?
 ([2602:ae:154e:e201:72e2:2d06:c2b1:b106])
 by smtp.gmail.com with ESMTPSA id
 s124-20020a625e82000000b0052e987c64efsm4490217pfb.174.2022.08.11.10.45.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 10:45:31 -0700 (PDT)
Message-ID: <81d8044e-5625-e730-59f8-2927a9bf038b@linaro.org>
Date: Thu, 11 Aug 2022 10:45:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 04/10] target/arm: Ignore PMCR.D when PMCR.LC is set
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220811171619.1154755-1-peter.maydell@linaro.org>
 <20220811171619.1154755-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220811171619.1154755-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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

On 8/11/22 10:16, Peter Maydell wrote:
> The architecture requires that if PMCR.LC is set (for a 64-bit cycle
> counter) then PMCR.D (which enables the clock divider so the counter
> ticks every 64 cycles rather than every cycle) should be ignored.  We
> were always honouring PMCR.D; fix the bug so we correctly ignore it
> in this situation.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 17 +++++++++++++----
>   1 file changed, 13 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

