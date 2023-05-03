Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FE66F5676
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 12:44:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu9wp-0001zq-8X; Wed, 03 May 2023 06:42:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pu9wm-0001xq-6j
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:42:56 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pu9wj-0007A3-46
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:42:55 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4QBD5F1tW4z67bjw;
 Wed,  3 May 2023 18:41:21 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 3 May
 2023 11:42:48 +0100
Date: Wed, 3 May 2023 11:42:48 +0100
To: Dave Jiang <dave.jiang@intel.com>
CC: <qemu-devel@nongnu.org>, <imammedo@redhat.com>, <ira.weiny@intel.com>,
 <mst@redhat.com>, <bwidawsk@kernel.org>
Subject: Re: [RFC PATCH 0/3] QEMU ACPI generic port support
Message-ID: <20230503114248.00004c51@Huawei.com>
In-Reply-To: <168185633821.899932.322047053764766056.stgit@djiang5-mobl3>
References: <168185633821.899932.322047053764766056.stgit@djiang5-mobl3>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 18 Apr 2023 15:21:36 -0700
Dave Jiang <dave.jiang@intel.com> wrote:

> s small RFC patch series is really a hack on what I need from qemu rather
> than a proper implementation. I'm hoping to get some guidance from the list on
> how to implement this correctly for qemu upstream. Thank you!
> 
> The patch series provides support for the ACPI Generic Port support that's
> defined by ACPI spec 6.5 5.2.16.7 (Generic Port Affinity Structure). The
> series also adds a genport object that allows locality data to be injected via
> qemu commandline to the HMAT tables. The generic port support is to allow a hot
> plugged CXL memory device to calculate the locality data from the CPU to
> the CXL device. The generic port related data provides the locality data from
> the CPU to the CXL host bridge (latency and bandwidth). These data in
> addition to the PCIe link data, CDAT from device, and CXL switch CDAT if switch
> exist, provides the locality data for the entire path.
> 
> Patch1: Adds Generic Port Affinity Structure sub-tables to the SRAT. For
> each CXL Host Bridge (HB) a GPAS entry is created with a unique proximity
> domain. For example, if the system is created with 4 proximity domains (PXM) for
> system memory, then the next GPAS will get PXM 4 and so on.

I may be going crazy but I'm not seeing an increment on the numa node. So I think
they all get 4 at the moment. Found it increment in patch 3.

> 
> Patch2: Add the json support for generic port. Split out because
> clang-format really clobbers the json files.
> 
> Patch3: Add a generic port object. The intention here is to allow setup of
> numa nodes, add hmat-lb data and node distance for the generic targets. I had to
> add a hack in qemu_create_cli_devices() to realize the genport objects. I need
> guidance on where and how to do this properly so the genport objects
> realize at the correct place and time.
> 
> Example of genport setup:
> -object genport,id=$X -numa node,genport=genport$X,nodeid=$Y,initiator=$Z
> -numa hmat-lb,initiator=$Z,target=$X,hierarchy=memory,data-type=access-latency,latency=$latency
> -numa hmat-lb,initiator=$Z,target=$X,hierarchy=memory,data-type=access-bandwidth,bandwidth=$bandwidthM

I think we should be using some links to the host bridges in here.
So I don't think there should be an explicit genport object at all.
Instead we should be able to point at the pxb itself.  Perhaps also
allowing other port types in future.

Something like

-device pxb-cxl,id=cxl1.1
-numa node,genport=cxl1.1,nodeid=$X
-numa hmat-lb,initiator=$Z,target=$X,...
-numa hmat-lb,initiator=$X,target=$Y,...
//as generic port goes both ways.

As we are currently using bus_nr for UID (which is admittedly a somewhat dirty hack that
just happened to be convenient) the ACPI building code can use that to fill in the SRAT
entry at appropriate point.

I haven't tried implementing it so there may well be some ordering issues that
require some late binding etc, but it should be possible to make it work.

> for ((i = 0; i < total_nodes; i++)); do
>         for ((j = 0; j < cxl_hbs; j++ )); do        # 2 CXL HBs
>                 -numa dist,src=$i,dst=$X,val=$dist
>         done
> done
> Linux kernel support:
> https://lore.kernel.org/linux-cxl/168088732996.1441063.10107817505475386072.stgit@djiang5-mobl3/T/#t
> 
> ---
> 
> Dave Jiang (3):
>       hw/acpi: Add support for Generic Port Affinity Structure to SRAT
>       genport: Add json support for generic port
>       acpi: add generic port device object
> 
> 
>  hw/acpi/aml-build.c         | 21 +++++++++++++
>  hw/acpi/genport.c           | 61 +++++++++++++++++++++++++++++++++++++
>  hw/acpi/meson.build         |  1 +
>  hw/i386/acpi-build.c        | 45 +++++++++++++++++++++++++++
>  include/hw/acpi/aml-build.h | 27 ++++++++++++++++
>  qapi/machine.json           |  3 +-
>  qapi/qom.json               | 12 ++++++++
>  softmmu/vl.c                | 26 ++++++++++++++++
>  8 files changed, 195 insertions(+), 1 deletion(-)
>  create mode 100644 hw/acpi/genport.c
> 
> --
> 
> 


