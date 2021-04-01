Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD513510C0
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 10:21:11 +0200 (CEST)
Received: from localhost ([::1]:58286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRsZi-0007IH-7P
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 04:21:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lRsXq-0005rN-6I
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:19:14 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:40941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lRsXo-0002k0-Ja
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:19:13 -0400
Received: by mail-wr1-x430.google.com with SMTP id v11so887357wro.7
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 01:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=p6T3VIkOrMfa6+ngXBSeeK8B9WkjIwRo5/JnqcHP32Y=;
 b=RHwRkBzTkjPnXUvguAuGkRxUChfSiTBbShGHs77vxtAVcNm6qEFzW0cmhYTeemnJKu
 5nORqje/e69jZMn96iKdN4R+2L1bntBhmTiMim82jIMM+j+1HTzfy3iB2hFRkEOUK2DS
 3HzHi2FBzdcZ1e4tHT4kcjBZi1VIkSURbb/+dJ2ecfeEktQmFf+os6lG4Ecbkqv+Vu81
 SPpP2MtiT86UfZkEUdwhHegly8PT9PK3foXGeg95gXatbMKsZ7guVAQN1neB+KneVi3Q
 Dg+SmJ7clxKqsQRkMo3emPBLDjoVLqsBPAkWJL+nca7KUvTwG5PMgGexGOfcITr4dUJr
 RLcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p6T3VIkOrMfa6+ngXBSeeK8B9WkjIwRo5/JnqcHP32Y=;
 b=DIVG8zcrQfB23EC7QlfY8LlIzK5wxMrgJe/lTRc3Onm9jzeLRax3EEdovnYgvg1DWc
 UGPHy2D3DwpZmrwU/JpR+SMkSHQNwZA3qycxT4fBL4eTYQqcyYA6zeiI0OjyWluozjpn
 HP7LH3pJ2QnuWjbqKf8yd3p0DCATwPXW2yDmcHVBO9S9MazXA+dbD4mWlLfTxKMRyibL
 i5Oh18r+Vbbmely1+I3cQ/7xOHJ99usc9fjz6QbrzXX45XjYT0c38/Wifa7GjgVZbOEa
 XluQuSDdNO/BBRHwalMVoJb5O+ZT4POfsBBzlW6pjWhHwkpVLvuQ6jAJHp3VYgIMbjlq
 mP7g==
X-Gm-Message-State: AOAM5304UVFSQGxqFc+swWSf0FXGAn5dReYUlHIOIooI6rkCymFI7Ek6
 Jp+Ke6W2jad7aVSkYT/QJqU=
X-Google-Smtp-Source: ABdhPJy92J5h/GseokEvdVa+o+M/QTzbAuAQ1fxRcktPzUg7GoucKHkfd2BTgRku7qHSXmwTqnwl0A==
X-Received: by 2002:a5d:4884:: with SMTP id g4mr8104156wrq.191.1617265150718; 
 Thu, 01 Apr 2021 01:19:10 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id f4sm8821688wrz.4.2021.04.01.01.19.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 01:19:10 -0700 (PDT)
Subject: Re: [PATCH v3 07/11] esp: don't underflow cmdfifo in do_cmd()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 alxndr@bu.edu, laurent@vivier.eu, pbonzini@redhat.com
References: <20210401074933.9923-1-mark.cave-ayland@ilande.co.uk>
 <20210401074933.9923-8-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2c2f7f50-a4bd-916f-6c71-a61dd4b566e9@amsat.org>
Date: Thu, 1 Apr 2021 10:19:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210401074933.9923-8-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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
> If the guest tries to execute a CDB when cmdfifo is not empty before the start
> of the message out phase then clearing the message out phase data will cause
> cmdfifo to underflow due to cmdfifo_cdb_offset being larger than the amount of
> data within.
> 
> Since this can only occur by issuing deliberately incorrect instruction
> sequences, ensure that the maximum length of esp_fifo_pop_buf() is limited to
> the size of the data within cmdfifo.
> 
> Buglink: https://bugs.launchpad.net/qemu/+bug/1909247
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index 4decbbfc29..7f49522e1d 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -319,13 +319,15 @@ static void do_busid_cmd(ESPState *s, uint8_t busid)
>  
>  static void do_cmd(ESPState *s)
>  {
> -    uint8_t busid = fifo8_pop(&s->cmdfifo);
> +    uint8_t busid = esp_fifo_pop(&s->cmdfifo);
> +    int len;
>  
>      s->cmdfifo_cdb_offset--;
>  
>      /* Ignore extended messages for now */
>      if (s->cmdfifo_cdb_offset) {
> -        esp_fifo_pop_buf(&s->cmdfifo, NULL, s->cmdfifo_cdb_offset);
> +        len = MIN(s->cmdfifo_cdb_offset, fifo8_num_used(&s->cmdfifo));

Do we want to log(GUEST_ERRORS) this?

> +        esp_fifo_pop_buf(&s->cmdfifo, NULL, len);
>          s->cmdfifo_cdb_offset = 0;
>      }
>  
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

