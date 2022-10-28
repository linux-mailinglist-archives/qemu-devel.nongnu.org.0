Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC520611454
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 16:18:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooQAM-00059I-47; Fri, 28 Oct 2022 10:16:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1ooQA4-0004q0-UQ
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 10:16:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1ooQ9y-00050E-GE
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 10:16:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666966593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t2DbeaBfvcys/3Er27e7UdbV63oAtZFVhlP+PxQ8K6I=;
 b=FmVr4V2dUSQxlWWx56s52z2p3SJjXZN8HqdytKv1mDUTe4rmQwBfr60JRMFtJp360BSKb0
 8hChorT5SoGj094L4QP5RbzYaOI1OpqDAC6W2GF1ACKEbjYZ52U1ZixmTIrRJvzUOgNQur
 WSS2oMzwNHyUakKoPa++vmD5hEwMZ5o=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-639-BfZzYloDOWeQcWJultgR_g-1; Fri, 28 Oct 2022 10:16:31 -0400
X-MC-Unique: BfZzYloDOWeQcWJultgR_g-1
Received: by mail-il1-f198.google.com with SMTP id
 n7-20020a056e02148700b002ffbfe5a9aeso5131425ilk.19
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 07:16:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t2DbeaBfvcys/3Er27e7UdbV63oAtZFVhlP+PxQ8K6I=;
 b=lhH9k2oOb8pT7Yhg3bVV7Z+smoO2qZQpZet5tpUTN1aYK4yreBm9/6acZbKvrmebId
 pj5ncwPlZltqVXyDnj6x8z8ibQ7khA3JTHUZaXEhbCn2/PVHUMGYrRp8Hi9a8uX8Ag1C
 mHxQNp/KWUYRzd+qwWFiisSDpv91EE/90SF080/FU+liolhYd1eVtPR86zsg8Jss6Okw
 TjLkSJYRF9s5m/tImj69m01rIV9ESvfPNzLa7lhBLOKXX1bGRssHUwPEygB2FVoe0sbr
 gs6C0VkXxc5cFy6iNWSK7ydAu4K0dleMCKAkZBCdELMYH0jAUcilWR8Lci0FKzvP8C8O
 uHkQ==
X-Gm-Message-State: ACrzQf1w20NbdBK4DH7HoQIXurAOYFOx8iE4WwNGy3MX6Y9mq82yTP2Z
 5ez/zhVnbleRnn8X27jEWW+SH1mCnvWSMPzwqmudDlFGDKKejLQhFiKU6m6Gk0DtLbAF1LFrNa/
 DDlVQZ7GeqoJaRqc=
X-Received: by 2002:a05:6638:2044:b0:365:c2de:3e9e with SMTP id
 t4-20020a056638204400b00365c2de3e9emr31904508jaj.157.1666966590038; 
 Fri, 28 Oct 2022 07:16:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM60lZMxdi/HmbO7s0TOZpyOYf4ElQ24AHxfXbq4AjxTo/+HiYtkPw9Yq8l5Cva6gXFSf/vmRw==
X-Received: by 2002:a05:6638:2044:b0:365:c2de:3e9e with SMTP id
 t4-20020a056638204400b00365c2de3e9emr31904486jaj.157.1666966589784; 
 Fri, 28 Oct 2022 07:16:29 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 t8-20020a92cc48000000b002faecf63c48sm1613665ilq.79.2022.10.28.07.16.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 07:16:29 -0700 (PDT)
Date: Fri, 28 Oct 2022 08:16:27 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, John
 Snow <jsnow@redhat.com>, Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason
 Wang <jasowang@redhat.com>, Stefan Weil <sw@weilnetz.de>, Keith Busch
 <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>, Peter Maydell
 <peter.maydell@linaro.org>, Andrey Smirnov <andrew.smirnov@gmail.com>, Paul
 Burton <paulburton@kernel.org>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Yan Vugenfirer <yan@daynix.com>, Yuri
 Benditovich <yuri.benditovich@daynix.com>
Subject: Re: [PATCH v5 01/17] hw/vfio/pci: Ensure MSI and MSI-X do not overlap
Message-ID: <20221028081627.50c9bf61.alex.williamson@redhat.com>
In-Reply-To: <20221028122629.3269-2-akihiko.odaki@daynix.com>
References: <20221028122629.3269-1-akihiko.odaki@daynix.com>
 <20221028122629.3269-2-akihiko.odaki@daynix.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 28 Oct 2022 21:26:13 +0900
Akihiko Odaki <akihiko.odaki@daynix.com> wrote:

