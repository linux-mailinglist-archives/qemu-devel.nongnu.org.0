Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 032A947B144
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 17:38:36 +0100 (CET)
Received: from localhost ([::1]:42436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzLgF-0004UW-Vq
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 11:38:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzKgy-00022x-Vr
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:35:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzKgw-0005fR-Hb
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:35:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640014509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hzbSRRX48lRGIHb4RSUYlFl+jLPR26DdeyrMP/zi3sg=;
 b=RcIM6H5Zl4Mo8I41ABy8bSFUpO5T/JGev4/1Ag9rQQfdQ9CcU/JlxeTNR2wW/4L5AvHmkR
 R93BkL1CwQDDQO/m5jSm0pTvrt8CXp/ubrWx5I5m9XXen709e6yFsk3Av7e2YmOZnDe8WM
 jfCDVdPdaAzCKBwNtB425MnABY0SaRw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-354-UWmFQppdMWij7FUXjEYdKQ-1; Mon, 20 Dec 2021 04:12:38 -0500
X-MC-Unique: UWmFQppdMWij7FUXjEYdKQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 bg20-20020a05600c3c9400b0033a9300b44bso3072626wmb.2
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 01:12:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hzbSRRX48lRGIHb4RSUYlFl+jLPR26DdeyrMP/zi3sg=;
 b=dJyEElbDAxllrdjmXI9R+G7fJGlCNvf2+qhVyI8bsZbmMC9I34BHSgZhusY4Qy1W5t
 uhqlRyvtesbhkpCDcnlDPUrS/n7Bwpjgn0sGwf48bOzMQ17jrlFYIaimGV0T6HuuhJjZ
 mlStA2yitfcvSBVAEk7eg7yzy4uJUtm9jj4rOXJ8/tQQnhmRiRT7VzzPv4sE4I97na7P
 pUm6UQBjq0oHtGgox/VLQ34GOiTwzU5JPD+P5nycjDI7f9yW5vu1WjbeF+q4mF6ZqmDC
 IlFErAcBGUQGtCcgiKmKnI7NzJ8TZnLmD3y7hzkyT+kt3kH4BiCAzxAV2F4tnbCb06SZ
 YweQ==
X-Gm-Message-State: AOAM531ZR44D1P4HkgHfzfFF7UnY5QDLCZqj3vPic2A/pte905tzlC0r
 p+zthmzyHRkAV5vKy6QSQaOUs2jfq2sGbBeNk3ikiWShnBux5AF0BgKNC3eJ/CuIxVDuR01cten
 aMGb5S1kk45np4NQ=
X-Received: by 2002:adf:ce84:: with SMTP id r4mr12341221wrn.131.1639991557237; 
 Mon, 20 Dec 2021 01:12:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwU+ZWqz0DEzbpzBuBOB17o2FvNvdrnxoPiP6IF6mADN/8vADjeBwQsiYKu6zQrMKd6RUajTg==
X-Received: by 2002:adf:ce84:: with SMTP id r4mr12341151wrn.131.1639991555984; 
 Mon, 20 Dec 2021 01:12:35 -0800 (PST)
Received: from [192.168.50.34] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180])
 by smtp.gmail.com with ESMTPSA id a10sm20456247wmq.27.2021.12.20.01.12.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 01:12:35 -0800 (PST)
Message-ID: <498f2e14-607a-afc3-d73a-58e7f6dad8e2@redhat.com>
Date: Mon, 20 Dec 2021 10:12:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] hw/nvram: at24 return 0xff if 1 byte address
To: Patrick Venture <venture@google.com>, cminyard@mvista.com
References: <20211220003240.1081986-1-venture@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211220003240.1081986-1-venture@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.209,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.608, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Patrick,

On 12/20/21 01:32, Patrick Venture wrote:
> The at24 eeproms are 2 byte devices that return 0xff when they are read
> from with a partial (1-byte) address written.  This distinction was
> found comparing model behavior to real hardware testing.
> 
> Tested: `i2ctransfer -f -y 45 w1@85 0 r1` returns 0xff instead of next
> byte
> 
> Signed-off-by: Patrick Venture <venture@google.com>
> ---
>  hw/nvram/eeprom_at24c.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
> index a9e3702b00..184fac9702 100644
> --- a/hw/nvram/eeprom_at24c.c
> +++ b/hw/nvram/eeprom_at24c.c
> @@ -62,7 +62,9 @@ int at24c_eeprom_event(I2CSlave *s, enum i2c_event event)
>      case I2C_START_SEND:
>      case I2C_START_RECV:
>      case I2C_FINISH:
> -        ee->haveaddr = 0;
> +        if (event != I2C_START_RECV) {
> +            ee->haveaddr = 0;
> +        }

Alternatively (matter of taste, I find it easier to read):

       case I2C_START_SEND:
       case I2C_FINISH:
           ee->haveaddr = 0;
           /* fallthrough */
       case I2C_START_RECV:

>          DPRINTK("clear\n");
>          if (ee->blk && ee->changed) {
>              int len = blk_pwrite(ee->blk, 0, ee->mem, ee->rsize, 0);
> @@ -86,6 +88,10 @@ uint8_t at24c_eeprom_recv(I2CSlave *s)
>      EEPROMState *ee = AT24C_EE(s);
>      uint8_t ret;
>  
> +    if (ee->haveaddr == 1) {
> +        return 0xff;

Don't we need to increase ee->haveaddr?

> +    }
> +
>      ret = ee->mem[ee->cur];
>  
>      ee->cur = (ee->cur + 1u) % ee->rsize;

Here for parity with send, what about:

    if (ee->haveaddr < 2) {
        ret = 0xff;
        ee->haveaddr++;
    } else {
        ret = ee->mem[ee->cur];
        ee->cur = (ee->cur + 1u) % ee->rsize;
    }

?


