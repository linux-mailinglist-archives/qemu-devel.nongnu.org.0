Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 154C1320A4A
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 13:50:26 +0100 (CET)
Received: from localhost ([::1]:39628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDoBs-0002mm-Io
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 07:50:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDo9s-0001oA-Gi
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 07:48:22 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:43001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDo9p-0007dw-LB
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 07:48:19 -0500
Received: by mail-wr1-x42a.google.com with SMTP id r3so4476537wro.9
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 04:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UA71VQgk6vHUAWHmeaUv2pfOth4OeCT3urbz7rObenU=;
 b=NZ+R0iDSfiLF1ndi9ClKE/ck1J9jnn5NGXnmLcaJ/U7kvvr+RWT/lpxo+1Grm/lYDT
 Og9LAHWurgWQpTBOf7BuZaK3uzV8CZr8eVXHXkrlvqZ6Uv41GSwKZsbRM9Gcn0uQ+M+1
 fh6eVhRv/TP6cHwT9al2gFxnAOvLDageUQ6RHoA1UpfMKma5AlQtrXJYjMQ6ET0N+gas
 2klI9PIsHxy7HD2i8iLIaPsH4r/PGDV5D5wHTKOWCIsdKQk+gRJx8X9j61kmaNA39DDX
 uPUgw90JNP98cPj0ryDU4HwnC6l4TOBVbkCvh9vYlXOfOSReTvgdGQbFVHGsHr4ECHPW
 arKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UA71VQgk6vHUAWHmeaUv2pfOth4OeCT3urbz7rObenU=;
 b=WZ0JD8qIAmWbJOx8I+l4uFmkvRHg5j7OY/ZK467Rt5Ifrtsf15r6u+Ug/leDuFwN15
 JS+tWKYEXzjsl7zngftc+B7yOtRmorBuGuIjboC8cOtRkIr+wVGVX+63mKe1z9JzeP6f
 je2d/zGLaNi58FxWPZ37ZtDLC+g+EF4NPhYzXIse22mrz5GBBDf2dnKY19YsU+F5lHz2
 9SXfJkHo8zMXAIx66vTtr7WzfkpaXbCRpygJATacHvYLactaTqfnsgVJ/CcdcwxW7w7/
 h9Vyu0kL2awAehUG8y8DYzlEjFzsN2UTfwti4D7OtRQcHCQUbWRNtgYVJTniFK/0VO+e
 emFw==
X-Gm-Message-State: AOAM533Hug1601EjqeKHUHGH0vJSGVXBUXJNs0V7qekaF9KGwJ+Uj4De
 fF2rZ2SNMJX1RfzEeaTwcs0=
X-Google-Smtp-Source: ABdhPJyCXQtgygXwMQBGAGEh6d0ts0fqE5GtnuTv2ZcAkLWVhpNzRlarkIJi5lz8IRZaUEmT7GXHIQ==
X-Received: by 2002:a5d:6148:: with SMTP id y8mr17319502wrt.238.1613911695808; 
 Sun, 21 Feb 2021 04:48:15 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id e17sm322327wro.36.2021.02.21.04.48.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 04:48:15 -0800 (PST)
Subject: Re: [PATCH v3 4/4] hw/mips/boston: Use bootloader helper to set GCRs
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20210127065424.114125-1-jiaxun.yang@flygoat.com>
 <20210127065424.114125-5-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e16f74da-3f17-89cc-8428-6db210d8e438@amsat.org>
Date: Sun, 21 Feb 2021 13:48:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210127065424.114125-5-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Paul Burton <paulburton@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/27/21 7:54 AM, Jiaxun Yang wrote:
> Translate embedded assembly into IO writes which is more
> readable.
> 
> Also hardcode cm_base at boot time instead of reading from CP0.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> --
> v3: Use bl_gen_write_ulong.
> ---
>  hw/mips/boston.c | 47 ++++++++---------------------------------------
>  1 file changed, 8 insertions(+), 39 deletions(-)
> 
> diff --git a/hw/mips/boston.c b/hw/mips/boston.c
> index b976c8199a..06e04ef8de 100644
> --- a/hw/mips/boston.c
> +++ b/hw/mips/boston.c
> @@ -274,48 +274,18 @@ static void boston_register_types(void)
>  }
>  type_init(boston_register_types)
>  
> -static void gen_firmware(uint32_t *p, hwaddr kernel_entry, hwaddr fdt_addr,
> -                         bool is_64b)
> +static void gen_firmware(uint32_t *p, hwaddr kernel_entry, hwaddr fdt_addr)
>  {
>      const uint32_t cm_base = 0x16100000;
>      const uint32_t gic_base = 0x16120000;
>      const uint32_t cpc_base = 0x16200000;
>  
> -    /* Move CM GCRs */
> -    if (is_64b) {
> -        stl_p(p++, 0x40287803);                 /* dmfc0 $8, CMGCRBase */
> -        stl_p(p++, 0x00084138);                 /* dsll $8, $8, 4 */
> -    } else {
> -        stl_p(p++, 0x40087803);                 /* mfc0 $8, CMGCRBase */
> -        stl_p(p++, 0x00084100);                 /* sll  $8, $8, 4 */
> -    }
> -    stl_p(p++, 0x3c09a000);                     /* lui  $9, 0xa000 */
> -    stl_p(p++, 0x01094025);                     /* or   $8, $9 */
> -    stl_p(p++, 0x3c0a0000 | (cm_base >> 16));   /* lui  $10, cm_base >> 16 */
> -    if (is_64b) {
> -        stl_p(p++, 0xfd0a0008);                 /* sd   $10, 0x8($8) */
> -    } else {
> -        stl_p(p++, 0xad0a0008);                 /* sw   $10, 0x8($8) */
> -    }
> -    stl_p(p++, 0x012a4025);                     /* or   $8, $10 */
> -
> -    /* Move & enable GIC GCRs */
> -    stl_p(p++, 0x3c090000 | (gic_base >> 16));  /* lui  $9, gic_base >> 16 */
> -    stl_p(p++, 0x35290001);                     /* ori  $9, 0x1 */
> -    if (is_64b) {
> -        stl_p(p++, 0xfd090080);                 /* sd   $9, 0x80($8) */
> -    } else {
> -        stl_p(p++, 0xad090080);                 /* sw   $9, 0x80($8) */
> -    }
> -
> -    /* Move & enable CPC GCRs */

If you don't mind I'll keep the comments.

