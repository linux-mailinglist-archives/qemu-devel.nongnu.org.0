Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D41482CFB56
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Dec 2020 13:50:49 +0100 (CET)
Received: from localhost ([::1]:49924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klX1U-0002uU-Uh
	for lists+qemu-devel@lfdr.de; Sat, 05 Dec 2020 07:50:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1klWy1-0000c5-SL
 for qemu-devel@nongnu.org; Sat, 05 Dec 2020 07:47:13 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:38593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1klWy0-0005h8-Cr
 for qemu-devel@nongnu.org; Sat, 05 Dec 2020 07:47:13 -0500
Received: by mail-ot1-x344.google.com with SMTP id b62so8011885otc.5
 for <qemu-devel@nongnu.org>; Sat, 05 Dec 2020 04:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=y0i4sd4jyRSMJOAt5fSmRA1kyI+sbU2giBDSkTi2/ts=;
 b=i9BU3SGcy12FOB11lRoJFhkQUE93GdQ//gjt8erv9oZc6tUrvPur37utWiyytd08jz
 Nq6TrRDL0pwXkidrAPn43Xbygy8MeXWL88ulPXmHc/lddRIy7tP6xOphKkBiVptD4x0M
 MsFUoLSnImRXPDBWnxkgMaitqWOtvjriuVnpS4N7xch1AT8vBQp6aMwKEQax+H2uzDN1
 4GthyjxqtuVLtwVgVbeLrqbtxTz3GSckacr53m7q5/W2Uv/bkf8p3sil4/QuzT7TNa1d
 Exf5MfxBFniuW/vPN0ggoBIWnzRnX4dIO3rqDyjM1vHqELwh1DL22uML/yWE2IwSX9mW
 01ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=y0i4sd4jyRSMJOAt5fSmRA1kyI+sbU2giBDSkTi2/ts=;
 b=kdVFr1ct2datR3JQBCScm32AUEG2iSNstt+Fx7hP8sMx/psUv4Zotf7XZfbwU3CHJ9
 iaNjS7vZkmWk9WUaCtAi1J9EDPdhsiDXu9q1P45ItU0UVfNOIpwobvI0S/uk0R/KEwhz
 wywe5RHggCaS+qXgLYr/xjJhZH8kbTdbsUGaEUSOIQK6L5moqVIiTzDb1oxXpW3dP1a/
 8ftuMjAt4deLACMJbJoWD2qGDVTgjpgE8cXvzVJDIuum7XiITJY3j/SHWPjDZuinRf/a
 oM2oMGYX5jOXQwp8RHJLDSSaUO6IaH+4kZNNOiqpYiKQHMQqjhjugCW6wnYPriGR6U4f
 IVHw==
X-Gm-Message-State: AOAM530jI3VnXe55rOCp6v1Ffr2zs5c/MPoce2uhd1QOT4SJrlHKGoUP
 0192zassiNJpGno4f3CrksiMoQ==
X-Google-Smtp-Source: ABdhPJxXZIA5RTvskfQHPX8ne7VlWQbWXqHjW+eeLH2c4O2N/w/8RTSgYvrNrZyMQ3FUB5pJOv1PJA==
X-Received: by 2002:a9d:b8e:: with SMTP id 14mr4959869oth.316.1607172431238;
 Sat, 05 Dec 2020 04:47:11 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id q127sm775359oia.18.2020.12.05.04.47.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Dec 2020 04:47:10 -0800 (PST)
Subject: Re: [PATCH 2/5] target/mips: Introduce ase_mt_available() helper
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhc@lemote.com>,
 qemu-devel@nongnu.org
References: <20201204222622.2743175-1-f4bug@amsat.org>
 <20201204222622.2743175-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e394bcf8-3028-8f27-2225-df2cb68d7e26@linaro.org>
Date: Sat, 5 Dec 2020 06:47:08 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201204222622.2743175-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x344.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/4/20 4:26 PM, Philippe Mathieu-Daudé wrote:
> Instead of accessing CP0_Config3 directly and checking
> the 'Multi-Threading Present' bit, introduce an helper
> to simplify code review.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/cpu.h        | 7 +++++++
>  hw/mips/cps.c            | 3 +--
>  target/mips/cp0_helper.c | 2 +-
>  target/mips/cpu.c        | 2 +-
>  target/mips/helper.c     | 2 +-
>  target/mips/translate.c  | 2 +-
>  6 files changed, 12 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

