Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 723EF3DBF4A
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 21:57:24 +0200 (CEST)
Received: from localhost ([::1]:36840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9YdH-0000GI-A5
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 15:57:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Yc2-0006t3-WD
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 15:56:08 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:45003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Yc1-0001zP-Fi
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 15:56:06 -0400
Received: by mail-pl1-x62f.google.com with SMTP id q2so12331179plr.11
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 12:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=YQE3Wfquu1SWYjujRssERskWh9d7byGGS8GgPP7liIM=;
 b=hobZt9cQXGdtFapw+QZdtyPMf16lJCdjLr88MJRm/snDAfUKw3SYduniBZ1rW5Y0Vl
 9Dy4fEAr8u0nsN2Ctq9yMYopruF1i1xNF7H2ZGIcqccuZQKYrlPi7+mO6gMemv96NefU
 3jp0gHpJTGjwoXyOtft6MJ4n8JnHuC/85QFKlQ7S1vHyJW4PXb3lguPO3RhmjYY0mYgi
 fR9vdJYEvshFRY7wCCl1gBloSUlihH4vqpx+m3QFJzb+0p3JAC9HsFVb9baqERdgaxR+
 9bWeaMNmY37l7WopDdnB2gnGlm8v+G4fOJgK1zyvAF8O1MKzoxuiNqqkBxsW1HEzXqzn
 qc7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YQE3Wfquu1SWYjujRssERskWh9d7byGGS8GgPP7liIM=;
 b=r6aCM27oN9uaZpUyxs3N+WBDtoqJij+ctkhiMnUN+CjQflE8vwTulUw/SY+4LTJDtq
 Lnj9mCZaiPowfAIu04a+MDKBNSgn/br/IuRZWT7Hw45BbcThmq5yz3gXvmSgXdtuwtOB
 lgMQ/fOgOhZ4hepweOPFap9eC3kedZtAxGppyhpX8qZ+5NFenP9TQz/aH3EJMNAIo6Ss
 50V5uwKSqEw92wDWAyVUcq3AmrtxyEX48dHVqo+L+/W131FWvwJXvFLidDzikAou8XQd
 D16pxjsG76PcG69FeLO46d9hxzTGGzISUQefvcbi8n7Q3OjZXenRHYOaKk8blWsF4kmM
 HzVg==
X-Gm-Message-State: AOAM531/QqqVjFK8SFoZmnl0YnS5JsRks6vBwlHVETyINLuNHtLoWsWE
 TSFkgNAdKKS735Hmtyo5hf8XcShFUpitgA==
X-Google-Smtp-Source: ABdhPJy2pIjr3Tuu6pzqBAPUZ+s2X8GDOpRLjuNnDFVqsyw4c4JV3HPZX7NuTZa+mFPUp93sHgnl7w==
X-Received: by 2002:a05:6a00:1627:b029:333:323:2c04 with SMTP id
 e7-20020a056a001627b029033303232c04mr4443495pfc.78.1627674963211; 
 Fri, 30 Jul 2021 12:56:03 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id y9sm3731688pgr.10.2021.07.30.12.56.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 12:56:02 -0700 (PDT)
Subject: Re: [PATCH for-6.2 42/53] target/arm: Implement MVE scalar fp insns
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210729111512.16541-1-peter.maydell@linaro.org>
 <20210729111512.16541-43-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <11bbd4fb-869b-120a-f431-7b3910b9900c@linaro.org>
Date: Fri, 30 Jul 2021 09:55:59 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729111512.16541-43-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
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

On 7/29/21 1:15 AM, Peter Maydell wrote:
> Implement the MVE scalar floating point insns VADD, VSUB and VMUL.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  9 +++++++++
>   target/arm/mve.decode      | 27 +++++++++++++++++++++------
>   target/arm/mve_helper.c    | 34 ++++++++++++++++++++++++++++++++++
>   target/arm/translate-mve.c | 20 ++++++++++++++++++++
>   4 files changed, 84 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

