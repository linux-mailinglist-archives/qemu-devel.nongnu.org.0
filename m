Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A06274007A7
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 23:57:52 +0200 (CEST)
Received: from localhost ([::1]:36202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMHC3-0001pU-5n
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 17:57:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mMHAG-00009p-Rl
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 17:56:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mMHAD-0005CG-5Z
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 17:55:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630706154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pSsxWkLwN8NlTeR0l4ubNDb4hBsapbqmfcISm7666o4=;
 b=SyyvkCbBuCaU51hIce2ZmoJBEeiS2rBVwm/rsDhlWHoZuhimB328KqyhzbsmGvhTHHZ0+T
 +bB4BOdLPkv3sldHwhWnfMdmwcNWMro6mm5B8NvXgvbtIuaygzx7MVxZsm4di1umsJDRYg
 ciYYPl+vDkMpf9dW+Rn/ICraSne1sq8=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-JaM6NeiXO3a7xMdMj0dgow-1; Fri, 03 Sep 2021 17:55:52 -0400
X-MC-Unique: JaM6NeiXO3a7xMdMj0dgow-1
Received: by mail-oo1-f71.google.com with SMTP id
 s20-20020a4aead40000b029028b41986b27so161267ooh.14
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 14:55:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=pSsxWkLwN8NlTeR0l4ubNDb4hBsapbqmfcISm7666o4=;
 b=CNC09koNAjqoqakkSLXmqyr+OPWxphS8BAYd8w5Q2J3joTI7UbGOFZeUIKwZkatXU5
 a0p0ZFu7cc25hZkAKjrVpcjv1GNcN2YRX7yuZha+3pBGhvBkvtQtj8vNrztRxZ1lnm/M
 ug1lM9KlfCGh/Rn++fvhYGCDEIJg7VQxlGaeqn1qj81V2N13FvSJ5YrLbeVUUWGSFPnG
 a0qV9tL6jRNvG6rAg5V+A1ebk0L9Bt4kIv9WKEgvUb52liITAKdwfSlKyy68zaqYPxSF
 Hg255+NSVn1NzcgxwjZd6oqZIFGIfcjSOdGAoL+hrFBhODglq2lepyqxlkj1sVsbQh1N
 TKUQ==
X-Gm-Message-State: AOAM531UdrPN/MDl1ddcV0+p2H42ifjq95NwgutP/tsCvZ/iLTB2orPg
 csWJFNpjti1hnI5LZotBzLznvjA8nSyzEead8cKS/P+jJmMPahwuFWSvTnaD3HUwQODvwUvD0s0
 3/jOukpmPMRjau6U=
X-Received: by 2002:aca:6541:: with SMTP id j1mr685512oiw.146.1630706151564;
 Fri, 03 Sep 2021 14:55:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTfIxwQzGAUki7jE//4j5tr2U/AucMagKcuaOb+XWP8SoUkv8flHCe6vdKqypsmnZcsFwPEw==
X-Received: by 2002:aca:6541:: with SMTP id j1mr685492oiw.146.1630706151001;
 Fri, 03 Sep 2021 14:55:51 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
 by smtp.gmail.com with ESMTPSA id 3sm125899ots.61.2021.09.03.14.55.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 14:55:50 -0700 (PDT)
Date: Fri, 3 Sep 2021 15:55:49 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Subject: Re: [PATCH 1/5] vfio: use helper to simplfy the failure path in
 vfio_msi_enable
Message-ID: <20210903155549.6fefbda7.alex.williamson@redhat.com>
In-Reply-To: <20210825075620.2607-2-longpeng2@huawei.com>
References: <20210825075620.2607-1-longpeng2@huawei.com>
 <20210825075620.2607-2-longpeng2@huawei.com>
Organization: Red Hat
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: mst@redhat.com, qemu-devel@nongnu.org, arei.gonglei@huawei.com,
 huangzhichao@huawei.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 25 Aug 2021 15:56:16 +0800
"Longpeng(Mike)" <longpeng2@huawei.com> wrote:

> The main difference of the failure path in vfio_msi_enable and
> vfio_msi_disable_common is enable INTX or not.
> 
> Extend the vfio_msi_disable_common to provide a arg to decide

"an arg"

> whether need to fallback, and then we can use this helper to
> instead the redundant code in vfio_msi_enable.

Do you mean s/instead/replace/?

> 
> Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
> ---
>  hw/vfio/pci.c | 34 ++++++++++++----------------------
>  1 file changed, 12 insertions(+), 22 deletions(-)
> 
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index e1ea1d8..7cc43fe 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -47,6 +47,7 @@
>  
>  static void vfio_disable_interrupts(VFIOPCIDevice *vdev);
>  static void vfio_mmap_set_enabled(VFIOPCIDevice *vdev, bool enabled);
> +static void vfio_msi_disable_common(VFIOPCIDevice *vdev, bool enable_intx);
>  
>  /*
>   * Disabling BAR mmaping can be slow, but toggling it around INTx can
> @@ -650,29 +651,17 @@ retry:
>      if (ret) {
>          if (ret < 0) {
>              error_report("vfio: Error: Failed to setup MSI fds: %m");
> -        } else if (ret != vdev->nr_vectors) {

This part of the change is subtle and not mentioned in the commit log.
It does seem unnecessary to test against this specific return value
since any positive return is an error indicating the number of vectors
we should retry with, but this change should be described in a separate
patch.

> +        } else {
>              error_report("vfio: Error: Failed to enable %d "
>                           "MSI vectors, retry with %d", vdev->nr_vectors, ret);
>          }
>  
> -        for (i = 0; i < vdev->nr_vectors; i++) {
> -            VFIOMSIVector *vector = &vdev->msi_vectors[i];
> -            if (vector->virq >= 0) {
> -                vfio_remove_kvm_msi_virq(vector);
> -            }
> -            qemu_set_fd_handler(event_notifier_get_fd(&vector->interrupt),
> -                                NULL, NULL, NULL);
> -            event_notifier_cleanup(&vector->interrupt);
> -        }
> -
> -        g_free(vdev->msi_vectors);
> -        vdev->msi_vectors = NULL;
> +        vfio_msi_disable_common(vdev, false);
>  
> -        if (ret > 0 && ret != vdev->nr_vectors) {
> +        if (ret > 0) {
>              vdev->nr_vectors = ret;
>              goto retry;
>          }
> -        vdev->nr_vectors = 0;
>  
>          /*
>           * Failing to setup MSI doesn't really fall within any specification.
> @@ -680,7 +669,6 @@ retry:
>           * out to fall back to INTx for this device.
>           */
>          error_report("vfio: Error: Failed to enable MSI");
> -        vdev->interrupt = VFIO_INT_NONE;
>  
>          return;
>      }
> @@ -688,7 +676,7 @@ retry:
>      trace_vfio_msi_enable(vdev->vbasedev.name, vdev->nr_vectors);
>  }
>  
> -static void vfio_msi_disable_common(VFIOPCIDevice *vdev)
> +static void vfio_msi_disable_common(VFIOPCIDevice *vdev, bool enable_intx)

