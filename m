Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D255FA156
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 17:44:49 +0200 (CEST)
Received: from localhost ([::1]:50846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohuxU-0005WU-8X
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 11:44:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ohueh-0005ZV-LQ
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 11:25:23 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ohuef-0006Dw-Ll
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 11:25:23 -0400
Received: from fraeml745-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4MmN4j1dHGz67dBN;
 Mon, 10 Oct 2022 23:24:37 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml745-chm.china.huawei.com (10.206.15.226) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 10 Oct 2022 17:25:16 +0200
Received: from localhost (10.202.226.42) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 10 Oct
 2022 16:25:15 +0100
Date: Mon, 10 Oct 2022 16:25:15 +0100
To: Gregory Price <gourry.memverge@gmail.com>
CC: <qemu-devel@nongnu.org>, <linux-cxl@vger.kernel.org>,
 <alison.schofield@intel.com>, <dave@stgolabs.net>,
 <a.manzanares@samsung.com>, <bwidawsk@kernel.org>, Gregory Price
 <gregory.price@memverge.com>
Subject: Re: [PATCH 2/2] hw/cxl: Allow CXL type-3 devices to be persistent
 or volatile
Message-ID: <20221010162515.000009f8@huawei.com>
In-Reply-To: <20221006233702.18532-2-gregory.price@memverge.com>
References: <20221006233702.18532-1-gregory.price@memverge.com>
 <20221006233702.18532-2-gregory.price@memverge.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.226.42]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Thu,  6 Oct 2022 19:37:02 -0400
Gregory Price <gourry.memverge@gmail.com> wrote:

> This commit enables setting one memory region for a type-3 device, but
> that region may now be either a persistent region or volatile region.
> 
> Future work may enable setting both regions simultaneously, as this is
> a possible configuration on a real type-3 device.  The scaffolding was
> put in for this, but is left for further work.
> 
> The existing [memdev] property has been deprecated and will default the
> memory region to a persistent memory region (although a user may assign
> the region to a ram or file backed region).
> 
> There is presently no interface with which to expose a MemoryRegion's
> real backing type (HostMemoryBackendRam/File), otherwise we could have
> used File to imply pmem (or inspected HostMemoryBackendFile->is_pmem) to
> deterine whether the backing device supported pmem mode.  This should be
> considered for future work, as it would make creating an array of
> HostMemory devices to represent DIMMs on a Single-Logical-Device
> MemoryExpander fairly straightforward.
> 
> Signed-off-by: Gregory Price <gregory.price@memverge.com>
> ---
Looks good to me, though I haven't tested it yet.

A few trivial comments inline.

>      *len = sizeof(*part_info);
> diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
> index 1837c1c83a..998461dac1 100644
> --- a/hw/mem/cxl_type3.c
> +++ b/hw/mem/cxl_type3.c
> @@ -100,18 +100,47 @@ static bool cxl_setup_memory(CXLType3Dev *ct3d, Error **errp)
>      DeviceState *ds = DEVICE(ct3d);
>      MemoryRegion *mr;
>      char *name;
> +    bool is_pmem = false;
>  
> -    if (!ct3d->hostmem) {
> -        error_setg(errp, "memdev property must be set");
> +    /*
> +     * FIXME: For now we only allow a single host memory region.

TODO maybe?  FIXME tends to lead to reviewers asking why we haven't
fixed it yet!

> +     * Handle the deprecated memdev property usage cases
> +     */
> +    if (!ct3d->hostmem && !ct3d->host_vmem && !ct3d->host_pmem) {
> +        error_setg(errp, "at least one memdev property must be set");
>          return false;
> +    } else if (ct3d->hostmem && (ct3d->host_vmem || ct3d->host_pmem)) {
> +        error_setg(errp, "deprecated [memdev] cannot be used with new "
> +                         "persistent and volatile memdev properties");
> +        return false;
> +    } else if (ct3d->hostmem) {
> +        warn_report("memdev is deprecated and defaults to pmem. "
> +                    "Use (persistent|volatile)-memdev instead.");

I'd suggest we don't warn on this yet. There is limited advantage in
doing so given it's easy to carry on supporting by just treating
it as another name for persistent-memdev


> +        is_pmem = true;
> +    } else {
> +        if (ct3d->host_vmem && ct3d->host_pmem) {
> +            error_setg(errp, "Multiple memory devices not supported yet");
> +            return false;
> +        }
> +        is_pmem = !!ct3d->host_pmem;
> +        ct3d->hostmem = ct3d->host_pmem ? ct3d->host_pmem : ct3d->host_vmem;
>      }
>  

