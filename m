Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C6F4361FC
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 14:42:32 +0200 (CEST)
Received: from localhost ([::1]:56076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdXOx-0004Xi-Fs
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 08:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mdXMK-00035c-46
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 08:39:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mdXMB-00067t-2e
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 08:39:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634819978;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZSbdyNnLU50evTdust7mHE+mlurYC695Ia3TRDspLCg=;
 b=Fjgjj3h9wPQK7V9piAk/0TlA4M7lV2pZ0jssnBTeNtUG1pZRybhGsptmIKP6ZhEY6afOLA
 PS+BmJuFlJ4Dhm+X8couUUGvoqIrvewuMEDKPbb76g9RTfN+JucWucvOQ7gu9SUJOlblYb
 qcyCoSV1qeSSVyG+aaU+rH9lM7UyCGs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-jjZatl-kPHm2KIEfy9IZog-1; Thu, 21 Oct 2021 08:38:58 -0400
X-MC-Unique: jjZatl-kPHm2KIEfy9IZog-1
Received: by mail-wr1-f69.google.com with SMTP id
 41-20020adf802c000000b00161123698e0so127362wrk.12
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 05:38:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=ZSbdyNnLU50evTdust7mHE+mlurYC695Ia3TRDspLCg=;
 b=BWyeJvsVFnJPM5hVo1KonIpgQqNY9dSficn0nLH+zfIIG7VlS127famy66s7onFHO9
 ziV2S84rfRtktu0pxmiDtrK0thkgv0Ew8ZJs0t935Q7ye9bXZNMZPaGtkcbqkpEYBVbo
 UB/QKcKQ9q7Cf5EsKAv3rQFvtrIfWG4o52CV5r2x1z7DYzFsLT74ZYuVRHhGV0QGGyrm
 NiavqLDHX84QE3iyO8ANjesxPr6UeP+08uS6zxTzVIWb3x5x4zBJ7m6KyqwDHy4qDqL2
 sQVi+HcQR6C9hda3yH4CCngWEM+/WsgEvW8TgcNi5iUZNPJVwm/Dvb914u3Xy/txV8UT
 blvQ==
X-Gm-Message-State: AOAM531bUCkruC0wu1OWKX+N3NupkOXAm0bo9KdxmvJDIJ6KAmtUZ7oy
 bOMSR95n4FuBH90KK4+uV0mPPcVOujEg6VeqrL5tCi3MzeiineBUMninaVq5S1/2ttyALAhttEB
 e/eu+0PM3jmbC1TQ=
X-Received: by 2002:a05:600c:d3:: with SMTP id
 u19mr6574874wmm.153.1634819937376; 
 Thu, 21 Oct 2021 05:38:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMFOBiqQ6/x1QoLVNHOpkN9sY1o7S0YwOP3mW+7mZRsYMQxwwbEyPx0Wi14k+3Ea69NCFRag==
X-Received: by 2002:a05:600c:d3:: with SMTP id
 u19mr6574841wmm.153.1634819937114; 
 Thu, 21 Oct 2021 05:38:57 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id f20sm5566344wmq.38.2021.10.21.05.38.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 05:38:56 -0700 (PDT)
Subject: Re: [PATCH 8/8] x86-iommu: Fail early if vIOMMU specified after
 vfio-pci
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20211021104259.57754-1-peterx@redhat.com>
 <20211021104259.57754-9-peterx@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <51201622-3d09-e5cf-9963-692b19450dc0@redhat.com>
Date: Thu, 21 Oct 2021 14:38:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211021104259.57754-9-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.867, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 10/21/21 12:42 PM, Peter Xu wrote:
> Scan the pci bus to make sure there's no vfio-pci device attached before vIOMMU
> is realized.
>
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  hw/i386/x86-iommu.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/hw/i386/x86-iommu.c b/hw/i386/x86-iommu.c
> index 86ad03972e..58abce7edc 100644
> --- a/hw/i386/x86-iommu.c
> +++ b/hw/i386/x86-iommu.c
> @@ -21,6 +21,7 @@
>  #include "hw/sysbus.h"
>  #include "hw/i386/x86-iommu.h"
>  #include "hw/qdev-properties.h"
> +#include "hw/vfio/pci.h"
>  #include "hw/i386/pc.h"
>  #include "qapi/error.h"
>  #include "qemu/error-report.h"
> @@ -103,6 +104,16 @@ IommuType x86_iommu_get_type(void)
>      return x86_iommu_default->type;
>  }
>  
> +static void x86_iommu_pci_dev_hook(PCIBus *bus, PCIDevice *dev, void *opaque)
> +{
> +    Error **errp = (Error **)opaque;
> +
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_VFIO_PCI)) {
> +        error_setg(errp, "Device '%s' must be specified before vIOMMUs",
> +                   TYPE_VFIO_PCI);
if there are several VFIO-PCI devices set before the IOMMU, errp may be
overriden
as we do not exit the loop as soon as there is an error I think

Eric
> +    }
> +}
> +
>  static void x86_iommu_realize(DeviceState *dev, Error **errp)
>  {
>      X86IOMMUState *x86_iommu = X86_IOMMU_DEVICE(dev);
> @@ -120,6 +131,12 @@ static void x86_iommu_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>  
> +    /* Make sure there's no special device plugged before vIOMMU */
> +    pci_for_each_device_all(x86_iommu_pci_dev_hook, (void *)errp);
> +    if (*errp) {
> +        return;
> +    }
> +
>      /* If the user didn't specify IR, choose a default value for it */
>      if (x86_iommu->intr_supported == ON_OFF_AUTO_AUTO) {
>          x86_iommu->intr_supported = irq_all_kernel ?
> @@ -151,6 +168,7 @@ static Property x86_iommu_properties[] = {
>  static void x86_iommu_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> +
>      dc->realize = x86_iommu_realize;
>      device_class_set_props(dc, x86_iommu_properties);
>  }


