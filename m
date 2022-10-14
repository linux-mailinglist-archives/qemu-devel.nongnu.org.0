Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B15D5FF219
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 18:14:57 +0200 (CEST)
Received: from localhost ([::1]:40016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojNKq-0002qI-6e
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 12:14:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1ojNFy-0004VJ-3B
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 12:09:54 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:40456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1ojNFv-0002Cf-Tk
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 12:09:53 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 v130-20020a1cac88000000b003bcde03bd44so5686630wme.5
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 09:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KQcJUmqZu88nfBtXApMM+zI67ONGbz1lPo6e59zltwQ=;
 b=QhUiOjPCl3nRaenOv00DDl/23HaWplzSIrmlEmNOoV+LloRMudfAcivtEyFU97eCKT
 eCzTfOjkFTdKRfPR/2e2JNCNKjtrXYNSuAvN58odtyjzB2M3NjaBZP0t7jcLB/+ZSIfY
 r7EvVl3xbNajBpV8DXyogXlllh7l/mbZY2cW9Y4lRKExzpJeHh3xNjAroZiPlJSIh8P2
 vqprCjFvCF362aKiy1V7prn+oLsopn+DJfO15ZO1T2djQ1A8B7GHBJHCiN9Uj428UfoM
 mKtsKTlhWXWKfB2ezzANXqFK0ILrHunn7RD1Fv2/f73GxvVu5IqeTRgit28pjOXjdWBA
 KMmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KQcJUmqZu88nfBtXApMM+zI67ONGbz1lPo6e59zltwQ=;
 b=Q4uvM+Bsb2s5dGP/W50m3WqC/IJRoCi5xIP1dMmyXPICnh6OmhDmGYzTKF/90wh2jG
 wkezcq07k4fBmzsRTFlgZH9rYgkCb3RC2kTT/eINpGPZ9DjKMSSH1QxKor2/qDm0PZGF
 Uai7Eocnh0AWLNm/AJG8SVI4E+vK5QE+jjIO+I9xZte71ojazwQqHffe/ARQ7JEt0q4w
 S6OcPu9xBUaKPGLnPYm6TtWzGMVRy812z4191LLzch4FSKByxNT3xwlk/LROIKKY3V+o
 G9/c2VBooIdWbp/rYhtBx0x6e1yQTMDagWGui+rVEW0/DLdxWXvU2aoI3yUFBD1nsruv
 O89Q==
X-Gm-Message-State: ACrzQf1rogSS1yaHi5BQ2acMsJMfErZE+K0//TfQR8yIS75Xgpi/J7Fj
 6ta9bnh4PfI64UmFejKugwhCjQ==
X-Google-Smtp-Source: AMsMyM5LhhaV4Mn9J9SKzMiuNY3eZ6f3/QME1KHrBHrKR5thFHwzL+GGAyJLpwUBryQupKKPR9wI0w==
X-Received: by 2002:a05:600c:214f:b0:3c6:ce02:8a68 with SMTP id
 v15-20020a05600c214f00b003c6ce028a68mr11161488wml.187.1665763789915; 
 Fri, 14 Oct 2022 09:09:49 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168]) by smtp.gmail.com with ESMTPSA id
 bv20-20020a0560001f1400b00231a5fa1ae2sm2153599wrb.20.2022.10.14.09.09.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 09:09:49 -0700 (PDT)
Date: Fri, 14 Oct 2022 17:09:46 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, mst@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/virtio/virtio-iommu-pci: Enforce the device is
 plugged on the root bus
Message-ID: <Y0mJyjYmTh7DIE1f@myrica>
References: <20221012163448.121368-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221012163448.121368-1-eric.auger@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 12, 2022 at 12:34:48PM -0400, Eric Auger wrote:
> In theory the virtio-iommu-pci could be plugged anywhere in the PCIe
> topology and as long as the dt/acpi info are properly built this should
> work. However at the moment we fail to do that because the
> virtio-iommu-pci BDF is not computed at plug time and in that case
> vms->virtio_iommu_bdf gets an incorrect value.
> 
> For instance if the virtio-iommu-pci is plugged onto a pcie root port
> and the virtio-iommu protects a virtio-block-pci device the guest does
> not boot.
> 
> So let's do not pretend we do support this case and fail the initialize()
> if we detect the virtio-iommu-pci is plugged anywhere else than on the
> root bus. Anyway this ability is not needed.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

I agree with the reasoning. It's not supported, difficult to support and
not needed, so let's make the error more obvious. If I remember correctly,
the problem with supporting an IOMMU behind a bridge is that static
topology descriptions like DT and ACPI identify devices using bus numbers,
which QEMU would need to allocate.

> ---
>  hw/virtio/virtio-iommu-pci.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
> index 79ea8334f0..7ef2f9dcdb 100644
> --- a/hw/virtio/virtio-iommu-pci.c
> +++ b/hw/virtio/virtio-iommu-pci.c
> @@ -17,6 +17,7 @@
>  #include "hw/qdev-properties-system.h"
>  #include "qapi/error.h"
>  #include "hw/boards.h"
> +#include "hw/pci/pci_bus.h"
>  #include "qom/object.h"
>  
>  typedef struct VirtIOIOMMUPCI VirtIOIOMMUPCI;
> @@ -44,6 +45,7 @@ static Property virtio_iommu_pci_properties[] = {
>  static void virtio_iommu_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
>  {
>      VirtIOIOMMUPCI *dev = VIRTIO_IOMMU_PCI(vpci_dev);
> +    PCIBus *pbus = pci_get_bus(&vpci_dev->pci_dev);
>      DeviceState *vdev = DEVICE(&dev->vdev);
>      VirtIOIOMMU *s = VIRTIO_IOMMU(vdev);
>  
> @@ -57,11 +59,17 @@ static void virtio_iommu_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
>              s->reserved_regions[i].type != VIRTIO_IOMMU_RESV_MEM_T_MSI) {
>              error_setg(errp, "reserved region %d has an invalid type", i);
>              error_append_hint(errp, "Valid values are 0 and 1\n");
> +            return;

Should this be a separate fix?  Anyway, for both changes

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Tested-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

>          }
>      }
> +    if (!pci_bus_is_root(pbus)) {
> +        error_setg(errp, "virtio-iommu-pci must be plugged on the root bus");
> +        return;
> +    }
> +
>      object_property_set_link(OBJECT(dev), "primary-bus",
> -                             OBJECT(pci_get_bus(&vpci_dev->pci_dev)),
> -                             &error_abort);
> +                             OBJECT(pbus), &error_abort);
> +
>      virtio_pci_force_virtio_1(vpci_dev);
>      qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
>  }
> -- 
> 2.31.1
> 

