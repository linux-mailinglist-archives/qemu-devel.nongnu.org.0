Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B09A4699307
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 12:22:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pScJv-0002I9-NU; Thu, 16 Feb 2023 06:20:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pScJt-0002HK-MK
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 06:20:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pScJr-0007Cw-Va
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 06:20:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676546454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+SGR2OTuFMkTmz30hS3C13oD95Dta+sufNEEj7mbeK0=;
 b=I16342/vB61jUVLU6Ixt+rXKLlxEYmqxUjOFpy3QLXWq3F1b5+KPBFruuBc203aPu/qtYr
 2+zat2OxzttbSF5INbTX7HXZJ3c/oasH7IDmx+AtIkFVsblpRi6ySxr4Dz95RgjTsxqx/9
 raNiSuZBJrR5QRH6uC7cNBOJ0dfZsx0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-206-VzQrjPgyOTGgZkeY3SVMHQ-1; Thu, 16 Feb 2023 06:20:53 -0500
X-MC-Unique: VzQrjPgyOTGgZkeY3SVMHQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 j29-20020a05620a001d00b00724fd33cb3eso967479qki.14
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 03:20:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+SGR2OTuFMkTmz30hS3C13oD95Dta+sufNEEj7mbeK0=;
 b=fqtQ3BzbDBf7KD6hitA1hkGJINAqDIx8o8aesS6Db5WM4sPWwwLT1LEuPTddzKxriS
 m7rB5skGNFU2/OEsS/46+Onc3opc1FRctXWgH7fAa+eIMSPFk4IIvi9FA93txDc6UMNC
 DYaWNzfPqvHymiUhEBjzYPOEEMh4MV/8DLG/gSGDkh8Okr945O5+LSOprdN2RMo3gK1U
 ayf1naP66F9vPTeylBjgp1tEFxqY4X4wyFdXIiMBQwxDq5dpatu1owYT6NOwF89whqVU
 rZ+41BFsZNDm1RwD3PYWb7xWiE8eIY0H+i64a4i2wmMKat35b6PwugQHNOIo/bbzR1Kr
 yrRQ==
X-Gm-Message-State: AO0yUKX62ijOs2e7qHuA6wFi9kvUomIbXlV5edXfbNLmLsBdBCtipccp
 EzPwUqRYLs/5OyCkoYkbtHkqNPiG3FebQzYCXFfJ3y8STGapJY1qWZ4Ox8B1vcBWrO5LtwDla1v
 2/0oLYHTFZy6BpWA=
X-Received: by 2002:a05:622a:592:b0:3ba:1a25:f66 with SMTP id
 c18-20020a05622a059200b003ba1a250f66mr8592518qtb.53.1676546453142; 
 Thu, 16 Feb 2023 03:20:53 -0800 (PST)
X-Google-Smtp-Source: AK7set9ijaSezyyRRSACwOJAfpWYSKoR4Mxdnk9qYilKV4r9wrtMoBgs98J+UaUFEvyWMePrAmt2NQ==
X-Received: by 2002:a05:622a:592:b0:3ba:1a25:f66 with SMTP id
 c18-20020a05622a059200b003ba1a250f66mr8592496qtb.53.1676546452898; 
 Thu, 16 Feb 2023 03:20:52 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-144.web.vodafone.de.
 [109.43.176.144]) by smtp.gmail.com with ESMTPSA id
 r9-20020ac85c89000000b003b869f71eedsm1024031qta.66.2023.02.16.03.20.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 03:20:52 -0800 (PST)
Message-ID: <f987749e-d7d8-7812-b118-2eb449ff09f6@redhat.com>
Date: Thu, 16 Feb 2023 12:20:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 01/14] hw/char/serial-pci: Replace
 DO_UPCAST(PCISerialState) by PCI_SERIAL()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-block@nongnu.org, Hu Tao <hutao@cn.fujitsu.com>,
 Gonglei Arei <arei.gonglei@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>, Li Qiang <liq3ea@163.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, xiaoqiang zhao <zxq_yx_007@163.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20230213184338.46712-1-philmd@linaro.org>
 <20230213184338.46712-2-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230213184338.46712-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 13/02/2023 19.43, Philippe Mathieu-Daudé wrote:
> Use the PCI_SERIAL() QOM type-checking macro to avoid DO_UPCAST().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/char/serial-pci.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/char/serial-pci.c b/hw/char/serial-pci.c
> index 801b769aba..9689645cac 100644
> --- a/hw/char/serial-pci.c
> +++ b/hw/char/serial-pci.c
> @@ -36,7 +36,10 @@
>   #include "qom/object.h"
>   
>   struct PCISerialState {
> +    /*< private >*/
>       PCIDevice dev;
> +    /*< public >*/
> +

I'm not sure about this part of the patch. It does not seem to be related to 
the other changes at all, and are you sure about which parts are really 
"public" and which parts are "private"? If so, I'd like to see a description 
about this in the commit message, preferably in a separate patch. Also, why 
an empty line after the "public" comment?

>       SerialState state;
>       uint8_t prog_if;
>   };
> @@ -46,7 +49,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(PCISerialState, PCI_SERIAL)
>   
>   static void serial_pci_realize(PCIDevice *dev, Error **errp)
>   {
> -    PCISerialState *pci = DO_UPCAST(PCISerialState, dev, dev);
> +    PCISerialState *pci = PCI_SERIAL(dev);
>       SerialState *s = &pci->state;
>   
>       if (!qdev_realize(DEVICE(s), NULL, errp)) {
> @@ -63,7 +66,7 @@ static void serial_pci_realize(PCIDevice *dev, Error **errp)
>   
>   static void serial_pci_exit(PCIDevice *dev)
>   {
> -    PCISerialState *pci = DO_UPCAST(PCISerialState, dev, dev);
> +    PCISerialState *pci = PCI_SERIAL(dev);
>       SerialState *s = &pci->state;
>   
>       qdev_unrealize(DEVICE(s));

Ack for the DO_UPCAST removal.

  Thomas


