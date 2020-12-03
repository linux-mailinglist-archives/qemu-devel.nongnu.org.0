Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C4E2CE13D
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 22:58:14 +0100 (CET)
Received: from localhost ([::1]:37642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkwc8-0002dA-Sc
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 16:58:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kkwbD-00029a-3w
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 16:57:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kkwb9-0006Tx-PQ
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 16:57:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607032629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T4qx1azhAjfBX8YupuuibWk5k4ODm/VRqZyBDfaUn4M=;
 b=ag9r3JY9SVfFir7RYroDp9QBAQHL+Y5Wfe2Vd/EVqroTFofKAt4e09wfu4LWNfjvad9qGP
 9RKponzT3WhRBCdIpvCkm4ezlTGuYEWzNkPCYjJsLAS2amOIsUDG4HMkSBUHF7hc69js/E
 FOQZj72FGzq2ZZA3IqOMP6WGIEup+3w=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118-F6Qm4BiUPQqBo7vohpFBag-1; Thu, 03 Dec 2020 16:57:08 -0500
X-MC-Unique: F6Qm4BiUPQqBo7vohpFBag-1
Received: by mail-wr1-f71.google.com with SMTP id w17so1755044wrl.8
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 13:57:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=T4qx1azhAjfBX8YupuuibWk5k4ODm/VRqZyBDfaUn4M=;
 b=R3XT9pv0sUAqIad3Is1VpRLMD9cC2XVC5j2FQCrphtJol9h+yC3rY3o+WHGWXRN0OE
 1jLTUul1wbxDbFCLY+b+bTOHiR0kuxosvqwTAEAJOKBV+7Y//NiVIUSoTGY5l3a2xaud
 sSqSf86q8IVuUdxmiqEA5E/fvVyTd6HQdsLlQwVwZ/DvnvK/FZqhvwv/aIbDLHJI1n3H
 IpGhh2KePgL6+WCnc8G0gebHde/zl9JC6R+O3WBZ1+K5ey14SmlfZiZ6F2qlCt5GCRqa
 mmlHKwnJf/mvPLkIlkeJSh/xPjHWil3uefI7l5DMNFLVnNIO5gCt0qoiCPtlNE9qFuW4
 Wbqg==
X-Gm-Message-State: AOAM533BeZcwCsORk/hYv43JcHSvZ94AdQhxo/zM4ScyfiwCUrgG0+QR
 KAtIHKzc7mBgRhEqy69gAd2oizsdpG8koMRmBV+TCKIlnDnfgLv7QPsUZKld1J14lR+lnyyKoYP
 Q0LXofreAxUaheyQ=
X-Received: by 2002:a1c:3c4:: with SMTP id 187mr818099wmd.143.1607032627075;
 Thu, 03 Dec 2020 13:57:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz1gurwG73/lEfF3CPCfcQLDcrWO+FPofMkeo+MZQ8Y6BeZutMtLbqX1izShk6f9ysZlIbYIA==
X-Received: by 2002:a1c:3c4:: with SMTP id 187mr818089wmd.143.1607032626884;
 Thu, 03 Dec 2020 13:57:06 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id d2sm923739wrn.43.2020.12.03.13.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 13:57:06 -0800 (PST)
Date: Thu, 3 Dec 2020 16:57:03 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Andrew Melnychenko <andrew@daynix.com>
Subject: Re: [PATCH v4 2/2] hw/virtio-pci Added AER capability.
Message-ID: <20201203165317-mutt-send-email-mst@kernel.org>
References: <20201203132517.220811-1-andrew@daynix.com>
 <20201203132517.220811-3-andrew@daynix.com>
MIME-Version: 1.0
In-Reply-To: <20201203132517.220811-3-andrew@daynix.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: intel-wired-lan@lists.osuosl.org, qemu-devel@nongnu.org,
 alexander.duyck@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 03, 2020 at 03:25:17PM +0200, Andrew Melnychenko wrote:
> From: Andrew <andrew@daynix.com>
> 
> Added AER capability for virtio-pci devices.
> Also added property for devices, by default AER is disabled.
> 
> Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> ---
>  hw/virtio/virtio-pci.c | 16 ++++++++++++++++
>  hw/virtio/virtio-pci.h |  4 ++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index ceaa233129..f863f69ede 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -1817,6 +1817,12 @@ static void virtio_pci_realize(PCIDevice *pci_dev, Error **errp)
>           */
>          pci_set_word(pci_dev->config + pos + PCI_PM_PMC, 0x3);
>  
> +        if (proxy->flags & VIRTIO_PCI_FLAG_AER) {
> +            pcie_aer_init(pci_dev, PCI_ERR_VER, last_pcie_cap_offset,
> +                          PCI_ERR_SIZEOF, NULL);
> +            last_pcie_cap_offset += PCI_ERR_SIZEOF;
> +        }
> +


What I dislike here is that the property can be added to
pci devices (not express) and will apparently succeed.
Pls add code to validate and fail init.


>          if (proxy->flags & VIRTIO_PCI_FLAG_INIT_DEVERR) {
>              /* Init error enabling flags */
>              pcie_cap_deverr_init(pci_dev);
> @@ -1858,7 +1864,15 @@ static void virtio_pci_realize(PCIDevice *pci_dev, Error **errp)
>  
>  static void virtio_pci_exit(PCIDevice *pci_dev)
>  {
> +    VirtIOPCIProxy *proxy = VIRTIO_PCI(pci_dev);
> +    bool pcie_port = pci_bus_is_express(pci_get_bus(pci_dev)) &&
> +                     !pci_bus_is_root(pci_get_bus(pci_dev));
> +
>      msix_uninit_exclusive_bar(pci_dev);
> +    if (proxy->flags & VIRTIO_PCI_FLAG_AER && pcie_port &&
> +        pci_is_express(pci_dev)) {
> +        pcie_aer_exit(pci_dev);
> +    }
>  }
>  
>  static void virtio_pci_reset(DeviceState *qdev)
> @@ -1911,6 +1925,8 @@ static Property virtio_pci_properties[] = {
>                      VIRTIO_PCI_FLAG_INIT_PM_BIT, true),
>      DEFINE_PROP_BIT("x-pcie-flr-init", VirtIOPCIProxy, flags,
>                      VIRTIO_PCI_FLAG_INIT_FLR_BIT, true),
> +    DEFINE_PROP_BIT("aer", VirtIOPCIProxy, flags,
> +                    VIRTIO_PCI_FLAG_AER_BIT, false),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> diff --git a/hw/virtio/virtio-pci.h b/hw/virtio/virtio-pci.h
> index 06e2af12de..d7d5d403a9 100644
> --- a/hw/virtio/virtio-pci.h
> +++ b/hw/virtio/virtio-pci.h
> @@ -41,6 +41,7 @@ enum {
>      VIRTIO_PCI_FLAG_INIT_LNKCTL_BIT,
>      VIRTIO_PCI_FLAG_INIT_PM_BIT,
>      VIRTIO_PCI_FLAG_INIT_FLR_BIT,
> +    VIRTIO_PCI_FLAG_AER_BIT,
>  };
>  
>  /* Need to activate work-arounds for buggy guests at vmstate load. */
> @@ -80,6 +81,9 @@ enum {
>  /* Init Function Level Reset capability */
>  #define VIRTIO_PCI_FLAG_INIT_FLR (1 << VIRTIO_PCI_FLAG_INIT_FLR_BIT)
>  
> +/* Advanced Error Reporting capability */
> +#define VIRTIO_PCI_FLAG_AER (1 << VIRTIO_PCI_FLAG_AER_BIT)
> +
>  typedef struct {
>      MSIMessage msg;
>      int virq;
> -- 
> 2.29.2


