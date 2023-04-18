Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 683056E5F43
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 13:02:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poj6D-0000Z3-1h; Tue, 18 Apr 2023 07:02:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1poj63-0000Y9-OJ
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 07:02:03 -0400
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1poj5y-0002fL-8D
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 07:02:03 -0400
Received: by mail-lj1-x233.google.com with SMTP id r9so16063777ljp.9
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 04:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681815715; x=1684407715;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a2ezIgF7ksNqAWL/aBEaTHLMSzS6GAqNKwd1/w3H0RE=;
 b=Ta62o3feXsbTyM1MTt3vEsDz7/rnK6tgSphbvwQQHUAkIYKWTg8ddDxJqtNJm/WSJf
 dVOxBPgAmILC/q4RczOIUbsbjB9nLkRRyzYReipF/6soPeHjImw/I2c/SyIa4kY3xwSF
 /1O32aR4Bc27xrj4QXkOvBTTNanvG6nK/UhShKa/XNGOvWPApvhGHmZ4GPSuz9KdqgIP
 AqedeITpA/Hqz4r3Se/Mzl+VbyZDPgnYA21BSfeH4NITzwhuldF4z+y+fy2v+bOohLJj
 32gSX4Qn9bTJIvT1Bumpn1UsKgZvuGN4pwEuzT8MACakaQDcS+AghkOg6ORD5K09GIdS
 RB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681815715; x=1684407715;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a2ezIgF7ksNqAWL/aBEaTHLMSzS6GAqNKwd1/w3H0RE=;
 b=jeQ3+UKCBljILNHa1GDgZzTU62pQZQ3CTPFE2ylm39/2NoaihrpGuniPsHvOmnQ9B+
 CNfwZG/5qpA+dQma5pHogfBY1/+zt72xjgZO6CmvYa9v+Qd8Nt+2oYLiLO2FLprx6Dg4
 F+Yu+xw0MxYfOdc1G6dyFNCSyJyGzjNOzPg2T2VcxR8HDghx5x+77Rymv7a9SJ/dwu6s
 pnd+JKgNBgqqJijHbebrrPz9ma4BAA334r/19+1nUvCxIjGoUf47SCYxqbJoDzwljSWC
 v3aoOP1bLPFehhR5HXdS6rpfxsvvso277pphPHxIlQfrjTMGThvkQcJpCOKyp8VlV+Wn
 NtGQ==
X-Gm-Message-State: AAQBX9eRlnTh/chrfefKINGtTfPVnVV3Dj9YVXetjq2hFRugK+8MHOMo
 EHb8xmcADVHElmsDxniGYaL86Q==
X-Google-Smtp-Source: AKy350aSg8OZYbMKrKuH/e66WSyp/sEC/umVV1iVuE4Nj29P/tv8u3Vdgry9m2BN/5PKTQZY+WNquQ==
X-Received: by 2002:a2e:8ec9:0:b0:2a8:a65a:7313 with SMTP id
 e9-20020a2e8ec9000000b002a8a65a7313mr619831ljl.31.1681815714956; 
 Tue, 18 Apr 2023 04:01:54 -0700 (PDT)
Received: from [192.168.58.227] ([91.209.212.60])
 by smtp.gmail.com with ESMTPSA id
 l20-20020a2e7014000000b002a8bb52d994sm1352190ljc.25.2023.04.18.04.01.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 04:01:54 -0700 (PDT)
Message-ID: <836a4c35-9e1d-c067-cb2f-76ea93ccd53a@linaro.org>
Date: Tue, 18 Apr 2023 13:01:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/3] target/arm: Set ptw->out_secure correctly for stage 2
 translations
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230414160413.549801-1-peter.maydell@linaro.org>
 <20230414160413.549801-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230414160413.549801-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x233.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-2.284, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/14/23 18:04, Peter Maydell wrote:
> +        /* Check if page table walk is to secure or non-secure PA space. */
> +        ptw->out_secure = (is_secure
> +                           && !(pte_secure
> +                                ? env->cp15.vstcr_el2 & VSTCR_SW
> +                                : env->cp15.vtcr_el2 & VTCR_NSW));
> +    } else {
> +        /* Regime is physical */
> +        ptw->out_secure = pte_secure;

Is that last comment really correct?  I think it could still be stage1 of 2.
That said, the actual code looks correct.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

