Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0092E48D9DD
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 15:43:51 +0100 (CET)
Received: from localhost ([::1]:39190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n81KP-0000qX-O1
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 09:43:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n81HM-0007vK-JR
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 09:40:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n81HI-00009H-Hh
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 09:40:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642084833;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CG7aSpuVTGDAa+XIP+jIZNod7OVGSJom7ChfDdZLUek=;
 b=P6U9j1EDaQyDVmSp3DQBZken9KOaumTssmei1lvFgB8wqFTfZBWG+PscJ2lli9ta8awSl+
 Ta8Df743/QcAcakEjGma1AqzuTaWwFWbRFX3ii7xYXJNh+7QS7OJgfVM9mYPH97ikQjE4q
 nsEV6ga7FQ/+TnzV29Q6hSvbySJY5H0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-115-O1D0PaT5Mcef8AX1W8yUJQ-1; Thu, 13 Jan 2022 09:40:26 -0500
X-MC-Unique: O1D0PaT5Mcef8AX1W8yUJQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 s190-20020a1ca9c7000000b00347c6c39d9aso3723232wme.5
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 06:40:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=CG7aSpuVTGDAa+XIP+jIZNod7OVGSJom7ChfDdZLUek=;
 b=glDjwfuPIqXFFAxYfsvYx3i+M2RG+9I3nkz5Qyefht3cCG5Vjtnt6MtE/UrQH03Aa/
 JADzgJbpgfHafgcN37ZtjpuQ9XNEzPmQKs+UjQEhLuvISycYwgUSdMm63WgqR5lhpVbT
 a9Ops3JQYWFLcsYvShDjUS/XKBWMdt38R6sW79CoeHe0bfcLq3cY2jz4s/VqtI1brUHn
 fqAD/zbOt28BYH6aip7lUH8XTIsPX91Q19cKbdEkCq1xMxb+8R8ubgJqKxWLetVk390g
 b5hJLsI2UbTLhGueHbKwMRAiUkjbekY3rg07Xw5IYV29a5likUUg0DWjjdfe8PJp/SqQ
 OuGg==
X-Gm-Message-State: AOAM532bhFkc6ghb3BUfNJBItJYSSTt9E5xqzoWr1axi9fpEHcJD0/sv
 wOdXonawTfJ3FW2wSfVXKNq4X8oDpqip+Tzz0GKhG4hCqlREyhTm1hAdZ9YNlQn7Ye0CPaKWyqe
 dpZYNk2kYvwyl6Jk=
X-Received: by 2002:a5d:55ce:: with SMTP id i14mr4476161wrw.224.1642084825423; 
 Thu, 13 Jan 2022 06:40:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJya5DAIEnhKy4IbhJ/i8C14unz9tBDhjepeg5z2H8qoOGQNVxVbich8TladiDviF+n9qqWNcQ==
X-Received: by 2002:a5d:55ce:: with SMTP id i14mr4476140wrw.224.1642084825179; 
 Thu, 13 Jan 2022 06:40:25 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id 14sm3284520wry.23.2022.01.13.06.40.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 06:40:24 -0800 (PST)
Subject: Re: [PATCH 1/2] tpm: CRB: Use ram_device for "tpm-crb-cmd" region
To: Stefan Berger <stefanb@linux.ibm.com>, eric.auger.pro@gmail.com,
 stefanb@linux.vnet.ibm.com, qemu-devel@nongnu.org,
 alex.williamson@redhat.com, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>
References: <20220113103757.2801389-1-eric.auger@redhat.com>
 <20220113103757.2801389-2-eric.auger@redhat.com>
 <75a7ffde-5ca4-cd98-2221-203fc5d771d6@linux.ibm.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <b7eb78c2-4909-508f-b4d0-a5b95d13d6a7@redhat.com>
Date: Thu, 13 Jan 2022 15:40:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <75a7ffde-5ca4-cd98-2221-203fc5d771d6@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Reply-To: eric.auger@redhat.com
Cc: cohuck@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Stefan,

On 1/13/22 3:06 PM, Stefan Berger wrote:
>
> On 1/13/22 05:37, Eric Auger wrote:
>> Representing the CRB cmd/response buffer as a standard
>> RAM region causes some trouble when the device is used
>> with VFIO. Indeed VFIO attempts to DMA_MAP this region
>> as usual RAM but this latter does not have a valid page
>> size alignment causing such an error report:
>> "vfio_listener_region_add received unaligned region".
>> To allow VFIO to detect that failing dma mapping
>> this region is not an issue, let's use a ram_device
>> memory region type instead.
>>
>> The change in meson.build is required to include the
>> cpu.h header.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>   hw/tpm/meson.build |  2 +-
>>   hw/tpm/tpm_crb.c   | 10 ++++++++--
>>   2 files changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/tpm/meson.build b/hw/tpm/meson.build
>> index 1c68d81d6a..3e74df945b 100644
>> --- a/hw/tpm/meson.build
>> +++ b/hw/tpm/meson.build
>> @@ -1,8 +1,8 @@
>>   softmmu_ss.add(when: 'CONFIG_TPM_TIS', if_true:
>> files('tpm_tis_common.c'))
>>   softmmu_ss.add(when: 'CONFIG_TPM_TIS_ISA', if_true:
>> files('tpm_tis_isa.c'))
>>   softmmu_ss.add(when: 'CONFIG_TPM_TIS_SYSBUS', if_true:
>> files('tpm_tis_sysbus.c'))
>> -softmmu_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_crb.c'))
>>
>> +specific_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_crb.c'))
>>   specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TPM_TIS'],
>> if_true: files('tpm_ppi.c'))
>>   specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TPM_CRB'],
>> if_true: files('tpm_ppi.c'))
>>   specific_ss.add(when: 'CONFIG_TPM_SPAPR', if_true:
>> files('tpm_spapr.c'))
>> diff --git a/hw/tpm/tpm_crb.c b/hw/tpm/tpm_crb.c
>> index 58ebd1469c..25f8e685e4 100644
>> --- a/hw/tpm/tpm_crb.c
>> +++ b/hw/tpm/tpm_crb.c
>> @@ -25,6 +25,7 @@
>>   #include "sysemu/tpm_backend.h"
>>   #include "sysemu/tpm_util.h"
>>   #include "sysemu/reset.h"
>> +#include "cpu.h"
>>   #include "tpm_prop.h"
>>   #include "tpm_ppi.h"
>>   #include "trace.h"
>> @@ -43,6 +44,7 @@ struct CRBState {
>>
>>       bool ppi_enabled;
>>       TPMPPI ppi;
>> +    uint8_t *crb_cmd_buf;
>>   };
>>   typedef struct CRBState CRBState;
>>
>> @@ -291,10 +293,14 @@ static void tpm_crb_realize(DeviceState *dev,
>> Error **errp)
>>           return;
>>       }
>>
>> +    s->crb_cmd_buf = qemu_memalign(qemu_real_host_page_size,
>> +                                HOST_PAGE_ALIGN(CRB_CTRL_CMD_SIZE));
>> +
>
> Do we need an unrealize function now to qemu_vfree() this memory?
I would say it is needed if the device can be hot-unplugged.
tpmppi->buf is not freeed either.

Thanks

Eric

>
>
>>       memory_region_init_io(&s->mmio, OBJECT(s), &tpm_crb_memory_ops, s,
>>           "tpm-crb-mmio", sizeof(s->regs));
>> -    memory_region_init_ram(&s->cmdmem, OBJECT(s),
>> -        "tpm-crb-cmd", CRB_CTRL_CMD_SIZE, errp);
>> +    memory_region_init_ram_device_ptr(&s->cmdmem, OBJECT(s),
>> "tpm-crb-cmd",
>> +                                      CRB_CTRL_CMD_SIZE,
>> s->crb_cmd_buf);
>> +    vmstate_register_ram(&s->cmdmem, DEVICE(s));
>>       memory_region_add_subregion(get_system_memory(),
>>           TPM_CRB_ADDR_BASE, &s->mmio);
>


