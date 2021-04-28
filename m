Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6904436DF75
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 21:19:56 +0200 (CEST)
Received: from localhost ([::1]:58102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbpj1-0006Iw-FM
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 15:19:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbph4-0005U3-VK
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:17:55 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:42781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbph3-0003eo-8M
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:17:54 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 a22-20020a05600c2256b029014294520f18so5095249wmm.1
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 12:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Zb+YgvdruzY8BMllXNWZxRDWpzQVjztJhwVWuys29Pc=;
 b=rKcuk/7s3NyzNlqOvzrBjQr2zK6O6uYDWpKFFm6x38yNX1bymzgypQ0H/mOevMml2t
 0zMHVPqJOT+skVqtGbpc/L31WYHNXSZEKmxD0BHhIoLjMx8g3MtJrtFrVjzsS1F/WC08
 NFSpcZzv83QimisnCdEMrq1zPNQcKtKhEwPF46euLVohw5b+x5Ka8ZNOg26IhsibjoLh
 IR55FM9gRlWMcdzOh7WOHY4Et0Q+jFnIoktGlP+xrQ2Sq6fE31G1E0jjrl3V/oE1/84b
 O8vlZc2vVXRThr5yZLF4fWJ8+XrbuHniYcA5y6ttwJVN+lxNf+RExsei7i2w/ThZNKUc
 oGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Zb+YgvdruzY8BMllXNWZxRDWpzQVjztJhwVWuys29Pc=;
 b=Uk6tv3BavlKzv50z/3/K8SdZWrldycotj1NnocxkYYuTqM5ReD2PONH6W6Uz450Auc
 l9DcrYGZNuHSRJ5zarCgmYzHaCdgeWFr43qzcegVhPO4E0XIkWj53yond2ytR4fPOG80
 yvMgA4n+aNnJGNPz1gVgrRbQUk/CYPLAtPdqIB6UcfWW6Sp+DWKGLJnmudZGo3gUUN6Z
 i6G4n9YAwXaqlPAV+NzDcBsuKxHlSwzlYt1HTktdEfNuO3lDlq45fvT8tgpVq+Ax69Jq
 M78ZwivnYiHt8jK2zY5pxBzljj7lzrJBAlJOHe1U9yrCvbr9FHhgKJv2TP21P+eHHDAG
 JRNA==
X-Gm-Message-State: AOAM533RK5UCd1YxgTYusduNNjQ6hhAHRaCVstiDk5Gw7tu7oEuCqUHt
 Ss8dfSfmQBQ244PU0UQeOeU=
X-Google-Smtp-Source: ABdhPJz/yR+xGEZGh5K4E/aBb9Qt5y81wih9WFiroTMX+M3zmM1gfvwsX2zo7I4T3h63xK6JO5Y9RQ==
X-Received: by 2002:a05:600c:379a:: with SMTP id
 o26mr31788158wmr.66.1619637471545; 
 Wed, 28 Apr 2021 12:17:51 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id v13sm960685wrt.65.2021.04.28.12.17.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 12:17:51 -0700 (PDT)
Subject: Re: [PATCH] hw/avr/atmega.c: use the avr51 cpu for atmega1280
To: Frederic Konrad <konrad@adacore.com>, qemu-devel@nongnu.org
References: <1619637319-22299-1-git-send-email-frederic.konrad@adacore.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7970a6ec-f5ac-bcc9-9184-d8450b64b116@amsat.org>
Date: Wed, 28 Apr 2021 21:17:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1619637319-22299-1-git-send-email-frederic.konrad@adacore.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Frederic Konrad <frederic.konrad@adacore.com>,
 Michael Rolnik <mrolnik@gmail.com>, Joaquin de Andres <me@xcancerberox.com.ar>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Joaquín.

On 4/28/21 9:15 PM, Frederic Konrad wrote:
> According to the as documentation:
>  (https://sourceware.org/binutils/docs-2.36/as/AVR-Options.html)
> 
> "Instruction set avr51 is for the enhanced AVR core with exactly 128K
>  program memory space (MCU types: atmega128, atmega128a, atmega1280,
>  atmega1281, atmega1284, atmega1284p, atmega128rfa1, atmega128rfr2,
>  atmega1284rfr2, at90can128, at90usb1286, at90usb1287, m3000)."
> 
> But when compiling a program for atmega1280 or avr51 and trying to execute
> it:
> 
> $ cat > test.S << EOF
>> loop:
>>     rjmp loop
>> EOF
> $ avr-gcc -nostdlib -nostartfiles -mmcu=atmega1280 test.S -o test.elf
> $ qemu-system-avr -serial mon:stdio -nographic -no-reboot -M mega \
>                   -bios test.elf
> qemu-system-avr: Current machine: Arduino Mega (ATmega1280) with 'avr6' CPU
> qemu-system-avr: ELF image 'test.elf' is for 'avr51' CPU
> 
> So this fixes the atmega1280 class to use an avr51 CPU.
> 
> Signed-off-by: Frederic Konrad <frederic.konrad@adacore.com>
> ---
>  hw/avr/atmega.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/avr/atmega.c b/hw/avr/atmega.c
> index 44c6afebbb..e3ea5702f5 100644
> --- a/hw/avr/atmega.c
> +++ b/hw/avr/atmega.c
> @@ -402,7 +402,7 @@ static void atmega1280_class_init(ObjectClass *oc, void *data)
>  {
>      AtmegaMcuClass *amc = ATMEGA_MCU_CLASS(oc);
>  
> -    amc->cpu_type = AVR_CPU_TYPE_NAME("avr6");
> +    amc->cpu_type = AVR_CPU_TYPE_NAME("avr51");
>      amc->flash_size = 128 * KiB;
>      amc->eeprom_size = 4 * KiB;
>      amc->sram_size = 8 * KiB;
> 


