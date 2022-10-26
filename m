Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F20660EB68
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 00:13:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onobi-000828-7Z; Wed, 26 Oct 2022 18:10:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1onobc-0007o7-EC
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 18:10:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1onobZ-0003V7-DO
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 18:10:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666822232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Q8rzHLFBZ01Fkm8eLjEa9OyYzMQLw+uXy4yyK+6jEg=;
 b=hXe+lf7tmhuVFC7s2Q6ZyCeIUB8xERhshc/YAa0w3H/t6+roiI3sD0AUUMoaDl61ov5A2G
 6YxJcPySvfQNAHk5RUGhFUllaH2yHW0GemEX9mD5em84BKFaZBpz8zKpTutBeC7vxJQrs3
 pG3MleFsxdmPC1tUz/7hHejpErsMI9g=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-617-frXkBFFBPo-yG55xvN8tMQ-1; Wed, 26 Oct 2022 18:10:30 -0400
X-MC-Unique: frXkBFFBPo-yG55xvN8tMQ-1
Received: by mail-io1-f71.google.com with SMTP id
 x21-20020a5d9455000000b006bc1172e639so11548912ior.18
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 15:10:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5Q8rzHLFBZ01Fkm8eLjEa9OyYzMQLw+uXy4yyK+6jEg=;
 b=WndvW69/PCW+gmn/bGh/kBUXeQWvZFf4Wvds1T96f+Hnoc5nP5AJHKMJ/C9AS14+rE
 KS88BCCSZk0/UxSJZDU2ifEeWjs46Idb3TuNeGXqChhPAQOq7wCdNVUYu21FnK2ptff7
 EpMQXdSb3CVog+Ik3dHd5BXO8kdlfSrrwRyKk/AkvvLDAcr9DH6PIfKOPi4NBQsJo8RN
 grIosh5YCMAd8u8neqDSo+xd5BOXKi7W2Ylytx21xpWsRRZg68X4WcKyicTRwWxzWLGT
 5wZ6Z24kTjP3lH3KE113OHqZ40lxlSU5GvkCf+4wr+9XN42+MnyaCRpQxfOu96ZkN4wv
 OY1w==
X-Gm-Message-State: ACrzQf2VtHCQVG508MRZsFBK3b6/6Cj6JdH33R7V7lNSjdcrniqKulCr
 bEktLfdQt8RKvtRSqAUafVz4JTKQ7TGJfh0gKnDOTu22/sAI6aGwyfzz9/F3UNA+dHYY3eznVw2
 6K00ngZegxkagXks=
X-Received: by 2002:a05:6638:2502:b0:363:cd71:a0d1 with SMTP id
 v2-20020a056638250200b00363cd71a0d1mr30638124jat.263.1666822228801; 
 Wed, 26 Oct 2022 15:10:28 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM50x8cIeUDDLqX9eNXJ7TIb/L7SKBLcUbnljs/iCaoCrqRCdq+MESGf2nEsZqh9cE1Mf3jJJg==
X-Received: by 2002:a05:6638:419c:b0:363:c0fb:3a64 with SMTP id
 az28-20020a056638419c00b00363c0fb3a64mr28427244jab.193.1666822218373; 
 Wed, 26 Oct 2022 15:10:18 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 y22-20020a02ce96000000b00374bf3b62a0sm2420547jaq.99.2022.10.26.15.10.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 15:10:17 -0700 (PDT)
Date: Wed, 26 Oct 2022 16:10:15 -0600
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
Subject: Re: [PATCH v3 14/16] hw/vfio/pci: Omit errp for pci_add_capability
Message-ID: <20221026161015.211b3f36.alex.williamson@redhat.com>
In-Reply-To: <20221026201527.24063-15-akihiko.odaki@daynix.com>
References: <20221026201527.24063-1-akihiko.odaki@daynix.com>
 <20221026201527.24063-15-akihiko.odaki@daynix.com>
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

On Thu, 27 Oct 2022 05:15:25 +0900
Akihiko Odaki <akihiko.odaki@daynix.com> wrote:

