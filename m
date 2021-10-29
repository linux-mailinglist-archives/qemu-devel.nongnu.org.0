Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FCB4401F4
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 20:34:10 +0200 (CEST)
Received: from localhost ([::1]:48396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgWhd-000524-6x
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 14:34:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mgWNn-0007rM-Ap
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 14:13:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mgWNj-0003om-El
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 14:13:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635531212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NDnpPdsx9OMKONVVtp8s/V0wjujWy9p1lVUWqDESJHc=;
 b=IhBL/zUlDg/HrjOcduV/l2K7wX335NBf84KV/+b7DdmHu2+IgYdsVaoUv5j3HHu2jIDd2X
 cB746NWARCZvkyqcdGBVU/Vz3syI9GcyYqJvGR3gTWrIeligTYYnrdg0Z9fSkGVVwsAav5
 4PCE5tjqH29h+mCPDBw+mR8Y8HZVO6I=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-6rrggQxLO5O7osC97vDGZw-1; Fri, 29 Oct 2021 14:13:31 -0400
X-MC-Unique: 6rrggQxLO5O7osC97vDGZw-1
Received: by mail-wr1-f71.google.com with SMTP id
 r12-20020adfdc8c000000b0017d703c07c0so450224wrj.0
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 11:13:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=NDnpPdsx9OMKONVVtp8s/V0wjujWy9p1lVUWqDESJHc=;
 b=c0xS3DYHZlgBbvzGOzWQ6VP38CjuYSyQ6W+AWBcm5yozs2FU1/KiqfLCoW7Wrs8/F5
 wsdvLXJ/AMJWTZUAtJq8BKbbtkpcM6P4SVHcsNYG0kS2wC50lGjGOQcDbChe/wuSipLo
 rQuiOuuM5xVkJ+FUeervDfkOLS7kZvhRhgwRcwLqcpCyVqlTKOICBNEFmO7V6bqb3zTH
 LHHP1MCn54I61VYn/gt5xt3PFde9M1NEepxPe3VsTQ8SiKtcfYtbH6YCf7xEiGQwQu07
 NLcHx9W8N/pRXaxOp7/hlZzfl/ZO/4fei/Whcp7T/pEIh+EsgtYzFYSdyElDOFT4kMNm
 eyzA==
X-Gm-Message-State: AOAM531bvy4p3o3SnTxcTcIScjPlOwTf063GL5QlVDkP/qQD3FvI/x1a
 lXRE6xU2zLZrSfzjXAzHplSKVcD+N7ND8PvKWsBIWohADQsouq8ILPo+SOF0tdpQ3jOAcsoOuwI
 QHRV1YwwScJwHPU8=
X-Received: by 2002:a5d:4949:: with SMTP id r9mr15935639wrs.439.1635531209984; 
 Fri, 29 Oct 2021 11:13:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwI9Kla+kYkrpmIu2BuV6kOlOrwE23Zj/JKpCbVNw8pKWyY4w2rjtAU4e7CkIomM4B1s9M06g==
X-Received: by 2002:a5d:4949:: with SMTP id r9mr15935608wrs.439.1635531209771; 
 Fri, 29 Oct 2021 11:13:29 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id 10sm11083524wme.27.2021.10.29.11.13.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 11:13:29 -0700 (PDT)
Message-ID: <7594e869-e424-4df8-a0bd-0d600b47f3f8@redhat.com>
Date: Fri, 29 Oct 2021 20:13:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 2/3] qdev-monitor: Check sysbus device type before
 creating it
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
References: <20211029142258.484907-1-damien.hedde@greensocs.com>
 <20211029142258.484907-3-damien.hedde@greensocs.com>
 <aedc893d-79bf-1d3c-74d6-8388d0d1915c@redhat.com>
In-Reply-To: <aedc893d-79bf-1d3c-74d6-8388d0d1915c@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.512, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, mark.burton@greensocs.com,
 edgari@xilinx.com, mirela.grujic@greensocs.com,
 Alistair Francis <alistair.francis@wdc.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/29/21 19:34, Philippe Mathieu-Daudé wrote:
> On 10/29/21 16:22, Damien Hedde wrote:
>> Add an early check to test if the requested sysbus device type
>> is allowed by the current machine before creating the device. This
>> impacts both -device cli option and device_add qmp command.
>>
>> Before this patch, the check was done well after the device has
>> been created (in a machine init done notifier). 

Before / Until? Also you could mention "in a machine init_done
notifier, which we will remove in the next commit".

>> We can now report
>> the error right away.
>>
>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> ---
>>
>> v3: update error message
>> ---
>>  softmmu/qdev-monitor.c | 11 +++++++++++
> 
> /me wonders why this file is named '-monitor'.
> 
>> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
>> index 4851de51a5..e49d9773d2 100644
>> --- a/softmmu/qdev-monitor.c
>> +++ b/softmmu/qdev-monitor.c
>> @@ -42,6 +42,7 @@
>>  #include "qemu/cutils.h"
>>  #include "hw/qdev-properties.h"
>>  #include "hw/clock.h"
>> +#include "hw/boards.h"
>>  
>>  /*
>>   * Aliases were a bad idea from the start.  Let's keep them
>> @@ -254,6 +255,16 @@ static DeviceClass *qdev_get_device_class(const char **driver, Error **errp)
>>          return NULL;
>>      }
>>  
>> +    if (object_class_dynamic_cast(oc, TYPE_SYS_BUS_DEVICE)) {
>> +        /* sysbus devices need to be allowed by the machine */
>> +        MachineClass *mc = MACHINE_CLASS(object_get_class(qdev_get_machine()));
>> +        if (!device_type_is_dynamic_sysbus(mc, *driver)) {
>> +            error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "driver",
> 
> Per include/qapi/qmp/qerror.h:
> 
>   /*
>    * These macros will go away, please don't use in new code, and do not
>    * add new ones!
>    */
> 
>   #define QERR_INVALID_PARAMETER_VALUE \
>       "Parameter '%s' expects %s"
> 
>> +                       "a dynamic sysbus device type for the machine");
> 
> Besides, this is easier to read:
> 
>             error_setg(errp, "Parameter 'driver' expects a dynamic"
>                              " sysbus device type for the machine");
> 
> Maybe remove QERR_INVALID_PARAMETER_VALUE from qdev_get_device_class()
> in a preliminary patch?
> 
> Otherwise:
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
>> +            return NULL;
>> +        }
>> +    }
>> +
>>      return dc;
>>  }
>>  
>>
> 