> vfio_add_std_cap() is designed to ensure that capabilities do not
> overlap, but it failed to do so for MSI and MSI-X capabilities.
> 
> Ensure MSI and MSI-X capabilities do not overlap with others by omitting
> other overlapping capabilities.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>  hw/vfio/pci.c | 63 +++++++++++++++++++++++++++++++++++++++++++--------
>  hw/vfio/pci.h |  3 +++
>  2 files changed, 56 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 939dcc3d4a..36c8f3dc85 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -1278,23 +1278,42 @@ static void vfio_disable_interrupts(VFIOPCIDevice *vdev)
>      }
>  }
>  
> -static int vfio_msi_setup(VFIOPCIDevice *vdev, int pos, Error **errp)
> +static void vfio_msi_early_setup(VFIOPCIDevice *vdev, Error **errp)
>  {
>      uint16_t ctrl;
> -    bool msi_64bit, msi_maskbit;
> -    int ret, entries;
> -    Error *err = NULL;
> +    uint8_t pos;
> +
> +    pos = pci_find_capability(&vdev->pdev, PCI_CAP_ID_MSI);
> +    if (!pos) {
> +        return;
> +    }
>  
>      if (pread(vdev->vbasedev.fd, &ctrl, sizeof(ctrl),
>                vdev->config_offset + pos + PCI_CAP_FLAGS) != sizeof(ctrl)) {
>          error_setg_errno(errp, errno, "failed reading MSI PCI_CAP_FLAGS");
> -        return -errno;
> +        return;
>      }
> -    ctrl = le16_to_cpu(ctrl);
> +    vdev->msi_pos = pos;
> +    vdev->msi_ctrl = le16_to_cpu(ctrl);
>  
> -    msi_64bit = !!(ctrl & PCI_MSI_FLAGS_64BIT);
> -    msi_maskbit = !!(ctrl & PCI_MSI_FLAGS_MASKBIT);
> -    entries = 1 << ((ctrl & PCI_MSI_FLAGS_QMASK) >> 1);
> +    vdev->msi_cap_size = 0xa;
> +    if ((vdev->msi_ctrl & PCI_MSI_FLAGS_MASKBIT)) {
> +        vdev->msi_cap_size += 0xa;
> +    }
> +    if ((vdev->msi_ctrl & PCI_MSI_FLAGS_64BIT)) {
> +        vdev->msi_cap_size += 0x4;
> +    }
> +}
> +
> +static int vfio_msi_setup(VFIOPCIDevice *vdev, int pos, Error **errp)
> +{
> +    bool msi_64bit, msi_maskbit;
> +    int ret, entries;
> +    Error *err = NULL;
> +
> +    msi_64bit = !!(vdev->msi_ctrl & PCI_MSI_FLAGS_64BIT);
> +    msi_maskbit = !!(vdev->msi_ctrl & PCI_MSI_FLAGS_MASKBIT);
> +    entries = 1 << ((vdev->msi_ctrl & PCI_MSI_FLAGS_QMASK) >> 1);
>  
>      trace_vfio_msi_setup(vdev->vbasedev.name, pos);
>  
> @@ -1306,7 +1325,6 @@ static int vfio_msi_setup(VFIOPCIDevice *vdev, int pos, Error **errp)
>          error_propagate_prepend(errp, err, "msi_init failed: ");
>          return ret;
>      }
> -    vdev->msi_cap_size = 0xa + (msi_maskbit ? 0xa : 0) + (msi_64bit ? 0x4 : 0);
>  
>      return 0;
>  }
> @@ -1524,6 +1542,7 @@ static void vfio_msix_early_setup(VFIOPCIDevice *vdev, Error **errp)
>      pba = le32_to_cpu(pba);
>  
>      msix = g_malloc0(sizeof(*msix));
> +    msix->pos = pos;
>      msix->table_bar = table & PCI_MSIX_FLAGS_BIRMASK;
>      msix->table_offset = table & ~PCI_MSIX_FLAGS_BIRMASK;
>      msix->pba_bar = pba & PCI_MSIX_FLAGS_BIRMASK;
> @@ -2025,6 +2044,24 @@ static int vfio_add_std_cap(VFIOPCIDevice *vdev, uint8_t pos, Error **errp)
>          }
>      }
>  
> +    if (cap_id != PCI_CAP_ID_MSI &&
> +        range_covers_byte(vdev->msi_pos, vdev->msi_cap_size, pos)) {
> +        warn_report(VFIO_MSG_PREFIX
> +                    "A capability overlaps with MSI, ignoring (%" PRIu8 " @ %" PRIu8 " in [%" PRIu8 ", %" PRIu8 "))",
> +                    vdev->vbasedev.name, cap_id, pos,
> +                    vdev->msi_pos, vdev->msi_pos + vdev->msi_cap_size);
> +        return 0;
> +    }
> +
> +    if (cap_id != PCI_CAP_ID_MSIX && vdev->msix &&
> +        range_covers_byte(vdev->msix->pos, MSIX_CAP_LENGTH, pos)) {
> +        warn_report(VFIO_MSG_PREFIX
> +                    "A capability overlaps with MSI-X, ignoring (%" PRIu8 " @ %" PRIu8 " in [%" PRIu8 ", %" PRIu8 "))",
> +                    vdev->vbasedev.name, cap_id, pos,
> +                    vdev->msix->pos, vdev->msix->pos + MSIX_CAP_LENGTH);
> +        return 0;
> +    }

