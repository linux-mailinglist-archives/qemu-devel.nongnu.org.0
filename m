Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AECF04C9A31
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 01:54:11 +0100 (CET)
Received: from localhost ([::1]:47254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPDFq-0007J1-Qr
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 19:54:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1nPD14-00072B-4A; Tue, 01 Mar 2022 19:38:55 -0500
Received: from [2607:f8b0:4864:20::f2d] (port=37672
 helo=mail-qv1-xf2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1nPD11-0001SK-35; Tue, 01 Mar 2022 19:38:52 -0500
Received: by mail-qv1-xf2d.google.com with SMTP id f11so338139qvz.4;
 Tue, 01 Mar 2022 16:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=ZUBmdUWfX+qczDlR5u0jlX5KTVEuBKxWWlt2RPJq4OM=;
 b=WDm2Ec3Vz+3JWmGaaL7/iCqdg2XXHb2N0C+daLKIrma3v9xnH8R2y5M3WCwL2IH76g
 qMRAd66alX54lsTdnby7LERuj8k8YDfaV0aac7wpEd3rXnVDUjooXNPSw2Hfh22n8gPZ
 2NjHYBx2DVXqD8V5DxnCXdA/AKVJoeTMuDcSLp1Y+eqQGra0p5uen6xG+ri8x8luV7B4
 cerdXnS+H0/azWJWDxqa9Ro4Zyal7XWLNu+Oh2EYCUWawGriNuC5I3l+zidY03x8xIWp
 /fvFA3YreWD8/iUFlyRalkPJrPUMLg73oqOVuE0yy7xwOb24UgbvJ2fhBdWxJp+t+Bxw
 30cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=ZUBmdUWfX+qczDlR5u0jlX5KTVEuBKxWWlt2RPJq4OM=;
 b=YANPj/kbTWQ9KVsvk3PWrvOD2+EOi9ITMbSl08kV9jPxIQYpKq5xE1tacEWcJkZ7C6
 5W4i2Re11vRomfdc6/mI0yVYfJ1aZod8Kg29j5NrrxMOyw7eqcInrkeGbrvImZbB/Yyf
 7Xip7R9bXCOVAMmAhpX5DQWP+jrVxgKbopzBfZZH1npvI4BEA0H1ooJC+eQ/3B9zcC1u
 8CjPicwelYUAqwm6GcEF2s7+p/vLXaX+FmvFZryBFh0kxrRv32qT8hCbTFD5CRMnb5uA
 Qo+55LNmWNDYqCsui0sXIFpCmoPyvI/zG6rsMpXLH9t12BphQNrc0lreS01nMGNFLvNB
 HRSg==
X-Gm-Message-State: AOAM532ZI5n+u83i7SEBFeX98CQimcsXjI0awF47/Jk8j/4i61vvpA/L
 T02EpBBY+qrog9JM99/wLQ==
X-Google-Smtp-Source: ABdhPJzbb1T9IrvWsQCp+rTG+shwl3J+PavfLWyAe16YS8rJfPLTtReqQEEvB63q+h2Lpdk5CjqSGQ==
X-Received: by 2002:ad4:4bb2:0:b0:434:febe:c813 with SMTP id
 i18-20020ad44bb2000000b00434febec813mr4384263qvw.51.1646181517382; 
 Tue, 01 Mar 2022 16:38:37 -0800 (PST)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id
 i3-20020a05620a074300b006630cbe7ec0sm3607671qki.90.2022.03.01.16.38.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 16:38:36 -0800 (PST)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:fd74:8a86:f056:f7b9])
 by serve.minyard.net (Postfix) with ESMTPSA id AC4BE1800D7;
 Wed,  2 Mar 2022 00:38:35 +0000 (UTC)
Date: Tue, 1 Mar 2022 18:38:34 -0600
From: Corey Minyard <minyard@acm.org>
To: Titus Rwantare <titusr@google.com>
Subject: Re: [PATCH v2 4/9] hw/i2c: pmbus: refactor uint handling and update
 MAINTAINERS
Message-ID: <20220302003834.GF3457@minyard.net>
References: <20220302002307.1895616-1-titusr@google.com>
 <20220302002307.1895616-5-titusr@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220302002307.1895616-5-titusr@google.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2d;
 envelope-from=tcminyard@gmail.com; helo=mail-qv1-xf2d.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: wuhaotsh@google.com, venture@google.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 01, 2022 at 04:23:02PM -0800, Titus Rwantare wrote:
