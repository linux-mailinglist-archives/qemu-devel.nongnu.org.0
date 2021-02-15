Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C55FC31BE8E
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 17:14:24 +0100 (CET)
Received: from localhost ([::1]:39494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBgVz-000655-SW
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 11:14:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBgUC-0005ax-Dc
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 11:12:34 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:36833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBgUA-0007EX-PZ
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 11:12:32 -0500
Received: by mail-pg1-x531.google.com with SMTP id t26so4478685pgv.3
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 08:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=e8SZf6Jx/0a8Zmhi1kw48dXgS/8jxqDUPuPgQ5Xzm4A=;
 b=hOeVWBTWZ3BmHfDIyIozpfNAuBUBT7gFawHqg9p1lWx5GNbIIMjBmN68kVPPujSHSG
 8xyA6JofG7HoVSCoR33CeRVtrbwZN9F4hd+M9FfLZgzSaOehwitzqMgGgWdbJMj7h7XH
 vDE1wtYqBUNatcRvP0eJvdbQxfJh8ZA/JHuI0k4mhVNGtcwFDSEN/X5SQteE7ifzSC73
 S+a78Qw39YbmKKUzujYzZdKXecBybynKTpVlmWJGL113f0ILPRF68ET3aDPg4naSKTbC
 ypF+q1Kjuh5QXxW6Y9LZmzvT4bH4TlnIy9bRJpy5OY5OHANFXENwMeYn0lY/QxoHnVk3
 wX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e8SZf6Jx/0a8Zmhi1kw48dXgS/8jxqDUPuPgQ5Xzm4A=;
 b=uRZoi0vnwGGkZrGTk84xwZXcS0RlnGqB8SPLG3hpFjr+AVPy7fTJGXEHlra+Tga9Vt
 dryeoxaRxxwN9icrsxBnXvtoNdmzVdkIa4o4zArjAOfXGYJXXrv9qkF3AszhTgmif0Mk
 8qk6AJhI1+18YextwliX9vOD7NBpVVaZUrh0BXwwp2ddqTh/4VpwEnmiFoAEJ/4Y3rSM
 AsOa7FSGuZll6N+BJ4JSWu/Gq8aeCPWeF7MbukP/9XhbKKoxhalwcdGIXiDltDvUjchF
 qtI/v2P1XYAl2pTgpNnGjKCq7+evqpw4q2rYE66XFWDtr6C9xIdQXifmErsz3jTN9QUD
 yV1Q==
X-Gm-Message-State: AOAM532yu0RNR4TuBAA5ho1/HwexITWUht+crjlQr9YaFsjFLderWa1y
 e2lOY/h8lssILoZIZi8K/Y+wEg==
X-Google-Smtp-Source: ABdhPJx9aNmsiOzsdOlDIgfGjDhS35g/g0CLi0FfmCmaap9q5lqB+1Aa5tRJY9fkYTHmamoDZk2S2w==
X-Received: by 2002:a65:43ca:: with SMTP id n10mr39382pgp.430.1613405549236;
 Mon, 15 Feb 2021 08:12:29 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 w123sm18932851pgb.13.2021.02.15.08.12.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 08:12:28 -0800 (PST)
Subject: Re: [RFC PATCH 03/42] target/mips/translate: Make cpu_HI/LO registers
 public
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <835fd18b-3aa2-0bbf-b7a4-8c503992641a@linaro.org>
Date: Mon, 15 Feb 2021 08:12:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210214175912.732946-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Fredrik Noring <noring@nocrew.org>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/14/21 9:58 AM, Philippe Mathieu-Daudé wrote:
> We will access the cpu_HI/LO registers outside of translate.c.
> Make them publicly accessible.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.h | 1 +
>  target/mips/translate.c | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

