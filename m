Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FADE7014E8
	for <lists+qemu-devel@lfdr.de>; Sat, 13 May 2023 09:20:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxjXN-0006Xl-AW; Sat, 13 May 2023 03:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxjXK-0006Wr-Vv
 for qemu-devel@nongnu.org; Sat, 13 May 2023 03:19:27 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxjXJ-00044x-Ge
 for qemu-devel@nongnu.org; Sat, 13 May 2023 03:19:26 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f50020e0f8so1685295e9.0
 for <qemu-devel@nongnu.org>; Sat, 13 May 2023 00:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683962364; x=1686554364;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=45aae8tnLMksqtPNbsyOpxbPox1Tvje60TD0OVw8ET0=;
 b=JgyT+zaPJmlwMaIhKA9YJCvahsFQc1A34sc5xz9QzY3zdpyNWHJeRjk1Lx3CwmCfPz
 BNlLu+a/c/yhRDGYTWSbfHJY7MJi5ayypqjUT3TPosjLxn/IgnZt5LR2fHDt9w62tW3L
 UL9yKnc8xQpFsNAuoWlEYWPC1Y1LHSBWi6eF3wmPRVjOHHuq50WGvE7IRuVKIBSWu64E
 TACGPz0Qgh4xeMh6Ur9NPs6r6XRUVN56p1BwEC1NUrQ+ey3X+iAp4rpZ3UX2bHQpUK2T
 R+5shQnDW0r1VIdiRV8nVJhuyI8XGQcj0PHe3kEz/VpUATD7f+rxz3Kjh91WyZNbQc0L
 W3Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683962364; x=1686554364;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=45aae8tnLMksqtPNbsyOpxbPox1Tvje60TD0OVw8ET0=;
 b=M0npDW9UlviymjWs6RwDFlXZpXCR8siNeEvHcqQnR8b0sjwdhBVOj2gp8iHTwpiLii
 HEpqw0RAvXDC2lhrjBlSJ3yNB4v/CwP5XFl6zmX1n8m+rVQdjHljzqUFHFAUCjaV1lf0
 x6ISufrafirg1HBBIvwT4EbgO1z0OXyp2WOZ3w81CZxdGRmQkwNvbmrbGTP/fFGzWgd1
 tt/5k5w+0A/l13SXZf3DFzI9tKmNT4en+HGPxoRaoZLE5zt2ROit2BJEro2A6YHtOJLb
 tFwXN5ovShYmcMqEx0xSik7Mp/7gEL7grVTMg/ufQGz6mSkd2YsY6CNf+VSEbZ8LaFX/
 +6DA==
X-Gm-Message-State: AC+VfDzhAX3c+xv87vGANrTJV0k/NcnSXRIRXir6hWd6iBEKfX/R+JtT
 qcYMfiIKwk4dRfUDi/A6bO77v2aMwzNXEhC5o2NM+g==
X-Google-Smtp-Source: ACHHUZ7Zr7QO9scbKHmYZqZtxieyinLJ1MxcHjWbOoxaSWcqXT7FO10fvfGwt/sD+x7Ki/aXSMNQmQ==
X-Received: by 2002:a05:600c:2294:b0:3f4:2a69:409 with SMTP id
 20-20020a05600c229400b003f42a690409mr10353983wmf.11.1683962364121; 
 Sat, 13 May 2023 00:19:24 -0700 (PDT)
Received: from [192.168.190.227] ([83.98.42.3])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a7bc5d7000000b003ee74c25f12sm30760109wmk.35.2023.05.13.00.19.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 May 2023 00:19:23 -0700 (PDT)
Message-ID: <39f6fa21-59d2-5b80-b235-2d5116759b7a@linaro.org>
Date: Sat, 13 May 2023 08:19:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 13/20] target/arm: Convert unconditional branch immediate
 to decodetree
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230512144106.3608981-1-peter.maydell@linaro.org>
 <20230512144106.3608981-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230512144106.3608981-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.845,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/12/23 15:40, Peter Maydell wrote:
> Convert the unconditional branch immediate insns B and BL to
> decodetree.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/a64.decode      |  9 +++++++++
>   target/arm/tcg/translate-a64.c | 31 +++++++++++--------------------
>   2 files changed, 20 insertions(+), 20 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

