Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E802AF5E3
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 17:11:44 +0100 (CET)
Received: from localhost ([::1]:34022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcsil-0004gR-CP
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 11:11:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1kcshO-00046E-RS
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 11:10:19 -0500
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:45238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1kcshH-00050a-Op
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 11:10:17 -0500
Received: from myt5-23f0be3aa648.qloud-c.yandex.net
 (myt5-23f0be3aa648.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e29:0:640:23f0:be3a])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 78D082E163B;
 Wed, 11 Nov 2020 19:10:04 +0300 (MSK)
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net [2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by myt5-23f0be3aa648.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 TPyoe90kzA-A4xK0vC6; Wed, 11 Nov 2020 19:10:04 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1605111004; bh=b6vhk8bFNRcFDnG61Up187WDzzgexpeeur5+uwl56P4=;
 h=In-Reply-To:Message-ID:Subject:To:From:References:Date:Cc;
 b=kPzit/MuYcyq0dmN5bhcaCLbZDn6ALAatUC42CejN3oK/o4FpDPeyANBiWAJyWexq
 UK2d/3fzJDGxVoOJ4jUWSLqTcITt5a1fLFQsflkHNZ0BMcxbynMxDU/6yjoWyEj/Q6
 4t710RygJuti17+GOmyZ9UUSvPS8h6hl/VGxNpY8=
Authentication-Results: myt5-23f0be3aa648.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b080:6409::1:13])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 JRogcERpRI-9rnmiJ9s; Wed, 11 Nov 2020 19:10:04 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Wed, 11 Nov 2020 19:09:53 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH] pci: Refuse to hotplug PCI Devices when the Guest OS is
 not ready
Message-ID: <20201111160953.GA2865@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-devel@nongnu.org, mst@redhat.com, dgibson@redhat.com,
 jusual@redhat.com
References: <20201022114026.31968-1-marcel.apfelbaum@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201022114026.31968-1-marcel.apfelbaum@gmail.com>
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=rvkagan@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 11:10:05
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: dgibson@redhat.com, jusual@redhat.com, qemu-devel@nongnu.org,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 22, 2020 at 02:40:26PM +0300, Marcel Apfelbaum wrote:
> From: Marcel Apfelbaum <marcel@redhat.com>
> 
> During PCIe Root Port's transition from Power-Off to Power-ON (or vice-versa)
> the "Slot Control Register" has the "Power Indicator Control"
> set to "Blinking" expressing a "power transition" mode.
> 
> Any hotplug operation during the "power transition" mode is not permitted
> or at least not expected by the Guest OS leading to strange failures.
> 
> Detect and refuse hotplug operations in such case.
> 
> Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> ---
>  hw/pci/pcie.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> index 5b48bae0f6..2fe5c1473f 100644
> --- a/hw/pci/pcie.c
> +++ b/hw/pci/pcie.c
> @@ -410,6 +410,7 @@ void pcie_cap_slot_pre_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
>      PCIDevice *hotplug_pdev = PCI_DEVICE(hotplug_dev);
>      uint8_t *exp_cap = hotplug_pdev->config + hotplug_pdev->exp.exp_cap;
>      uint32_t sltcap = pci_get_word(exp_cap + PCI_EXP_SLTCAP);
> +    uint32_t sltctl = pci_get_word(exp_cap + PCI_EXP_SLTCTL);
>  
>      /* Check if hot-plug is disabled on the slot */
>      if (dev->hotplugged && (sltcap & PCI_EXP_SLTCAP_HPC) == 0) {
> @@ -418,6 +419,12 @@ void pcie_cap_slot_pre_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
>          return;
>      }
>  
> +    if ((sltctl & PCI_EXP_SLTCTL_PIC) == PCI_EXP_SLTCTL_PWR_IND_BLINK) {
> +        error_setg(errp, "Hot-plug failed: %s is in Power Transition",
> +                   DEVICE(hotplug_pdev)->id);
> +        return;
> +    }
> +
>      pcie_cap_slot_plug_common(PCI_DEVICE(hotplug_dev), dev, errp);
>  }

I wonder if hw/pci/shpc.c is free from this issue?

Roman.

