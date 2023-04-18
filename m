Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 151036E6F51
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 00:22:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pothy-0002s8-9i; Tue, 18 Apr 2023 18:21:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave.jiang@intel.com>)
 id 1poths-0002rj-It
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 18:21:48 -0400
Received: from mga02.intel.com ([134.134.136.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave.jiang@intel.com>)
 id 1pothp-0004CB-GI
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 18:21:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681856505; x=1713392505;
 h=subject:from:to:cc:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ysBI7kOvKS7xf/PoeVzIoLlxBzw+TZ1pvzUzNcJiqD0=;
 b=d1nJuMHdJILYDw/m+a606Csue69cUTWgieS0p3hytjQubAQp1OKkzaof
 BU0zDSkbIL48BeJURKqzc1JCqqtSxjY2P7EnBDW4PCjlQ+2E8NqBQpyRo
 qFsmzAyY0EP7LQiRKYn4j5VqwRiTfd3GHK+QlVIThRZAio0twu8NWDApB
 anVv7kLNPbgLcVG2UXgUNd/vK2XzLLkr/i7ApSyr3S9fUgJPx4mhiF5/z
 aeDl+i9XE9ZR+mCYhbQm4uOqWfN+WuOGx8a/siR1KVpecyF9TaapjX2G9
 kom/0wovcEwZK3D9Uswjiqe4QEURQU8S6IeS27u5mfUSOC9sHce7v3cy2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="334103999"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="334103999"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 15:21:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="684766917"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="684766917"
Received: from psherpa-mobl.amr.corp.intel.com (HELO [192.168.1.177])
 ([10.212.29.141])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 15:21:37 -0700
Subject: [RFC PATCH 0/3] QEMU ACPI generic port support
From: Dave Jiang <dave.jiang@intel.com>
To: qemu-devel@nongnu.org
Cc: imammedo@redhat.com, Jonathan.Cameron@huawei.com, ira.weiny@intel.com,
 mst@redhat.com, bwidawsk@kernel.org
Date: Tue, 18 Apr 2023 15:21:36 -0700
Message-ID: <168185633821.899932.322047053764766056.stgit@djiang5-mobl3>
User-Agent: StGit/1.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.20; envelope-from=dave.jiang@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

s small RFC patch series is really a hack on what I need from qemu rather
than a proper implementation. I'm hoping to get some guidance from the list on
how to implement this correctly for qemu upstream. Thank you!

The patch series provides support for the ACPI Generic Port support that's
defined by ACPI spec 6.5 5.2.16.7 (Generic Port Affinity Structure). The
series also adds a genport object that allows locality data to be injected via
qemu commandline to the HMAT tables. The generic port support is to allow a hot
plugged CXL memory device to calculate the locality data from the CPU to
the CXL device. The generic port related data provides the locality data from
the CPU to the CXL host bridge (latency and bandwidth). These data in
addition to the PCIe link data, CDAT from device, and CXL switch CDAT if switch
exist, provides the locality data for the entire path.

Patch1: Adds Generic Port Affinity Structure sub-tables to the SRAT. For
each CXL Host Bridge (HB) a GPAS entry is created with a unique proximity
domain. For example, if the system is created with 4 proximity domains (PXM) for
system memory, then the next GPAS will get PXM 4 and so on.

Patch2: Add the json support for generic port. Split out because
clang-format really clobbers the json files.

Patch3: Add a generic port object. The intention here is to allow setup of
numa nodes, add hmat-lb data and node distance for the generic targets. I had to
add a hack in qemu_create_cli_devices() to realize the genport objects. I need
guidance on where and how to do this properly so the genport objects
realize at the correct place and time.

Example of genport setup:
-object genport,id=$X -numa node,genport=genport$X,nodeid=$Y,initiator=$Z
-numa hmat-lb,initiator=$Z,target=$X,hierarchy=memory,data-type=access-latency,latency=$latency
-numa hmat-lb,initiator=$Z,target=$X,hierarchy=memory,data-type=access-bandwidth,bandwidth=$bandwidthM
for ((i = 0; i < total_nodes; i++)); do
        for ((j = 0; j < cxl_hbs; j++ )); do        # 2 CXL HBs
                -numa dist,src=$i,dst=$X,val=$dist
        done
done
Linux kernel support:
https://lore.kernel.org/linux-cxl/168088732996.1441063.10107817505475386072.stgit@djiang5-mobl3/T/#t

---

Dave Jiang (3):
      hw/acpi: Add support for Generic Port Affinity Structure to SRAT
      genport: Add json support for generic port
      acpi: add generic port device object


 hw/acpi/aml-build.c         | 21 +++++++++++++
 hw/acpi/genport.c           | 61 +++++++++++++++++++++++++++++++++++++
 hw/acpi/meson.build         |  1 +
 hw/i386/acpi-build.c        | 45 +++++++++++++++++++++++++++
 include/hw/acpi/aml-build.h | 27 ++++++++++++++++
 qapi/machine.json           |  3 +-
 qapi/qom.json               | 12 ++++++++
 softmmu/vl.c                | 26 ++++++++++++++++
 8 files changed, 195 insertions(+), 1 deletion(-)
 create mode 100644 hw/acpi/genport.c

--