> The code generating errors in pci_add_capability has a comment which
> says:
> > Verify that capabilities don't overlap.  Note: device assignment
> > depends on this check to verify that the device is not broken.
> > Should never trigger for emulated devices, but it's helpful for
> > debugging these.  
> 
> Indeed vfio has some code that passes capability offsets and sizes from
> a physical device, but it explicitly pays attention so that the
> capabilities never overlap. Therefore, in pci_add_capability(), we can
> always assert that capabilities never overlap, and that is what happens
> when omitting errp.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>  hw/vfio/pci-quirks.c | 15 +++------------
>  hw/vfio/pci.c        | 14 +++++---------
>  2 files changed, 8 insertions(+), 21 deletions(-)
> 
> diff --git a/hw/vfio/pci-quirks.c b/hw/vfio/pci-quirks.c
> index f0147a050a..e94fd273ea 100644
> --- a/hw/vfio/pci-quirks.c
> +++ b/hw/vfio/pci-quirks.c
> @@ -1530,7 +1530,7 @@ const PropertyInfo qdev_prop_nv_gpudirect_clique = {
>  static int vfio_add_nv_gpudirect_cap(VFIOPCIDevice *vdev, Error **errp)
>  {
>      PCIDevice *pdev = &vdev->pdev;
> -    int ret, pos = 0xC8;
> +    int pos = 0xC8;
>  
>      if (vdev->nv_gpudirect_clique == 0xFF) {
>          return 0;
> @@ -1547,11 +1547,7 @@ static int vfio_add_nv_gpudirect_cap(VFIOPCIDevice *vdev, Error **errp)
>          return -EINVAL;
>      }
>  
> -    ret = pci_add_capability(pdev, PCI_CAP_ID_VNDR, pos, 8, errp);
> -    if (ret < 0) {
> -        error_prepend(errp, "Failed to add NVIDIA GPUDirect cap: ");
> -        return ret;
> -    }
> +    pci_add_capability(pdev, PCI_CAP_ID_VNDR, pos, 8);
>  
>      memset(vdev->emulated_config_bits + pos, 0xFF, 8);
>      pos += PCI_CAP_FLAGS;
> @@ -1718,12 +1714,7 @@ static int vfio_add_vmd_shadow_cap(VFIOPCIDevice *vdev, Error **errp)
>          return -EFAULT;
>      }
>  
> -    ret = pci_add_capability(&vdev->pdev, PCI_CAP_ID_VNDR, pos,
> -                             VMD_SHADOW_CAP_LEN, errp);
> -    if (ret < 0) {
> -        error_prepend(errp, "Failed to add VMD MEMBAR Shadow cap: ");
> -        return ret;
> -    }
> +    pci_add_capability(&vdev->pdev, PCI_CAP_ID_VNDR, pos, VMD_SHADOW_CAP_LEN);


For these, I guess we're assuming that since they're added first via
vfio_add_virt_caps() that we cannot create an overlap?

>  
>      memset(vdev->emulated_config_bits + pos, 0xFF, VMD_SHADOW_CAP_LEN);
>      pos += PCI_CAP_FLAGS;
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 939dcc3d4a..2b653d01e3 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -1826,7 +1826,7 @@ static void vfio_add_emulated_long(VFIOPCIDevice *vdev, int pos,
>      vfio_set_long_bits(vdev->emulated_config_bits + pos, mask, mask);
>  }
>  
> -static int vfio_setup_pcie_cap(VFIOPCIDevice *vdev, int pos, uint8_t size,
> +static int vfio_setup_pcie_cap(VFIOPCIDevice *vdev, uint8_t pos, uint8_t size,
>                                 Error **errp)
>  {
>      uint16_t flags;
> @@ -1943,11 +1943,7 @@ static int vfio_setup_pcie_cap(VFIOPCIDevice *vdev, int pos, uint8_t size,
>                                 1, PCI_EXP_FLAGS_VERS);
>      }
>  
> -    pos = pci_add_capability(&vdev->pdev, PCI_CAP_ID_EXP, pos, size,
> -                             errp);
> -    if (pos < 0) {
> -        return pos;
> -    }
> +    pos = pci_add_capability(&vdev->pdev, PCI_CAP_ID_EXP, pos, size);
>  
>      vdev->pdev.exp.exp_cap = pos;
>  
> @@ -2045,14 +2041,14 @@ static int vfio_add_std_cap(VFIOPCIDevice *vdev, uint8_t pos, Error **errp)
>      case PCI_CAP_ID_PM:
>          vfio_check_pm_reset(vdev, pos);
>          vdev->pm_cap = pos;
> -        ret = pci_add_capability(pdev, cap_id, pos, size, errp);
> +        pci_add_capability(pdev, cap_id, pos, size);
>          break;
>      case PCI_CAP_ID_AF:
>          vfio_check_af_flr(vdev, pos);
> -        ret = pci_add_capability(pdev, cap_id, pos, size, errp);
> +        pci_add_capability(pdev, cap_id, pos, size);
>          break;
>      default:
> -        ret = pci_add_capability(pdev, cap_id, pos, size, errp);
> +        pci_add_capability(pdev, cap_id, pos, size);
>          break;
>      }

And for these we've calculated a size to make sure that we don't bump
into the next capability, but how do you account for the MSI and MSI-X
cases above this chunk where vfio's overlap prevention can't be used?
Thanks,

Alex


