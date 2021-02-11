Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4D0318985
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 12:36:40 +0100 (CET)
Received: from localhost ([::1]:60920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAAH1-0004sm-Jy
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 06:36:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAAEu-0003gD-IP
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 06:34:28 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:39139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAAEs-0006Ey-QP
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 06:34:28 -0500
Received: by mail-wm1-x332.google.com with SMTP id u14so5391800wmq.4
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 03:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=azktiaDjBQsCcpmk+umidSUIfIBfS7Kx3y9tSJ3VfUo=;
 b=pvKintE4jXlTCbdqD7aUOM8XyhKvvSsIHZ8r9rVEkH/BU4EP9T8oDxyNOHOqhoUKQt
 uWpxZ1VjTdBXaP/3hSwF3e3vNTd7HHcQh1owp+LdEIJgroCsNGqEpCVC+8dhp7vEVsGY
 i3fZDFu7kG9m7twdPmtqm0Im5GKTMwx8h2lmzZl7FUhN8GIUDoqVwEi7amIo9Y5dyqCU
 i2vzr/N/90FGXqmmSx0qcZBtrdzNuGQNCOxXYl5ctRmBp2LnYTFIGGZI4ePwgXK1ZbLq
 AikhRvmmMaxafCNzTcBUzTAQsMRc77ZY4dZa4wwLyfZqQeqCgQhBdlJGql19ErBPzyy9
 9H4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=azktiaDjBQsCcpmk+umidSUIfIBfS7Kx3y9tSJ3VfUo=;
 b=Dot7M1Ts4O8L/ucG4WIANP7Mf/j1JsrX/PnidWxWCRvIMBZKThINsNZc2BvKGFyBeW
 uiEYl7qPfX19ot5PehMz4p5AR3l27cF29F1n2xJPJfuHXRo3vFCFT1C8EB5lkjoFqmBH
 3fcRBd7UMsE6LcmZgEjyEAHAnrYffzuYlY2e32V/Hcsz6/TFUMeNhu0bFPubAzdw6wy3
 tmK7y+J4t5fuQIEmCmLUhtxEfRGyNkCDNSeEneL3XOIs4ekBU52Im3xaPf4VMCJ3Obg2
 XD4Z/PA77QBdv4igiS9m9RN6rCW/0hX67+6yeb1a2yujRwckvLuRr7OkwbO7PfUeqI+0
 WfHQ==
X-Gm-Message-State: AOAM530sDiZCi1m7KesQb9CDRDs1r1/5RRr/uyYeJr/P022q/Hdp/D+n
 QjPcrlkxVHu3n7O9RRFCuMQ=
X-Google-Smtp-Source: ABdhPJw6G/CHwtrQzTWZeu70tN/gGCzUnd8IcHbPvTGKCmgHNFwoa2o1Dlw9zUlvWUKRn02T6uY78Q==
X-Received: by 2002:a1c:f415:: with SMTP id z21mr4676941wma.114.1613043263783; 
 Thu, 11 Feb 2021 03:34:23 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id a16sm4290472wrr.89.2021.02.11.03.34.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 03:34:23 -0800 (PST)
Subject: Re: [RFC PATCH] target/mips/cp0_timer: Use new clock_ns_to_ticks()
To: qemu-devel@nongnu.org
References: <161304272319.26113.12503101478176267986@c667a6b167f6>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <576ecac4-5b08-90c8-9109-9e3d579b6222@amsat.org>
Date: Thu, 11 Feb 2021 12:34:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <161304272319.26113.12503101478176267986@c667a6b167f6>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.211,
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
Cc: peter.maydell@linaro.org, aleksandar.rikalo@syrmia.com, luc@lmichel.fr,
 wuhaotsh@google.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/11/21 12:25 PM, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/20210210234334.3750022-1-f4bug@amsat.org/
> 
> 
> 
> Hi,
> 
> This series seems to have some coding style problems. See output below for
> more information:
> 
> Type: series
> Message-id: 20210210234334.3750022-1-f4bug@amsat.org
> Subject: [RFC PATCH] target/mips/cp0_timer: Use new clock_ns_to_ticks()
> 
> Updating 3c8cf5a9c21ff8782164d1def7f44bd888713384
> Switched to a new branch 'test'
> 86c0e95 target/mips/cp0_timer: Use new clock_ns_to_ticks()
> 
> === OUTPUT BEGIN ===
> ERROR: space prohibited after that '-' (ctx:ExW)
> #39: FILE: target/mips/cp0_timer.c:41:
> +           - (uint32_t)(now_ticks / cpu->cp0_count_rate);
>             ^

Well, having the operator at the beginning of the line makes
it more obvious than having it at the end of the previous line.

I can remove the space to make checkpatch happy but it seems
wrong.

