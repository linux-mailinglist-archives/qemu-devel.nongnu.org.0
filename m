Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 381E24AB893
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 11:17:58 +0100 (CET)
Received: from localhost ([::1]:35284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH15o-0003Cx-9j
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 05:17:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nH0FY-00074k-KT
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 04:23:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nH0FW-0006QE-79
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 04:23:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644225833;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kMu2xqZbDkLUMhj0VLFcJRxkpk0KGvMApn8YQcoc8WY=;
 b=b+fp5X6U0vEE48Ws5aUQ2tLCWOhBE5/xBAq2HMPpUGWwMfZtqU3+vSgdeDwnmCNb3nCnoR
 XJpr7U3lyuskOSU2ZF3MsmAEWiNRT5nZULHFc62pDjm5+7TZZ6iTWDyX2bL2lUecsIHNoz
 lgLr5gLwfaNEgh9jDE4JzOO3k5rM0Dc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-269-dJHpvwa8MrWMB7fib9HOuw-1; Mon, 07 Feb 2022 04:23:52 -0500
X-MC-Unique: dJHpvwa8MrWMB7fib9HOuw-1
Received: by mail-wm1-f69.google.com with SMTP id
 bg16-20020a05600c3c9000b0034bea12c043so11941490wmb.7
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 01:23:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=kMu2xqZbDkLUMhj0VLFcJRxkpk0KGvMApn8YQcoc8WY=;
 b=F4JYZ71ZL8SUpbOe53PrSEGalEDo9edncDxFISVrgM1pryhHfbbjTQd4NnggW/4wDP
 zW3/Qz6l2478cIwh2rgLbP68JGJm/K73EGl9ET875TUSPxasOWylEHkCTuisatPkMmBI
 NbHp+IX0X79/d2FLtTkPxuTEE4pcVbtZuPatOe+OUYhLeXbtNGtseleYe7Ixbap7nXbN
 BXwsNIzY8KSgrr0M+ka535OVsHdw51eikHwmxdpJv0hmad3nCAXSk9tV5DLpdNaJF+Da
 safEmE8SpXt83b+VjR/ebWsVuTQsDiK9Wc6yYX6KhdC1oc6tyX/qon1XSkUBhLbt+JbN
 9MDg==
X-Gm-Message-State: AOAM530R+9zbvbriuGJPTa3IGgc1igIUtv9q+VNjx58bOk00mDujpl32
 3vBFxwlwqBPgl+ozUL4UsovrvES/l34I5qzXKkrudsWKxSb323ojUiyXH13Ft1mHiYbBJvxJ8Ue
 5ou4bHtmldr4m1gM=
X-Received: by 2002:a05:600c:600f:: with SMTP id
 az15mr10295945wmb.27.1644225830975; 
 Mon, 07 Feb 2022 01:23:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxluN8lDmeZtHe4KoprwF6BJtdjmluTv7tGAojd/SE2Oe/mg5WIRPw5skhLLITkVw04SV9hCg==
X-Received: by 2002:a05:600c:600f:: with SMTP id
 az15mr10295926wmb.27.1644225830695; 
 Mon, 07 Feb 2022 01:23:50 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id x7sm1916501wro.21.2022.02.07.01.23.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 01:23:50 -0800 (PST)
Subject: Re: [PULL 1/2] tpm: CRB: Use ram_device for "tpm-crb-cmd" region
To: Igor Mammedov <imammedo@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>
References: <164392758602.1683127.4327439310436541025.stgit@omen>
 <164392772418.1683127.9746374099330960813.stgit@omen>
 <20220204130846.31f5b396@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <70759420-a05e-56fd-c4c1-5926a19f7c2d@redhat.com>
Date: Mon, 7 Feb 2022 10:23:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220204130846.31f5b396@redhat.com>
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
Cc: Stefan Berger <stefanb@linux.ibm.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Igor,
On 2/4/22 1:08 PM, Igor Mammedov wrote:
> On Thu, 03 Feb 2022 15:35:35 -0700
> Alex Williamson <alex.williamson@redhat.com> wrote:
>
>> From: Eric Auger <eric.auger@redhat.com>
>>
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
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Tested-by: Stefan Berger <stefanb@linux.ibm.com>
>> Acked-by: Stefan Berger <stefanb@linux.ibm.com>
>> [PMD: Keep tpm_crb.c in meson's softmmu_ss]
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Link: https://lore.kernel.org/r/20220120001242.230082-2-f4bug@amsat.org
>> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
>> ---
>>  hw/tpm/tpm_crb.c |   22 ++++++++++++++++++++--
>>  1 file changed, 20 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/tpm/tpm_crb.c b/hw/tpm/tpm_crb.c
>> index 58ebd1469c35..be0884ea6031 100644
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
>> +    vmstate_register_ram(&s->cmdmem, DEVICE(s));
> Does it need a compat knob for the case of migrating to older QEMU/machine type,
> not to end-up with target aborting migration when it sees unknown section.
Hum I did not think about this. I need to double check.

Thank you for the review.

Eric
>
>
>>      memory_region_add_subregion(get_system_memory(),
>>          TPM_CRB_ADDR_BASE, &s->mmio);
>> @@ -309,12 +315,24 @@ static void tpm_crb_realize(DeviceState *dev, Error **errp)
>>      qemu_register_reset(tpm_crb_reset, dev);
>>  }
>>  
>> +static void tpm_crb_unrealize(DeviceState *dev)
>> +{
>> +    CRBState *s = CRB(dev);
>> +
> likewise, should vmstate be unregistered here, before freeing
> actually happens?
>
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
>>
>>
>>


