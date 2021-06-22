Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C425D3B0654
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 15:58:00 +0200 (CEST)
Received: from localhost ([::1]:35674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvgud-00052Y-SI
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 09:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvgtT-0003s8-7q
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 09:56:47 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:40800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvgtR-00018i-DI
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 09:56:46 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 bb10-20020a17090b008ab029016eef083425so1775161pjb.5
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 06:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=pYtnAtm09Tmv5uSDFvd+taC2tZNaSAKH/r3zUh8EQjw=;
 b=nh3tBAMYKrmODfsCl/E1Hw7UQjn/NygvYfdeX7JAZaEkhMeulJSFRO4aFXRsEKtRCf
 +89wYFXVgUSklGDW81yQJiXRsG9AX1rwAg+AHb5yInAeBl++ynxP3PG1vVo3FAnnfJ30
 w3g4HA7i/wy96Gan/RxLvWY0CBmkUJJyZE/J7sgOoqOywvXl728+1x42blITXt7ilR/m
 5adPC9ID0vSvpaaRlUMpwKbYQWhhdmHFfj0fqoMseBdkLPmzPSK59FbsiEsCkvLqi+2U
 J6ldoYHdpgzoZ3OfVs1BBBTCyrbMhfD5PFTEthCBNLvAMMppZXm7mMwhSJnoI6SlUssH
 HpaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pYtnAtm09Tmv5uSDFvd+taC2tZNaSAKH/r3zUh8EQjw=;
 b=qlEmp0awBd9PkZQhY+1YfJgX3QxMgNLZXAtiN4Ro+yVTmMjYu18tVKcJQ8H09Plird
 erRXIY8+B67XYLiiVg8qAd06ULDjadOrS0/1SirvYm+q6qJDMMg7OUbyVbEhkL40RFGn
 WB0DkJJoMso9TatPzesjuVay4BwwCryzhPG8fDmOW5BNM5SYMbrFnLDEpn5Uu6nJ6YUE
 VhAklalLfOngHQyenWJ5s8+ujqFowDgOK3MohA9cEWqu2XZs8NZw74L/MIEb3l/2gISk
 HG4fUVrq5OLBEOo/H8GFtYjrrB6mOzSxLWuxp02mUZl33vXTwmrTLzrtDTcyH5zJiHZz
 OB0w==
X-Gm-Message-State: AOAM5338WxJT1hAV3XOtG835M21c1OC8JX8EytgaFf79AoLi4PPM+nc/
 hv55CnUd/0Q7cnusHj8UGqnAHwcfG7d6Fg==
X-Google-Smtp-Source: ABdhPJw8lFB32rQVHEUllncdCITVlowj2iraiAJ9RciyhGc1y5hShterTSkYn7a5K63GCgfVt9qdcA==
X-Received: by 2002:a17:90a:520b:: with SMTP id
 v11mr4111602pjh.236.1624370203925; 
 Tue, 22 Jun 2021 06:56:43 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x7sm2380843pjf.56.2021.06.22.06.56.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 06:56:43 -0700 (PDT)
Subject: Re: [PATCH 17/28] tcg: Add flags argument to tcg_gen_bswap16_*,
 tcg_gen_bswap32_i64
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-18-richard.henderson@linaro.org>
 <f01808cb-0bd1-aa4d-f289-a59a4c281203@amsat.org>
 <a9972b30-7f01-5600-c942-9058f78fca2e@linaro.org>
 <ad351945-da73-39b0-eb5f-3a66fb25109a@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f47ece2f-299f-9560-59c4-3cace6d5f543@linaro.org>
Date: Tue, 22 Jun 2021 06:56:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <ad351945-da73-39b0-eb5f-3a66fb25109a@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 6/22/21 3:20 AM, Philippe Mathieu-Daudé wrote:
> Another I noticed is popcnt.

Already present as ctpop.  (Which is how we name the operation in host-utils.h too.)


r~

