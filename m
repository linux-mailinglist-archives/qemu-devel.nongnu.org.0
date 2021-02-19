Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D38531F723
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 11:13:12 +0100 (CET)
Received: from localhost ([::1]:33362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD2mc-0000eS-Mq
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 05:13:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1lD2ks-00089b-Li
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 05:11:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1lD2ko-0002gg-9y
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 05:11:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613729477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hzEN1gbUy1Rl/0xkNP/6H8bluFsXJ1H990T6vQhFsas=;
 b=WpjoluseAsB7pe84CcarTUaVBHvayefMVfvciqgzEpRBqhlQ94ai9eDuThByJvGQ8LpUF+
 XpqOJ6/LLbrKLP+WCqkjOZn3smrVkuK3pO9QIgstPjtVxJP/UhgMH72z6pMFetDbsJEJsD
 g8APClSZpOVmEKIZePxt55bxniAsa7c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-8OqKjsZlMgC9YG2tSqLIdQ-1; Fri, 19 Feb 2021 05:11:13 -0500
X-MC-Unique: 8OqKjsZlMgC9YG2tSqLIdQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7EE8D6EE20;
 Fri, 19 Feb 2021 10:11:12 +0000 (UTC)
Received: from [10.36.112.23] (ovpn-112-23.ams2.redhat.com [10.36.112.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 412B060C17;
 Fri, 19 Feb 2021 10:10:56 +0000 (UTC)
Subject: Re: [PATCH v3 4/4] pcie: don't set link state active if the slot is
 empty
To: qemu-devel@nongnu.org
References: <20210212135250.2738750-1-lvivier@redhat.com>
 <20210212135250.2738750-5-lvivier@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <79854ee7-1508-81f4-6cd3-e34c1d6dad80@redhat.com>
Date: Fri, 19 Feb 2021 11:10:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210212135250.2738750-5-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: quintela@redhat.com, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 alex.williamson@redhat.com, zhengxiang9@huawei.com, jfreimann@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Any comment?

This fix is really needed to fix a bug that prevents to use virtio-net failover on recent
kernel.

Thanks,
Laurent

On 12/02/2021 14:52, Laurent Vivier wrote:
> When the pcie slot is initialized, by default PCI_EXP_LNKSTA_DLLLA
> (Data Link Layer Link Active) is set in PCI_EXP_LNKSTA
> (Link Status) without checking if the slot is empty or not.
> 
> This is confusing for the kernel because as it sees the link is up
> it tries to read the vendor ID and fails:
> 
> (From https://bugzilla.kernel.org/show_bug.cgi?id=211691)
> 
> [    1.661105] pcieport 0000:00:02.2: pciehp: Slot Capabilities      : 0x0002007b
> [    1.661115] pcieport 0000:00:02.2: pciehp: Slot Status            : 0x0010
> [    1.661123] pcieport 0000:00:02.2: pciehp: Slot Control           : 0x07c0
> [    1.661138] pcieport 0000:00:02.2: pciehp: Slot #0 AttnBtn+ PwrCtrl+ MRL- AttnInd+ PwrInd+ HotPlug+ Surprise+ Interlock+ NoCompl- IbPresDis- LLActRep+
> [    1.662581] pcieport 0000:00:02.2: pciehp: pciehp_get_power_status: SLOTCTRL 6c value read 7c0
> [    1.662597] pcieport 0000:00:02.2: pciehp: pciehp_check_link_active: lnk_status = 2204
> [    1.662703] pcieport 0000:00:02.2: pciehp: pending interrupts 0x0010 from Slot Status
> [    1.662706] pcieport 0000:00:02.2: pciehp: pcie_enable_notification: SLOTCTRL 6c write cmd 1031
> [    1.662730] pcieport 0000:00:02.2: pciehp: pciehp_check_link_active: lnk_status = 2204
> [    1.662748] pcieport 0000:00:02.2: pciehp: pciehp_check_link_active: lnk_status = 2204
> [    1.662750] pcieport 0000:00:02.2: pciehp: Slot(0-2): Link Up
> [    2.896132] pcieport 0000:00:02.2: pciehp: pciehp_check_link_status: lnk_status = 2204
> [    2.896135] pcieport 0000:00:02.2: pciehp: Slot(0-2): No device found
> [    2.896900] pcieport 0000:00:02.2: pciehp: pending interrupts 0x0010 from Slot Status
> [    2.896903] pcieport 0000:00:02.2: pciehp: pciehp_power_off_slot: SLOTCTRL 6c write cmd 400
> [    3.656901] pcieport 0000:00:02.2: pciehp: pending interrupts 0x0009 from Slot Status
> 
> This is really a problem with virtio-net failover that hotplugs a VFIO
> card during the boot process. The kernel can shutdown the slot while
> QEMU is hotplugging it, and this likely ends by an automatic unplug of
> the card. At the end of the boot sequence the card has disappeared.
> 
> To fix that, don't set the "Link Active" state in the init function, but
> rely on the plug function to do it, as the mechanism has already been
> introduced by 2f2b18f60bf1.
> 
> Fixes: 2f2b18f60bf1 ("pcie: set link state inactive/active after hot unplug/plug")
> Cc: zhengxiang9@huawei.com
> Fixes: 3d67447fe7c2 ("pcie: Fill PCIESlot link fields to support higher speeds and widths")
> Cc: alex.williamson@redhat.com
> Fixes: b2101eae63ea ("pcie: Set the "link active" in the link status register")
> Cc: benh@kernel.crashing.org
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  hw/pci/pcie.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> index d4010cf8f361..a733e2fb879a 100644
> --- a/hw/pci/pcie.c
> +++ b/hw/pci/pcie.c
> @@ -75,11 +75,6 @@ pcie_cap_v1_fill(PCIDevice *dev, uint8_t port, uint8_t type, uint8_t version)
>                   QEMU_PCI_EXP_LNKSTA_NLW(QEMU_PCI_EXP_LNK_X1) |
>                   QEMU_PCI_EXP_LNKSTA_CLS(QEMU_PCI_EXP_LNK_2_5GT));
>  
> -    if (dev->cap_present & QEMU_PCIE_LNKSTA_DLLLA) {
> -        pci_word_test_and_set_mask(exp_cap + PCI_EXP_LNKSTA,
> -                                   PCI_EXP_LNKSTA_DLLLA);
> -    }
> -
>      /* We changed link status bits over time, and changing them across
>       * migrations is generally fine as hardware changes them too.
>       * Let's not bother checking.
> @@ -125,8 +120,7 @@ static void pcie_cap_fill_slot_lnk(PCIDevice *dev)
>           */
>          pci_long_test_and_set_mask(exp_cap + PCI_EXP_LNKCAP,
>                                     PCI_EXP_LNKCAP_DLLLARC);
> -        pci_word_test_and_set_mask(exp_cap + PCI_EXP_LNKSTA,
> -                                   PCI_EXP_LNKSTA_DLLLA);
> +        /* the PCI_EXP_LNKSTA_DLLLA will be set in the hotplug function */
>  
>          /*
>           * Target Link Speed defaults to the highest link speed supported by
> @@ -427,6 +421,7 @@ void pcie_cap_slot_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
>      PCIDevice *hotplug_pdev = PCI_DEVICE(hotplug_dev);
>      uint8_t *exp_cap = hotplug_pdev->config + hotplug_pdev->exp.exp_cap;
>      PCIDevice *pci_dev = PCI_DEVICE(dev);
> +    uint32_t lnkcap = pci_get_long(exp_cap + PCI_EXP_LNKCAP);
>  
>      /* Don't send event when device is enabled during qemu machine creation:
>       * it is present on boot, no hotplug event is necessary. We do send an
> @@ -434,7 +429,8 @@ void pcie_cap_slot_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
>      if (!dev->hotplugged) {
>          pci_word_test_and_set_mask(exp_cap + PCI_EXP_SLTSTA,
>                                     PCI_EXP_SLTSTA_PDS);
> -        if (pci_dev->cap_present & QEMU_PCIE_LNKSTA_DLLLA) {
> +        if (pci_dev->cap_present & QEMU_PCIE_LNKSTA_DLLLA ||
> +            (lnkcap & PCI_EXP_LNKCAP_DLLLARC)) {
>              pci_word_test_and_set_mask(exp_cap + PCI_EXP_LNKSTA,
>                                         PCI_EXP_LNKSTA_DLLLA);
>          }
> @@ -448,7 +444,8 @@ void pcie_cap_slot_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
>      if (pci_get_function_0(pci_dev)) {
>          pci_word_test_and_set_mask(exp_cap + PCI_EXP_SLTSTA,
>                                     PCI_EXP_SLTSTA_PDS);
> -        if (pci_dev->cap_present & QEMU_PCIE_LNKSTA_DLLLA) {
> +        if (pci_dev->cap_present & QEMU_PCIE_LNKSTA_DLLLA ||
> +            (lnkcap & PCI_EXP_LNKCAP_DLLLARC)) {
>              pci_word_test_and_set_mask(exp_cap + PCI_EXP_LNKSTA,
>                                         PCI_EXP_LNKSTA_DLLLA);
>          }
> @@ -640,6 +637,7 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
>      uint32_t pos = dev->exp.exp_cap;
>      uint8_t *exp_cap = dev->config + pos;
>      uint16_t sltsta = pci_get_word(exp_cap + PCI_EXP_SLTSTA);
> +    uint32_t lnkcap = pci_get_long(exp_cap + PCI_EXP_LNKCAP);
>  
>      if (ranges_overlap(addr, len, pos + PCI_EXP_SLTSTA, 2)) {
>          /*
> @@ -695,7 +693,8 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
>  
>          pci_word_test_and_clear_mask(exp_cap + PCI_EXP_SLTSTA,
>                                       PCI_EXP_SLTSTA_PDS);
> -        if (dev->cap_present & QEMU_PCIE_LNKSTA_DLLLA) {
> +        if (dev->cap_present & QEMU_PCIE_LNKSTA_DLLLA ||
> +            (lnkcap & PCI_EXP_LNKCAP_DLLLARC)) {
>              pci_word_test_and_clear_mask(exp_cap + PCI_EXP_LNKSTA,
>                                           PCI_EXP_LNKSTA_DLLLA);
>          }
> 


