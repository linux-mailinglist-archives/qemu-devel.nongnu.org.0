Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C93917240D
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 17:54:48 +0100 (CET)
Received: from localhost ([::1]:34626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7MQx-0003S1-75
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 11:54:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44644)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j7MPy-0002rD-SJ
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 11:53:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j7MPx-0002fA-QP
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 11:53:46 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:60825
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j7MPx-0002et-Li
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 11:53:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582822425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=klQasuvkB9n35CdkmEbqUV8ZPKnOsqAm2v2UJ8nXL5c=;
 b=BAmTGNqQ7Xfa3hTiZkK31ILHZjnNclojJ1ZUGlzExAZ2y4uTFY4NyuzroV2OsmX4ZnjTPQ
 B4akvRt+ZK0X7IYDyASj32FF8WJLnY9hFpeozyUt7JQxKR5UlQNiE2XwoSKe8IelPav8AZ
 HEtfDmG9k9fR9Dzydd4q8HDOcb6IPbU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-YdK3MrCCMSix39ueJVs9Ag-1; Thu, 27 Feb 2020 11:53:41 -0500
X-MC-Unique: YdK3MrCCMSix39ueJVs9Ag-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29002801E53
 for <qemu-devel@nongnu.org>; Thu, 27 Feb 2020 16:53:40 +0000 (UTC)
Received: from [10.36.116.59] (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C87CD5DDA5;
 Thu, 27 Feb 2020 16:53:33 +0000 (UTC)
Subject: Re: [PATCH 1/5] vfio/pci: Disable INTx fast path if using split
 irqchip
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20200226225048.216508-1-peterx@redhat.com>
 <20200226225048.216508-2-peterx@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <59815cf7-7fb8-faf6-4bb8-5376c87aa684@redhat.com>
Date: Thu, 27 Feb 2020 17:53:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200226225048.216508-2-peterx@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 2/26/20 11:50 PM, Peter Xu wrote:
> It's currently broken.  Let's use the slow path to at least make it
> functional.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

> ---
>  hw/vfio/pci.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 5e75a95129..98e0e0c994 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -128,6 +128,18 @@ static void vfio_intx_enable_kvm(VFIOPCIDevice *vdev, Error **errp)
>          return;
>      }
>  
> +    if (kvm_irqchip_is_split()) {
> +        /*
> +         * VFIO INTx is currently not working with split kernel
> +         * irqchip for level triggered interrupts.  Go the slow path
> +         * as long as split is enabled so we can be at least
> +         * functional (even with poor performance).
> +         *
> +         * TODO: Remove this after all things fixed up.
If this patch were to be applied sooner than the other patches as
suggested in the cover letter, We may emit a warning message saying that
slow path is selected due to split irqchip and this will induce perf
downgrade
> +         */
> +        return;
> +    }
> +
>      /* Get to a known interrupt state */
>      qemu_set_fd_handler(irqfd.fd, NULL, NULL, vdev);
>      vfio_mask_single_irqindex(&vdev->vbasedev, VFIO_PCI_INTX_IRQ_INDEX);
> 


Tested with a 5.2-rc1 kernel with reverted "654f1f13ea56  kvm: Check
irqchip mode before assign irqfd" and guest booting with nomsi.

Without this patch the assigned NIC does not work. This patch fixes the
issue.

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric


