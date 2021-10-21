Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4117943678C
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 18:22:53 +0200 (CEST)
Received: from localhost ([::1]:36638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdaqC-0002Jp-DR
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 12:22:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mdajN-0002uQ-63
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 12:15:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mdajH-00013J-UE
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 12:15:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634832941;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=crH+znvKB9WoyvELw3PRh2itlkOBRbcUI64R9YDH+Lw=;
 b=HHq3bQR+AHtsFk9GIEtJTQSvqBaWJ9dMVbdkO8GQkI19KlRMPDSJC+DwXB/naLA4IobTDs
 TJKYLxoZBUAmOv9zw9wcOquIIZ+QNyiEZNWbVPbto6PFu++jASj+MuTUrWdKtk/pz5nszq
 EbAHOkpAFw5X6v/AqosED0B2jui0jIE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-tWGTVHL3PmaXPUykVvqkjw-1; Thu, 21 Oct 2021 12:15:38 -0400
X-MC-Unique: tWGTVHL3PmaXPUykVvqkjw-1
Received: by mail-wm1-f72.google.com with SMTP id
 g63-20020a1c2042000000b003231f6cebb8so86509wmg.3
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 09:15:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=crH+znvKB9WoyvELw3PRh2itlkOBRbcUI64R9YDH+Lw=;
 b=ShVDgQ5a65ntOg/X5sN9l1Sl7GaKP27sZGb+tC5MfTEcjh36mOh6LMj83KC96bt6OM
 PNDBW4g74i200O7/Zu3zOdECERR8SjJ93U6SOxUN8AJb8iACrD23w/syVdHgIWSot5GD
 gx3I+S0/+8pBXJGXDgac2NcgXVQ+rgjeSIlVvoIE4WXvjMllkUjOz7itBci75iQv8mPV
 FJ7yFO0gE3QhsQ/k0MPEod6F/6VJKyMwt7BY9jMWkSj+6XqBYy8hO3KU+qpTBOpGwdqD
 H+IfUW3xSOag6YBNWnaR34R+AE+5kBeJYrEubr8Fr/Ipy8swVAfyr3YdDgBnPVKMMTZo
 eNbA==
X-Gm-Message-State: AOAM530PZWw8B8RuV3Na9kl7fyVPC1ojcSTXWkM5EhZgwQJdiDu5Xw5i
 3UqGpNDaOGrtAnvXze/xBbnYhAEqNNX0EVFLcZE2Gu3nJqHZYNyc8oNzGVDElksVPe5tdiPb5xn
 Seyj/blKdQbntEaQ=
X-Received: by 2002:a05:600c:218d:: with SMTP id
 e13mr7688867wme.130.1634832936810; 
 Thu, 21 Oct 2021 09:15:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfLsGixJAIXr/VZA5f//ea36lQQASJ86PK94V1SdmYeGRpo6m9YMfp4DzWBxtINTgI37z0UA==
X-Received: by 2002:a05:600c:218d:: with SMTP id
 e13mr7688828wme.130.1634832936437; 
 Thu, 21 Oct 2021 09:15:36 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id o11sm7885812wry.0.2021.10.21.09.15.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 09:15:35 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] vfio/pci: Fix vfio-pci sub-page MMIO BAR mmaping
 in live migration
To: Kunkun Jiang <jiangkunkun@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20210914015326.1494-1-jiangkunkun@huawei.com>
 <20210914015326.1494-2-jiangkunkun@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <571dc3ee-8b2a-fcef-b617-1ba85a3d442a@redhat.com>
Date: Thu, 21 Oct 2021 18:15:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210914015326.1494-2-jiangkunkun@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.867, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: eric.auger@redhat.com
Cc: wanghaibin.wang@huawei.com, tangnianyao@huawei.com, ganqixin@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Kunkun,

On 9/14/21 3:53 AM, Kunkun Jiang wrote:
> We expand MemoryRegions of vfio-pci sub-page MMIO BARs to
> vfio_pci_write_config to improve IO performance.
s/to vfio_pci_write_config/ in vfio_pci_write_config()
> The MemoryRegions of destination VM will not be expanded
> successful in live migration, because their addresses have
s/will not be expanded successful in live migration/are not expanded
anymore after live migration (?) Is that the correct symptom?
> been updated in vmstate_load_state (vfio_pci_load_config).
>
> So iterate BARs in vfio_pci_write_config and try to update
> sub-page BARs.
>
> Fixes: c5e2fb3ce4d (vfio: Add save and load functions for VFIO PCI devices)
is it an actual fix or an optimization?
> Reported-by: Nianyao Tang <tangnianyao@huawei.com>
> Reported-by: Qixin Gan <ganqixin@huawei.com>
> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
> ---
>  hw/vfio/pci.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index e1ea1d8a23..43c7e93153 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -2453,7 +2453,12 @@ static int vfio_pci_load_config(VFIODevice *vbasedev, QEMUFile *f)
>  {
>      VFIOPCIDevice *vdev = container_of(vbasedev, VFIOPCIDevice, vbasedev);
>      PCIDevice *pdev = &vdev->pdev;
> -    int ret;
> +    pcibus_t old_addr[PCI_NUM_REGIONS - 1];
> +    int bar, ret;
> +
> +    for (bar = 0; bar < PCI_ROM_SLOT; bar++) {
> +        old_addr[bar] = pdev->io_regions[bar].addr;
> +    }
what are those values before the vmstate_load_state ie. can't you do the
vfio_sub_page_bar_update_mapping() unconditionnaly on old_addr[bar] !=
pdev->io_regions[bar].addr
>  
>      ret = vmstate_load_state(f, &vmstate_vfio_pci_config, vdev, 1);
>      if (ret) {
> @@ -2463,6 +2468,14 @@ static int vfio_pci_load_config(VFIODevice *vbasedev, QEMUFile *f)
>      vfio_pci_write_config(pdev, PCI_COMMAND,
>                            pci_get_word(pdev->config + PCI_COMMAND), 2);
>  
> +    for (bar = 0; bar < PCI_ROM_SLOT; bar++) {
> +        if (old_addr[bar] != pdev->io_regions[bar].addr &&
> +            vdev->bars[bar].region.size > 0 &&
> +            vdev->bars[bar].region.size < qemu_real_host_page_size) {
> +            vfio_sub_page_bar_update_mapping(pdev, bar);
> +        }
> +    }
> +
>      if (msi_enabled(pdev)) {
>          vfio_msi_enable(vdev);
>      } else if (msix_enabled(pdev)) {
Thanks

Eric


