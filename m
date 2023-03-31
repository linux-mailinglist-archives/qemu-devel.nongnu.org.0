Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF236D21BF
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 15:51:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piF9i-0005Yf-KZ; Fri, 31 Mar 2023 09:51:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1piF9f-0005Xw-NW; Fri, 31 Mar 2023 09:50:59 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1piF9e-0005QK-72; Fri, 31 Mar 2023 09:50:59 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-544f7c176easo415747067b3.9; 
 Fri, 31 Mar 2023 06:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680270656; x=1682862656;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+ALD1yV9hC+PQ5OpMsDjktEtFlDCb7jA+DI21FNH3nY=;
 b=guzCSRiVmnt0+6XL0hl1fAwP5llLoMkOmBqPwtbHmFFkYGX04wBsfSpJKTtH2mZuUZ
 5dd6FPDvdkHNJEzgfE7y7GEbowIn5b9Aweypp/ZBT9lBx10oP62g9KD5qVq5vbIL7Vfd
 hFhg7QCYYPt+q238Blsuo5LtPsZc9U0NJh4YDiSiryNNfOrivYrz7jLomnEAjvK83Eer
 i7o3bl3l0KBvR4cF1oe0E6tpLdXTmESf3IywWh9QTRk2guMrm9IbWp3trjRHlv4AgONi
 zSpwg8FW55RtudOwdJXtIMgglI0PCKUq1jFfrL4gYoKqpAKY9ibbzWaWkZLdwOTZmj6m
 X81A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680270656; x=1682862656;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+ALD1yV9hC+PQ5OpMsDjktEtFlDCb7jA+DI21FNH3nY=;
 b=r306pEDtSlZUt874xBdeawCZQRVGW75nOnuKfrlIG0aGn+30ANZW0GoT2B9r/tzESI
 l5Yd2LCbrsUb0oXnv/B23wgPBsjPiD+ek5FaE0StqEIzSllQt+kO00guLO7SFpgS4Fd/
 LzdJXXf8vBvNJQLcVMRrhe9Y4glkY/+LbYSZsLulG4xtmQFwWczycSROTAJRW1oHNQFY
 aQQqunbWB6+pphMPaydyVyQy8iN2616y6v0qVpAKNaJiGeDidB5BEvFQVkHtdRl7yKVm
 ZmpuWdgE6u7DlzQlDit69EkkPNQmMqvRpycT/0FTgWf7xb2MuayP1mSFOuh4oIbZEpxG
 Ss2A==
X-Gm-Message-State: AAQBX9dkIyy9kkH2S1W5/0NraXDzQRZSz/vkpXt2iM8krX7JdtSTB5/w
 kdixa5Jeqv5Gm1nWIEt8Iw==
X-Google-Smtp-Source: AKy350bpW2rg+rto+vtILKr52FRQuNSaK9/lxx/59EmPyZZXuM2tMwtjTp/phOTMhREOlInNcHjXbA==
X-Received: by 2002:a81:62c3:0:b0:541:876d:ae50 with SMTP id
 w186-20020a8162c3000000b00541876dae50mr29398854ywb.44.1680270656501; 
 Fri, 31 Mar 2023 06:50:56 -0700 (PDT)
Received: from serve.minyard.net ([47.184.185.84])
 by smtp.gmail.com with ESMTPSA id
 c144-20020a814e96000000b00545a0818487sm541194ywb.23.2023.03.31.06.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 06:50:55 -0700 (PDT)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:4b5:7e28:63da:3be])
 by serve.minyard.net (Postfix) with ESMTPSA id 20DF21800BB;
 Fri, 31 Mar 2023 13:50:55 +0000 (UTC)
Date: Fri, 31 Mar 2023 08:50:53 -0500
From: Corey Minyard <minyard@acm.org>
To: Titus Rwantare <titusr@google.com>
Cc: philmd@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Hao Wu <wuhaotsh@google.com>
Subject: Re: [PATCH 2/7] hw/i2c: pmbus: add vout mode bitfields
Message-ID: <ZCblPdY53T1Bhg8b@minyard.net>
References: <20230331000756.1712787-1-titusr@google.com>
 <20230331000756.1712787-3-titusr@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230331000756.1712787-3-titusr@google.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=tcminyard@gmail.com; helo=mail-yw1-x112a.google.com
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

On Fri, Mar 31, 2023 at 12:07:51AM +0000, Titus Rwantare wrote:
> The VOUT_MODE command is described in the PMBus Specification,
> Part II, Ver 1.3 Section 8.3
> 
> VOUT_MODE has a three bit mode and 4 bit parameter, the three bit
> mode determines whether voltages are formatted as uint16, uint16,
> VID, and Direct modes. VID and Direct modes use the remaining 5 bits
> to scale the voltage readings.
> 
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Signed-off-by: Titus Rwantare <titusr@google.com>

Ok, I see the new sensor later.

Acked-by: Corey Minyard <cminyard@mvista.com>

> ---
>  include/hw/i2c/pmbus_device.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/include/hw/i2c/pmbus_device.h b/include/hw/i2c/pmbus_device.h
> index 7dc00cc4d9..2e95164aa1 100644
> --- a/include/hw/i2c/pmbus_device.h
> +++ b/include/hw/i2c/pmbus_device.h
> @@ -444,6 +444,14 @@ typedef struct PMBusCoefficients {
>      int32_t R;     /* exponent */
>  } PMBusCoefficients;
>  
> +/**
> + * VOUT_Mode bit fields
> + */
> +typedef struct PMBusVoutMode {
> +    uint8_t  mode:3;
> +    int8_t   exp:5;
> +} PMBusVoutMode;
> +
>  /**
>   * Convert sensor values to direct mode format
>   *
> -- 
> 2.40.0.423.gd6c402a77b-goog
> 

