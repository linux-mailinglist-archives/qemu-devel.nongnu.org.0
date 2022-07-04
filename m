Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC213565226
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 12:27:02 +0200 (CEST)
Received: from localhost ([::1]:60756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8JIE-0003vH-0w
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 06:27:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o8JEp-0001Qk-Ud
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 06:23:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o8JEm-0004CV-Ug
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 06:23:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656930207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bLXWdW1OqSM9FtEHEE9v5KYWqP90bIZD4fon+v0UH7I=;
 b=XT2891m+ttHVVAccm72edTgcsl59qe9NwrM976BT1aHEyC8jA05mdnvFmvw4pLmGe8BPbm
 ZOcxRu1giX5qwUAK5uvPhxNDoS4kGyITJURI+s4jppwbkuWKqZnVRUxEa65Xt6MxCrDakH
 vboGRbGXZUSNlpJrbPZrCWa7uLtsv/Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-501-GdV57kEmM4WBUbG9Dkljww-1; Mon, 04 Jul 2022 06:23:26 -0400
X-MC-Unique: GdV57kEmM4WBUbG9Dkljww-1
Received: by mail-wm1-f71.google.com with SMTP id
 k16-20020a7bc310000000b0038e6cf00439so5149208wmj.0
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 03:23:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bLXWdW1OqSM9FtEHEE9v5KYWqP90bIZD4fon+v0UH7I=;
 b=vi8DTo/KkOYSFritKf2swMegFJP6o8b2PlafW93gYIxgR/luY/HY08g0UfVnCMdiZe
 vdOgYvrVBTwwliZDlVBRP4GzIpoFh4sHjNI2ZqEuyjlMuWYJ4F/DgIvK1IkoGlZY+Zmz
 7t/7l/YNpjA+bnusUGCKaL0o+MR1pP/xpItIWV5iTxSolLOyyGPoK/ianBlCuot5v2AG
 Unnlqigm1uqJqPIh7ZQ8bNnYNwn8qKcsAiApBfF2MqTYZTgIQQhoE9Fe68gHDVS73Jo+
 5kftxrPP2jyEB/c0fV+Y56ALd9410t9tuJFKAPKVgGCaThX2X8dbEbRy7vLDoPedxUM1
 yHAA==
X-Gm-Message-State: AJIora8xlo5spQjGxmauUMgb3tNbcQBzzNgoLFuUKyuC9i+b7Uo6Eq7g
 qEEUxNi1qQ3a98zLQ3YggDV6XAiBNc8oKnz+iW8iVZATztsgVccG1Gg9hQVfo6KdM4MeDubB28X
 6/lGUyo812Q7Iaxw=
X-Received: by 2002:a05:6000:88:b0:21d:691c:38d5 with SMTP id
 m8-20020a056000008800b0021d691c38d5mr5489815wrx.450.1656930205467; 
 Mon, 04 Jul 2022 03:23:25 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tiQHC2xWi45kuRNSklvjfKFrQfxf4qPsZDMEQrDR+54fyq9W9ri3OSLJOOSTKxDc49vznmuw==
X-Received: by 2002:a05:6000:88:b0:21d:691c:38d5 with SMTP id
 m8-20020a056000008800b0021d691c38d5mr5489790wrx.450.1656930205146; 
 Mon, 04 Jul 2022 03:23:25 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 x1-20020a1c7c01000000b003a02b135747sm18987283wmc.46.2022.07.04.03.23.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 03:23:24 -0700 (PDT)
Message-ID: <78ac87ee-e40b-8d18-3775-4417edb74fa3@redhat.com>
Date: Mon, 4 Jul 2022 12:23:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 03/11] goldfish_rtc: Add endianness property
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Stafford Horne <shorne@gmail.com>, QEMU Development <qemu-devel@nongnu.org>
Cc: Openrisc <openrisc@lists.librecores.org>, Anup Patel
 <anup.patel@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:Goldfish RTC" <qemu-riscv@nongnu.org>
References: <20220703212823.10067-1-shorne@gmail.com>
 <20220703212823.10067-4-shorne@gmail.com>
 <272f1e82-ff1b-9a7a-931b-91472dd244bf@linaro.org>
 <b8d2595b-c86a-b1b8-8912-13fc9ba782d3@redhat.com>
 <31017a43-3ebb-0aa3-f6ce-d2df1b5dc177@linaro.org>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <31017a43-3ebb-0aa3-f6ce-d2df1b5dc177@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/07/2022 12:21, Richard Henderson wrote:
> On 7/4/22 15:46, Laurent Vivier wrote:
>> On 04/07/2022 11:59, Richard Henderson wrote:
>>> On 7/4/22 02:58, Stafford Horne wrote:
>>>> -static const MemoryRegionOps goldfish_rtc_ops = {
>>>> -    .read = goldfish_rtc_read,
>>>> -    .write = goldfish_rtc_write,
>>>> -    .endianness = DEVICE_NATIVE_ENDIAN,
>>>> -    .valid = {
>>>> -        .min_access_size = 4,
>>>> -        .max_access_size = 4
>>>> -    }
>>>> +static const MemoryRegionOps goldfish_rtc_ops[3] = {
>>>> +    [DEVICE_NATIVE_ENDIAN] = {
>>>> +        .read = goldfish_rtc_read,
>>>> +        .write = goldfish_rtc_write,
>>>> +        .endianness = DEVICE_NATIVE_ENDIAN,
>>>> +        .valid = {
>>>> +            .min_access_size = 4,
>>>> +            .max_access_size = 4
>>>> +        }
>>>> +    },
>>>> +    [DEVICE_LITTLE_ENDIAN] = {
>>>> +        .read = goldfish_rtc_read,
>>>> +        .write = goldfish_rtc_write,
>>>> +        .endianness = DEVICE_LITTLE_ENDIAN,
>>>> +        .valid = {
>>>> +            .min_access_size = 4,
>>>> +            .max_access_size = 4
>>>> +        }
>>>> +    },
>>>> +    [DEVICE_BIG_ENDIAN] = {
>>>> +        .read = goldfish_rtc_read,
>>>> +        .write = goldfish_rtc_write,
>>>> +        .endianness = DEVICE_BIG_ENDIAN,
>>>> +        .valid = {
>>>> +            .min_access_size = 4,
>>>> +            .max_access_size = 4
>>>> +        }
>>>> +    },
>>>>   };
>>>
>>> You don't need 3 copies, only big and little.
>>>
>>>> +static Property goldfish_rtc_properties[] = {
>>>> +    DEFINE_PROP_UINT8("endianness", GoldfishRTCState, endianness,
>>>> +                      DEVICE_NATIVE_ENDIAN),
>>>> +    DEFINE_PROP_END_OF_LIST(),
>>>> +};
>>>
>>> ... and I think the clear desire for default is little-endian.  I would make the 
>>> property be bool, and add a comment that this is only for m68k compatibility, so don't 
>>> use it in new code.
>>
>> m68k doesn't really need this.
>>
>> kernel with the m68k virt machine and goldfish device supports "native" mode so I think 
>> it's not needed to add another layer of complexity for it.
> 
> "Another level"?  I'm talking about removing "native", and only having "big" and "little", 
> which is less complexity.

"Less complexity" is to keep only native. I'm not against the change, I'm just saying it's 
not needed by m68k.

Thanks,
Laurent


