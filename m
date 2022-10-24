Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A84C060AF0F
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 17:29:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omyQU-0008OX-Oy; Mon, 24 Oct 2022 10:27:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omyQS-0008OP-Oc
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:27:36 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omyQR-0006Q3-D0
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:27:36 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 az22-20020a05600c601600b003c6b72797fdso6738105wmb.5
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 07:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GDE/r1Brx7xoFYOkAioRyGReOkGyeSf03uMCE/8gBSs=;
 b=jFxLkNvvPJQ7d74TVwn6lsxYZYmgaJELMnam67lhcDPr1aAFCJwKtUoftUYs4U6seu
 yEeodr2sM51a/CYIxyHN6yX7Ulvc3d9XeZHDeI33O7SRNzhwfCDq2WZpwIiHi4fgtPNQ
 /RALGypRbQVSRwZp+5kO4ezVGUtaLwhiu7/KmsUAYMjvDQB6zlG7PA2KPGqvZmthE0B3
 4bvVo776Hkluo5jbEpffaoobp7A1bh9KhZRAO8nigIeyMKLcdSLWdCXMNGHlwMZ/6rT/
 clqhXQdgb7+OAVN0U9/OkEq0Owr0QxekpUF/W366CsU1UCMPgAxsNwsH0RjftkCEwWXG
 EO+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GDE/r1Brx7xoFYOkAioRyGReOkGyeSf03uMCE/8gBSs=;
 b=p+uVEj3afICUwcEq4+Wp/2fxh5+tH96B9qvbXkY0yFgREqLuyzRmUCZ1AXlcB1oIOh
 rm7a2SkxTujUjl8LiRqw1ZBH4wF8OGD2MXA6kyY5XjAXS/3kBlQjWpnsJKoIbk7arYJK
 m412TsMU8SawKBg7qkw39zYLmBd6Znnz8NyjsXyZIqXYS4qBDJtCwZCA/0PdUoD7b28B
 wYVO6JDlWIRcQ4M3GRkeJZ3pJBz0hzp8F+QyQTB5TCGM7w8zfBPagoXDklYvoag/xzY4
 bUB15srgdRfFlqpAXQ72N+5VmfZxtcmeVdZ+WQc+UnfQhsrnDJyVcH+t2wGHFp+FXW2B
 zYuA==
X-Gm-Message-State: ACrzQf3Dpdfn+CDFWVtPKHh9cj5Ze7XFWKZDNUswqLzKJR7Zdf5/CrAP
 +EcsrXaiwOCzVqcULHsmSFYCbQ==
X-Google-Smtp-Source: AMsMyM7a7PXP2mBsZL8JmPfHss1rslafUIKfdmhN7+oK20rORXcug3F+3rjZvYxKlXYiGnZhA6VkEg==
X-Received: by 2002:a05:600c:4f10:b0:3c6:dcc6:51d7 with SMTP id
 l16-20020a05600c4f1000b003c6dcc651d7mr22669760wmq.91.1666621653653; 
 Mon, 24 Oct 2022 07:27:33 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 o21-20020a1c7515000000b003b476cabf1csm45028wmc.26.2022.10.24.07.27.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 07:27:33 -0700 (PDT)
Message-ID: <8aa7b602-616e-0e18-c7ab-4b7d2bd2fbdc@linaro.org>
Date: Mon, 24 Oct 2022 16:27:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH 03/29] target/arm: Convert to tcg_ops restore_state_to_opc
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
 <20221024132459.3229709-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221024132459.3229709-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
>   target/arm/cpu.c       | 26 ++++++++++++++++++++++++++
>   target/arm/translate.c | 22 ----------------------
>   2 files changed, 26 insertions(+), 22 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


