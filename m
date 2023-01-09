Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A57662C4B
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 18:10:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEvdg-0001ej-Rd; Mon, 09 Jan 2023 12:08:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEvde-0001dz-PI
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 12:08:46 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEvdc-0001Jv-VO
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 12:08:46 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 m7-20020a17090a730700b00225ebb9cd01so13455954pjk.3
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 09:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/kDw5do4OJo9qC4J/ERsOLAcitpyu9YKNp5iwCH1+xE=;
 b=jXawHFvB2+2ZxIJifSFGcrwCG7JRfKnA3ANZwv2ew78SFaNT0bcSRQ+dqq3aCF3/Id
 UF/VxrmiEjow8E6I+ABa7lZk7DlvQcCsDiEwpmvYntDF1zq19tEQufAqOJaISoI/Tu16
 HoupnQbtiiBgQuKSA2D6O05Wd4hXaJBW3W5eBX0cc16hHjN5cb3OJF4b7DJk+Kxqbs/P
 fBpkhlj2PMf6L0x3aMdx9rC1/TgcMbeQIAyS67zyVbC/rAQM7Kd/NgwdRBcihS8jB5/g
 fV/W2alt4mkDDr/wyl4FejxgJVCdQ+und4Lym27vMsHQd2NN8ViEbDqTPQdlkKQxybV/
 GDmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/kDw5do4OJo9qC4J/ERsOLAcitpyu9YKNp5iwCH1+xE=;
 b=WBcvybuVxg7+ixpwfLKzl3A12u6dZueii6+s37o+ovOmXEYEfqsyYF2faDaqKmdFF/
 srmcajn9juB5NT5vh8STV/yJSlF7siIIwhAfbjHzgaVizmL/SQwGKWHNtV0whpRBCJ7Z
 jb20rO6P/AG+Ad2h3Soj8IUh9lJsqsGh3EZpb86xWd0xmwUNw2s8oRrgs9HFjrcA0CSk
 +gGU1Rz+JxNaLxNb1nKwO6jBRDciR24im4IuMK6AZUc3MkLYD+wU8Drmar/xSVeg43NN
 ZrIyo7GHilFDNqiH6TVu6iupOzVnVi6Op4QtEQ9glent12BQ5iZINH3qYIumAMYWt4t2
 FK7w==
X-Gm-Message-State: AFqh2kol7cfkPWUqgUSz/BdcL+9ZqYCPrMVXw1J8SP80qxPhsrjHw6kC
 foDN1wVD9IkDkEYNDVljIeNeow==
X-Google-Smtp-Source: AMrXdXvDpo2p8ax7MOtG+c9m1CSC8oqTgNx5M4ezZcXZD1RcNBdsG2mxCW1XJ4qXDNEZfYj6t3Kyvw==
X-Received: by 2002:a17:902:ea0a:b0:192:6b73:ccee with SMTP id
 s10-20020a170902ea0a00b001926b73cceemr81573282plg.18.1673284123260; 
 Mon, 09 Jan 2023 09:08:43 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:a909:891c:953d:a6b0?
 ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 k18-20020a170902c41200b00190f5e3bcd9sm6417382plk.23.2023.01.09.09.08.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 09:08:42 -0800 (PST)
Message-ID: <3b1572bc-a178-5d04-9e55-95878bcb05cc@linaro.org>
Date: Mon, 9 Jan 2023 09:08:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/5] hw/i2c/versatile_i2c: Drop useless casts from void *
 to pointer
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20230109091754.79499-1-philmd@linaro.org>
 <20230109091754.79499-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230109091754.79499-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/9/23 01:17, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/i2c/versatile_i2c.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

