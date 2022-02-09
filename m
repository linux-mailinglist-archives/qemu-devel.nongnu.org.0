Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DF14AEF18
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 11:17:38 +0100 (CET)
Received: from localhost ([::1]:49354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHk2b-0002ji-FN
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 05:17:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nHjUC-0007PA-VT
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 04:42:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nHjU4-0000AH-HR
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 04:42:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644399587;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mKSGazFnEiph9YjZ9kwcLti9/SMgFkJrqZkAMDOKKpM=;
 b=GFkV87S5Y3DlAmwI9lnWKVgaR1/+vwsUF9X4w6jSRDi6+f5K/f2W8R/0TlNtdvoKj3/ZKk
 ll3ikpiwgtCHmZdJr8K6lAE1+DQNqfBorA/0tqfGUkAvm7R3nXyn2YQhdj6Ck6WLb4VUdU
 Xj3+oJ2vNhngaxnfvzKAgPzYUW0Kuqs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-449-gxrbss-xMuq-sTQ0B4ZHhQ-1; Wed, 09 Feb 2022 04:39:43 -0500
X-MC-Unique: gxrbss-xMuq-sTQ0B4ZHhQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 m8-20020adfa3c8000000b001e3381fdf45so881229wrb.4
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 01:39:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=mKSGazFnEiph9YjZ9kwcLti9/SMgFkJrqZkAMDOKKpM=;
 b=Nx8QvVHXFXNnYjaUdZFiq0Ww/ogRN0rMiQ4Q5vJjOpPmSSXimTTn7/mhmrssOgAIzz
 eyINCtvpbzttRldfXHxbq+/I6NKIB7wcjtGCXX8v7lJDfyW/KjezB3YuuPGTjzXcFaZf
 eZ3XbyqwCdcX5x90wNK6O6ei2HoYfmbF0bjSHgb52HGwzXiKz21o6G6SyRyrBFCz75sl
 R0KuZN3faHl/H2Jms1iNWCnsu7HRRN2UgVUnRngd+jkkFGa2B8pt/hVIYa7Yogx2rryx
 Jh48LcuAxYHOrkyDkv3tRIgPUc7aYnz2/OBAZN7SKM7vt6XfPgqWux+I7lyub8C+axjE
 PVJQ==
X-Gm-Message-State: AOAM533i343Kzaec2cHFJLZHJUgT+01D6PnUQ8ThrXp+jixWD2NqYMce
 7Y5xPbyIGAMEwB3rlCqaCgjIhoxqzofxsnK9uGLgi4sk6cTIZNGMbgRVWYQDv2R6G10rD7Zyu/s
 kpvJ09OxS3briczc=
X-Received: by 2002:adf:e6ca:: with SMTP id y10mr1303748wrm.571.1644399582371; 
 Wed, 09 Feb 2022 01:39:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz0D+OjiWQ7al4AccvWFdOg1KcmPb/S8rylE5DN6D6L7Wr6DBCWHrPIryqfYKfAahh1Y36YZg==
X-Received: by 2002:adf:e6ca:: with SMTP id y10mr1303734wrm.571.1644399582131; 
 Wed, 09 Feb 2022 01:39:42 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id a13sm2473487wmq.28.2022.02.09.01.39.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 01:39:41 -0800 (PST)
Subject: Re: [PATCH v4 1/2] tpm: CRB: Use ram_device for "tpm-crb-cmd" region
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20220208133842.112017-1-eric.auger@redhat.com>
 <20220208133842.112017-2-eric.auger@redhat.com> <YgKifeZwaWRZ1V1l@work-vm>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <eae7e6e6-2f56-c263-f1d2-19104201c8ec@redhat.com>
Date: Wed, 9 Feb 2022 10:39:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YgKifeZwaWRZ1V1l@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: eric.auger@redhat.com
Cc: stefanb@linux.vnet.ibm.com, cohuck@redhat.com, qemu-devel@nongnu.org,
 f4bug@amsat.org, quintela@redhat.com, alex.williamson@redhat.com,
 imammedo@redhat.com, eric.auger.pro@gmail.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Dave,

On 2/8/22 6:03 PM, Dr. David Alan Gilbert wrote:
> * Eric Auger (eric.auger@redhat.com) wrote:
>> Representing the CRB cmd/response buffer as a standard
>> RAM region causes some trouble when the device is used
>> with VFIO. Indeed VFIO attempts to DMA_MAP this region
>> as usual RAM but this latter does not have a valid page
>> size alignment causing such an error report:
>> "vfio_listener_region_add received unaligned region".
>> To allow VFIO to detect that failing dma mapping
>> this region is not an issue, let's use a ram_device
>> memory region type instead.
> Don't the weird sizes and alignments also cause problems with the RAM
> migration code?
I tested CRB migration and it seems to work properly.
> Why don't you just align this up to a convenient boundary?
The spec (CG PC Client Platform TPM Profile (PTP)
    Specification Family “2.0” Level 00 Revision 01.03 v22, page 100) 
says that the command/response data "may be defined as large as 3968",
which is (0x1000 - 0x80), 0x80 being the size of the control struct.
so the size of the region logically is less than a 4kB page, hence our
trouble.

We learnt in the past Windows driver has some stronger expectation wrt
memory mapping. I don't know if those latter would work if we were to
enlarge the window by some tricks.


Besides
https://trustedcomputinggroup.org/wp-content/uploads/Mobile-Command-Response-Buffer-Interface-v2-r12-Specification_FINAL2.pdf
says

"
Including the control structure, the three memory areas comprise the
entirety of the CRB. There are no constraints on how those three memory
areas are provided. They can all be in system RAM, or all be in device
memory, or any combination.
"
So device memory looks an option too.

Adding Marc-Andre in the loop

Thanks

Eric





>
> Dave
>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Tested-by: Stefan Berger <stefanb@linux.ibm.com>
>> Acked-by: Stefan Berger <stefanb@linux.ibm.com>
>> [PMD: Keep tpm_crb.c in meson's softmmu_ss]
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> ---
>>
>> v3 -> v4:
>> -  call vmstate_unregister_ram
>> ---
>>  hw/tpm/tpm_crb.c | 23 +++++++++++++++++++++--
>>  1 file changed, 21 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/tpm/tpm_crb.c b/hw/tpm/tpm_crb.c
>> index 58ebd1469c3..668f969b409 100644
>> --- a/hw/tpm/tpm_crb.c
>> +++ b/hw/tpm/tpm_crb.c
>> @@ -25,6 +25,7 @@
>>  #include "sysemu/tpm_backend.h"
>>  #include "sysemu/tpm_util.h"
>>  #include "sysemu/reset.h"
>> +#include "exec/cpu-common.h"
>>  #include "tpm_prop.h"
>>  #include "tpm_ppi.h"
>>  #include "trace.h"
>> @@ -43,6 +44,7 @@ struct CRBState {
>>  
>>      bool ppi_enabled;
>>      TPMPPI ppi;
>> +    uint8_t *crb_cmd_buf;
>>  };
>>  typedef struct CRBState CRBState;
>>  
>> @@ -291,10 +293,14 @@ static void tpm_crb_realize(DeviceState *dev, Error **errp)
>>          return;
>>      }
>>  
>> +    s->crb_cmd_buf = qemu_memalign(qemu_real_host_page_size,
>> +                                HOST_PAGE_ALIGN(CRB_CTRL_CMD_SIZE));
>> +
>>      memory_region_init_io(&s->mmio, OBJECT(s), &tpm_crb_memory_ops, s,
>>          "tpm-crb-mmio", sizeof(s->regs));
>> -    memory_region_init_ram(&s->cmdmem, OBJECT(s),
>> -        "tpm-crb-cmd", CRB_CTRL_CMD_SIZE, errp);
>> +    memory_region_init_ram_device_ptr(&s->cmdmem, OBJECT(s), "tpm-crb-cmd",
>> +                                      CRB_CTRL_CMD_SIZE, s->crb_cmd_buf);
>> +    vmstate_register_ram(&s->cmdmem, dev);
>>  
>>      memory_region_add_subregion(get_system_memory(),
>>          TPM_CRB_ADDR_BASE, &s->mmio);
>> @@ -309,12 +315,25 @@ static void tpm_crb_realize(DeviceState *dev, Error **errp)
>>      qemu_register_reset(tpm_crb_reset, dev);
>>  }
>>  
>> +static void tpm_crb_unrealize(DeviceState *dev)
>> +{
>> +    CRBState *s = CRB(dev);
>> +
>> +    vmstate_unregister_ram(&s->cmdmem, dev);
>> +    qemu_vfree(s->crb_cmd_buf);
>> +
>> +    if (s->ppi_enabled) {
>> +        qemu_vfree(s->ppi.buf);
>> +    }
>> +}
>> +
>>  static void tpm_crb_class_init(ObjectClass *klass, void *data)
>>  {
>>      DeviceClass *dc = DEVICE_CLASS(klass);
>>      TPMIfClass *tc = TPM_IF_CLASS(klass);
>>  
>>      dc->realize = tpm_crb_realize;
>> +    dc->unrealize = tpm_crb_unrealize;
>>      device_class_set_props(dc, tpm_crb_properties);
>>      dc->vmsd  = &vmstate_tpm_crb;
>>      dc->user_creatable = true;
>> -- 
>> 2.26.3
>>


