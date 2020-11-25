Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E82C02C3AB1
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 09:13:30 +0100 (CET)
Received: from localhost ([::1]:42986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khpvd-00033i-Oy
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 03:13:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khptq-00024N-TN; Wed, 25 Nov 2020 03:11:38 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:52720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khptp-000198-E7; Wed, 25 Nov 2020 03:11:38 -0500
Received: by mail-wm1-x341.google.com with SMTP id 10so1167534wml.2;
 Wed, 25 Nov 2020 00:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Yza3QuMv9Til8gM8mBpOwRdYCHxSnYnR29n1qkHbTqE=;
 b=ROZ2RuIc/PSnh91d6c3JUZIbpndVbguHLFl5BcA31Uu9SMms+SmRwDRt/T4kAxQF8T
 v3UGvg3855HULMc6Svr7UQpMItsoQn7yeK4f6yRhPPe8azFqSFoOS+PqMn1me5Pqgo5R
 STNpQ5lcAJwFmqIJG9IpXZMTJUc4fzv8KkU5DK5j9aLwOUHCn088xxQyVp/I+yQe7rVD
 9kW4i2Axqvu8M4KKY0U9g2BPEy/yN2EMvy+y4ckBaMetk6supArIwbVQplZABZhMTcWJ
 0Cls2kcbp/msX5ru8TRvusiQrsekmMR2w7MWHA0/GyNVB5FABBzn7HwScOvmx0/FPQgi
 9wYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Yza3QuMv9Til8gM8mBpOwRdYCHxSnYnR29n1qkHbTqE=;
 b=LEMCOL4JNQKW/zTRaEgGu1IU/Ot7VZHmsgdBuUiTwng9ch6AjNy1baFdTXJ0mkB3wQ
 zjndXZoX0TjojRn1JNeSRTFTCtaTh/Vu32T4lz6+Eku7y6fIhTwlWgZ4NXBPgKiAxtXz
 jqjL8KWR0dR7ayH/1X/tqmeYNAxvG+nZ9VSC3okwwAr7wSnVsuOhYZKBCcYAM+cSHXRs
 fB+V9AtHOag6CTCBr0DSsuO1saOo1EA26qfN9Obf5Is8OsYljMGnjLTBwFeknW+R9hKX
 ilsN8WALxBd/fAY1tjpkDtqJlB3enjaLdvLWNSCrwsGo4J0vcYgSnqX55yuOO8WkN1sy
 sajQ==
X-Gm-Message-State: AOAM533Bwr5ALf77FR0RAYQtIpIG4wWmE191BPC3wI6Z+PLoBbKneP3W
 hIG0IyX0dAGxOqql2X4wYZGxg0/JkvM=
X-Google-Smtp-Source: ABdhPJwCmi9b224Bydqji0MD9mzMYzRCcARTvCTupCeJgDGmIb42xyY5igRfnma+dAzzw7/CeYQWlw==
X-Received: by 2002:a1c:5f08:: with SMTP id t8mr2441149wmb.84.1606291894806;
 Wed, 25 Nov 2020 00:11:34 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id k205sm3360243wmk.4.2020.11.25.00.11.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2020 00:11:33 -0800 (PST)
Subject: Re: [PATCH 01/11] target/arm: Enforce word alignment for LDRD/STRD
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201125040642.2339476-1-richard.henderson@linaro.org>
 <20201125040642.2339476-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3db6fa76-89d2-8775-e19e-c58f57eb7abb@amsat.org>
Date: Wed, 25 Nov 2020 09:11:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201125040642.2339476-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/25/20 5:06 AM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

