Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A85A3510DB
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 10:29:22 +0200 (CEST)
Received: from localhost ([::1]:50274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRshd-0007hA-9x
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 04:29:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lRsew-00052k-FQ
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:26:34 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:40494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lRseu-0007Cn-O7
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:26:34 -0400
Received: by mail-wr1-x42e.google.com with SMTP id v11so907987wro.7
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 01:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GAYRDX3bWIWojSbG29mRmM9gofqAuy84J7VF3jNzK4A=;
 b=keLdiQgnwBs73M87mFfZMhT6FDNkZbYRe2yJZROvo7E/wj9WATYYsY6GPtMEod09cm
 gzYmfgVxmVcoeYquGYL0gzVkMsVLXestNeleMG3R3Gvea4hXu28YjL9Df3b8tm4/Zfgl
 GBLPfWiSRVLLandiqPbXHxcDrsLrM1+bRIXzs9DiDjcD9E90YqXg1DwXco5GctMGDSnr
 9uAIv+hVQa6OT2YSB99QXlaROK32wZpkAivMh803wAtA2WmG5+7KY+bEWPtab+zM3VK7
 Qg1UTHLukWfWifbWMfH+tZc8dyzEl/FSHvIhoTqBA5Ic5/lt/9+qoW5N1ne/Nc19Z+aD
 vj/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GAYRDX3bWIWojSbG29mRmM9gofqAuy84J7VF3jNzK4A=;
 b=NxuoN3yssRERFpvC6LrOpHT6Vb9qM1X/Gvjw7znVrRi8CzFRxxoKP7z6evt2PpU9ad
 bhh4gHpBHneF62vn4ngL7/7RSXB8CxLqRxwlBjD79SdsJtsiHQb0/kIoryR+zubwKP3n
 AuAztCMbFVRv5D/hLB1V0/rUTthrHweMzl8fhFVx/Mp1OPD+ZSAmoMdcbN9XJzd840wV
 UOYv6PXIk/CQ+9pMRt3ofcHG3JvL14i/aUdcgvffS4qj66swZhjJ4tdzY4YMePPMKOND
 aP09CjoGezfiULMJoXJdXm8aF1JxbxIehrAQlW2YjB1jYyEofrjzJvRywOGXEU7IOrxf
 9FYA==
X-Gm-Message-State: AOAM5309B+x3v+LFIdMBpvSkbHq3ZKwbhUPiPISd9hobxG3e9rtPJMbx
 HzVc0dWjrjI/avkTK8DlPLs=
X-Google-Smtp-Source: ABdhPJxtCObSx79fFtZBSX6CZGQ5u7cTGv1gbyKmk4s3/d6VWu5RzGQbFotCD4+p85VOP9JwHgnXOg==
X-Received: by 2002:a5d:5904:: with SMTP id v4mr8251874wrd.261.1617265591474; 
 Thu, 01 Apr 2021 01:26:31 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id 64sm7194615wmz.7.2021.04.01.01.26.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 01:26:30 -0700 (PDT)
Subject: Re: [PATCH v3 02/11] esp: rework write_response() to avoid using the
 FIFO for DMA transactions
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 alxndr@bu.edu, laurent@vivier.eu, pbonzini@redhat.com
References: <20210401074933.9923-1-mark.cave-ayland@ilande.co.uk>
 <20210401074933.9923-3-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <bc943319-b721-373f-8def-99ff0da0d0b5@amsat.org>
Date: Thu, 1 Apr 2021 10:26:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210401074933.9923-3-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
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
> The code for write_response() has always used the FIFO to store the data for
> the status/message in phases, even for DMA transactions. Switch to using a
> separate buffer that can be used directly for DMA transactions and restrict
> the FIFO use to the non-DMA case.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index bafea0d4e6..26fe1dcb9d 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -445,18 +445,16 @@ static void write_response_pdma_cb(ESPState *s)
>  
>  static void write_response(ESPState *s)
>  {
> -    uint32_t n;
> +    uint8_t buf[2];
>  
>      trace_esp_write_response(s->status);
>  
> -    fifo8_reset(&s->fifo);
> -    esp_fifo_push(s, s->status);
> -    esp_fifo_push(s, 0);
> +    buf[0] = s->status;
> +    buf[1] = 0;

Slightly simplified:

       const uint8_t buf[2] = { s->status, 0 };

>      if (s->dma) {

           uint32_t n;

>          if (s->dma_memory_write) {
> -            s->dma_memory_write(s->dma_opaque,
> -                                (uint8_t *)fifo8_pop_buf(&s->fifo, 2, &n), 2);
> +            s->dma_memory_write(s->dma_opaque, buf, 2);
>              s->rregs[ESP_RSTAT] = STAT_TC | STAT_ST;
>              s->rregs[ESP_RINTR] |= INTR_BS | INTR_FC;
>              s->rregs[ESP_RSEQ] = SEQ_CD;
> @@ -466,7 +464,8 @@ static void write_response(ESPState *s)
>              return;
>          }
>      } else {
> -        s->ti_size = 2;
> +        fifo8_reset(&s->fifo);
> +        fifo8_push_all(&s->fifo, buf, 2);
>          s->rregs[ESP_RFLAGS] = 2;
>      }
>      esp_raise_irq(s);
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

