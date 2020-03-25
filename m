Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 573B11926BE
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Mar 2020 12:07:13 +0100 (CET)
Received: from localhost ([::1]:34430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jH3sO-0002sh-E3
	for lists+qemu-devel@lfdr.de; Wed, 25 Mar 2020 07:07:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38121)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1jH3l5-0001RH-E7
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 06:59:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1jH3l4-0007Qp-4s
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 06:59:39 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:44731)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>) id 1jH3l3-0007Q5-UJ
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 06:59:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585133977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bcJI0GbkUZIr02gRxdbBZJ5DsU8QnyJloc5W3nxYZac=;
 b=UVNsi5mytRNp4m/76wor3HCc29d85XdB2jRSwfVKgTdFnrGoHkv7Mx2X912EOpxdOam+iW
 sOr+8Ys8Q1NudvEGrJz6O4VEGrVzoCuMzO7zFlFL9P45k0CZu9V885uiFHXFow7/zZLtSi
 L3/nOIgiNG+yzRNeO7j1sn4U44IWNCs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-3omNIcftMzGcthX_ojGO-g-1; Wed, 25 Mar 2020 06:59:35 -0400
X-MC-Unique: 3omNIcftMzGcthX_ojGO-g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2CC48017DF;
 Wed, 25 Mar 2020 10:59:34 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.153])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C46B60BF3;
 Wed, 25 Mar 2020 10:59:32 +0000 (UTC)
Message-ID: <23fb62761fa37569eb23ed6dd0831cffb1133d01.camel@redhat.com>
Subject: Re: [PATCH v6 42/42] nvme: make lba data size configurable
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Klaus Jensen <its@irrelevant.dk>, qemu-block@nongnu.org
Date: Wed, 25 Mar 2020 12:59:31 +0200
In-Reply-To: <20200316142928.153431-43-its@irrelevant.dk>
References: <20200316142928.153431-1-its@irrelevant.dk>
 <20200316142928.153431-43-its@irrelevant.dk>
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: Kevin Wolf <kwolf@redhat.com>, Beata Michalska <beata.michalska@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Javier Gonzalez <javier.gonz@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2020-03-16 at 07:29 -0700, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> Acked-by: Keith Busch <kbusch@kernel.org>
> ---
>  hw/block/nvme-ns.c | 7 ++++++-
>  hw/block/nvme-ns.h | 4 +++-
>  hw/block/nvme.c    | 1 +
>  3 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
> index 6d975104171d..d7e5c81c5f16 100644
> --- a/hw/block/nvme-ns.c
> +++ b/hw/block/nvme-ns.c
> @@ -18,7 +18,7 @@ static int nvme_ns_init(NvmeNamespace *ns)
>  {
>      NvmeIdNs *id_ns = &ns->id_ns;
>  
> -    id_ns->lbaf[0].ds = BDRV_SECTOR_BITS;
> +    id_ns->lbaf[0].ds = ns->params.lbads;
>      id_ns->nsze = cpu_to_le64(nvme_ns_nlbas(ns));
>  
>      /* no thin provisioning */
> @@ -78,6 +78,11 @@ static int nvme_ns_check_constraints(NvmeNamespace *ns, Error **errp)
>          return 1;
>      }
>  
> +    if (ns->params.lbads < 9 || ns->params.lbads > 12) {
> +        error_setg(errp, "unsupported lbads (supported: 9-12)");
> +        return 1;
> +    }
> +
>      return 0;
>  }
>  
> diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
> index 3c3651d485d0..43b78f8b8d9c 100644
> --- a/hw/block/nvme-ns.h
> +++ b/hw/block/nvme-ns.h
> @@ -7,10 +7,12 @@
>  
>  #define DEFINE_NVME_NS_PROPERTIES(_state, _props) \
>      DEFINE_PROP_DRIVE("drive", _state, blk), \
> -    DEFINE_PROP_UINT32("nsid", _state, _props.nsid, 0)
> +    DEFINE_PROP_UINT32("nsid", _state, _props.nsid, 0), \
> +    DEFINE_PROP_UINT8("lbads", _state, _props.lbads, BDRV_SECTOR_BITS)
>  
>  typedef struct NvmeNamespaceParams {
>      uint32_t nsid;
> +    uint8_t  lbads;
>  } NvmeNamespaceParams;
>  
>  typedef struct NvmeNamespace {
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 4f1504fc00fe..61a9da970d41 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -2624,6 +2624,7 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
>      if (n->namespace.blk) {
>          ns = &n->namespace;
>          ns->params.nsid = 1;
> +        ns->params.lbads = BDRV_SECTOR_BITS;
>  
>          if (nvme_ns_setup(n, ns, errp)) {
>              return;

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky




