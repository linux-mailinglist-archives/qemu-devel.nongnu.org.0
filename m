Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5E0303797
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 09:03:45 +0100 (CET)
Received: from localhost ([::1]:55670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4JKC-0005Eo-7u
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 03:03:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4JIc-0004i0-FE; Tue, 26 Jan 2021 03:02:06 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:37165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4JIa-00086K-RG; Tue, 26 Jan 2021 03:02:06 -0500
Received: by mail-ed1-x529.google.com with SMTP id g1so18640262edu.4;
 Tue, 26 Jan 2021 00:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Dgr+HdLTqkYEZnc0zeKHohCrG6rp8xQ9iFUpxmaCSQQ=;
 b=ewnQ85mwoFzmGopJ1kXqgkz/PgZcUF7DlyT7YUpzIHRtHBQjSp9Ki8Ps/c5X1Y018b
 CZ+0wpYQGf0IALn9wX/81YR11cv2E+aN1duTQBr0OB/ZgwDVYox6LIW/O3CiIY6/ODpt
 LEY5puCEZXN6jJBUUDlbb69YGrkn2NTR/0EDo3JFBWWBoWIs92uGEEfdsNIpr7BuZbW/
 o8XfJE+vT+R3mi5iDsNOeihUzMiosrBrCmDaohkB6XhI+unL6uHt27Z4JAnzOnRzH4Yd
 xlZrYxkb3fluepviVKkztaHyMJw49o1XdskcBjO3Fj1yP/dNHlp86eN7xp3BR8xhn/xy
 diYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Dgr+HdLTqkYEZnc0zeKHohCrG6rp8xQ9iFUpxmaCSQQ=;
 b=gSR+V0P3tUyeYIF8/TPZzlHmAQWqkWTioqgyxoI1v+3iMHMJz8Kuf8CJGrt0kTUqfi
 Ym12qD7F5/q8oU1vUn8htwaB4spEzY20OvjyZi6hcIZKIsI3lWR1rfEXOwZh370j1JY9
 ZD9g8+8MhVqeuIV6+I8GPUJfSmqxQXNy+3QzfkzLlehkYtv3AwLnKT2vxJrIBHtKl8QQ
 P/ZSIc3iCKMwPKmQE+gjoqPF3jjKIkR5IAgM8q1eDKOrNK6J0qHhUBD/MrD0BMO01aFI
 55M/YVFcJCZrVLDKwMUKnBomRGy/rUUQM+K/DRpEgIF0vHG7dnz/fYJq9M17tbK3xVy3
 bVMQ==
X-Gm-Message-State: AOAM5322+XN86GJiEU1xJF6rEeZ0IzCfjVJJ6VYF/Z+5V2RtzEyv4Opl
 YyY1hMc8Lg+4RyRGi2NTQno=
X-Google-Smtp-Source: ABdhPJzsWbBtKzyaPX2TWRPMoy+P+a3yWw/YxSxMy4/knUUI8WRMS9V3PL38uw7Jfgqvd7exbWjNfw==
X-Received: by 2002:a05:6402:524f:: with SMTP id
 t15mr3589586edd.158.1611648122832; 
 Tue, 26 Jan 2021 00:02:02 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id q4sm9333857ejx.8.2021.01.26.00.02.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jan 2021 00:02:02 -0800 (PST)
Subject: Re: [PATCH] hw/sd: ssi-sd: Fix SEND_IF_COND (CMD8) response
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
References: <1611636214-52427-1-git-send-email-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <898c463a-fd6a-01af-480b-89bd27fcd0e4@amsat.org>
Date: Tue, 26 Jan 2021 09:02:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1611636214-52427-1-git-send-email-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x529.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/26/21 5:43 AM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> The SEND_IF_COND command (CMD8) response is of format R7, but
> current code returns R1 for CMD8. Fix it.
> 
> Fixes: 775616c3ae8c ("Partial SD card SPI mode support")
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> 
> ---
> When testing with VxWorks driver, this additional issue was exposed.
> It looks like VxWorks has stricter parsing on command responses while
> U-Boot/Linux drivers are all happy with exising QEMU CMD8 response.
> 
> Based on http://patchwork.ozlabs.org/project/qemu-devel/list/?series=226136
> 
>  hw/sd/ssi-sd.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


