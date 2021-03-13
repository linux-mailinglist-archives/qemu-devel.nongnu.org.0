Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B0633A0E5
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 21:07:19 +0100 (CET)
Received: from localhost ([::1]:55186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLAXe-0003Yx-PB
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 15:07:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLANx-0008J0-8y
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:57:17 -0500
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:47056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLANv-0001xz-HB
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:57:16 -0500
Received: by mail-qt1-x834.google.com with SMTP id 73so6504145qtg.13
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 11:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nzvwLaTYDr/JRTnXGBonvQmeEGV0XK0G+8JYMZP4zhE=;
 b=HXGL8uCip9nO0yFL1AxJQY5Xr7rj0Xi94/Dpc4ueMiAHFs4I7uKtcHgn8oLYG5iid5
 uL0gBIdkryquDrcXTbMCE04iTiF7G7fgvzlJsITPHzVANZ4JZKaLh3gWP+zQ1OwtTtzM
 bHzLtsQu97iWVle1i3TVknMR1mIcl9yIojF3E+ADAIhTSI83p0jsxoxd27xTWH+VJLOi
 qeghKXL2DDtphwiEKDOaa027iO6z0wAPCQXCDCOvI34snIbeitC5VceuBm0SEf0Z+LTg
 QAMqxoZpw9SbKN28h4fuPFT5gSShdK1mulqmz53+YyBk4fu2MgRoqBfqTdXG0oGJg1bk
 Qrjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nzvwLaTYDr/JRTnXGBonvQmeEGV0XK0G+8JYMZP4zhE=;
 b=MU7+/V1oERX+xpkZvLaLz3zc73G/gTs//bMgY1jOcxo7jw40tpIfjlj8rFRQcQMbmA
 feQoVrnyZmuQE2f86jh89pcz23KymcgA/Db4KWQ+pBXbhnEmaH120LszsHfkPfxEOUP8
 8eGs5STXpBrcNj1NkCmq8he83ekRNY5BQ1fFBoVEXmXTGultJzqcbvNMyW34eLckX1nr
 D/YFntT0OYkJObdywTY4+eikcP3ZCWfJ9ZxyOoI1me7rHXsFdGFcGXTh9M8+DQusepQS
 XAG3yyW7+RKBEFTJhkj5+BSdbO+XAhSwQa8X3RJi19ls+1TyjRmQPMEmvtvBXOxuqfdM
 ia5Q==
X-Gm-Message-State: AOAM5328f5uGMK5Ujdgw6zSD0yJTbzYSjlBE9wzB+r2C6ae+gMxaS9J6
 tWdf6rbCBmX7hIIK4gSBw9bErg==
X-Google-Smtp-Source: ABdhPJzHOqSy6Y4gCfd4iKdSYbOlolLJ+s29aBIY6P3vsZBBO5v6FCIjCPvE8z14wpE1ohvBBknJsg==
X-Received: by 2002:ac8:5a13:: with SMTP id n19mr15875062qta.14.1615665434455; 
 Sat, 13 Mar 2021 11:57:14 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k8sm5128540qth.74.2021.03.13.11.57.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 11:57:14 -0800 (PST)
Subject: Re: [PATCH 04/11] hw/gpio/avr_gpio: Add migration VMstate
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210313165445.2113938-1-f4bug@amsat.org>
 <20210313165445.2113938-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fbf55931-bd56-e7cd-e4d0-98b96c27beaa@linaro.org>
Date: Sat, 13 Mar 2021 13:57:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210313165445.2113938-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x834.google.com
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
Cc: Thomas Huth <huth@tuxfamily.org>, Sarah Harris <S.E.Harris@kent.ac.uk>,
 Michael Rolnik <mrolnik@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/13/21 10:54 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/gpio/avr_gpio.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

