Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFE240404A
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 22:47:47 +0200 (CEST)
Received: from localhost ([::1]:33512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO4Ty-00028y-5B
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 16:47:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mO4S0-0000o4-GT
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 16:45:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mO4Rx-0000Qt-HG
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 16:45:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631133939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RRtcUZvx5ZzivmG7XQQhgF4FfNxFYNnbxWG9PmYfDuk=;
 b=h+kC7m+0Q/auDyIFp7CoQ0c1+JorOWW0mGe4Fp9LwbOs61vmP5GPHNTPVBZvpSYCPx0wZA
 4Jj6ums7dy1zF8K+6foDJ3Awx/V9axT8+SYC2/IrgK2Ao4HNqnxtToiXReJlNz+/s5JisJ
 tRhpHUDJHidYq0BkDYWZCzuQe7JV9O8=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-GlDUiDG5MNWyfMV8VYJUgA-1; Wed, 08 Sep 2021 16:45:38 -0400
X-MC-Unique: GlDUiDG5MNWyfMV8VYJUgA-1
Received: by mail-oo1-f70.google.com with SMTP id
 j22-20020a4ad196000000b002903f4c4467so2020084oor.1
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 13:45:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=RRtcUZvx5ZzivmG7XQQhgF4FfNxFYNnbxWG9PmYfDuk=;
 b=kl5nCFm6xuImLUuqcXtH7DytzTwa84zUAOsDoxZuphOYdi/GJ0yaMrBpD7qPxTjsfu
 SvCBQ1exg+kQZhQc2PzWERrdnMM65ckO/I61qQSgfkZLyEoelNqOKO2GbvQph7ty4LBK
 FH/GuvKlcEJJbpJd6UoTLZxd2E+QT56kyYOnvsXLmL6SEFdLSOFj4lzxANJv3aH9cxMH
 sNFBic6nfJ3gtgcX8Ijji7o9tdNggM4prnTgP96VYALC6o4ttYixh+wd4eLLtGsSVnpd
 ijdtbb3h9o9G0WdwXaHdKT/NP3TVeUeNHyROlgH+Zw0RjHxTA4CQpIWfVAmHGB1csgNg
 x+mA==
X-Gm-Message-State: AOAM532x97arp0965Tw0zVg8TxbCB1ctoYIkL1bIAVuvftD4gSEP+k0S
 KknaC6eEoDrZQdV8bJk3JsKHXTzFSzAp2z59gu0aBvbM0E1bCkORcBFLQyikfafoajhQbH7CKb6
 ezB2iu5UARWzht1s=
X-Received: by 2002:a4a:d108:: with SMTP id k8mr176537oor.90.1631133937540;
 Wed, 08 Sep 2021 13:45:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2X3ejV/eeCG2io5pRAWDLw1TDFjbMN9u135o6IOK72VEXjcrnEAqjk3LLERM0b2GxWUZNKg==
X-Received: by 2002:a4a:d108:: with SMTP id k8mr176517oor.90.1631133937312;
 Wed, 08 Sep 2021 13:45:37 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
 by smtp.gmail.com with ESMTPSA id 17sm42598oip.16.2021.09.08.13.45.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 13:45:36 -0700 (PDT)
Date: Wed, 8 Sep 2021 14:45:35 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Kunkun Jiang <jiangkunkun@huawei.com>
Subject: Re: [PATCH 1/2] vfio/pci: Fix vfio-pci sub-page MMIO BAR mmaping in
 live migration
Message-ID: <20210908144535.66463b6c.alex.williamson@redhat.com>
In-Reply-To: <20210903093611.1159-2-jiangkunkun@huawei.com>
References: <20210903093611.1159-1-jiangkunkun@huawei.com>
 <20210903093611.1159-2-jiangkunkun@huawei.com>
Organization: Red Hat
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Eric Auger <eric.auger@redhat.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 tangnianyao@huawei.com, ganqixin@huawei.com, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 3 Sep 2021 17:36:10 +0800
Kunkun Jiang <jiangkunkun@huawei.com> wrote:

> We expand MemoryRegions of vfio-pci sub-page MMIO BARs to
> vfio_pci_write_config to improve IO performance.
> The MemoryRegions of destination VM will not be expanded
> successful in live migration, because their addresses have
> been updated in vmstate_load_state (vfio_pci_load_config).

What's the call path through vfio_pci_write_config() that you're
relying on to get triggered to enable this and why wouldn't we just
walk all sub-page BARs in vfio_pci_load_config() to resolve the issue
then?  It's my understanding that we do this update in write-config
because it's required that the VM sizes the BAR before using it, which
is not the case when we resume from migration.  Thanks,

Alex
 
> Remove the restriction on base address change in
> vfio_pci_write_config for correct mmapping sub-page MMIO
> BARs. Accroding to my analysis, the remaining parameter
> verification is enough.
> 
> Fixes: c5e2fb3ce4d (vfio: Add save and load functions for VFIO PCI devices)
> Reported-by: Nianyao Tang <tangnianyao@huawei.com>
> Reported-by: Qixin Gan <ganqixin@huawei.com>
> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
> ---
>  hw/vfio/pci.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index e1ea1d8a23..891b211ddf 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -1189,18 +1189,12 @@ void vfio_pci_write_config(PCIDevice *pdev,
>          }
>      } else if (ranges_overlap(addr, len, PCI_BASE_ADDRESS_0, 24) ||
>          range_covers_byte(addr, len, PCI_COMMAND)) {
> -        pcibus_t old_addr[PCI_NUM_REGIONS - 1];
>          int bar;
>  
> -        for (bar = 0; bar < PCI_ROM_SLOT; bar++) {
> -            old_addr[bar] = pdev->io_regions[bar].addr;
> -        }
> -
>          pci_default_write_config(pdev, addr, val, len);
>  
>          for (bar = 0; bar < PCI_ROM_SLOT; bar++) {
> -            if (old_addr[bar] != pdev->io_regions[bar].addr &&
> -                vdev->bars[bar].region.size > 0 &&
> +            if (vdev->bars[bar].region.size > 0 &&
>                  vdev->bars[bar].region.size < qemu_real_host_page_size) {
>                  vfio_sub_page_bar_update_mapping(pdev, bar);
>              }


