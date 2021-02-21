Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FC9320A13
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 12:49:17 +0100 (CET)
Received: from localhost ([::1]:35896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDnEi-0001D6-95
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 06:49:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lDnB6-0008Hx-OD
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 06:45:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lDnB2-0007bO-8q
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 06:45:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613907925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UXP21+M/Hk6xH+bn9+gfaOmr+u+WZ+lBVNPU3I7PNIw=;
 b=a9kLiyoI7AYtdj61vs52w63JC/LXDbeqNyHfHJEkTRNyv2L8LAOYOJc+CPF88Ew6+JXzH6
 5QU5qg52Jck9hwuR4wCiD++SxeqlfVX7PxetOuxjpqAgr7gRiphaesyagxnL2WEBkPeeDj
 IIHY7RhUXD72fEExJTdtDpjrUmYpg9Q=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-ZgmZy5G2MiG5RDhdFTJneg-1; Sun, 21 Feb 2021 06:45:23 -0500
X-MC-Unique: ZgmZy5G2MiG5RDhdFTJneg-1
Received: by mail-ed1-f69.google.com with SMTP id t18so3667013edr.19
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 03:45:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UXP21+M/Hk6xH+bn9+gfaOmr+u+WZ+lBVNPU3I7PNIw=;
 b=ofDcSFmQozmd9oEtcfuoeBHfaxbNTJm8HewrKKceta33Uy4CE7AuPizL+V8PtcOhRe
 WyvIRIoO4SHim9rn+oS9d4AzRUNvsmzWLXYvAglvQWyxfxc5phZRBTkzhgrPIAoL0qQX
 QiZkUC6Dxgf190Lh06B0gqpQaJ/zCiIXPd7o9z7zLd33hpt2KOzqp0td8wLmiVJS5S0h
 paARVVykfq7k9SRfy3ZiMBWs/XEEKIW1Vne7lKMigkv5XYw3txoGRFzX9JJx043mpWy6
 8D5RakB7OD7eQjwI4oCKyfDiOWkXJ2fpsLifkZv+ZPAF415YPUatBRSIl1trZbQC/Bg0
 98ZQ==
X-Gm-Message-State: AOAM531uTdnCSipcBQIM1uBVAeKQtt40MDvGqrKjsuZeY/SlvVIgrBIr
 EpOuWozhpbr856+O3NAdscgceKv+rX0Ms9SpWg/8tpi6hSDL1JF59AMgkm7a+eXWfkfYDRYr6v9
 4TVpGwgx98cqiBkg=
X-Received: by 2002:a17:906:7fc4:: with SMTP id
 r4mr16188003ejs.81.1613907922273; 
 Sun, 21 Feb 2021 03:45:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxcWHNzXZe9LU7qtiUDhxZZQRwFw3zHtrzzpNqh/7tYnYg4C4H3qEEGSEz/A8kwd44vBpSIOQ==
X-Received: by 2002:a17:906:7fc4:: with SMTP id
 r4mr16187994ejs.81.1613907922087; 
 Sun, 21 Feb 2021 03:45:22 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id o9sm6229331eji.101.2021.02.21.03.45.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 03:45:21 -0800 (PST)
Date: Sun, 21 Feb 2021 06:45:18 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH] virtio-iommu: Default to bypass during boot
Message-ID: <20210221064211-mutt-send-email-mst@kernel.org>
References: <20210218105929.1433230-1-jean-philippe@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210218105929.1433230-1-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: eric.auger@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 18, 2021 at 11:59:30AM +0100, Jean-Philippe Brucker wrote:
> Currently the virtio-iommu device must be programmed before it allows
> DMA from any PCI device. This can make the VM entirely unusable when a
> virtio-iommu driver isn't present, for example in a bootloader that
> loads the OS from storage.
> 
> Similarly to the other vIOMMU implementations, default to DMA bypassing
> the IOMMU during boot. Add a "boot-bypass" option that lets users change
> this behavior.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

wouldn't this be a spec violation?


When the device is reset, endpoints are not attached to any domain.

If the VIRTIO_IOMMU_F_BYPASS feature is negotiated, all accesses from
unattached endpoints are allowed and translated by the IOMMU using the
identity function. If the feature is not negotiated, any memory access
from an unattached endpoint fails. Upon attaching an endpoint in
bypass mode to a new domain, any memory access from the endpoint fails,
since the domain does not contain any mapping.


Maybe it's not too late to change the spec here - want to try sending
a spec patch?




> ---
>  include/hw/virtio/virtio-iommu.h |  1 +
>  hw/virtio/virtio-iommu.c         | 23 +++++++++++++++++++++--
>  2 files changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
> index 273e35c04bc..4c66989ca4e 100644
> --- a/include/hw/virtio/virtio-iommu.h
> +++ b/include/hw/virtio/virtio-iommu.h
> @@ -58,6 +58,7 @@ struct VirtIOIOMMU {
>      GTree *domains;
>      QemuMutex mutex;
>      GTree *endpoints;
> +    bool boot_bypass;
>  };
>  
>  #endif
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index c2883a2f6c8..cd08dc39eca 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -689,6 +689,25 @@ static void virtio_iommu_report_fault(VirtIOIOMMU *viommu, uint8_t reason,
>  
>  }
>  
> +static bool virtio_iommu_bypass_is_allowed(VirtIOIOMMU *s)
> +{
> +    VirtIODevice *vdev = &s->parent_obj;
> +
> +    /*
> +     * Allow bypass if:
> +     * - boot_bypass is enabled and the BYPASS feature hasn't yet been
> +     *   acknowledged.
> +     * - the BYPASS feature has been negotiated.
> +     */
> +    if (s->boot_bypass && !(vdev->status & VIRTIO_CONFIG_S_FEATURES_OK)) {
> +        return true;
> +    }
> +    if (virtio_vdev_has_feature(vdev, VIRTIO_IOMMU_F_BYPASS)) {
> +        return true;
> +    }
> +    return false;
> +}
> +
>  static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>                                              IOMMUAccessFlags flag,
>                                              int iommu_idx)
> @@ -715,8 +734,7 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>          .perm = IOMMU_NONE,
>      };
>  
> -    bypass_allowed = virtio_vdev_has_feature(&s->parent_obj,
> -                                             VIRTIO_IOMMU_F_BYPASS);
> +    bypass_allowed = virtio_iommu_bypass_is_allowed(s);
>  
>      sid = virtio_iommu_get_bdf(sdev);
>  
> @@ -1156,6 +1174,7 @@ static const VMStateDescription vmstate_virtio_iommu = {
>  
>  static Property virtio_iommu_properties[] = {
>      DEFINE_PROP_LINK("primary-bus", VirtIOIOMMU, primary_bus, "PCI", PCIBus *),
> +    DEFINE_PROP_BOOL("boot-bypass", VirtIOIOMMU, boot_bypass, true),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> -- 
> 2.30.0


