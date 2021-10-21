Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BBB435FBA
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 12:52:46 +0200 (CEST)
Received: from localhost ([::1]:53046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdVgj-0004kr-5N
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 06:52:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mdVdp-00024H-U5
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 06:49:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mdVdk-0000ay-Pk
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 06:49:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634813379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t08V6p2CVQmgirgMPlujTMneoV/zkAvFSXWstl3XxXk=;
 b=RJ25Kkvjn0X7UWyASu8tZEi8gVLJBzEu+D1bWh+jXqoRPcHi6RakW8iA4FztvLN8voT4qC
 cbanTJv+rKkf5uWXYS0h4c8uY+yaG6tEjhwnv4z3Wfpyw8Bag2v09RteC/W1ExLj1m06P4
 IB+1tfCnTx8ITCUrDZ+SSYcKHTAYdAM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-gEbuIq3qNkmpcvqna0_XYA-1; Thu, 21 Oct 2021 06:49:38 -0400
X-MC-Unique: gEbuIq3qNkmpcvqna0_XYA-1
Received: by mail-wm1-f70.google.com with SMTP id
 o22-20020a1c7516000000b0030d6f9c7f5fso62111wmc.1
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 03:49:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=t08V6p2CVQmgirgMPlujTMneoV/zkAvFSXWstl3XxXk=;
 b=KMPH3vG+QhGvFc8ShVJ3R/6FKWdUlxX9ALSyJ/1x4BtIxfXsOMArC9LntXT+RcnIDg
 jDuoK+ZSzRwysBoVXtUkkvN5qEIsqxGkGP0U1QJGC/ITVK4PdgqriZaINRzbJhZs1UIx
 awjJ4J6lES5tlVRg3prflwbCrauE/5NZAbYyMTlUCrU+2/7yDQ9rAtVXqqW47fXnBRGM
 DT8LCCuy+/lqB29lYXmxmgMh308tYa188D1UoxIL6+4r/W+qC6bnCvRMxh0ZeuijKQVY
 UinqndzZaX7NvpRGDGBKpr5exTChdpM+ydQW8YwNBn97qRrSBbl3Mt1rOavfR3glNYsz
 VAEg==
X-Gm-Message-State: AOAM530oa3IalzInVkDQkSLuElp8U9VqLpX2BVVS5csnQGXfhr7AkZ0A
 sCm2f3CfGBN6f4Numz0EUX3RmbeiiiONqNbYy4vYtb2sFSrvCQpBCvrB3ffGo1lWFdO0BEfdoWB
 HqGPCTD1G5KlbyvY=
X-Received: by 2002:a05:600c:5113:: with SMTP id
 o19mr5906973wms.12.1634813377492; 
 Thu, 21 Oct 2021 03:49:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9hk6chzWf2j+Z9zQuqRhNQTY2TnfjS4u1qCDvHfMm0lfAfAC6pJnW9rbmOSf7sSRB3lc3lw==
X-Received: by 2002:a05:600c:5113:: with SMTP id
 o19mr5906945wms.12.1634813377285; 
 Thu, 21 Oct 2021 03:49:37 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id e9sm4597103wrn.2.2021.10.21.03.49.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 03:49:36 -0700 (PDT)
Date: Thu, 21 Oct 2021 06:49:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 8/8] x86-iommu: Fail early if vIOMMU specified after
 vfio-pci
Message-ID: <20211021064731-mutt-send-email-mst@kernel.org>
References: <20211021104259.57754-1-peterx@redhat.com>
 <20211021104259.57754-9-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211021104259.57754-9-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 21, 2021 at 06:42:59PM +0800, Peter Xu wrote:
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

cast not needed here.

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
> -- 
> 2.32.0


