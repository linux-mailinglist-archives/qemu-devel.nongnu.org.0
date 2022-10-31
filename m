Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D75613869
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:52:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opVCO-0003Ip-7R; Mon, 31 Oct 2022 09:51:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1opVCL-0003FX-Sl
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:51:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1opVCK-0000Je-17
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:51:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667224285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o8dwldbXQk9w7iIcu+eF/I6gT9GbbBrcSf6WPkra20A=;
 b=QwuEj6b1/2f/QWJvvoSa5fsxfYM9Z4bjlv+nN/hCJC8P8rl+Q9ClAbjJAukXUWSKglOq0A
 gx9+JZNce7/snX9TFmZAoPKZhQgBDqd3RCIIFso/drrZDIKtedCgihumHM3mJMWOdHRLos
 RJwt69W/NVFmnEBYv5xqJnBtnBteaIo=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-661-zS8DtoX1MeGSvLgC0FYMiQ-1; Mon, 31 Oct 2022 09:51:24 -0400
X-MC-Unique: zS8DtoX1MeGSvLgC0FYMiQ-1
Received: by mail-il1-f200.google.com with SMTP id
 c4-20020a056e020bc400b0030098df879dso3462926ilu.6
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 06:51:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o8dwldbXQk9w7iIcu+eF/I6gT9GbbBrcSf6WPkra20A=;
 b=CdobAd+cl2+8cmqs5+wGqjQho1EA5Dju2O71WUoBBt6yfp5uljarqInfAf6xEUgzXE
 KglL+6X5jJ+56fB6i0ulhVtEYbUXe+aiCbnb1kJFuQEZD8maiexdoXj6mNgRPYg6HlBV
 4U0b/8sTH4pGMVTSnbg/nP6IF0y80vyWaSL/xyL5KYG7L3ImQiKak4n2MJPvIKD8s+RE
 77wJC0fAKB1XT6VEe2a+dUgl377bACoGn8vcRug/NnnKL9UQeaaDvat7cNLYEQ3v65vv
 eYaLkJMpOSlIvTqvHJTPj55gGaa7CN+BrrU7XOttK/RyfjkLWQX0oIBR+v+FagoePvrq
 DQyw==
X-Gm-Message-State: ACrzQf0OyZmoBryYcwmgf3nYvL8geKWzmxwJkoCznI/Jjs/xH3LXwH/F
 nnObQ2yCQxWPgm0y2nQs5h28kMZ1hxPW9YnR6xVazYUxXxXE7n5HmDXZdeExHMr1LW82bSFUmX8
 XlCcqgrV8yol/+EI=
X-Received: by 2002:a05:6638:468e:b0:375:1ae9:ba13 with SMTP id
 bq14-20020a056638468e00b003751ae9ba13mr7112518jab.253.1667224283537; 
 Mon, 31 Oct 2022 06:51:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5chxhbeDngLlQPCqY/ex5s7UclzoIgq7Frs/jfEnlTYaoHx/tCrspsA39fJvQAAdiY69Roiw==
X-Received: by 2002:a05:6638:468e:b0:375:1ae9:ba13 with SMTP id
 bq14-20020a056638468e00b003751ae9ba13mr7112488jab.253.1667224283226; 
 Mon, 31 Oct 2022 06:51:23 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 m4-20020a026a44000000b00363e6b793d7sm2829926jaf.28.2022.10.31.06.51.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 06:51:22 -0700 (PDT)
Date: Mon, 31 Oct 2022 07:51:20 -0600
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
Subject: Re: [PATCH v6 01/17] hw/vfio/pci: Ensure MSI and MSI-X do not overlap
Message-ID: <20221031075120.72d9d7ca.alex.williamson@redhat.com>
In-Reply-To: <20221031123319.21532-2-akihiko.odaki@daynix.com>
References: <20221031123319.21532-1-akihiko.odaki@daynix.com>
 <20221031123319.21532-2-akihiko.odaki@daynix.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 31 Oct 2022 21:33:03 +0900
Akihiko Odaki <akihiko.odaki@daynix.com> wrote:

> pci_add_capability() checks whether capabilities overlap, and notifies
> its caller so that it can properly handle the case. However, in the
> most cases, the capabilities actually never overlap, and the interface
> incurred extra error handling code, which is often incorrect or
> suboptimal. For such cases, pci_add_capability() can simply abort the
> execution if the capabilities actually overlap since it should be a
> programming error.
> 
> This change handles the other cases: hw/vfio/pci depends on the check to
> decide MSI and MSI-X capabilities overlap with another. As they are
> quite an exceptional and hw/vfio/pci knows much about PCI capabilities,
> adding code specific to the cases to hw/vfio/pci still results in less
> code than having error handling code everywhere in total.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>  hw/vfio/pci.c | 61 ++++++++++++++++++++++++++++++++++++++++++---------
>  hw/vfio/pci.h |  3 +++
>  2 files changed, 54 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 939dcc3d4a..c7e3ef95a7 100644
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
> @@ -2025,6 +2044,22 @@ static int vfio_add_std_cap(VFIOPCIDevice *vdev, uint8_t pos, Error **errp)
>          }
>      }
>  
> +    if (cap_id != PCI_CAP_ID_MSI &&
> +        range_covers_byte(vdev->msi_pos, vdev->msi_cap_size, pos)) {
> +        error_setg(errp,
> +            "A capability overlaps with MSI (%" PRIu8 " in [%" PRIu8 ", %" PRIu8 "))",
> +            pos, vdev->msi_pos, vdev->msi_pos + vdev->msi_cap_size);
> +        return -EINVAL;
> +    }
> +
> +    if (cap_id != PCI_CAP_ID_MSIX && vdev->msix &&
> +        range_covers_byte(vdev->msix->pos, MSIX_CAP_LENGTH, pos)) {
> +        error_setg(errp,
> +            "A capability overlaps with MSI-X (%" PRIu8 " in [%" PRIu8 ", %" PRIu8 "))",
> +            pos, vdev->msix->pos, vdev->msix->pos + MSIX_CAP_LENGTH);
> +        return -EINVAL;
> +    }

I provided an example of how the existing vfio_msi[x]_setup() can be
trivially extended to perform the necessary size checking in place of
pci_add_capability() without special cases and additional error paths
as done here.  Please adopt the approach I suggested.  Thanks,

Alex

> +
>      /* Scale down size, esp in case virt caps were added above */
>      size = MIN(size, vfio_std_cap_max_size(pdev, pos));
>  
> @@ -3037,6 +3072,12 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
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


