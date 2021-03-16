Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B87E33D235
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 11:57:31 +0100 (CET)
Received: from localhost ([::1]:35734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM7OE-0008Qu-BD
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 06:57:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lM7Mf-0007jo-AL
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 06:55:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lM7Md-0004Ul-Gx
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 06:55:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615892150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ut3i0HY07uCTm0cwRjtGnL/F6vjL1ktmZLgRyY+bhY0=;
 b=iBvFlbzhYTS3NuvieOj5+wdsrkli3dX+vkKFIi0dlm/Cyc9HeRJk/vylaBdCkkE9apEWU6
 /mxCZRWT/LDTTaaJQWBcJKB0ukG7rYoUB14ILilT4WTVUZrKojMi/KvebuR8Bu1R/W1zs9
 cD2Rt1iTaa2cwheZE3s7DYro0jHw9AQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-0KDyq2qUNy6z029VcDKb-g-1; Tue, 16 Mar 2021 06:55:48 -0400
X-MC-Unique: 0KDyq2qUNy6z029VcDKb-g-1
Received: by mail-wr1-f71.google.com with SMTP id r12so16494876wro.15
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 03:55:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ut3i0HY07uCTm0cwRjtGnL/F6vjL1ktmZLgRyY+bhY0=;
 b=W87Mj5k62fIG9wDoLdDmNz4/zaTc+zglCfZpnRsU05+uIEnymYc7oIe3zTL/K4PqlA
 VJhy1/OzKbC5AvC6AUTb28XBYJ+BZnAfL8rd76RONtJ6Cccn4cEGUghZGEfMAKf4/K3t
 Ja+VI1NoE0rs0MO0jE4iwURrbS9bYlOxBfXPUNlUmt7+ae0OYWOTsaNX8hlCv+78eXZw
 GYW+WSu+tf0KpQGmUhPPuHFEP7jss8HVYRlq30QKuMcH4XucauQlajOSn5Y4nFsXgnqA
 7rF+HzQZiEzmOoU0DOTbDDW2+n+B83OJPtsORKjm7UY4HGdHIOUxF15q+GdqEO3ILFRL
 H8/w==
X-Gm-Message-State: AOAM531QOA6yxXrhIqPhF9N5Gb5EAHtBMM7Ko62dqlblnlNIOA7GZXzP
 kAlOw7J0SlzTtqOxEAKM2yM6R5FbDLni+f03IjJIH6FoQNRuwPXHzaCiSAdTMVgCbq1RuTYxndj
 QsYaO8i/OZN0uRzs=
X-Received: by 2002:adf:f78f:: with SMTP id q15mr4096104wrp.383.1615892147673; 
 Tue, 16 Mar 2021 03:55:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwaDaw1WSXbmRCVeoMXrKjUg3NGKYkS7IJXI02R0WbRjP63xMDpH3sO4hsKnt7LiaV5ElCw+Q==
X-Received: by 2002:adf:f78f:: with SMTP id q15mr4096092wrp.383.1615892147518; 
 Tue, 16 Mar 2021 03:55:47 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id p6sm21409446wru.2.2021.03.16.03.55.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 03:55:47 -0700 (PDT)
Subject: Re: [PATCH 1/6] accel: Introduce 'query-accels' QMP command
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210311231202.1536040-1-philmd@redhat.com>
 <20210311231202.1536040-2-philmd@redhat.com>
 <b71367e7-eade-e7fb-d612-8bc18fba35c3@redhat.com>
 <87ft0va8wp.fsf@dusky.pond.sub.org>
 <04e9cbd3-1773-c953-10a5-ad6299c35354@redhat.com>
 <0b5efc04-817d-6e17-075c-86eab1b7ab1f@redhat.com>
Message-ID: <74d442cd-5e39-f9a4-6ca5-e2656280aa73@redhat.com>
Date: Tue, 16 Mar 2021 11:55:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <0b5efc04-817d-6e17-075c-86eab1b7ab1f@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P=2eBerrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/16/21 11:26 AM, Philippe Mathieu-Daudé wrote:
> On 3/16/21 10:02 AM, Philippe Mathieu-Daudé wrote:
>> On 3/16/21 7:51 AM, Markus Armbruster wrote:
>>> Eric Blake <eblake@redhat.com> writes:
>>>
>>>> On 3/11/21 5:11 PM, Philippe Mathieu-Daudé wrote:
>>> [...]
>>>>> diff --git a/accel/accel-qmp.c b/accel/accel-qmp.c
>>>>> new file mode 100644
>>>>> index 00000000000..f16e49b8956
>>>>> --- /dev/null
>>>>> +++ b/accel/accel-qmp.c
>>>>> @@ -0,0 +1,47 @@
>>>>> +/*
>>>>> + * QEMU accelerators, QMP commands
>>>>> + *
>>>>> + * Copyright (c) 2021 Red Hat Inc.
>>>>> + *
>>>>> + * SPDX-License-Identifier: GPL-2.0-or-later
>>>>> + */
>>>>> +
>>>>> +#include "qemu/osdep.h"
>>>>> +#include "qapi/qapi-commands-machine.h"
>>>>> +
>>>>> +static const Accelerator accel_list[] = {
>>>>> +    ACCELERATOR_QTEST,
>>>>> +#ifdef CONFIG_TCG
>>>>> +    ACCELERATOR_TCG,
>>>>> +#endif
>>>>> +#ifdef CONFIG_KVM
>>>>> +    ACCELERATOR_KVM,
>>>>> +#endif
>>>>
>>>> ...would it be worth compiling the enum to only list enum values that
>>>> were actually compiled in?  That would change it to:
>>>>
>>>> { 'enum': 'Accelerator',
>>>>   'data': [ 'qtest',
>>>>             { 'name': 'tcg', 'if': 'defined(CONFIG_TCG)' },
>>>> ...
>>
>> These accelerator definitions are supposed to be poisoned in generic
>> code... But I like the simplicity of your suggestion, so I'll give it
>> a try and see what happens with removing the poisoned definitions.
> 
> This is actually quite interesting :) Accelerator definitions are
> declared in config-target.h, but acceleration is host specific...

Thomas, I guess I hit Claudio's reported bug again...

1/ generic libqemuutil.a is built without any CONFIG_accel definition.

So this qapi-generated enum ... :

typedef enum Accelerator {
    ACCELERATOR_QTEST,
#if defined(CONFIG_TCG)
    ACCELERATOR_TCG,
#endif /* defined(CONFIG_TCG) */
#if defined(CONFIG_KVM)
    ACCELERATOR_KVM,
#endif /* defined(CONFIG_KVM) */
#if defined(CONFIG_HAX)
    ACCELERATOR_HAX,
#endif /* defined(CONFIG_HAX) */
#if defined(CONFIG_HVF)
    ACCELERATOR_HVF,
#endif /* defined(CONFIG_HVF) */
#if defined(CONFIG_WHPX)
    ACCELERATOR_WHPX,
#endif /* defined(CONFIG_WHPX) */
#if defined(CONFIG_XEN_BACKEND)
    ACCELERATOR_XEN,
#endif /* defined(CONFIG_XEN_BACKEND) */
    ACCELERATOR__MAX,
} Accelerator;

... is expanded to:

typedef enum Accelerator {
    ACCELERATOR_QTEST,
    ACCELERATOR__MAX,
} Accelerator;

2/ softmmu code and qtest do get the definition, the enum
   is different:

typedef enum Accelerator {
    ACCELERATOR_QTEST,
    ACCELERATOR_KVM,
    ACCELERATOR__MAX,
} Accelerator;

qmp_query_accels() fills AcceleratorInfoList with 2 entries

3/ trying to understand what's happening, query-qmp-schema
   returns:

        {
            "name": "206",
            "tag": "name",
            "variants": [
                {
                    "case": "qtest",
                    "type": "0"
                },
                {
                    "case": "kvm",
                    "type": "0"
                }
            ],
            "members": [
                {
                    "name": "name",
                    "type": "403"
                }
            ],
            "meta-type": "object"
        },
        {
            "name": "403",
            "meta-type": "enum",
            "values": [
                "qtest",
                "kvm"
            ]
        },

So accelerators are listed, but with the same enum index?

4/ Running 'query-accels' aborts in qapi_enum_lookup():

The first entry 'qtest' is visited correctly.
When the second entry 'kvm' is visited, this assertion fires:

    assert(val >= 0 && val < lookup->size);

because lookup->size = 1 (remember from 1/ Accelerator_lookup
has been compiled without definitions, in libqemuutil.a).

I'll keep the current patch, as it works, and address the rest
of this series comments.

Thanks,

Phil.


