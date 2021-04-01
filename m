Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3513510C2
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 10:21:53 +0200 (CEST)
Received: from localhost ([::1]:33216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRsaO-0000Dt-Rj
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 04:21:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lRsU8-0001Tl-Ql
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:15:24 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:34603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lRsU6-0000Lj-Ac
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:15:24 -0400
Received: by mail-wr1-x433.google.com with SMTP id j7so902468wrd.1
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 01:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6qHtcohBw/996lcHpKqsbGshYdCD7SS6Y8OWyQ/RYPs=;
 b=sqLdLh2F+G+IqOWDgRTFGmYEJ7PD3W7jXFE5gAwAeU+gQwrG9cN0FHp9WZuKpmJeRL
 5QW4w2lanoP4EFA/Kh2Ea3nJC9Ax/2uLbHsYX0Rns+jhaTRow7WOqRJx9xwvjccwfHNy
 xzpF4mEM34aw1KpEkov9pb1ZpZWjP2s0xeYeAiL+qxkMDByc2YY0QIJcVryZSjsEMdFI
 bDma30kfnSvf7tjjvB0NIsD5VyMApEM2yEn4xWVBRSm1bLbLi/CEwD4iicMDY01GXKxN
 vkL4Sy7tUw5OaBewjRtuWxGuF/aYTIVIgaOEYNk3r0nvE/CJFyC65Nb5YxfXA1ibWLEd
 cVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6qHtcohBw/996lcHpKqsbGshYdCD7SS6Y8OWyQ/RYPs=;
 b=AlbBFk/K0E6Wc32yGSEmk0HbqfeJWNkdSBKtWpO2qjYOGGvCgVIe/E0KaWbhndyTZ8
 x6T3FVBKw/jZt3z5cfqFZ7icEP4pCsTtmyNukJkHBs+0w75fnnUoSj4iVX1kqwWVToyG
 HapwHEVEbFFLh8o/9W0YVvTeNPLOijrhkigo1Q67fXy8ngLfdGYXqZ7FVGepc3oqr3U8
 dY9080OlyT3Q/Pn/dJqQ3llnDbCDaIFCovbyyxOnh3Kuw2FY/RVOOB0OpyuUixtQfgHk
 Si0gq3j+6IKV0JAblr44N7nCKsBARt49WJkKYldAI/4piMt2l8lOd7i7wM66QkjtY2Mk
 Up4g==
X-Gm-Message-State: AOAM532Z8fPFO5JKgK2EIXpUs8O3t2oPvce3VF1ngGnSKtIJY/O53rtJ
 H1+I3/XzPT0WgY3Xz2TT9uw=
X-Google-Smtp-Source: ABdhPJyBYcaic44hUEnJUr04QCE79yAWaGIcfI5yRDLbX5xrM0StyMH5DPiviSnpOrijfATiPHp/qA==
X-Received: by 2002:a05:6000:18f:: with SMTP id
 p15mr8248025wrx.23.1617264917399; 
 Thu, 01 Apr 2021 01:15:17 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id 18sm7036534wmj.21.2021.04.01.01.15.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 01:15:16 -0700 (PDT)
Subject: Re: [PATCH v3 03/11] esp: consolidate esp_cmdfifo_push() into
 esp_fifo_push()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 alxndr@bu.edu, laurent@vivier.eu, pbonzini@redhat.com
References: <20210401074933.9923-1-mark.cave-ayland@ilande.co.uk>
 <20210401074933.9923-4-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <bc8795c0-4fc6-a923-0458-f2ac0feb590c@amsat.org>
Date: Thu, 1 Apr 2021 10:15:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210401074933.9923-4-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/1/21 9:49 AM, Mark Cave-Ayland wrote:
> Each FIFO currently has its own push functions with the only difference being
> the capacity check. The original reason for this was that the fifo8
> implementation doesn't have a formal API for retrieving the FIFO capacity,
> however there are multiple examples within QEMU where the capacity field is
> accessed directly.

So the Fifo8 API is not complete / practical.

> Change esp_fifo_push() to access the FIFO capacity directly and then consolidate
> esp_cmdfifo_push() into esp_fifo_push().
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c | 27 ++++++++-------------------
>  1 file changed, 8 insertions(+), 19 deletions(-)
> 
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index 26fe1dcb9d..16aaf8be93 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -98,16 +98,15 @@ void esp_request_cancelled(SCSIRequest *req)
>      }
>  }
>  
> -static void esp_fifo_push(ESPState *s, uint8_t val)
> +static void esp_fifo_push(Fifo8 *fifo, uint8_t val)
>  {
> -    if (fifo8_num_used(&s->fifo) == ESP_FIFO_SZ) {
> +    if (fifo8_num_used(fifo) == fifo->capacity) {
>          trace_esp_error_fifo_overrun();
>          return;
>      }
>  
> -    fifo8_push(&s->fifo, val);
> +    fifo8_push(fifo, val);
>  }
> -

Spurious line removal?

>  static uint8_t esp_fifo_pop(ESPState *s)
>  {
>      if (fifo8_is_empty(&s->fifo)) {
> @@ -117,16 +116,6 @@ static uint8_t esp_fifo_pop(ESPState *s)
>      return fifo8_pop(&s->fifo);
>  }

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

