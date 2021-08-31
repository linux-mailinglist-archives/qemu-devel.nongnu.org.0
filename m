Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D39023FC959
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 16:06:50 +0200 (CEST)
Received: from localhost ([::1]:56812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL4PZ-0001fx-I3
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 10:06:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mL4Kx-0005Pn-KY
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 10:02:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mL4Kp-00043m-77
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 10:02:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630418514;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ucAjbW8qDmBYB72V5ZPZHbAZ7mL6QNrCkthrO2CDID8=;
 b=fwi9R/DF8emkGzyrQjstf3C2PUQsXZd+blYUC/fGMl5y464K27zH33ucxKx4+HOx26Ar72
 U8sL9enKmyJTEF3GibgOzqEeZ85wXINfHstaEOZLUTsYTD2LeFSUdpqJC9gDCfvoYx8e2C
 A3vBEPEbQKDvSnKIE+ohbt6VN/tGT3k=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-NRhX8LhJNXWGjINNXICAIQ-1; Tue, 31 Aug 2021 10:01:53 -0400
X-MC-Unique: NRhX8LhJNXWGjINNXICAIQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 u2-20020adfdd42000000b001579f5d6779so2441445wrm.8
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 07:01:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=ucAjbW8qDmBYB72V5ZPZHbAZ7mL6QNrCkthrO2CDID8=;
 b=oAIGyAjWrPZfisABvMQcSBWWWskMUxYBLIlBiGTdhgXluYt9QWTmD3IY+2QfGSMzJ/
 jKJ+v4DapMchaBlJd98eonCg9icX7F7EGUEQkT4+zx5t7l6vgxArhiTu+OM2zSQclChz
 yyIpF6KnSkFo/fHz6UEILHcq2LXJZ5gRySBv9u6qgQALVNYi5SYTBb6Aq/016xiWD0EP
 6o/L659HUF/kAZS6zytlrPC8WSUnE7J4yxOHZPjzTzgC6QQcPnX5hOo7yIxiVxDxcIII
 /DMdM1OgBSqbk6WsQtvInIX6cPWS5aFQx/SSchV9nA/62ToMEE2QxXylkve+BHXzqc3s
 wSKQ==
X-Gm-Message-State: AOAM533KAhabXB2wfjqNtp92B4qCqQBE2p0i7AHlacDX+Fmh6NvLMi3h
 2CkByxTHqtOiMMGvy/OiCbuw34xaPs3XsS5EVQoDF/L8kjVaMGpoh3gg46OdFvf/dfW3qRce6xK
 hJLdpVFg0OIpTs3E=
X-Received: by 2002:adf:de8f:: with SMTP id w15mr31637383wrl.277.1630418511678; 
 Tue, 31 Aug 2021 07:01:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEVuZtZc1dfD6jPYhQ8HdfUyI3pvNtXkipyIP/wvzyqZwI06f5/Sr5rZnJlO5fNysfQiXGEw==
X-Received: by 2002:adf:de8f:: with SMTP id w15mr31637339wrl.277.1630418511362; 
 Tue, 31 Aug 2021 07:01:51 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id r12sm18883525wrv.96.2021.08.31.07.01.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Aug 2021 07:01:50 -0700 (PDT)
Subject: Re: [PATCH v5 1/4] hw/arm/smmuv3: Support non PCI/PCIe device connect
 with SMMU v3
To: chunming <chunming_li1234@163.com>, peter.maydell@linaro.org
References: <1629878922-173270-1-git-send-email-chunming_li1234@163.com>
 <1629878922-173270-2-git-send-email-chunming_li1234@163.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <3730a403-5144-b743-06f9-90faa45e20a4@redhat.com>
Date: Tue, 31 Aug 2021 16:01:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1629878922-173270-2-git-send-email-chunming_li1234@163.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) DKIMWL_WL_HIGH=-0.391, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.932,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: eric.auger@redhat.com
Cc: renwei.liu@verisilicon.com, qemu-arm@nongnu.org,
 jianxian.wen@verisilicon.com, qemu-devel@nongnu.org,
 chunming <chunming.li@verisilicon.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Chunming,

