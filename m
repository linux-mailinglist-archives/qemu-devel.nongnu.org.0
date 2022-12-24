Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A3A655BD0
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Dec 2022 00:34:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9E0g-00061r-8j; Sat, 24 Dec 2022 18:32:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9E0e-00061N-ME
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:32:56 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9E0d-000283-1Z
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:32:56 -0500
Received: by mail-pl1-x630.google.com with SMTP id b2so8004501pld.7
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 15:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IvzvRtI4PPzQ+G3WKq2nCrpIImwB1GmLykd9y8MpBXQ=;
 b=JgEFcIv1jARKk87f0nQ/jUHdl7nnUQN5HnKXKHhu2d3BvTOGkUq7p1ZA+qM8YarFeu
 x7ojdkCI8/0xRymP9mEwvc2qVDzLBk4u/e4uVRFpxsJnO/IwZxQ9ABwn4p5i3Xj/Z7Tr
 q5QgYOOPBFP5JumhKV9z0YVNZAHuvaocYmER2LCuk+2Yx0exX04VJT0FsdLBxhu02had
 jgM2Gz5mgHdA1u3DRtJ6jbjMigWEG8Mps1J03KQ7yiihYd/RyDNBiSy9Qp/H0Bm9agbf
 WZ9397ctD/DdQ+y6K/EU733ZY9x/cLPrtEgQNu5NBuS/1sHSTEf2rhFXrGrtKk7Aq0yb
 hrVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IvzvRtI4PPzQ+G3WKq2nCrpIImwB1GmLykd9y8MpBXQ=;
 b=hAL6BHmXI0E4xpkKBFLjIDYrzZsfbdX36p0gRan4v3kRSKuJmb90fSqP42n6h5kGue
 s+o3V7qRwFe2BgqOGmEvXqH0ITSWyphW/FDuWZW7oqRcSebKbGjEp4ir6BHBaBiwiiQG
 rk6bduZbH8X9tTCGEhFDJZ2pqXs4/Xn4Vok750vj7dWPz+XjwD3XzJFqwa0J4jqcjoXm
 Imfk//RSx0iAOkKUGwlleeZEs9yWiLGPyRXFhr6LLSkIOOFxJUGEBsPyjDMUxV4kS+ms
 B9qywvlmvqatzDWzR8GkobJKxgDP3+O4R4PAr23lR/FPRLWKf9npDtsMUAR+9WlATp5K
 i+8A==
X-Gm-Message-State: AFqh2koVTgPGjp/L4nNi1h2K+PEOaFsQuqKuaxWe7AlidSfRidLlGnnw
 aCUoLTlJerS/QkzTJK+JXQmh7Q==
X-Google-Smtp-Source: AMrXdXsu6NOKqtQSdDNsg8nREHwf1glW4YRwvZVr1+wGvr9pkXUBR98UbmKwX04aPZVawg+ckMAPRQ==
X-Received: by 2002:a17:902:e952:b0:192:4ce1:3687 with SMTP id
 b18-20020a170902e95200b001924ce13687mr17602963pll.52.1671924773253; 
 Sat, 24 Dec 2022 15:32:53 -0800 (PST)
Received: from [172.16.2.110] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a170902f35100b00186b04776b0sm4587751ple.118.2022.12.24.15.32.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Dec 2022 15:32:52 -0800 (PST)
Message-ID: <94cf9f19-0737-ee6e-449c-7166ce0eed9b@linaro.org>
Date: Sat, 24 Dec 2022 15:32:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 0/6] hw/arm: Fix smpboot[] on big-endian hosts and remove
 tswap32()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@aj.id.au>, Igor Mitsyanko <i.mitsyanko@gmail.com>, 
 Joel Stanley <joel@jms.id.au>, Havard Skinnemoen <hskinnemoen@google.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Tyrone Ting <kfting@nuvoton.com>
References: <20221222215549.86872-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221222215549.86872-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/22/22 13:55, Philippe Mathieu-Daudé wrote:
> Philippe Mathieu-Daudé (6):
>    hw/arm/aspeed: Fix smpboot[] on big-endian hosts
>    hw/arm/raspi: Fix smpboot[] on big-endian hosts
>    hw/arm/exynos4210: Remove tswap32() calls and constify smpboot[]
>    hw/arm/npcm7xx: Remove tswap32() calls and constify smpboot[]
>    hw/arm/xilinx_zynq: Remove tswap32() calls and constify smpboot[]
>    hw/arm/boot: Remove tswap32() calls and constify board_setup_blob[]

Series:
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

