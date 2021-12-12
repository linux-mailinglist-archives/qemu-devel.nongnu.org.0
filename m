Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16ABB471CF9
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Dec 2021 21:37:46 +0100 (CET)
Received: from localhost ([::1]:57464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwVbM-0002f0-U3
	for lists+qemu-devel@lfdr.de; Sun, 12 Dec 2021 15:37:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwVZ3-0000ti-GP
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 15:35:22 -0500
Received: from [2607:f8b0:4864:20::530] (port=36527
 helo=mail-pg1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwVZ1-0004oz-Ec
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 15:35:20 -0500
Received: by mail-pg1-x530.google.com with SMTP id 200so3965729pgg.3
 for <qemu-devel@nongnu.org>; Sun, 12 Dec 2021 12:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZjsXg/AdaNT8UNAL+8owMlzcz8Ut+qb4zCi4vr4Aew0=;
 b=F+YIfx49uq1ArPNxYqbfXtipvTb35+MP1+kTguIcJHYpWhYXywyJfQlOFbhWU18uLF
 3Tam6DNC5EtcjLvandwu/KKcYS+Fo03BaxvfchF2xGHLKN3IEl+PVoIu6MYucBrlpEJ7
 3UKfC5F0Z/9Dzy/y/FAl+ODtG8ubzyOFYWMLYhsGsGNSfXf+73koi4SoG8hwS4E4NKmt
 sA5yMPHvcemM1F5luUzlZXt73UtuIacCAqXoKlCo2noqKbt7Xr413ebnp+RY+ygXNgDH
 m+5ih/ReR/lUpTAS61DrwRQySjOAWEceaJpoBbHoYGMKPW0jEHViMt6JBwducHY7/94w
 mPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZjsXg/AdaNT8UNAL+8owMlzcz8Ut+qb4zCi4vr4Aew0=;
 b=Hy6vyCcJi6XBCi6nT5U+sCId24GQtMN27DAI0ciGBTGf++PLAowpV2eLke15UKKdv/
 z5Ynb06Yj3SiPlfn8Rfe94VtjJtfibuxENLMkCvMJziu1zeKpccF5tTkBfl6D2bpXOpp
 daAt1WnIRksfrP3bba152m0Vz8r4ZjvETXtTn6JihjW4A27xF/TDQvX5qGs/SqQzSALg
 zvVQulef/sMbx+251dPD9PCf6h2qV6TFnCMAZZlaOjTc4giXnehGiqSnYyRiU9rzFhv1
 NL4brGB6WGWaVACZgw4xqDBhhTEOFTrBcqcDuPtpyfgzyTrKiL8z4D0HaYPjHjTMgsKw
 6D/w==
X-Gm-Message-State: AOAM530ORQGBaJoVB0JW3LjQ4lAYOLwtd5rVHh8vcZXsTdRt31aqSqi2
 CEx0Nq3st3NnsB5tqnFnL80p0g==
X-Google-Smtp-Source: ABdhPJyCxgH4wR2WQYrIC5XwYb7M4nIPYvbhx+jzziv6Ofv7QDYjSGMk8xGfpTTHy2sXqns6WVgHJQ==
X-Received: by 2002:a63:2c10:: with SMTP id s16mr15149506pgs.173.1639341318166; 
 Sun, 12 Dec 2021 12:35:18 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id 12sm4754277pjn.16.2021.12.12.12.35.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 12:35:17 -0800 (PST)
Subject: Re: [PATCH 13/26] hw/intc/arm_gicv3_its: Use FIELD macros for CTEs
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8ba521f1-1080-9f24-e21e-3587f6f44c0a@linaro.org>
Date: Sun, 12 Dec 2021 12:35:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211191135.1764649-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::530
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.051,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/21 11:11 AM, Peter Maydell wrote:
> Use FIELD macros to handle CTEs, rather than ad-hoc mask-and-shift.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/gicv3_internal.h | 3 ++-
>   hw/intc/arm_gicv3_its.c  | 7 ++++---
>   2 files changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

