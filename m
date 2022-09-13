Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CEC5B691B
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 09:59:11 +0200 (CEST)
Received: from localhost ([::1]:42302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY0p4-0000co-3k
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 03:59:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY0k4-0005WS-0H
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 03:54:00 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:35473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY0k2-0006bW-EC
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 03:53:59 -0400
Received: by mail-wr1-x42b.google.com with SMTP id bz13so19395285wrb.2
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 00:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=xrfnxUYIgI1nAMOL23PgzhXNENUmdhzD0FoYP0b24zk=;
 b=dizyFR2AocDiAWjlMhbkZjJpibLx0fRZ7bTEW9m0A6x0zDelY4wiB/azwDdNbLbM+D
 rn/cfqa9fEF5SvCxr8RwpOPPVXUz/UgJH5n54mkkYl4TVNuKAX/CZRWhms+r/YjpimCM
 s+p6UyOU/87mrs30yYlVYlm17+XiB+Dn81cy7jiOfcBXKuCexVblAJChKQW3nuK1sdyR
 K2nqMEQIPzV0w9IdUTRqhlV81EKSiL0U1f37fjbykSqQoINiXt3OK+szPtj9FE9Uox/b
 KbUjITXsRzorZVgFG+Nrc4nXERygWcBkOti1VuNUHcxwhO2U9A7HUYppdp5tzNvIJOgy
 b95g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=xrfnxUYIgI1nAMOL23PgzhXNENUmdhzD0FoYP0b24zk=;
 b=7u2Q3Nctc2HQr3+gj8wGkGshYe/DjnJ/WHJn4ZSeF31PpSx4vF1aFW83xAoerc81PC
 l0TN4z4hiO8/6a0urHT2RE0SwachLvVTZggCMnClxXkwEE6/ZBNPxSuaoZegBIhJ4y5v
 bQmdpGlxrFjR3luM3tLTbYrPyLT8TqmIo28ZgPrxGtgi/GK8J8KC7ljsl01Z5zHSXR4+
 4AOz96ts82gL0mgXv2p0TozPtX0BuCUYM8G3Cuwo0hSQVy0Gr+XOfKxCHb1oi8wqWe3j
 K/gjTSWmkG/tiBYyeqbP90albWqkpniYIApSHoYEwZ4bLDjSfHoGkGYMWR0zHhfUMlBG
 X1Sg==
X-Gm-Message-State: ACgBeo2GXmfr5LH8EwR3pCEciNysBgJDk3Eykm1czCLMM8A4UatzBjhB
 Ca1RfjPTVR9LPdMtqUkbAPz2gA==
X-Google-Smtp-Source: AA6agR7557C8G0Oa5zj+TcQNBUdcwXadB8eKc1Ud30m4tSN6lm8vMOrerWvYtTzBIHSuI3kotnSFbQ==
X-Received: by 2002:a5d:6c63:0:b0:22a:4247:1e7c with SMTP id
 r3-20020a5d6c63000000b0022a42471e7cmr10632385wrz.625.1663055636180; 
 Tue, 13 Sep 2022 00:53:56 -0700 (PDT)
Received: from [10.119.17.153] ([89.101.193.67])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a05600c0a0500b003a540fef440sm14672649wmp.1.2022.09.13.00.53.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Sep 2022 00:53:55 -0700 (PDT)
Message-ID: <cd5f2690-c9cf-5c4f-5e1c-01b63e87c56b@linaro.org>
Date: Tue, 13 Sep 2022 08:53:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 13/24] disas/nanomips: Delete copy functions
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>, thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 peter.maydell@linaro.org, djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220912122635.74032-1-milica.lazarevic@syrmia.com>
 <20220912122635.74032-14-milica.lazarevic@syrmia.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220912122635.74032-14-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.153,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/12/22 13:26, Milica Lazarevic wrote:
> Functions that have just one parameter and simply return it have been
> deleted. Calls to these functions have been replaced with the argument
> itself.
> 
> We're deleting following functions:
> - both versions of copy()
> - encode_s_from_address()
> - encode_u_from_address()
> - encode_lsb_from_pos_and_size()
> 
> Signed-off-by: Milica Lazarevic<milica.lazarevic@syrmia.com>
> ---
>   disas/nanomips.cpp | 3151 ++++++++++++++++++++++----------------------
>   1 file changed, 1559 insertions(+), 1592 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

