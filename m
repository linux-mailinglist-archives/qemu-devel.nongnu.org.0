Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 469C01A1BA4
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Apr 2020 07:57:34 +0200 (CEST)
Received: from localhost ([::1]:56320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jM3iO-0004FM-Rk
	for lists+qemu-devel@lfdr.de; Wed, 08 Apr 2020 01:57:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57364)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1jM3hF-0003bQ-7Q
 for qemu-devel@nongnu.org; Wed, 08 Apr 2020 01:56:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1jM3hE-0005pv-78
 for qemu-devel@nongnu.org; Wed, 08 Apr 2020 01:56:21 -0400
Received: from charlie.dont.surf ([128.199.63.193]:35218)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>)
 id 1jM3hB-0005mK-QG; Wed, 08 Apr 2020 01:56:17 -0400
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 583F2BF41D;
 Wed,  8 Apr 2020 05:56:11 +0000 (UTC)
Date: Wed, 8 Apr 2020 07:56:07 +0200
From: Klaus Birkelund Jensen <its@irrelevant.dk>
To: Andrzej Jakowski <andrzej.jakowski@linux.intel.com>
Subject: Re: [PATCH v1] nvme: indicate CMB support through controller
 capabilities register
Message-ID: <20200408055607.g2ii7gwqbnv6cd3w@apples.localdomain>
References: <20200401184219.14911-1-andrzej.jakowski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200401184219.14911-1-andrzej.jakowski@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 128.199.63.193
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
Cc: kbusch@kernel.org, kwolf@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Apr  1 11:42, Andrzej Jakowski wrote:
> This patch sets CMBS bit in controller capabilities register when user
> configures NVMe driver with CMB support, so capabilites are correctly reported
> to guest OS.
> 
> Signed-off-by: Andrzej Jakowski <andrzej.jakowski@linux.intel.com>
> ---
>  hw/block/nvme.c      | 2 ++
>  include/block/nvme.h | 4 ++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index d28335cbf3..986803398f 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -1393,6 +1393,8 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
>      n->bar.intmc = n->bar.intms = 0;
>  
>      if (n->cmb_size_mb) {
> +        /* Contoller capabilities */
> +        NVME_CAP_SET_CMBS(n->bar.cap, 1);
>  
>          NVME_CMBLOC_SET_BIR(n->bar.cmbloc, 2);
>          NVME_CMBLOC_SET_OFST(n->bar.cmbloc, 0);
> diff --git a/include/block/nvme.h b/include/block/nvme.h
> index 8fb941c653..561891b140 100644
> --- a/include/block/nvme.h
> +++ b/include/block/nvme.h
> @@ -27,6 +27,7 @@ enum NvmeCapShift {
>      CAP_CSS_SHIFT      = 37,
>      CAP_MPSMIN_SHIFT   = 48,
>      CAP_MPSMAX_SHIFT   = 52,
> +    CAP_CMB_SHIFT      = 57,
>  };
>  
>  enum NvmeCapMask {
> @@ -39,6 +40,7 @@ enum NvmeCapMask {
>      CAP_CSS_MASK       = 0xff,
>      CAP_MPSMIN_MASK    = 0xf,
>      CAP_MPSMAX_MASK    = 0xf,
> +    CAP_CMB_MASK       = 0x1,
>  };
>  
>  #define NVME_CAP_MQES(cap)  (((cap) >> CAP_MQES_SHIFT)   & CAP_MQES_MASK)
> @@ -69,6 +71,8 @@ enum NvmeCapMask {
>                                                             << CAP_MPSMIN_SHIFT)
>  #define NVME_CAP_SET_MPSMAX(cap, val) (cap |= (uint64_t)(val & CAP_MPSMAX_MASK)\
>                                                              << CAP_MPSMAX_SHIFT)
> +#define NVME_CAP_SET_CMBS(cap, val) (cap |= (uint64_t)(val & CAP_CMB_MASK)\
> +                                                            << CAP_CMB_SHIFT)
>  
>  enum NvmeCcShift {
>      CC_EN_SHIFT     = 0,
> -- 
> 2.21.1
> 

Looks good.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

