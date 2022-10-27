Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA6861022E
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:58:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo8xc-00016I-Nw; Thu, 27 Oct 2022 15:54:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1oo8xI-0000kb-ON
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 15:54:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1oo8bH-0003zO-HW
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 15:31:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666899093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FTFs5Rjjxiui9rrU8WyvaiO6592b7yoGl8NSC0MMcGs=;
 b=PQLhVpQWoKspr1eMrGOJaGoIjDzyBsodbxMuALZJhSLG87dbBwYJuWbEZ9QJMMVlcMt0x4
 6LG7TsLXw1nNn6XvMa2uQOpRL/JQ6fGgVqaAelushnMqw8Q3Mt2tZdOnDao0vRdqGeOEJ/
 NmqjjTY40TydHyff6LaL9mequpFx4rQ=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-477-hkJzcNgtP72UMLsZFW68uQ-1; Thu, 27 Oct 2022 15:31:30 -0400
X-MC-Unique: hkJzcNgtP72UMLsZFW68uQ-1
Received: by mail-il1-f199.google.com with SMTP id
 m9-20020a056e021c2900b002fadb905ddcso2202313ilh.18
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 12:31:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FTFs5Rjjxiui9rrU8WyvaiO6592b7yoGl8NSC0MMcGs=;
 b=OCqjX72qk3f/1tSdDoL5+o5WdXM7B/y9JwpiDovLpeG9z5VP3+GZGBkGiPw0qgL4cA
 e8DcHXnKaNgBG5wBQMDL7sVY8L+JIQ5AFQ8rFm4pwUs+YOJgkdl9FdYiqJ3WjAdXlFsP
 AYLRealK07fojthvN8BymjXWP6XkfBiUGg7K4FqleCh0CwSKXyJIs9XTqBUESxr0uKfd
 22BmWI9L+GSsz1Wuz9ZTGL1vcKZ0q7oO1g6ruw8sVp0frIqsHp7nGbsTjxZg9Y2vbmTQ
 re/f1f1Tzx8jmINqF2/TWeu1DrIEwrC4LWPzI7dDvKiXa5MpcbVqWomva0IxMv6dMcUm
 KZmQ==
X-Gm-Message-State: ACrzQf3N0OGLtzWchV82Dk9hmDkz9iTqqQTsyuu8WL1WUQSrwctSyrNf
 p1NhwJPMC95bqfHrB2q4p5qcxRXPweh/1ISrcGgyVaxB43+jS05luLzPvmEgAqkRaYCMbc198NG
 /e/PUtZOxaGGKVHY=
X-Received: by 2002:a05:6e02:20ea:b0:2fa:bf8:300a with SMTP id
 q10-20020a056e0220ea00b002fa0bf8300amr31044541ilv.309.1666899085266; 
 Thu, 27 Oct 2022 12:31:25 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4NjG2fNB22tbqc4Ub7DPY5tTk5Y8FHf6B8z7NF3vukk0HtrX4ug1kDekztIZHMReQoyMvaVg==
X-Received: by 2002:a05:6e02:20ea:b0:2fa:bf8:300a with SMTP id
 q10-20020a056e0220ea00b002fa0bf8300amr31044511ilv.309.1666899084922; 
 Thu, 27 Oct 2022 12:31:24 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 p12-20020a056638216c00b0036fdc9ef995sm889348jak.92.2022.10.27.12.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 12:31:24 -0700 (PDT)
Date: Thu, 27 Oct 2022 13:31:22 -0600
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
Subject: Re: [PATCH v4 01/17] hw/vfio/pci: Ensure MSI and MSI-X do not overlap
Message-ID: <20221027133122.0278d5e0.alex.williamson@redhat.com>
In-Reply-To: <20221027063705.4093-2-akihiko.odaki@daynix.com>
References: <20221027063705.4093-1-akihiko.odaki@daynix.com>
 <20221027063705.4093-2-akihiko.odaki@daynix.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 27 Oct 2022 15:36:49 +0900
Akihiko Odaki <akihiko.odaki@daynix.com> wrote:

> vfio_add_std_cap() is designed to ensure that capabilities do not
> overlap, but it failed to do so for MSI and MSI-X capabilities.
> 
> Ensure MSI and MSI-X capabilities do not overlap with others by omitting
> other overlapping capabilities.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>  hw/vfio/pci.c | 55 +++++++++++++++++++++++++++++++++++++++++----------
>  hw/vfio/pci.h |  3 +++
>  2 files changed, 48 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 939dcc3d4a..8a4995cd68 100644
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
> +    pos = pci_find_capability(&vdev->pdev, PCI_CAP_ID_MSIX);


PCI_CAP_ID_MSIX???  Is this tested with MSI?


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
> +
> +    vdev->msi_cap_size = 0xa;
> +    if ((vdev->msi_ctrl & PCI_MSI_FLAGS_MASKBIT)) {
> +        vdev->msi_cap_size += 0xa;
> +    }
> +    if ((vdev->msi_ctrl & PCI_MSI_FLAGS_64BIT)) {
> +        vdev->msi_cap_size += 0x4;
> +    }
> +}
>  
> -    msi_64bit = !!(ctrl & PCI_MSI_FLAGS_64BIT);
> -    msi_maskbit = !!(ctrl & PCI_MSI_FLAGS_MASKBIT);
> -    entries = 1 << ((ctrl & PCI_MSI_FLAGS_QMASK) >> 1);
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
> @@ -2025,6 +2044,16 @@ static int vfio_add_std_cap(VFIOPCIDevice *vdev, uint8_t pos, Error **errp)
>          }
>      }
>  
> +    if (cap_id != PCI_CAP_ID_MSI &&
> +        pos >= vdev->msi_pos && pos < vdev->msi_pos + vdev->msi_cap_size) {
> +        return 0;
> +    }
> +
> +    if (cap_id != PCI_CAP_ID_MSIX && vdev->msix &&
> +        pos >= vdev->msix->pos && pos < vdev->msix->pos + MSIX_CAP_LENGTH) {
> +        return 0;
> +    }
> +

These only test a specific kind of overlap, why not use
ranges_overlap()?

We also need to sanity test vdev->msi_pos, or are you just letting
msi_pos = 0, msi_cap_size = 0 fall through since we cannot overlap?

Shouldn't this also jump to reporting the error rather than silently
dropping a capability?  Thanks,

Alex

>      /* Scale down size, esp in case virt caps were added above */
>      size = MIN(size, vfio_std_cap_max_size(pdev, pos));
>  
> @@ -3037,6 +3066,12 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
>  
>      vfio_bars_prepare(vdev);
>  
> +    vfio_msi_early_setup(vdev, &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        goto error;
> +    }
> +
>      vfio_msix_early_setup(vdev, &err);
>      if (err) {
>          error_propagate(errp, err);
> diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
> index 7c236a52f4..9ae0278058 100644
> --- a/hw/vfio/pci.h
> +++ b/hw/vfio/pci.h
> @@ -107,6 +107,7 @@ enum {
>  
>  /* Cache of MSI-X setup */
>  typedef struct VFIOMSIXInfo {
> +    uint8_t pos;
>      uint8_t table_bar;
>      uint8_t pba_bar;
>      uint16_t entries;
> @@ -128,6 +129,8 @@ struct VFIOPCIDevice {
>      unsigned int rom_size;
>      off_t rom_offset; /* Offset of ROM region within device fd */
>      void *rom;
> +    uint8_t msi_pos;
> +    uint16_t msi_ctrl;
>      int msi_cap_size;
>      VFIOMSIVector *msi_vectors;
>      VFIOMSIXInfo *msix;