Capabilities are not a single byte, the fact that it doesn't start
within the MSI or MSI-X capability is not a sufficient test.  We're
also choosing to prioritize MSI and MSI-X capabilities by protecting
that range rather than the existing behavior where we'd drop those
capabilities if they overlap with another capability that has already
been placed.  There are merits to both approaches, but I don't see any
justification here to change the current behavior.

Isn't the most similar behavior to existing to pass the available size
to vfio_msi[x]_setup() and return an errno if the size would be
exceeded?  Something like below (untested, and requires exporting
msi_cap_sizeof()).  Thanks,

Alex

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 939dcc3d4a9e..485f9bc5102d 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -1278,11 +1278,13 @@ static void vfio_disable_interrupts(VFIOPCIDevice *vdev)
     }
 }
 
-static int vfio_msi_setup(VFIOPCIDevice *vdev, int pos, Error **errp)
+static int vfio_msi_setup(VFIOPCIDevice *vdev, int pos,
+                          uint8_t size, Error **errp)
 {
     uint16_t ctrl;
     bool msi_64bit, msi_maskbit;
     int ret, entries;
+    uint8_t msi_cap_size;
     Error *err = NULL;
 
     if (pread(vdev->vbasedev.fd, &ctrl, sizeof(ctrl),
@@ -1295,6 +1297,10 @@ static int vfio_msi_setup(VFIOPCIDevice *vdev, int pos, Error **errp)
     msi_64bit = !!(ctrl & PCI_MSI_FLAGS_64BIT);
     msi_maskbit = !!(ctrl & PCI_MSI_FLAGS_MASKBIT);
     entries = 1 << ((ctrl & PCI_MSI_FLAGS_QMASK) >> 1);
+    msi_cap_size = msi_cap_sizeof(ctrl);
+
+    if (msi_cap_size > size)
+	    return -ENOSPC;
 
     trace_vfio_msi_setup(vdev->vbasedev.name, pos);
 
@@ -1306,7 +1312,7 @@ static int vfio_msi_setup(VFIOPCIDevice *vdev, int pos, Error **errp)
         error_propagate_prepend(errp, err, "msi_init failed: ");
         return ret;
     }
-    vdev->msi_cap_size = 0xa + (msi_maskbit ? 0xa : 0) + (msi_64bit ? 0x4 : 0);
+    vdev->msi_cap_size = msi_cap_size;
 
     return 0;
 }
@@ -1570,11 +1576,15 @@ static void vfio_msix_early_setup(VFIOPCIDevice *vdev, Error **errp)
     vfio_pci_relocate_msix(vdev, errp);
 }
 
-static int vfio_msix_setup(VFIOPCIDevice *vdev, int pos, Error **errp)
+static int vfio_msix_setup(VFIOPCIDevice *vdev, int pos,
+                           uint8_t size, Error **errp)
 {
     int ret;
     Error *err = NULL;
 
+    if (MSIX_CAP_LENGTH > size)
+	    return -ENOSPC;
+
     vdev->msix->pending = g_new0(unsigned long,
                                  BITS_TO_LONGS(vdev->msix->entries));
     ret = msix_init(&vdev->pdev, vdev->msix->entries,
@@ -2033,14 +2043,14 @@ static int vfio_add_std_cap(VFIOPCIDevice *vdev, uint8_t pos, Error **errp)
 
     switch (cap_id) {
     case PCI_CAP_ID_MSI:
-        ret = vfio_msi_setup(vdev, pos, errp);
+        ret = vfio_msi_setup(vdev, pos, size, errp);
         break;
     case PCI_CAP_ID_EXP:
         vfio_check_pcie_flr(vdev, pos);
         ret = vfio_setup_pcie_cap(vdev, pos, size, errp);
         break;
     case PCI_CAP_ID_MSIX:
-        ret = vfio_msix_setup(vdev, pos, errp);
+        ret = vfio_msix_setup(vdev, pos, size, errp);
         break;
     case PCI_CAP_ID_PM:
         vfio_check_pm_reset(vdev, pos);


