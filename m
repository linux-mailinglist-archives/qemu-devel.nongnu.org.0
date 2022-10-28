Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EB9611B27
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 21:49:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooVKA-0007GL-8N; Fri, 28 Oct 2022 15:47:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ooVJk-0007AU-HZ
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 15:47:02 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ooVJS-0007ev-Jj
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 15:47:00 -0400
Received: by mail-pj1-x1036.google.com with SMTP id j7so1883949pjn.5
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 12:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Zib0GJPPCYGTBQXSJ2rOQOknJzzuaYVualwHxGmDGu4=;
 b=uKBGf6l1LJZNvpBqhbgNbxQHdp9B2/UAkrhLUtYA6FwOLetKvmLzpSEb3tZewBAZsd
 2TTKRAMNX1fHVdOBWPocQbVj9OC/xaIR81TTSghT6voGNE6t02VByuWHThwl8e5z4Qzw
 3eRjS+DlAIAvHi0TS1UG9aAT7guJZxwyivFctcbWBB2tW8K/mDckxrWHnvgTyhr7sTZv
 3yUD7FSCiS+NMOo9IeOkqqLzhfc+zGiIgVO6VSMxL3l1zUxZyqC9WCzKFQZl4iro0vlB
 Dnvykn1pd5nwfX8zXnGJaPrPvVklwLopf9B0InyNysgtTG/Hq5dpnMK5PhirkKQ36A0v
 1F+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Zib0GJPPCYGTBQXSJ2rOQOknJzzuaYVualwHxGmDGu4=;
 b=IDIhgjpGo64DsYRWFgURg5kR4IpeOApLCOJqArwklzY/udDRiOCtHS4F2Fjuu6oLNf
 AmyaS9ptuu4NgwHjh9Uw3+wK5TLuqBf1npFfr70DIQcSPCRr7JP9GJDwzCu2Eb1E8LPy
 vesLjcwluEAeYVuR74w+CmU+P+jRGlqkBCcwSYRrIBFVHBxM2Jdc96ngXbD3dBtiHT0K
 DP+GbQGstuRFShXj9e4p/QGeLfBoNvQkK4Mu2OoDn5BI5lCk7jBaYvJS5WC+O8if9WR6
 7rI07LULtc3riIVvRzb7B9yPHPgEkIx4tKv8YP+8wkG+LP5Cyz68hkBZh6UK11DDZ7ZR
 3Dpw==
X-Gm-Message-State: ACrzQf3WjyvX0ywFhIP9toaqzSc32VZINbRbaw0/jEMeIndEvbMTbqvf
 HS6vD1aG9koxMhZpAzwzjlqhAg==
X-Google-Smtp-Source: AMsMyM6LuetL41TqUBn229PKZOuZMFIFURKYmHqt6rhfY4r5pZouVfc2tfmKNPcNfcT4SXO14KbiAQ==
X-Received: by 2002:a17:902:b117:b0:186:a1fd:c3df with SMTP id
 q23-20020a170902b11700b00186a1fdc3dfmr608249plr.23.1666986400945; 
 Fri, 28 Oct 2022 12:46:40 -0700 (PDT)
Received: from [10.0.0.64] (180-150-56-70.b49638.mel.static.aussiebb.net.
 [180.150.56.70]) by smtp.gmail.com with ESMTPSA id
 p3-20020a170902780300b001783f964fe3sm814434pll.113.2022.10.28.12.46.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 12:46:40 -0700 (PDT)
Message-ID: <ec4c9fdd-8e42-07b8-7f25-a01affdac35d@linaro.org>
Date: Sat, 29 Oct 2022 06:46:35 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 6/7] target/arm: Implement HCR_EL2.TID4 traps
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221028134002.730598-1-peter.maydell@linaro.org>
 <20221028134002.730598-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221028134002.730598-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/29/22 00:40, Peter Maydell wrote:
> For FEAT_EVT, the HCR_EL2.TID4 trap allows trapping of the cache ID
> registers CCSIDR_EL1, CCSIDR2_EL1, CLIDR_EL1 and CSSELR_EL1 (and
> their AArch32 equivalents).  This is a subset of the registers
> trapped by HCR_EL2.TID2, which includes all of these and also the
> CTR_EL0 register.
> 
> Our implementation already uses a separate access function for
> CTR_EL0 (ctr_el0_access()), so all of the registers currently using
> access_aa64_tid2() should also be checking TID4.  Make that function
> check both TID2 and TID4, and rename it appropriately.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 17 +++++++++--------
>   1 file changed, 9 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

