Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 171FB4823F4
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 13:18:35 +0100 (CET)
Received: from localhost ([::1]:41370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3Grh-0000EY-TM
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 07:18:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3GlC-0003EA-Rd
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:11:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3Gl7-0003oY-CL
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:11:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640952701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E125D2q0jVKZGoChjXFFpUZ4UHjXhHfzC4x8mxbYdCE=;
 b=bBTjZGgjuRVuueibGzadO9CBZdL2U4JNRjLvBSB7jlZmdzmpT8cRBqnn2FH8dPOrPURGd6
 3MpNhjDuGkJz/an7j70NQbVFmnFJnPgSGXFswrmR+tre2hpbRanfyMm+4yWBVy6lFZFWoW
 hK2e+pu5dkUr8Y0x3sALTgoOuP2Cj+4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-536-Ay8Sc6bxMGutzLG0J3z_9A-1; Fri, 31 Dec 2021 07:11:39 -0500
X-MC-Unique: Ay8Sc6bxMGutzLG0J3z_9A-1
Received: by mail-wr1-f72.google.com with SMTP id
 d13-20020adf9b8d000000b001a2aa837f8dso7507358wrc.3
 for <qemu-devel@nongnu.org>; Fri, 31 Dec 2021 04:11:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=E125D2q0jVKZGoChjXFFpUZ4UHjXhHfzC4x8mxbYdCE=;
 b=KO7RrLwJwDEb5h//Cv+cGTITRi6JZ3+mhFsmwbgA95GaqT95HNIk+AewrujuBR3Xdj
 U10DLTWHqlsWu5zVIX3zC+ueIAKv/rtVkko04LK5nJJErXwZGx8+3NsfmnlKwEkHpFcm
 X6aJ6FYLzxS+hiD6sosVi0/X2CMWUSfqen0EFetxZG3kPtMp8gaM7UWogK8Rhdu1p6F6
 BkBJ67XqVILt0BYIzoqv9w5vzcQnBRuFpA0hzkhbJ/zyxEqMu/Mrq0d9NBZsrjCMzYQR
 WMfI13OviEj2kXKOcYFBqaVUtoHMClzgMJDtKuRBJ98HH54uOYbxCLqHPUfkCQdW3Bmy
 h9yA==
X-Gm-Message-State: AOAM530j39il8A7W6q+sO7ORT/ExukyiACvLd2Yvy/9ZaUA4Ue4/NNZ/
 T5FFOlWNt5UCsDNRaSfygM4F6pluYtmL/KpSp0//96DnAc/MqUCRR/u+7KiEVH+1KvBMUdjxouI
 Z/1t7itpvaKxlpeE=
X-Received: by 2002:a7b:c055:: with SMTP id u21mr14373344wmc.0.1640952698621; 
 Fri, 31 Dec 2021 04:11:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxC1lyxgdKp4f1IPOuz6jTfBd+hi5FTMVfKZbfDiEDYLhfjpuhAEApRx9HsgZSDOWLgwfz8Eg==
X-Received: by 2002:a7b:c055:: with SMTP id u21mr14373331wmc.0.1640952698385; 
 Fri, 31 Dec 2021 04:11:38 -0800 (PST)
Received: from [192.168.1.36] (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id d2sm26605185wrw.26.2021.12.31.04.11.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Dec 2021 04:11:37 -0800 (PST)
Message-ID: <d09675d0-b7fa-7484-22fa-e02a1655bcb0@redhat.com>
Date: Fri, 31 Dec 2021 13:11:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/3] hw/qdev: Restrict qdev_get_gpio_out_connector() to
 qdev-internal.h
To: "wangyanan (Y)" <wangyanan55@huawei.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20211229225206.171882-1-philmd@redhat.com>
 <20211229225206.171882-2-philmd@redhat.com>
 <8bf1a23a-7e3e-538b-3854-629545a98089@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <8bf1a23a-7e3e-538b-3854-629545a98089@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/31/21 08:30, wangyanan (Y) wrote:
> Hi,
> 
> On 2021/12/30 6:52, Philippe Mathieu-Daudé wrote:
>> qdev_get_gpio_out_connector() is called by sysbus_get_connected_irq()
>> which is only used by platform-bus.c; restrict it to hw/core/ by
>> adding a local "qdev-internal.h" header.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>   hw/core/qdev-internal.h | 15 +++++++++++++++
>>   include/hw/qdev-core.h  | 18 ------------------
>>   hw/core/gpio.c          |  1 +
>>   hw/core/sysbus.c        |  1 +
>>   4 files changed, 17 insertions(+), 18 deletions(-)
>>   create mode 100644 hw/core/qdev-internal.h
>>
>> diff --git a/hw/core/qdev-internal.h b/hw/core/qdev-internal.h
>> new file mode 100644
>> index 00000000000..6ec17d0ea70
>> --- /dev/null
>> +++ b/hw/core/qdev-internal.h
>> @@ -0,0 +1,15 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * qdev internal helpers
>> + *
>> + * Copyright (c) 2009-2021 QEMU contributors
>> + */
>> +#ifndef HW_CORE_QDEV_INTERNAL_H
>> +#define HW_CORE_QDEV_INTERNAL_H
>> +
>> +#include "hw/qdev-core.h"
>> +
>> +/* Following functions are only used by the platform-bus subsystem */
> Could it be better to also keep the original function comment here?

We could, but this include being now internal, it seems superfluous.

Since Peter documented this function, let see if he has an preference.

>> +qemu_irq qdev_get_gpio_out_connector(DeviceState *dev, const char
>> *name, int n);
>> +
>> +#endif /* HW_CORE_QDEV_INTERNAL_H */
>> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
>> index d19c9417520..655899654bb 100644
>> --- a/include/hw/qdev-core.h
>> +++ b/include/hw/qdev-core.h
>> @@ -532,24 +532,6 @@ void qdev_connect_gpio_out(DeviceState *dev, int
>> n, qemu_irq pin);
>>   void qdev_connect_gpio_out_named(DeviceState *dev, const char *name,
>> int n,
>>                                    qemu_irq input_pin);
>>   -/**
>> - * qdev_get_gpio_out_connector: Get the qemu_irq connected to an
>> output GPIO
>> - * @dev: Device whose output GPIO we are interested in
>> - * @name: Name of the output GPIO array
>> - * @n: Number of the output GPIO line within that array
>> - *
>> - * Returns whatever qemu_irq is currently connected to the specified
>> - * output GPIO line of @dev. This will be NULL if the output GPIO line
>> - * has never been wired up to the anything.  Note that the qemu_irq
>> - * returned does not belong to @dev -- it will be the input GPIO or
>> - * IRQ of whichever device the board code has connected up to @dev's
>> - * output GPIO.
>> - *
>> - * You probably don't need to use this function -- it is used only
>> - * by the platform-bus subsystem.
>> - */
>> -qemu_irq qdev_get_gpio_out_connector(DeviceState *dev, const char
>> *name, int n);
>> -
>>   /**
>>    * qdev_intercept_gpio_out: Intercept an existing GPIO connection
>>    * @dev: Device to intercept the outbound GPIO line from
>> diff --git a/hw/core/gpio.c b/hw/core/gpio.c
>> index 80d07a6ec99..513ccbd1062 100644
>> --- a/hw/core/gpio.c
>> +++ b/hw/core/gpio.c
>> @@ -21,6 +21,7 @@
>>   #include "hw/qdev-core.h"
>>   #include "hw/irq.h"
>>   #include "qapi/error.h"
>> +#include "qdev-internal.h"
>>     static NamedGPIOList *qdev_get_named_gpio_list(DeviceState *dev,
>>                                                  const char *name)
>> diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
>> index 05c1da3d311..0e6773c8df7 100644
>> --- a/hw/core/sysbus.c
>> +++ b/hw/core/sysbus.c
>> @@ -23,6 +23,7 @@
>>   #include "hw/sysbus.h"
>>   #include "monitor/monitor.h"
>>   #include "exec/address-spaces.h"
>> +#include "qdev-internal.h"
>>     static void sysbus_dev_print(Monitor *mon, DeviceState *dev, int
>> indent);
>>   static char *sysbus_get_fw_dev_path(DeviceState *dev);
> Otherwise, the tweak looks reasonable:
> Reviewed-by: Yanan Wang <wangyanan55@huawei.com>

Thanks,

Phil.


