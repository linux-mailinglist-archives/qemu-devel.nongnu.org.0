Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9673C6D0AE8
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 18:20:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phuz6-0002tK-HB; Thu, 30 Mar 2023 12:18:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1phuz4-0002t2-I0; Thu, 30 Mar 2023 12:18:42 -0400
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1phuz2-0000ty-W8; Thu, 30 Mar 2023 12:18:42 -0400
Received: by mail-qt1-x82c.google.com with SMTP id g19so18952869qts.9;
 Thu, 30 Mar 2023 09:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680193119; x=1682785119;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IY3HYrgkJc48v/s/jTEmWJf4aTeq9R6SxyJt0rDkcUY=;
 b=ja/kzcLhL3RuUxjHcRuZTXfgsrLjA9ziTCx30i6mtdg0KhEVncWSPb8FEWuhU1NReK
 v0sgNrI0Bq8TEsTqc6zO7v3LKdreUTM6+4LLWowC5sM7nNgfryKhMGE8nbmGcXrOvQFg
 JymcoPNezfCOY/CuO1rGHHsX9oHEmX5zmnVaVuklxvuoy910sANdRpljJ/j50Xszyyqv
 6u8Hq+Rw0Mz0s5ELZ8/n81faTuzq4Tm4atLwjOw7ATiA/lWITgnF/EuIjurbuy2qWJH9
 XfeH3oDuDznUUhNfn4Okh7gq1mnVFCpRaMJFqlAXWpfY4/W78swcwA8PD7jhco9a1VWB
 Sy3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680193119; x=1682785119;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IY3HYrgkJc48v/s/jTEmWJf4aTeq9R6SxyJt0rDkcUY=;
 b=dghKl/EjfDQ1SOh7HtUhlHU0AoHNkwTjyiCMm2jh1thU/hHyQUkFcef7H2Bv+QUpau
 8zItd6Y+nKMCaMj0f9rAQPrTz3gKdKx/BctBtIAaElsG3vyNBiFUFRZlnRdnpqA+3C4M
 uDQhDHD1/olIK4PyECR9B6MJsM/TT8N+UIA/zRfyrsKBczaLhhqT9EXbN23dLBtGvf/b
 /0EKShf5MpKR/2xzUJWZ69Y+B9vwwv4T5KbDvvqJlPmMnQoN+zDNCPdDT7lgww9LKJj2
 VUJM9BlgiHh8riAbCKTyxTKw7+WXmo8tu+wp2yC9ZwzT56cFh4uW3hrWYimGM9y8bbxP
 Csew==
X-Gm-Message-State: AO0yUKXT999pVlzwjkqA8Obo6tfGWIYM96BYB+OCUNrcHiZuPPTpLHnq
 Mn9s0Q49Axw6LFmqxjwJNw==
X-Google-Smtp-Source: AK7set9RXztyvv2NC9a3tivnJHclQ13cek82ym0aAr271rWROVSSYNNJiFwLUlQ1PERU84mZnButHw==
X-Received: by 2002:a05:622a:189b:b0:3dd:8323:1ed5 with SMTP id
 v27-20020a05622a189b00b003dd83231ed5mr40824582qtc.62.1680193119102; 
 Thu, 30 Mar 2023 09:18:39 -0700 (PDT)
Received: from serve.minyard.net ([47.184.185.84])
 by smtp.gmail.com with ESMTPSA id
 q6-20020a37f706000000b0074235386738sm6204702qkj.37.2023.03.30.09.18.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 09:18:38 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:92e9:7a86:2720:254b])
 by serve.minyard.net (Postfix) with ESMTPSA id 5BABF1800BD;
 Thu, 30 Mar 2023 16:18:37 +0000 (UTC)
