Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D25484ECA
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 08:40:33 +0100 (CET)
Received: from localhost ([::1]:57464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n50uO-0002Of-5X
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 02:40:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1n50iC-0005kk-5J
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 02:28:04 -0500
Received: from [2607:f8b0:4864:20::1030] (port=45618
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1n50i6-0002iU-BK
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 02:27:52 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 l16-20020a17090a409000b001b2e9628c9cso5566076pjg.4
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 23:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1Xo5IFa149SO4ADvZhXcmMCRRBJ3RIWl6rdxC4KsDkY=;
 b=dk99/dJ4YZuObqkmUXNuJng2XbvWvW75jFRPoeMMCwqCVFnBMTeVckRwc+R6DbUjLS
 7kYIuVLVwjS1eRKZN6Ktd65cbEDNhQ17ZTWnT5ppx1kcziqgAD2zEuQf15GSU53kY2bg
 t4Yqp8+4LLmod+R3MJJhnBl5W/sHqyYMq5oDQKyk+o6y1uJxZI1GAsbGtgDq24/spokE
 +/QzjyYDwk/G8HtWNVeRcmaklfbPmeIad6JVP/+SZHQ0Ma8o5Leka+Bg4z9/Cfc3XDzV
 HACR7njqmrsKN1HL9WaVDWwRG2ATj9QGl5bBd0T0NnciAEcnzYrGroYhKSGJh8cAmM2k
 xJww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1Xo5IFa149SO4ADvZhXcmMCRRBJ3RIWl6rdxC4KsDkY=;
 b=Ojm8i7DdcBIFdBZ2pBd0h6dULkpZP6C4nBNy5UqLa5Ph/fV1DifgGqnUiubCCRcvqf
 K5OEFhk07FF07ns7E/JO2I9OH7sqf5dPxrTusa1jbCGZgy0LYP2Mym6+v0B41iTeL/KE
 RU60HhmsMaFlNMOT6qalFpS9AzJSb+RXrUdqKtso/BvMKnd095KL609eJwieUjy5J4Rg
 gzuZ/pxURX00+0NDh5urDHDYjIBjUwOnxgZKzKeJk75HmLutTb/XoRESiHQaOytHgny5
 6fIo03RX4tnECFnNQ3MuBAmeKv9lLt1R7pkwfcob5wiJ1gT9nwzVwNYRqo1PbKzskEVp
 E+1w==
X-Gm-Message-State: AOAM533OpkDNMw6Wvr/Eb5/i2Q1iWVdMQHIQtMuFAPrKKH21UK6rEL6c
 0SuVLGdbiYgypdJsTFGu5YXVV13ou34GWw==
X-Google-Smtp-Source: ABdhPJx8xs5RI+ehyleKtUV7d5OyZLNt712MXzHPXf26877g789PpJGPs60aWoeuZyfpkelzLL6DNQ==
X-Received: by 2002:a17:90b:164f:: with SMTP id
 il15mr2598594pjb.155.1641367666266; 
 Tue, 04 Jan 2022 23:27:46 -0800 (PST)
Received: from [10.76.15.169] ([153.254.110.109])
 by smtp.gmail.com with ESMTPSA id gk13sm1460904pjb.43.2022.01.04.23.27.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 23:27:45 -0800 (PST)
Subject: Re: Re: [PATCH 4/5] usb: allow max 8192 bytes for desc
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 peter.maydell@linaro.org, richard.henderson@linaro.org, kraxel@redhat.com,
 eblake@redhat.com, pbonzini@redhat.com
References: <20211227142734.691900-1-pizhenwei@bytedance.com>
 <20211227142734.691900-5-pizhenwei@bytedance.com>
 <222c5015-399d-0ff0-e061-7dd3a947d4d4@amsat.org>
From: zhenwei pi <pizhenwei@bytedance.com>
Message-ID: <708c4228-d123-b403-09ff-b7d75bf1bba4@bytedance.com>
Date: Wed, 5 Jan 2022 15:25:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <222c5015-399d-0ff0-e061-7dd3a947d4d4@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-1.057, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 1/4/22 11:22 PM, Philippe Mathieu-Daudé wrote:
> On 27/12/21 15:27, zhenwei pi wrote:
>> A device of USB video class usually uses larger desc structure, so
>> use larger buffer to avoid failure.
>>
>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>> ---
>>   hw/usb/desc.c | 15 ++++++++-------
>>   hw/usb/desc.h |  1 +
>>   2 files changed, 9 insertions(+), 7 deletions(-)
>>
>> diff --git a/hw/usb/desc.c b/hw/usb/desc.c
>> index 8b6eaea407..7f6cc2f99b 100644
>> --- a/hw/usb/desc.c
>> +++ b/hw/usb/desc.c
>> @@ -632,7 +632,8 @@ int usb_desc_get_descriptor(USBDevice *dev, 
>> USBPacket *p,
>>       bool msos = (dev->flags & (1 << USB_DEV_FLAG_MSOS_DESC_IN_USE));
>>       const USBDesc *desc = usb_device_get_usb_desc(dev);
>>       const USBDescDevice *other_dev;
>> -    uint8_t buf[256];
>> +    size_t buflen = USB_DESC_MAX_LEN;
>> +    g_autofree uint8_t *buf = g_malloc(buflen);
> 
> Do we want to have a per-device desc_size (in USBDevice, default to
> 256, video devices set it to 8K)?
> 
> How "hot" is this path? Could we keep 8K on the stack?
> 
It's an unlikely code path:
1, During guest startup, guest tries to probe device.
2, run 'lsusb' command in guest

Keeping 8K on the stack also seems OK.

>> diff --git a/hw/usb/desc.h b/hw/usb/desc.h
>> index 3ac604ecfa..35babdeff6 100644
>> --- a/hw/usb/desc.h
>> +++ b/hw/usb/desc.h
>> @@ -199,6 +199,7 @@ struct USBDesc {
>>       const USBDescMSOS         *msos;
>>   };
>> +#define USB_DESC_MAX_LEN    8192
>>   #define USB_DESC_FLAG_SUPER (1 << 1)
>>   /* little helpers */
> 

-- 
zhenwei pi

