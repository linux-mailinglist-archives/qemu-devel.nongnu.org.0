Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F29E16AAB7
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Feb 2020 17:06:15 +0100 (CET)
Received: from localhost ([::1]:38492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6GFK-0002ry-9K
	for lists+qemu-devel@lfdr.de; Mon, 24 Feb 2020 11:06:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37622)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.williamson@redhat.com>) id 1j6GEP-0002K0-Ju
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 11:05:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.williamson@redhat.com>) id 1j6GEK-0004Ct-Tr
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 11:05:16 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:32024
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
 id 1j6GEK-0004Cg-Pf
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 11:05:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582560311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bhnZbydnZ2r9Kdb3GlWeogdtTKqpXEI1tWvaPEld2ZM=;
 b=KqOxUYfrgxZJKIu1fFek6fNgdZfNcqy2WFSaY+v4rcRri3IO0zFPlgOSO4hUDONQbD9ezL
 wJ5mGRYgF27Rvcd9fxZm1Bl5b3SMOF11+uhVqPmYMmvvOzGwWNiW9wVsNPLNp0k2zqSoIW
 dVbnlgm1W8yvaD6W5HhO7K+xMmdqJ2c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-NxNGDdM8MueKM_ldsC1brw-1; Mon, 24 Feb 2020 11:05:03 -0500
X-MC-Unique: NxNGDdM8MueKM_ldsC1brw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82CD6100550E;
 Mon, 24 Feb 2020 16:05:02 +0000 (UTC)
Received: from w520.home (ovpn-116-28.phx2.redhat.com [10.3.116.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 65B7F5C1D6;
 Mon, 24 Feb 2020 16:04:59 +0000 (UTC)
Date: Mon, 24 Feb 2020 09:04:58 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Subject: Re: [PATCH RESEND 1/3] vfio/pci: fix a null pointer reference in
 vfio_rom_read
Message-ID: <20200224090458.080152c0@w520.home>
In-Reply-To: <20200224064219.1434-2-longpeng2@huawei.com>
References: <20200224064219.1434-1-longpeng2@huawei.com>
 <20200224064219.1434-2-longpeng2@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: weifuqiang@huawei.com, arei.gonglei@huawei.com, huangzhichao@huawei.com,
 qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 24 Feb 2020 14:42:17 +0800
"Longpeng(Mike)" <longpeng2@huawei.com> wrote:

> From: Longpeng <longpeng2@huawei.com>
> 
> vfio_pci_load_rom() maybe failed and then the vdev->rom is NULL in
> some situation (though I've not encountered yet), maybe we should
> avoid the VM abort.
> 
> Signed-off-by: Longpeng <longpeng2@huawei.com>
> ---
>  hw/vfio/pci.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 5e75a95..ed798ae 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -768,7 +768,7 @@ static void vfio_update_msi(VFIOPCIDevice *vdev)
>      }
>  }
>  
> -static void vfio_pci_load_rom(VFIOPCIDevice *vdev)
> +static bool vfio_pci_load_rom(VFIOPCIDevice *vdev)
>  {
>      struct vfio_region_info *reg_info;
>      uint64_t size;
> @@ -778,7 +778,7 @@ static void vfio_pci_load_rom(VFIOPCIDevice *vdev)
>      if (vfio_get_region_info(&vdev->vbasedev,
>                               VFIO_PCI_ROM_REGION_INDEX, &reg_info)) {
>          error_report("vfio: Error getting ROM info: %m");
> -        return;
> +        return false;
>      }
>  
>      trace_vfio_pci_load_rom(vdev->vbasedev.name, (unsigned long)reg_info->size,
> @@ -797,7 +797,7 @@ static void vfio_pci_load_rom(VFIOPCIDevice *vdev)
>          error_printf("Device option ROM contents are probably invalid "
>                      "(check dmesg).\nSkip option ROM probe with rombar=0, "
>                      "or load from file with romfile=\n");
> -        return;
> +        return false;
>      }
>  
>      vdev->rom = g_malloc(size);
> @@ -849,6 +849,8 @@ static void vfio_pci_load_rom(VFIOPCIDevice *vdev)
>              data[6] = -csum;
>          }
>      }
> +
> +    return true;
>  }
>  
>  static uint64_t vfio_rom_read(void *opaque, hwaddr addr, unsigned size)
> @@ -863,8 +865,9 @@ static uint64_t vfio_rom_read(void *opaque, hwaddr addr, unsigned size)
>      uint64_t data = 0;
>  
>      /* Load the ROM lazily when the guest tries to read it */
> -    if (unlikely(!vdev->rom && !vdev->rom_read_failed)) {
> -        vfio_pci_load_rom(vdev);
> +    if (unlikely(!vdev->rom && !vdev->rom_read_failed) &&
> +        !vfio_pci_load_rom(vdev)) {
> +        return 0;
>      }
>  
>      memcpy(&val, vdev->rom + addr,

Looks like an obvious bug, until you look at the rest of this memcpy():

memcpy(&val, vdev->rom + addr,
           (addr < vdev->rom_size) ? MIN(size, vdev->rom_size - addr) : 0);

IOW, we'll do a zero sized memcpy() if rom_size is zero, so there's no
risk of the concern identified in the commit log.  This patch is
unnecessary.  Thanks,

Alex


