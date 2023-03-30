Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 492CB6D0AF2
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 18:24:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phv3t-0005KM-Kx; Thu, 30 Mar 2023 12:23:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1phv3m-0005FN-02; Thu, 30 Mar 2023 12:23:34 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1phv3j-00026l-My; Thu, 30 Mar 2023 12:23:32 -0400
Received: by mail-qt1-x835.google.com with SMTP id ga7so19006971qtb.2;
 Thu, 30 Mar 2023 09:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680193410; x=1682785410;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=28uDGd4/uu9orWEnADlopTUFLkqJ2AKQ9WdNjEAf3FQ=;
 b=GUykG6lwKIMlca7UjXwtivL7RPHiKhzyCy9Ktc2DKkmbmG0/RgZ1ZKQg/MXb841H2p
 NufLf5OlRNQwz3k4l0dZyM8m2fOWIktHOyCmnDPk9u2liMNLX7KgJZGiFbvOaH7VX5i5
 MG3Qy+XocxpDr1smzg3OyvWIDkdwY4rI9Jewezmstl+XmaTgVZaxOGck/fRK8pH79Q3D
 nkj0c6T+w+h0TJrEffZAPu9S3DffIgWxKSbyWo1+2/trPfMdTuEr+qAWbwqy8ojmMEEN
 sh9qKSRA3aTA1e8b0fe40daPfcdD4/hPLx/aQZhizKiQGKlNR5PXOwDVRpq66GP6CZ4J
 hwcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680193410; x=1682785410;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=28uDGd4/uu9orWEnADlopTUFLkqJ2AKQ9WdNjEAf3FQ=;
 b=JOOAX+CWoAVz01qSsFlc8oI2OfyjrWeX1N6gmEYyYEdBEXgfw3C9y6zUJxphTZwLYO
 W/2yw1h7nshGT2YK0w4Tl1SC6HX59EqwPoq8c5KFJGWpmA6G/zMS0HgIhdxMZ46umebg
 SkKyw+ega1YERXStyL89JPsuCcXrCbqBx0VOElddVDp4K1Dnqm086stIOkoYjZVLO3fv
 ocO7/jQzrlvWStwkfyxNIFiKN3stxdSS3mGzO0yMg2Hzl11zxlQrpcbBoq8BOSsjV0Pv
 pfujiGDvSxe3jVimA7rbKFcvMkDrfUefYqcMPeo9nS+YL4mG5cWetTfb4mVZzI6Y2Z1b
 3ZPQ==
X-Gm-Message-State: AO0yUKXqShOube3GD9dCIO/oXRuVKq08LRUFGDi1Sl2RCmgzYe3KTz59
 WABmc/WPt3UyKD5hn0tyRES9PFPJ3g==
X-Google-Smtp-Source: AKy350Y3ZMYV7OFVhR4BJNxDV6K3l1Uxa2nKPhjH4HTXmMlxaSX1e7/rk4Gh/3GAEQpV1rqQ3TTMFw==
X-Received: by 2002:ac8:5ad1:0:b0:3bf:c474:df98 with SMTP id
 d17-20020ac85ad1000000b003bfc474df98mr39455798qtd.56.1680193410141; 
 Thu, 30 Mar 2023 09:23:30 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id
 j185-20020a37b9c2000000b007465ad44891sm18540582qkf.102.2023.03.30.09.23.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 09:23:29 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:92e9:7a86:2720:254b])
 by serve.minyard.net (Postfix) with ESMTPSA id CE3B61800BB;
 Thu, 30 Mar 2023 16:23:28 +0000 (UTC)
Date: Thu, 30 Mar 2023 11:23:27 -0500
From: Corey Minyard <minyard@acm.org>
To: Titus Rwantare <titusr@google.com>
Cc: philmd@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Patrick Venture <venture@google.com>
Subject: Re: [PATCH 4/5] hw/i2c: pmbus: block uninitialised string reads
Message-ID: <ZCW3fxy0g5QLRqCO@minyard.net>
References: <20230322175513.1550412-1-titusr@google.com>
 <20230322175513.1550412-5-titusr@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230322175513.1550412-5-titusr@google.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=tcminyard@gmail.com; helo=mail-qt1-x835.google.com
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

On Wed, Mar 22, 2023 at 05:55:12PM +0000, Titus Rwantare wrote:
> Devices models calling pmbus_send_string can't be relied upon to
> send a non-zero pointer. This logs an error and doesn't segfault.

Yes, a good idea.

Acked-by: Corey Minyard <cminyard@mvista.com>

> 
> Reviewed-by: Patrick Venture <venture@google.com>
> Signed-off-by: Titus Rwantare <titusr@google.com>
> ---
>  hw/i2c/pmbus_device.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
> index bb42e410b4..18e629eaac 100644
> --- a/hw/i2c/pmbus_device.c
> +++ b/hw/i2c/pmbus_device.c
> @@ -94,6 +94,13 @@ void pmbus_send64(PMBusDevice *pmdev, uint64_t data)
>  
>  void pmbus_send_string(PMBusDevice *pmdev, const char *data)
>  {
> +    if (!data) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: %s: uninitialised read from 0x%02x\n",
> +                      __func__, DEVICE(pmdev)->canonical_path, pmdev->code);
> +        return;
> +    }
> +
>      size_t len = strlen(data);
>      g_assert(len + pmdev->out_buf_len < SMBUS_DATA_MAX_LEN);
>      pmdev->out_buf[len + pmdev->out_buf_len] = len;
> -- 
> 2.40.0.rc1.284.g88254d51c5-goog
> 

