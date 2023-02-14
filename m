Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB47B696E00
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 20:37:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS172-0005Oy-MI; Tue, 14 Feb 2023 14:37:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pS170-0005OB-4n
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 14:37:10 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pS16y-0003VH-65
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 14:37:09 -0500
Received: from myt5-8800bd68420f.qloud-c.yandex.net
 (myt5-8800bd68420f.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:4615:0:640:8800:bd68])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id EB9DB61095;
 Tue, 14 Feb 2023 22:37:02 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:6407::1:7] (unknown
 [2a02:6b8:b081:6407::1:7])
 by myt5-8800bd68420f.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 xapqh20RgCg1-qV4tINNP; Tue, 14 Feb 2023 22:37:02 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676403422; bh=oAo8x18ujok1InosIC4oLluaBO8XCwkqqRXYAjGXqkk=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=G0l2VHDQK59TdwDBemZgrZr2jE5zdWGxChxyNWwP1e5lKfmRzyLLYhwdFUDpikTh2
 9P4jcdvHEeO0X72V/koyp4PP86m5DEc9Ytnx8GeFEOQ35js79VfPX+VhLFSLiZGFNi
 QpwNR5GwGDfA5OLiOzkGj9BhVHLnPlB5A3qgErA0=
Authentication-Results: myt5-8800bd68420f.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <2794b864-6576-8cb0-040f-b21d82ad9d4a@yandex-team.ru>
Date: Tue, 14 Feb 2023 21:36:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 06/16] pci/shpc: refactor shpc_device_plug_common()
Content-Language: en-US, ru-RU
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, philmd@linaro.org, den-plotnikov@yandex-team.ru
References: <20230213140103.1518173-1-vsementsov@yandex-team.ru>
 <20230213140103.1518173-7-vsementsov@yandex-team.ru>
From: Anton Kuchin <antonkuchin@yandex-team.ru>
In-Reply-To: <20230213140103.1518173-7-vsementsov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=antonkuchin@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 13/02/2023 16:00, Vladimir Sementsov-Ogievskiy wrote:
> Rename it to shpc_device_get_slot(), to mention what it does rather
> than how it is used. It also helps to reuse it in further commit.
>
> Also, add a return value and get rid of local_err.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>   hw/pci/shpc.c | 19 ++++++++-----------
>   1 file changed, 8 insertions(+), 11 deletions(-)
>
> diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
> index 9f964b1d70..e7bc7192f1 100644
> --- a/hw/pci/shpc.c
> +++ b/hw/pci/shpc.c
> @@ -496,8 +496,9 @@ static const MemoryRegionOps shpc_mmio_ops = {
>           .max_access_size = 4,
>       },
>   };
> -static void shpc_device_plug_common(PCIDevice *affected_dev, int *slot,
> -                                    SHPCDevice *shpc, Error **errp)
> +
> +static bool shpc_device_get_slot(PCIDevice *affected_dev, int *slot,
> +                                 SHPCDevice *shpc, Error **errp)
>   {
>       int pci_slot = PCI_SLOT(affected_dev->devfn);
>       *slot = SHPC_PCI_TO_IDX(pci_slot);
> @@ -507,21 +508,20 @@ static void shpc_device_plug_common(PCIDevice *affected_dev, int *slot,
>                      "controller. Valid slots are between %d and %d.",
>                      pci_slot, SHPC_IDX_TO_PCI(0),
>                      SHPC_IDX_TO_PCI(shpc->nslots) - 1);
> -        return;
> +        return false;
>       }
> +
> +    return true;
>   }
>   
>   void shpc_device_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
>                               Error **errp)
>   {
> -    Error *local_err = NULL;
>       PCIDevice *pci_hotplug_dev = PCI_DEVICE(hotplug_dev);
>       SHPCDevice *shpc = pci_hotplug_dev->shpc;
>       int slot;
>   
> -    shpc_device_plug_common(PCI_DEVICE(dev), &slot, shpc, &local_err);
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> +    if (!shpc_device_get_slot(PCI_DEVICE(dev), &slot, shpc, errp)) {
>           return;
>       }
>   
> @@ -563,16 +563,13 @@ void shpc_device_unplug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
>   void shpc_device_unplug_request_cb(HotplugHandler *hotplug_dev,
>                                      DeviceState *dev, Error **errp)
>   {
> -    Error *local_err = NULL;
>       PCIDevice *pci_hotplug_dev = PCI_DEVICE(hotplug_dev);
>       SHPCDevice *shpc = pci_hotplug_dev->shpc;
>       uint8_t state;
>       uint8_t led;
>       int slot;
>   
> -    shpc_device_plug_common(PCI_DEVICE(dev), &slot, shpc, &local_err);
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> +    if (!shpc_device_get_slot(PCI_DEVICE(dev), &slot, shpc, errp)) {
>           return;
>       }
>   
Reviewed-by: Anton Kuchin <antonkuchin@yandex-team.ru>