> Signed-off-by: Titus Rwantare <titusr@google.com>
> ---
>  MAINTAINERS           | 10 ++++++++++
>  hw/i2c/pmbus_device.c | 18 +++++++++---------
>  2 files changed, 19 insertions(+), 9 deletions(-)

This makes sense, but can you split it into two patches and give a bit
more explaination about the uint handling.  Usually patches without
explaination are frowned upon, even if it's kind of obvious.

-corey

> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fa8adc2618..3601984b5d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3135,6 +3135,16 @@ F: include/hw/i2c/smbus_master.h
>  F: include/hw/i2c/smbus_slave.h
>  F: include/hw/i2c/smbus_eeprom.h
>  
> +PMBus
> +M: Titus Rwantare <titusr@google.com>
> +S: Maintained
> +F: hw/i2c/pmbus_device.c
> +F: hw/sensor/adm1272.c
> +F: hw/sensor/max34451.c
> +F: include/hw/i2c/pmbus_device.h
> +F: tests/qtest/adm1272-test.c
> +F: tests/qtest/max34451-test.c
> +
>  Firmware schema specifications
>  M: Philippe Mathieu-Daudé <f4bug@amsat.org>
>  R: Daniel P. Berrange <berrange@redhat.com>
> diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
> index 6eeb0731d7..3beb02afad 100644
> --- a/hw/i2c/pmbus_device.c
> +++ b/hw/i2c/pmbus_device.c
> @@ -89,16 +89,16 @@ void pmbus_send_string(PMBusDevice *pmdev, const char *data)
>  }
>  
>  
> -static uint64_t pmbus_receive_uint(const uint8_t *buf, uint8_t len)
> +static uint64_t pmbus_receive_uint(PMBusDevice *pmdev)
>  {
>      uint64_t ret = 0;
>  
>      /* Exclude command code from return value */
> -    buf++;
> -    len--;
> +    pmdev->in_buf++;
> +    pmdev->in_buf_len--;
>  
> -    for (int i = len - 1; i >= 0; i--) {
> -        ret = ret << 8 | buf[i];
> +    for (int i = pmdev->in_buf_len - 1; i >= 0; i--) {
> +        ret = ret << 8 | pmdev->in_buf[i];
>      }
>      return ret;
>  }
> @@ -110,7 +110,7 @@ uint8_t pmbus_receive8(PMBusDevice *pmdev)
>                        "%s: length mismatch. Expected 1 byte, got %d bytes\n",
>                        __func__, pmdev->in_buf_len - 1);
>      }
> -    return pmbus_receive_uint(pmdev->in_buf, pmdev->in_buf_len);
> +    return pmbus_receive_uint(pmdev);
>  }
>  
>  uint16_t pmbus_receive16(PMBusDevice *pmdev)
> @@ -120,7 +120,7 @@ uint16_t pmbus_receive16(PMBusDevice *pmdev)
>                        "%s: length mismatch. Expected 2 bytes, got %d bytes\n",
>                        __func__, pmdev->in_buf_len - 1);
>      }
> -    return pmbus_receive_uint(pmdev->in_buf, pmdev->in_buf_len);
> +    return pmbus_receive_uint(pmdev);
>  }
>  
>  uint32_t pmbus_receive32(PMBusDevice *pmdev)
> @@ -130,7 +130,7 @@ uint32_t pmbus_receive32(PMBusDevice *pmdev)
>                        "%s: length mismatch. Expected 4 bytes, got %d bytes\n",
>                        __func__, pmdev->in_buf_len - 1);
>      }
> -    return pmbus_receive_uint(pmdev->in_buf, pmdev->in_buf_len);
> +    return pmbus_receive_uint(pmdev);
>  }
>  
>  uint64_t pmbus_receive64(PMBusDevice *pmdev)
> @@ -140,7 +140,7 @@ uint64_t pmbus_receive64(PMBusDevice *pmdev)
>                        "%s: length mismatch. Expected 8 bytes, got %d bytes\n",
>                        __func__, pmdev->in_buf_len - 1);
>      }
> -    return pmbus_receive_uint(pmdev->in_buf, pmdev->in_buf_len);
> +    return pmbus_receive_uint(pmdev);
>  }
>  
>  static uint8_t pmbus_out_buf_pop(PMBusDevice *pmdev)
> -- 
> 2.35.1.616.g0bdcbb4464-goog
> 

