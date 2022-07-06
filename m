Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC7C56920D
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 20:44:06 +0200 (CEST)
Received: from localhost ([::1]:44472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9A0K-0005R5-Ly
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 14:44:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o99vJ-0004RL-OJ
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 14:38:54 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:41084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o99vF-0000PL-RD
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 14:38:52 -0400
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 188EC2E1389;
 Wed,  6 Jul 2022 21:38:41 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:6422::1:33] (unknown
 [2a02:6b8:b081:6422::1:33])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 bnkK73N8tE-cdOK1ZtP; Wed, 06 Jul 2022 21:38:40 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1657132720; bh=o2oiZ18nw6OMexSxmd7Tc+lsFqwR3rS4cyO2fjMHZYs=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=YYEFDjSdpl88U0O2WYPDBRgZpzXQNzWdxCP7CXt+tpzL6VWCwvlvfEadIfkPP+UZP
 +Xbzk4pXFQxv5CQ10RPdESHxh5jYsl9qM8coeLEmeefEXugH3b2C5LAc1hL4VuqJnb
 INnFDoIlbTIFaoNZ1zsJI+LTGh/4C8wgB7x2qGnI=
Authentication-Results: myt5-70c90f7d6d7d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <18e4c3fc-080a-a8e4-786a-b0410345167c@yandex-team.ru>
Date: Wed, 6 Jul 2022 21:38:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] hw/pci/pci_bridge: ensure PCIe slots have only one slot
Content-Language: en-US
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, yc-core@yandex-team.ru,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20220704102514.1284827-1-rvkagan@yandex-team.ru>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220704102514.1284827-1-rvkagan@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/4/22 13:25, Roman Kagan wrote:
> It's possible to create non-working configurations by attaching a device
> to a derivative of PCIe slot (pcie-root-port, ioh3420, etc) and
> specifying a slot number other that zero, e.g.:
> 
>      -device pcie-root-port,id=s0,... \
>      -device virtio-blk-pci,bus=s0,addr=4,...
> 
> Make QEMU reject such configurations and only allow addr=0 on the
> secondary bus of a PCIe slot.
> 
> Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
> ---
>   hw/pci/pci_bridge.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c
> index da34c8ebcd..8b38d5ad3d 100644
> --- a/hw/pci/pci_bridge.c
> +++ b/hw/pci/pci_bridge.c
> @@ -33,6 +33,7 @@
>   #include "qemu/units.h"
>   #include "hw/pci/pci_bridge.h"
>   #include "hw/pci/pci_bus.h"
> +#include "hw/pci/pcie_port.h"
>   #include "qemu/module.h"
>   #include "qemu/range.h"
>   #include "qapi/error.h"
> @@ -386,6 +387,10 @@ void pci_bridge_initfn(PCIDevice *dev, const char *typename)
>       br->windows = pci_bridge_region_init(br);
>       QLIST_INIT(&sec_bus->child);
>       QLIST_INSERT_HEAD(&parent->child, sec_bus, sibling);
> +
> +    if (PCIE_SLOT(dev)) {

Hmm, wouldn't PCIE_SLOT just crash if dev is not pcie slot? As I understand, PCIE_SLOT is finally an OBJECT_CHECK(), which say:

  * If an invalid object is passed to this function, a run time assert will be
  * generated.


> +        sec_bus->slot_reserved_mask = ~1u;
> +    }
>   }
>   
>   /* default qdev clean up function for PCI-to-PCI bridge */


-- 
Best regards,
Vladimir

