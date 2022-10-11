Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 503AB5FB1CC
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 13:48:08 +0200 (CEST)
Received: from localhost ([::1]:47358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiDjz-0003f4-8y
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 07:48:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oiCXQ-0004yo-GG
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:31:12 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oiCXJ-0005Ne-04
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:31:02 -0400
Received: from fraeml740-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4MmsRx4h50z67GQ8;
 Tue, 11 Oct 2022 18:27:57 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml740-chm.china.huawei.com (10.206.15.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 11 Oct 2022 12:30:44 +0200
Received: from localhost (10.202.226.42) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 11 Oct
 2022 11:30:43 +0100
Date: Tue, 11 Oct 2022 11:30:42 +0100
To: <ira.weiny@intel.com>
CC: Michael Tsirkin <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>,
 <qemu-devel@nongnu.org>, <linux-cxl@vger.kernel.org>
Subject: Re: [RFC PATCH 5/6] hw/cxl/cxl-events: Add event interrupt support
Message-ID: <20221011113042.0000534b@huawei.com>
In-Reply-To: <20221010222944.3923556-6-ira.weiny@intel.com>
References: <20221010222944.3923556-1-ira.weiny@intel.com>
 <20221010222944.3923556-6-ira.weiny@intel.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.226.42]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
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

On Mon, 10 Oct 2022 15:29:43 -0700
ira.weiny@intel.com wrote:

> From: Ira Weiny <ira.weiny@intel.com>
> 
> To facilitate testing of event interrupt support add a QMP HMP command
> to reset the event logs and issue interrupts when the guest has enabled
> those interrupts.
Two things in here, so probably wants breaking into two patches:
1) Add the injection command
2) Add the interrupt support.

As on earlier patches, I think we need a more sophisticated
injection interface so we can inject individual errors (or better yet sets of
errors so we can trigger single error case, and multiple error per interrupt.)

Jonathan


> 
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> ---
>  hmp-commands.hx             | 14 +++++++
>  hw/cxl/cxl-events.c         | 82 +++++++++++++++++++++++++++++++++++++
>  hw/cxl/cxl-host-stubs.c     |  5 +++
>  hw/mem/cxl_type3.c          |  7 +++-
>  include/hw/cxl/cxl_device.h |  3 ++
>  include/sysemu/sysemu.h     |  3 ++
>  6 files changed, 113 insertions(+), 1 deletion(-)
> 
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index 564f1de364df..c59a98097317 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -1266,6 +1266,20 @@ SRST
>    Inject PCIe AER error
>  ERST
>  
> +    {
> +        .name       = "cxl_event_inject",
> +        .args_type  = "id:s",
> +        .params     = "id <error_status>",
> +        .help       = "inject cxl events and interrupt\n\t\t\t"
> +                      "<id> = qdev device id\n\t\t\t",
> +        .cmd        = hmp_cxl_event_inject,
> +    },
> +
> +SRST
> +``cxl_event_inject``
> +  Inject CXL Events
> +ERST
> +
>      {
>          .name       = "netdev_add",
>          .args_type  = "netdev:O",


>  const MemoryRegionOps cfmws_ops;
> diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
> index 2b13179d116d..b4a90136d190 100644
> --- a/hw/mem/cxl_type3.c
> +++ b/hw/mem/cxl_type3.c
> @@ -459,7 +459,7 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
>      ComponentRegisters *regs = &cxl_cstate->crb;
>      MemoryRegion *mr = &regs->component_registers;
>      uint8_t *pci_conf = pci_dev->config;
> -    unsigned short msix_num = 3;
> +    unsigned short msix_num = 7;
>      int i;
>  
>      if (!cxl_setup_memory(ct3d, errp)) {
> @@ -502,6 +502,11 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
>          msix_vector_use(pci_dev, i);
>      }
>  
> +    ct3d->cxl_dstate.event_vector[CXL_EVENT_TYPE_INFO] = 6;
> +    ct3d->cxl_dstate.event_vector[CXL_EVENT_TYPE_WARN] = 5;
> +    ct3d->cxl_dstate.event_vector[CXL_EVENT_TYPE_FAIL] = 4;
> +    ct3d->cxl_dstate.event_vector[CXL_EVENT_TYPE_FATAL] = 3;

For testing purposes, maybe put 2 of them on same interrupt vector?
That way we'll verify the kernel code deals fine with either separate
interrupts or shared vectors.


