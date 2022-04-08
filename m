Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FA94FA03C
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 01:47:10 +0200 (CEST)
Received: from localhost ([::1]:44302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncyJp-0006gd-1l
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 19:47:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncyHp-00054l-Be
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 19:45:05 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:37563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncyHn-00007p-OM
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 19:45:04 -0400
Received: by mail-pf1-x436.google.com with SMTP id bo5so9747590pfb.4
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 16:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1ydNvS9zmRs9Yj1qePuBxPZg2FBsoA/uUOe+zJQ2BPc=;
 b=IHboVxCZW14F3LouY393xMKHTxaIRssncQDjWxwxEiyBDcH/3YNm1Cs2g+inmp1Ota
 OZxiUgnVtfCYUDqQ5lLIKpHpBQQxAbaS5E73QkrV2XfdoRUn6arUvtSsi8Cn7NBwr4Ry
 7kw6CnIp3qjKqTVOSiAQE+Gqpbh4zlOEjQalELTIIrqLc4u4qfyUDXYMglBdWBq3W/x5
 8yqjotnGpA6M0IG43cZuBYxBhgGSf8SW+ae22gH2O6qycbqprjH6nLociQidbxwo910t
 gCZ31Eb4hsoIfP7IK0GQaVoRoHubZUW6G22ZCuBJGSsWU7pU88pmi+/BWKNEkFHGkk/S
 kCSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1ydNvS9zmRs9Yj1qePuBxPZg2FBsoA/uUOe+zJQ2BPc=;
 b=eNu86RNrk/8tytJWM+BYIVIee7tq5I+SMvsmKKTwjejRvOFwuckrcHPkatDqhXCGJV
 NCPPr9zAaOYI7xPah44osyyqs1YfH5b2QIjqd+L3nfNrv4k95eeEcaZChojU7oUbFrU1
 aWkpHsIqTHaUTLqHJxoDIW/KVKxda8lIsg7KAvEZD4+SAq9NIWQVkEXY35pAIeznKzmO
 Pmtm+bE6pwWqdwjYC0t9nrRCw67MucxTP3TPEll6Xa67wavJktFbuRGY5cgnOI3gTIUO
 ULvjM3ZBWZE7yw2sHFRcb7MsC/r44qHRO80/bVk8je5f6Kzc+XMvK5PvsKRJNni5ilIW
 hfhw==
X-Gm-Message-State: AOAM531AyVMcidZ1FrZe8ykqC4abb8/D8oFaRQ0bwuTxHkVt4FbemDuU
 ZWLTn2awtM7P/LfjMsmSaKhPxg==
X-Google-Smtp-Source: ABdhPJwdFnsjixObdEhitl2j/SQpEP1zW62rrmN4Cv7dgoKGQVF8SQbPWm8hPoDCfp4gWFGJkTkdDw==
X-Received: by 2002:a63:dc42:0:b0:382:6aff:3f17 with SMTP id
 f2-20020a63dc42000000b003826aff3f17mr17495177pgj.5.1649461502276; 
 Fri, 08 Apr 2022 16:45:02 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a6541c2000000b0039d1280084asm1009117pgq.26.2022.04.08.16.45.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 16:45:01 -0700 (PDT)
Message-ID: <dc2089c2-470c-7ccc-99c4-c4b82b61c94a@linaro.org>
Date: Fri, 8 Apr 2022 16:45:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 06/41] hw/intc/arm_gicv3_its: Factor out "is intid a valid
 LPI ID?"
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/22 07:15, Peter Maydell wrote:
> In process_mapti() we check interrupt IDs to see whether they are
> in the valid LPI range. Factor this out into its own utility
> function, as we're going to want it elsewhere too for GICv4.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> index f8467b61ec5..400cdf83794 100644
> --- a/hw/intc/arm_gicv3_its.c
> +++ b/hw/intc/arm_gicv3_its.c
> @@ -79,6 +79,12 @@ typedef enum ItsCmdResult {
>       CMD_CONTINUE = 1,
>   } ItsCmdResult;
>   
> +static inline bool intid_in_lpi_range(uint32_t id)
> +{
> +    return id >= GICV3_LPI_INTID_START &&
> +        id < (1ULL << (GICD_TYPER_IDBITS + 1));
> +}

Ok, I guess.  Though there's no need for ULL, and a 64-bit comparison.

> -    uint32_t num_intids;

You didn't have one here, and GICD_TYPER_IDBITS is 15.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