Date: Thu, 30 Mar 2023 11:18:36 -0500
From: Corey Minyard <minyard@acm.org>
To: Titus Rwantare <titusr@google.com>
Cc: philmd@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Hao Wu <wuhaotsh@google.com>
Subject: Re: [PATCH 1/5] hw/i2c: pmbus add support for block receive
Message-ID: <ZCW2XDxAzptykEQf@minyard.net>
References: <20230322175513.1550412-1-titusr@google.com>
 <20230322175513.1550412-2-titusr@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230322175513.1550412-2-titusr@google.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=tcminyard@gmail.com; helo=mail-qt1-x82c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: minyard@acm.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

It's generally frowned upon to have empty descriptions, some rationale
would be helpful.  For instance, you remove a length check from the send
string, why did you do that?

Any why is this being added?  What's it supporting?

-corey

On Wed, Mar 22, 2023 at 05:55:09PM +0000, Titus Rwantare wrote:
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Signed-off-by: Titus Rwantare <titusr@google.com>
> ---
>  hw/i2c/pmbus_device.c         | 30 +++++++++++++++++++++++++++++-
>  include/hw/i2c/pmbus_device.h |  7 +++++++
>  2 files changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
> index c3d6046784..02647769cd 100644
> --- a/hw/i2c/pmbus_device.c
> +++ b/hw/i2c/pmbus_device.c
> @@ -95,7 +95,6 @@ void pmbus_send64(PMBusDevice *pmdev, uint64_t data)
>  void pmbus_send_string(PMBusDevice *pmdev, const char *data)
>  {
>      size_t len = strlen(data);
> -    g_assert(len > 0);
>      g_assert(len + pmdev->out_buf_len < SMBUS_DATA_MAX_LEN);
>      pmdev->out_buf[len + pmdev->out_buf_len] = len;
>  
> @@ -105,6 +104,35 @@ void pmbus_send_string(PMBusDevice *pmdev, const char *data)
>      pmdev->out_buf_len += len + 1;
>  }
>  
> +uint8_t pmbus_receive_block(PMBusDevice *pmdev, uint8_t *dest, size_t len)
> +{
> +    /* dest may contain data from previous writes */
> +    memset(dest, 0, len);
> +
> +    /* Exclude command code from return value */
> +    pmdev->in_buf++;
> +    pmdev->in_buf_len--;
> +
> +    /* The byte after the command code denotes the length */
> +    uint8_t sent_len = pmdev->in_buf[0];
> +
> +    if (sent_len != pmdev->in_buf_len - 1) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: length mismatch. Expected %d bytes, got %d bytes\n",
> +                      __func__, sent_len, pmdev->in_buf_len - 1);
> +    }
> +
> +    /* exclude length byte */
> +    pmdev->in_buf++;
> +    pmdev->in_buf_len--;
> +
> +    if (pmdev->in_buf_len < len) {
> +        len = pmdev->in_buf_len;
> +    }
> +    memcpy(dest, pmdev->in_buf, len);
> +    return len;
> +}
> +
>  
>  static uint64_t pmbus_receive_uint(PMBusDevice *pmdev)
>  {
> diff --git a/include/hw/i2c/pmbus_device.h b/include/hw/i2c/pmbus_device.h
> index 93f5d57c9d..7dc00cc4d9 100644
> --- a/include/hw/i2c/pmbus_device.h
> +++ b/include/hw/i2c/pmbus_device.h
> @@ -501,6 +501,13 @@ void pmbus_send64(PMBusDevice *state, uint64_t data);
>   */
>  void pmbus_send_string(PMBusDevice *state, const char *data);
>  
> +/**
> + * @brief Receive data sent with Block Write.
> + * @param dest - memory with enough capacity to receive the write
> + * @param len - the capacity of dest
> + */
> +uint8_t pmbus_receive_block(PMBusDevice *pmdev, uint8_t *dest, size_t len);
> +
>  /**
>   * @brief Receive data over PMBus
>   * These methods help track how much data is being received over PMBus
> -- 
> 2.40.0.rc1.284.g88254d51c5-goog
> 

