Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E78633D04B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 10:04:59 +0100 (CET)
Received: from localhost ([::1]:57794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM5dK-0003F4-LY
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 05:04:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lM5ba-0002ST-Q6
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 05:03:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lM5bY-00045x-DX
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 05:03:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615885387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h4JytCPsg8Vm/OXgQAAjt+nN3FJcsc9v32THS8Hne38=;
 b=KWVEvbB+FjpETFa1mtFp1oYZ9n2BMkQPchu6C2eYNy4+5oBqGBHxgz6tBwVWKnFX9jXzqv
 CVorTgglQgNWEFUwoMbqoqQ3UZM5hiGZ5r4J/3toRCKx58nWA7la1L/icl6MGfdpfsr6w6
 6goPLxzl5IIC9/n7wO49RDNetQfdX+E=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-K8WzQ4-4MXmCasE-825SoA-1; Tue, 16 Mar 2021 05:03:02 -0400
X-MC-Unique: K8WzQ4-4MXmCasE-825SoA-1
Received: by mail-wr1-f71.google.com with SMTP id o11so336421wrc.4
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 02:03:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h4JytCPsg8Vm/OXgQAAjt+nN3FJcsc9v32THS8Hne38=;
 b=DTjo0q67kv0hL58wmeVux75ouSn2E1jPj6z7fjkLITxETSZytLv3MYuGqIpMOZx3SW
 l5ij99kEN5OZJpvK52pdnVn09dlC+q8KrX7yWK++Gb6fKRt2Bn3n8M++WounpMEjRKLQ
 9FiHPtnNmcgG8FBPQkY48WQx1FX7451h0/7GiQH/CHI9MONQXFMfwK0uT0/bj23Yzi51
 hkFayE+LFn6dKCTa+QsFCh2OOc8kOn/0Et/mBAsMbUIo6SR4sMpvEn0UxXBx+YVkPUxf
 Ad2nx0WYUNVFE4gLUU5Ano+9OnOcGTKgtpkyAscd1cY99nUqZLzA5wyqp4kPyz3MKBU6
 s9Ug==
X-Gm-Message-State: AOAM533f+qrbtsriXN8IaXPxEjXBmqEx30u8gHNBaEOyHIkkRMN2DkvU
 Hc6L8vzUbNW6vUF3jZpyjE9hjPP0bdSvZaizT6SrsUCPsG086loQzrTuB0fJXKZQ367dvTXG1+W
 LAmRapRb5EH0ajc8=
X-Received: by 2002:adf:e603:: with SMTP id p3mr3745730wrm.360.1615885381589; 
 Tue, 16 Mar 2021 02:03:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJweyf/bI2dZLrOFRZjm9BOAM/oNQsOTYgRJtR6P0h2x/pOKHeH3lcIClmwvKKIIyZSfvH25Fw==
X-Received: by 2002:adf:e603:: with SMTP id p3mr3745696wrm.360.1615885381348; 
 Tue, 16 Mar 2021 02:03:01 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id h10sm21420085wrp.22.2021.03.16.02.03.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 02:03:00 -0700 (PDT)
Subject: Re: [PATCH 1/6] accel: Introduce 'query-accels' QMP command
To: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20210311231202.1536040-1-philmd@redhat.com>
 <20210311231202.1536040-2-philmd@redhat.com>
 <b71367e7-eade-e7fb-d612-8bc18fba35c3@redhat.com>
 <87ft0va8wp.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <04e9cbd3-1773-c953-10a5-ad6299c35354@redhat.com>
Date: Tue, 16 Mar 2021 10:02:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <87ft0va8wp.fsf@dusky.pond.sub.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/16/21 7:51 AM, Markus Armbruster wrote:
> Eric Blake <eblake@redhat.com> writes:
> 
>> On 3/11/21 5:11 PM, Philippe Mathieu-Daudé wrote:
> [...]
>>> diff --git a/accel/accel-qmp.c b/accel/accel-qmp.c
>>> new file mode 100644
>>> index 00000000000..f16e49b8956
>>> --- /dev/null
>>> +++ b/accel/accel-qmp.c
>>> @@ -0,0 +1,47 @@
>>> +/*
>>> + * QEMU accelerators, QMP commands
>>> + *
>>> + * Copyright (c) 2021 Red Hat Inc.
>>> + *
>>> + * SPDX-License-Identifier: GPL-2.0-or-later
>>> + */
>>> +
>>> +#include "qemu/osdep.h"
>>> +#include "qapi/qapi-commands-machine.h"
>>> +
>>> +static const Accelerator accel_list[] = {
>>> +    ACCELERATOR_QTEST,
>>> +#ifdef CONFIG_TCG
>>> +    ACCELERATOR_TCG,
>>> +#endif
>>> +#ifdef CONFIG_KVM
>>> +    ACCELERATOR_KVM,
>>> +#endif
>>
>> ...would it be worth compiling the enum to only list enum values that
>> were actually compiled in?  That would change it to:
>>
>> { 'enum': 'Accelerator',
>>   'data': [ 'qtest',
>>             { 'name': 'tcg', 'if': 'defined(CONFIG_TCG)' },
>> ...

These accelerator definitions are supposed to be poisoned in generic
code... But I like the simplicity of your suggestion, so I'll give it
a try and see what happens with removing the poisoned definitions.

> Makes introspection more useful.  Management applications can get the
> information the list of compiled-in accelerators from query-qmp-schema.
> They don't have to be taught to use query-accels.
> 
> In fact, query-accels becomes useless except as a tool to force
> visibility of Accelerator in query-qmp-schema.  We wouldn't have to
> force if we had CLI introspection that shows the type of -accel's
> parameter @accel.  Adding a query command is a common work-around for
> our anemic CLI introspection capabilities.
> 
> The query command could be made more useful than introspection if it
> reflected run time state, i.e. it showed an accelerator only when the
> host system actually supports it.  Can't say how practical that would
> be.
> 
>>>
>>> +AcceleratorInfoList *qmp_query_accels(Error **errp)
>>> +{
>>> +    AcceleratorInfoList *list = NULL, **tail = &list;
>>> +
>>> +    for (unsigned i = 0; i < ARRAY_SIZE(accel_list); i++) {
>>> +        AcceleratorInfo *info = g_new0(AcceleratorInfo, 1);
>>> +
>>> +        info->name = accel_list[i];
>>> +
>>> +        QAPI_LIST_APPEND(tail, info);
>>> +    }
>>> +
>>> +    return list;
>>> +}
> 
> You could then use something like
> 
>         for (accel = 0; accel < ACCELERATOR__MAX; accel++) {
>             AcceleratorInfo *info = g_new0(AcceleratorInfo, 1);
> 
>             info->name = Accelerator_str(accel);
> 
>             QAPI_LIST_APPEND(tail, info);
>         }
> 