I'd rather avoid these sort of modal options to functions where we can.
Maybe this suggests instead that re-enabling INTx should be removed
from the common helper and callers needing to do so should do it
outside of the common helper.  Thanks,

Alex


>  {
>      Error *err = NULL;
>      int i;
> @@ -710,9 +698,11 @@ static void vfio_msi_disable_common(VFIOPCIDevice *vdev)
>      vdev->nr_vectors = 0;
>      vdev->interrupt = VFIO_INT_NONE;
>  
> -    vfio_intx_enable(vdev, &err);
> -    if (err) {
> -        error_reportf_err(err, VFIO_MSG_PREFIX, vdev->vbasedev.name);
> +    if (enable_intx) {
> +        vfio_intx_enable(vdev, &err);
> +        if (err) {
> +            error_reportf_err(err, VFIO_MSG_PREFIX, vdev->vbasedev.name);
> +        }
>      }
>  }
>  
> @@ -737,7 +727,7 @@ static void vfio_msix_disable(VFIOPCIDevice *vdev)
>          vfio_disable_irqindex(&vdev->vbasedev, VFIO_PCI_MSIX_IRQ_INDEX);
>      }
>  
> -    vfio_msi_disable_common(vdev);
> +    vfio_msi_disable_common(vdev, true);
>  
>      memset(vdev->msix->pending, 0,
>             BITS_TO_LONGS(vdev->msix->entries) * sizeof(unsigned long));
> @@ -748,7 +738,7 @@ static void vfio_msix_disable(VFIOPCIDevice *vdev)
>  static void vfio_msi_disable(VFIOPCIDevice *vdev)
>  {
>      vfio_disable_irqindex(&vdev->vbasedev, VFIO_PCI_MSI_IRQ_INDEX);
> -    vfio_msi_disable_common(vdev);
> +    vfio_msi_disable_common(vdev, true);
>  
>      trace_vfio_msi_disable(vdev->vbasedev.name);
>  }


