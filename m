Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDB25EDEB5
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 16:23:39 +0200 (CEST)
Received: from localhost ([::1]:46032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odXyM-0004Lt-4a
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 10:23:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odVzp-0006aI-3x
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 08:17:02 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:33357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odVzm-0004I2-4X
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 08:16:59 -0400
Received: by mail-pf1-x435.google.com with SMTP id w2so12409441pfb.0
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 05:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=hZZzk2h0DXLhS5kIUscxiCbkj1nfwKlpBBur/BWrcpQ=;
 b=jrvyeQeBTHSvXCWA4xXnk8d58gJrni3//pR8QAG5hjfijMxYapJVMs1UkleHdQhTi7
 nVwcBQd11SR8NfF+tLEC6UADk9pYMUkRevkCFK2O+l33dHMvJqwz1ff3LjK+aoFEI6k4
 bYU2OjTkmljHuYz0I9naLf3YoRxhMPCU4UTS13+Rpce2BeD9yTT6JE/DivnMEW9szyQe
 0wuQEUSfeJqhk3fOP+8TK6QPSl8BpUM4V2aQ77A5Xg3ivXDlCahqQfkH+dLYV6n/O6Qf
 CPSmwTJwaseDuj4UoD7t7tvpn2F8htoZbmYvIS86/rY62QD+WEIAtMIGUC15wpj3vOM5
 czbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=hZZzk2h0DXLhS5kIUscxiCbkj1nfwKlpBBur/BWrcpQ=;
 b=fl+OvuTF04jjmOGxhmFzUzOI72oaB2mRy5ZAri3lvoPyS6yDobpKZCYz7PKQENHERK
 9lNfH3d+4Lh83z1cSd5ni0R7Sgi+oC2HVCiIY82MvnG/yaeKHssfc+aJw80dWrlT2IYk
 c0F1awXHHc5hYIIlk5mbkiAjD2gScqgDqLSKx0cj/Lvr1fb26U6zcmpuxAgR6z2C8sxJ
 IUHpK6NODwo+zozDLAxzpV3csC9KxgzZnH0BERX8URTpVHZAI+mMLkNKYiQNSPn/7w9F
 1moR3FsguDL0fnaRdTNqShwYf+QPfdGYtcHZhpLDFRVUNVFl9OMI58G34FDk+3W2YDOT
 YiQQ==
X-Gm-Message-State: ACrzQf05iPcrvyj//XthvyZAsYrbETDKBntxSpIluzVIYhsp6Py8PrFe
 V3Vjf1L/uqSIk0g4MnAsgb/nVw==
X-Google-Smtp-Source: AMsMyM5QG71f9I2oTL4JdFaFLlWV+7wsOIXLASDTY5E9HMTJMwPpsd5IJjBzpMRtSKaVmPdmVxoVZw==
X-Received: by 2002:a05:6a00:1c72:b0:543:239c:b602 with SMTP id
 s50-20020a056a001c7200b00543239cb602mr34589795pfw.75.1664367414244; 
 Wed, 28 Sep 2022 05:16:54 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 1-20020a630d41000000b0043c9da02729sm3459114pgn.6.2022.09.28.05.16.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 05:16:53 -0700 (PDT)
Message-ID: <a2714c98-56ba-5cee-2a69-8e70c769e0b1@linaro.org>
Date: Wed, 28 Sep 2022 05:16:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/3] target/arm: Update SDCR_VALID_MASK to include SCCD
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>
References: <20220923123412.1214041-1-peter.maydell@linaro.org>
 <20220923123412.1214041-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220923123412.1214041-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/23/22 05:34, Peter Maydell wrote:
> Our SDCR_VALID_MASK doesn't include all of the bits which are defined
> by the current architecture.  In particular in commit 0b42f4fab9d3 we
> forgot to add SCCD, which meant that an AArch32 guest couldn't
> actually use the SCCD bit to disable counting in Secure state.
> 
> Add all the currently defined bits; we don't implement all of them,
> but this makes them be reads-as-written, which is architecturally
> valid and matches how we currently handle most of the others in the
> mask.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