On 8/25/21 10:08 AM, chunming wrote:
> From: chunming <chunming.li@verisilicon.com>
>
>   . Add sid-map property to store non PCI/PCIe devices SID
>   . Create IOMMU memory regions for non PCI/PCIe devices based on their SID
>   . Update SID getting strategy for PCI/PCIe and non PCI/PCIe devices
>
> Signed-off-by: chunming <chunming.li@verisilicon.com>
> ---
>  hw/arm/smmuv3.c              | 46 ++++++++++++++++++++++++++++++++++++
>  include/hw/arm/smmu-common.h |  7 +++++-
>  include/hw/arm/smmuv3.h      |  2 ++
>  3 files changed, 54 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 01b60bee49..11d7fe8423 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -32,6 +32,7 @@
>  #include "hw/arm/smmuv3.h"
>  #include "smmuv3-internal.h"
>  #include "smmu-internal.h"
> +#include "hw/qdev-properties.h"
>  
>  /**
>   * smmuv3_trigger_irq - pulse @irq if enabled and update
> @@ -1430,6 +1431,19 @@ static void smmu_reset(DeviceState *dev)
>      smmuv3_init_regs(s);
>  }
>  
> +static SMMUDevice *smmu_find_peri_sdev(SMMUState *s, uint16_t sid)
> +{
> +    SMMUDevice *sdev;
> +
> +    QLIST_FOREACH(sdev, &s->peri_sdev_list, next) {
> +        if (smmu_get_sid(sdev) == sid) {
> +            return sdev;
> +        }
> +    }
> +
> +    return NULL;
> +}
> +
>  static void smmu_realize(DeviceState *d, Error **errp)
>  {
>      SMMUState *sys = ARM_SMMU(d);
> @@ -1437,6 +1451,9 @@ static void smmu_realize(DeviceState *d, Error **errp)
>      SMMUv3Class *c = ARM_SMMUV3_GET_CLASS(s);
>      SysBusDevice *dev = SYS_BUS_DEVICE(d);
>      Error *local_err = NULL;
> +    SMMUDevice *sdev;
> +    char *name = NULL;
> +    uint16_t sid = 0;
>  
>      c->parent_realize(d, &local_err);
>      if (local_err) {
> @@ -1454,6 +1471,28 @@ static void smmu_realize(DeviceState *d, Error **errp)
>      sysbus_init_mmio(dev, &sys->iomem);
>  
>      smmu_init_irq(s, dev);
> +
> +    /* Create IOMMU memory region for peripheral devices based on their SID */
s/peripheral devices/platform devices? I would suggest to rename the
fields contained 'peri' too.
> +    for (int i = 0; i < s->num_sid; i++) {
> +        sid = s->sid_map[i];
> +        sdev = smmu_find_peri_sdev(sys, sid);
> +        if (sdev) {
> +            continue;
> +        }
> +
> +        sdev = g_new0(SMMUDevice, 1);
> +        sdev->smmu = sys;
> +        sdev->bus = NULL;
> +        sdev->devfn = sid;
> +
> +        name = g_strdup_printf("%s-peri-%d", sys->mrtypename, sid);
> +        memory_region_init_iommu(&sdev->iommu, sizeof(sdev->iommu),
> +                                 sys->mrtypename,
> +                                 OBJECT(sys), name, 1ULL << SMMU_MAX_VA_BITS);
> +
> +        QLIST_INSERT_HEAD(&sys->peri_sdev_list, sdev, next);
> +        g_free(name);
> +    }
>  }
>  
>  static const VMStateDescription vmstate_smmuv3_queue = {
> @@ -1506,6 +1545,12 @@ static void smmuv3_instance_init(Object *obj)
>      /* Nothing much to do here as of now */
>  }
>  
> +static Property smmuv3_properties[] = {
> +    DEFINE_PROP_ARRAY("sid-map", SMMUv3State, num_sid, sid_map,
> +                      qdev_prop_uint16, uint16_t),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
>  static void smmuv3_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> @@ -1515,6 +1560,7 @@ static void smmuv3_class_init(ObjectClass *klass, void *data)
>      device_class_set_parent_reset(dc, smmu_reset, &c->parent_reset);
>      c->parent_realize = dc->realize;
>      dc->realize = smmu_realize;
> +    device_class_set_props(dc, smmuv3_properties);
>  }
>  
>  static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index 706be3c6d0..95cd12a4b5 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -117,6 +117,7 @@ struct SMMUState {
>      QLIST_HEAD(, SMMUDevice) devices_with_notifiers;
>      uint8_t bus_num;
>      PCIBus *primary_bus;
> +    QLIST_HEAD(, SMMUDevice) peri_sdev_list;
>  };
>  
>  struct SMMUBaseClass {
> @@ -138,7 +139,11 @@ SMMUPciBus *smmu_find_smmu_pcibus(SMMUState *s, uint8_t bus_num);
>  /* Return the stream ID of an SMMU device */
>  static inline uint16_t smmu_get_sid(SMMUDevice *sdev)
>  {
> -    return PCI_BUILD_BDF(pci_bus_num(sdev->bus), sdev->devfn);
> +    if (sdev->bus == NULL) {
> +        return sdev->devfn;
> +    } else {
> +        return PCI_BUILD_BDF(pci_bus_num(sdev->bus), sdev->devfn);
> +    }
>  }
>  
>  /**
> diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
> index c641e60735..32ba84990d 100644
> --- a/include/hw/arm/smmuv3.h
> +++ b/include/hw/arm/smmuv3.h
> @@ -39,6 +39,8 @@ struct SMMUv3State {
>      uint32_t features;
>      uint8_t sid_size;
>      uint8_t sid_split;
> +    uint32_t num_sid;
> +    uint16_t *sid_map;

peri_sdev_list is a field of the SMMUState. Why don't you put those fields in the parent class too. If we were to support another other model of SMMU, platform device support would be meaningful there too so I would sugeest to put the fields and peorperty and this level.

>  
>      uint32_t idr[6];
>      uint32_t iidr;
Thanks

Eric


