Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2567B3230FC
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 19:51:08 +0100 (CET)
Received: from localhost ([::1]:33346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEcm3-0001JM-6W
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 13:51:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEckx-0000sC-N1
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:50:00 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:36768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEckv-00015c-Ug
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:49:59 -0500
Received: by mail-ej1-x634.google.com with SMTP id do6so36141109ejc.3
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 10:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7j01HIY7fgWMkbwn25ehZNAA9t5Zl0aEpSeuxzMIJ20=;
 b=S/sFgaqXw32Zc2GsSSlNmwU53V4ehgVQnwqdmfrfIIdfTN4TxsjvA6FVMquEiuvjY3
 3QJjYiZpveUcn8o1Odvdt65VtwDHZ10WOF731g4l+at+PxFqbKZ0PBr4DLCmtMguhRug
 GtyAa9USQhZv/iMXZxQNmFvzmlQXopC1dqycnpbKfYKFjkblg6ByCqV96phiBDwELNN8
 RKKebjxQBsIZ2D1aoEKno5dE3fzgXwA+mOJjVdfI/JCTt54zvnzBIM0lBkCyMA0tHY6F
 hyVYNlV1p6Hx0/qb7lhKVeJmlcfOV/+BmRKqKFhRLcYxungyyrI0ofNkqZIuT7DYHhky
 Rh8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7j01HIY7fgWMkbwn25ehZNAA9t5Zl0aEpSeuxzMIJ20=;
 b=BNCKWn+Q5uqeP5Ks/EyhTg9ZKy9MofmPBANpb0p8fKro+fmRawn3VaAI2ZluPivnGk
 j1Xpbi0hhDBrd7PB5liwNnFfJN7XDLjU2uw45/Q5GYdjPH3FxL+W4bIKmPJ+wBFJo4+P
 zF4Lu4MaSkUipjYlDWj3aAZWzpVuUdjPx8UxyDvdY5Qhnk/k3juwMRFVp4Eq/12FFKwG
 69lkJIfOMg6qcdpM8XRLopIWuBh65HpaRYhmeMJ2GRwCSfS4nmEGd9mTSmqO/6DTiM4D
 6qKeZnCrh/04z87MPp/ca7LhdY48lHN0IzU2hCHoX5uIZkChuALvCxJT9p0QJXeSYWt9
 BVBQ==
X-Gm-Message-State: AOAM533Qw0eveEO2QcuiaDFjYYUI3pEEinn7/V/legUfhFQhjBPjOZMA
 BVXeRln5cmQwtre3q4mXe24=
X-Google-Smtp-Source: ABdhPJxo6On8SkJLn8gQ0hYV6CdVpb7YjEx241uWWN5YV41fH1Dhu9DP/dz4TTSAKtpA2/FbwQOmHQ==
X-Received: by 2002:a17:906:c0cd:: with SMTP id
 bn13mr26602049ejb.368.1614106196402; 
 Tue, 23 Feb 2021 10:49:56 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id p20sm11707034ejo.19.2021.02.23.10.49.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 10:49:55 -0800 (PST)
Subject: Re: [PATCH v2 38/42] esp: convert ti_buf from array to Fifo8
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net, laurent@vivier.eu
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-39-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <69c265c8-1d68-4e09-971a-98233e7debee@amsat.org>
Date: Tue, 23 Feb 2021 19:49:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-39-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/21 8:30 PM, Mark Cave-Ayland wrote:
> Rename TI_BUFSZ to ESP_FIFO_SZ since this constant is really describing the size
> of the FIFO and is not directly related to the TI size.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c         | 117 ++++++++++++++++++++++++++----------------
>  include/hw/scsi/esp.h |   8 +--
>  2 files changed, 79 insertions(+), 46 deletions(-)

> @@ -806,11 +818,9 @@ void esp_reg_write(ESPState *s, uint32_t saddr, uint64_t val)
>              } else {
>                  trace_esp_error_fifo_overrun();
>              }
> -        } else if (s->ti_wptr == TI_BUFSZ - 1) {
> -            trace_esp_error_fifo_overrun();
>          } else {
>              s->ti_size++;
> -            s->ti_buf[s->ti_wptr++] = val & 0xff;
> +            esp_fifo_push(s, val & 0xff);

Personally I'd drop the '& 0xff' part.

>          }
>  
>          /* Non-DMA transfers raise an interrupt after every byte */
> @@ -839,8 +849,7 @@ void esp_reg_write(ESPState *s, uint32_t saddr, uint64_t val)
>          case CMD_FLUSH:
>              trace_esp_mem_writeb_cmd_flush(val);
>              /*s->ti_size = 0;*/

Is this comment still meaningful?

> -            s->ti_wptr = 0;
> -            s->ti_rptr = 0;
> +            fifo8_reset(&s->fifo);
>              break;
>          case CMD_RESET:
>              trace_esp_mem_writeb_cmd_reset(val);
> @@ -958,11 +967,18 @@ static int esp_pre_save(void *opaque)
>  static int esp_post_load(void *opaque, int version_id)
>  {
>      ESPState *s = ESP(opaque);
> +    int len, i;
>  
>      version_id = MIN(version_id, s->mig_version_id);
>  
>      if (version_id < 5) {
>          esp_set_tc(s, s->mig_dma_left);
> +
> +        /* Migrate ti_buf to fifo */
> +        len = s->mig_ti_wptr - s->mig_ti_rptr;
> +        for (i = 0; i < len; i++) {
> +            fifo8_push(&s->fifo, s->mig_ti_buf[i]);

Again I dare to add:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +        }
>      }

