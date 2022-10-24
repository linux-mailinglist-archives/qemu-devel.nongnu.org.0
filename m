Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E8260ADC0
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 16:33:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omy4B-0006TU-I9; Mon, 24 Oct 2022 10:04:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omy43-0006T3-D1
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:04:27 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omy41-0002Iu-T5
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:04:27 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 bg9-20020a05600c3c8900b003bf249616b0so6705226wmb.3
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 07:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rQQFWTTA3SuIv2qTWhkcBBw4MVt66FdHUncJdsKlsBU=;
 b=UywHe3ocNZANSorRjB9Khv0dh7cr6nIhkyNyNWQjs5iCo8c9MS/7gRGQpy9/OcloNu
 0DHu3AhY85jlgwOcbO9wGHi/h6nM0dsqK7LuYZdkKA2fxVNK++zT/NsQ34Qek9qWNpQB
 HRiMl4bnOXBB1D/dEfPWdtxzs9JjUn6GAZgTtzHTaBsS3SumrM3fWY61A1YlZorn6M+G
 UK9m9Z4QDjAHt/17+tRAZtKVyCQtKpDvy3Gn/+QeGfnr6Bz/TcZutNt67+aiWPk5pYtQ
 qRiwOj6qB77F7r4w9/RYhOrhj3NS+lopcFGlcGmiGUOG9CAgGSvTPqrdOx0R6o7v3Z+i
 lWdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rQQFWTTA3SuIv2qTWhkcBBw4MVt66FdHUncJdsKlsBU=;
 b=r+1p2jF7q6aCLiIf1/DiDnyVVlEDgc48IB/pLvWl49OC0GR02ZtLfpwFgeIeLguVKu
 YQezi2hs9SV292TTxtihZ3TLPISWXbklygMXJTJk2CznnvXa/6pfWID98d9qUiuTdGle
 5XTiUTgZwhUwpsL5cedIoOVy3x9eREhJdjQsgY6aNn729C1LUTxYFlR8IgQcwnS0z+7D
 0U1cIIi8hRnxQ1wxCZ2gTM/KDg+Def1SqK+wFj412pMU/i82VJYk+abemw7Rxp+RKfSL
 e/v8N7RBwW89yVF99/JA0t0MefKwLY6wjnpIJ8Hg/LKbpjWUDRx51gbxLK9WukLnp90s
 /oAA==
X-Gm-Message-State: ACrzQf0CLzBYIweQzDuvUZZmHegSO89qPqqgJSuGgvqaDD0Xc4T5TYAh
 h0DAzeyBny5YPf1BHOIiDo+UmBGpWDYh3A==
X-Google-Smtp-Source: AMsMyM6XFMzFUfMWAbKTiXgZI7mV9BM+r9uPElwPYeP1WFNYihiR2tuePVIYrg18GZqvW9Cx/aWxxw==
X-Received: by 2002:a05:600c:258:b0:3c6:fe18:b45 with SMTP id
 24-20020a05600c025800b003c6fe180b45mr22582232wmj.8.1666620264295; 
 Mon, 24 Oct 2022 07:04:24 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a5d4e8e000000b0023655e51c14sm8816883wru.32.2022.10.24.07.04.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 07:04:23 -0700 (PDT)
Message-ID: <34e25132-12eb-250a-5e73-35f29e62f640@linaro.org>
Date: Mon, 24 Oct 2022 16:04:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH 21/29] target/tricore: Convert to tcg_ops
 restore_state_to_opc
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
 <20221024132459.3229709-23-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221024132459.3229709-23-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 24/10/22 15:24, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/tricore/cpu.c       | 11 +++++++++++
>   target/tricore/translate.c |  6 ------
>   2 files changed, 11 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


