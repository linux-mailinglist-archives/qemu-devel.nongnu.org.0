Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F5F2DC511
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 18:10:17 +0100 (CET)
Received: from localhost ([::1]:56650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpaJc-0000tg-S2
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 12:10:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpa4y-0007iR-NB
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:55:08 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:39781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpa4x-00039i-9w
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:55:08 -0500
Received: by mail-wm1-x32f.google.com with SMTP id 3so3110371wmg.4
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UrPtg+NXILWzoMKDFVWYjaARt50ngfJJUniPUuwE5No=;
 b=fkPhGGTl8OCPo8vRaTXBDVkhNnotUM7108lHTjdk9Qw/De1wbSugtmdvIvRUb7buc7
 FdhSXwMw9L7cBMIMbyAJ12nE1XInYIjUqvV9vikdfYv6aqckya6Dxr49bvndJX/9wk0n
 0rUWM7n1ukGcf/eeNpiPL0vevEivj9kz34jyH7w0A7PePfhD4AADNH+dhWC7iS3wGaWk
 I9Gl0hKBvfP1fnN53Mlq+oZj2RCTtJ3MpijNeHthuECLtPi2vrTBu6H3y09CI6ZqGU/L
 LMhZA9Jiw6s3gQzZ7jLYdr+kvswC05y6x/YJkVtFE0KIELoGjjLSVJ3LnV6gJ2Ss61Jr
 hsCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UrPtg+NXILWzoMKDFVWYjaARt50ngfJJUniPUuwE5No=;
 b=JmdHaEQqVJ6Ui9tfcv5K8MnkVRKiACKDjVeV65udrEeiO7I/68nF2NMZM9BI/wqNn4
 vDbMEQ8sZsBHIigOkXCBYy2XHlCxm4D0F9j7wZVGlHTYT1kcf0SUovmmM4InDTE1q12E
 G7VHZaHVdYgf98npNVDcxX3ibMePYi6V6d6vkFZ0h5QsmdJudxwj0O9ClvhGuurQylSS
 pwXOhNDTuB930qm6nCl4xCf+FG6nyX1c5jYgcxcswA5JC0oqXlPQwvAda2rIk2jM3Vkb
 V0CVriQgSyydG+tBa3iiH7+zGbsMz49V6Dh++JIE8pd9iIHiTnh5RbrHd3i5fbruitNP
 sABA==
X-Gm-Message-State: AOAM532Z3oFeKjTXOjfMW6z3EAaRWvwfuf8+LEYBYB4M+h2c6pjHJn7W
 JPSCJGkLkqP2uxuJA9jMnZhi/8kEVPQ=
X-Google-Smtp-Source: ABdhPJzl5NUhO6xd5xXfarTKP4QOTCXJ3TGb+Pu6je1VHkBT+j04ZyYLHlwPQJsQnhqfRfZZd79b5A==
X-Received: by 2002:a1c:1f94:: with SMTP id f142mr4184137wmf.124.1608137705784; 
 Wed, 16 Dec 2020 08:55:05 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id i7sm4086002wrv.12.2020.12.16.08.55.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 08:55:05 -0800 (PST)
Subject: Re: [PATCH 6/7] hw/mips/fuloong2e: Correct cpuclock env
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20201216022513.89451-1-jiaxun.yang@flygoat.com>
 <20201216023123.92335-2-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b0a451dd-2313-ad86-985e-271d5ca27a69@amsat.org>
Date: Wed, 16 Dec 2020 17:55:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201216023123.92335-2-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: chenhuacai@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/20 3:31 AM, Jiaxun Yang wrote:
> It should be 533080000.
> See clock_set_hz.

Missed in 3ca7639ff00 ("hw/mips/fuloong2e: Set CPU frequency
to 533 MHz").

> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  hw/mips/fuloong2e.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
> index 256c7867e4..af2d259dc4 100644
> --- a/hw/mips/fuloong2e.c
> +++ b/hw/mips/fuloong2e.c
> @@ -159,7 +159,7 @@ static uint64_t load_kernel(CPUMIPSState *env)
>      }
>  
>      /* Setup minimum environment variables */
> -    prom_set(prom_buf, index++, "cpuclock=100000000");
> +    prom_set(prom_buf, index++, "cpuclock=533080000");

Actually it should be "cpuclock=%u" of clock_get_hz(cpuclk).

>      prom_set(prom_buf, index++, "memsize=%"PRIi64, loaderparams.ram_size / MiB);
>      prom_set(prom_buf, index++, NULL);
>  
> 

