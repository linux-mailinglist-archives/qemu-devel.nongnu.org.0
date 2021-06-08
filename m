Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C05439F1AF
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 11:09:09 +0200 (CEST)
Received: from localhost ([::1]:56714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqXjQ-0003W1-B5
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 05:09:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lqXhp-0002GR-4t
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 05:07:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lqXhi-0006B9-04
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 05:07:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623143239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hVwGFAFFERJ2mkxTdg+lhbpFQYLK/yIsBintzYulUNY=;
 b=TxuR9Dt6Ek4gRdwN1Tu7om8ieQDGsGnjZ5AZcfxQpzu3fSwk5TAojL3rNb1HzWeMb37BJg
 Dl8OXQ2ZBw8Qfmnvb4J4i1GGv5UdHYGupLCFKgOKOkR16ZiQLO89PIChhwvSRif+QzFJYa
 GjHXOXXg/950Dx3XhAQfyzMth/501sM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-ZoUFF6ChNcOfVRPsc-iDYQ-1; Tue, 08 Jun 2021 05:07:15 -0400
X-MC-Unique: ZoUFF6ChNcOfVRPsc-iDYQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 o82-20020a1ca5550000b029019ae053d508so475654wme.6
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 02:07:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hVwGFAFFERJ2mkxTdg+lhbpFQYLK/yIsBintzYulUNY=;
 b=B9LViZF8ONAK059SmgtgTIS8NijJw69U97MqD38TrcO+OZsQ3NSWyjNNwc5o1qY3db
 IwbZ5fCR2OG3GCxsxepPeK1ITi27S1P/T24PLCcZvMPt9HdUUvE5jJ7DkJKald5N0uct
 1si73Dxy9NOPWADnCpqZpU5/eWg0YzSquYDmFH91DTzaARQfYgdS+T1w09vOzVWwEbUC
 +g4m5FZ0UzvrXtQ+Z7iFokY9SCV4dxdsMLKvtPouppket8zQra+ge9VPq4NTzZa2fNYf
 v1tsi9FOFPpgxP0CfQSu2t/unWXPlRV3z4OZtJN70H/35NpcyirfuoPp5A+ADSQ3fnSQ
 FFVQ==
X-Gm-Message-State: AOAM530p1LVhpHulQQj1wN2SdvQg6bOOmqk+4GbwK7VYQXWI6kKv4pHA
 qR/6ldf6muFx0DrSJgunGPTBpCevmDehBFsFsdDuPMnH6z9NMU0xlK1QRjR/9oVwDLYrg7GGq1F
 E/XbIbv4GAdr40IY=
X-Received: by 2002:a7b:c19a:: with SMTP id y26mr3099707wmi.132.1623143234640; 
 Tue, 08 Jun 2021 02:07:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUhJ9QEcJHktVMpRh2cHGuj8cTe5v0LntRgmCSaaCcm2VxtOtzC46MCi1FuywH0UqaBCu0FQ==
X-Received: by 2002:a7b:c19a:: with SMTP id y26mr3099684wmi.132.1623143234412; 
 Tue, 08 Jun 2021 02:07:14 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id n42sm2032003wms.29.2021.06.08.02.07.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 02:07:13 -0700 (PDT)
Subject: Re: [PATCH v16 02/99] accel: Introduce 'query-accels' QMP command
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-3-alex.bennee@linaro.org>
 <14b256ef-4fc2-302c-45b1-295c26aa76ce@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <70c80ba3-e842-6a34-c9c9-8b24efef2bd7@redhat.com>
Date: Tue, 8 Jun 2021 11:07:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <14b256ef-4fc2-302c-45b1-295c26aa76ce@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 3:07 PM, Thomas Huth wrote:
> On 04/06/2021 17.51, Alex Bennée wrote:
>> From: Philippe Mathieu-Daudé <philmd@redhat.com>
>>
>> Introduce the 'query-accels' QMP command which returns a list
>> of built-in accelerator names.
>>
>> - Accelerator is a QAPI enum of all existing accelerators,
>>
>> - AcceleratorInfo is a QAPI structure providing accelerator
>>    specific information. Currently the common structure base
>>    provides the name of the accelerator, while the specific
>>    part is empty, but each accelerator can expand it.
>>
>> - 'query-accels' QMP command returns a list of @AcceleratorInfo
>>
>> For example on a KVM-only build we get:
>>
>>      { "execute": "query-accels" }
>>      {
>>          "return": [
>>              {
>>                  "name": "qtest"
>>              },
>>              {
>>                  "name": "kvm"
>>              }
>>          ]
>>      }
>>
>> Note that we can't make the enum values or union branches conditional
>> because of target-specific poisoning of accelerator definitions.
>>
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>> Tested-by: Alex Bennée <alex.bennee@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> Message-Id: <20210505125806.1263441-3-philmd@redhat.com>
>> ---
> [...]
>> +static const bool accel_builtin_list[ACCELERATOR__MAX] = {
>> +    [ACCELERATOR_QTEST] = true,
>> +#ifdef CONFIG_TCG
>> +    [ACCELERATOR_TCG] = true,
>> +#endif
>> +#ifdef CONFIG_KVM
>> +    [ACCELERATOR_KVM] = true,
>> +#endif
>> +#ifdef CONFIG_HAX
>> +    [ACCELERATOR_HAX] = true,
>> +#endif
>> +#ifdef CONFIG_HVF
>> +    [ACCELERATOR_HVF] = true,
>> +#endif
>> +#ifdef CONFIG_WHPX
>> +    [ACCELERATOR_WHPX] = true,
>> +#endif
>> +#ifdef CONFIG_XEN_BACKEND
>> +    [ACCELERATOR_XEN] = true,
>> +#endif
> 
> Nit: Use alphabetical order here, too, just like you did in the enum?

This has been drastically simplified by Markus using target-specific
machine code in v8.


