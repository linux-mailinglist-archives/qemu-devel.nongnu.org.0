Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF0E59720E
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 16:59:40 +0200 (CEST)
Received: from localhost ([::1]:53492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOKWB-0002PT-HL
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 10:59:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oOKUh-000098-Tu
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 10:58:07 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oOKUf-0000kZ-Ei
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 10:58:07 -0400
Received: from fraeml710-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4M7B2g26MZz67xgM;
 Wed, 17 Aug 2022 22:57:47 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml710-chm.china.huawei.com (10.206.15.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 17 Aug 2022 16:58:01 +0200
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 17 Aug 2022 15:58:00 +0100
To: <qemu-devel@nongnu.org>, "Michael S . Tsirkin" <mst@redhat.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, Igor Mammedov <imammedo@redhat.com>
CC: <linux-cxl@vger.kernel.org>, <linuxarm@huawei.com>, "Shameerali Kolothum
 Thodi" <shameerali.kolothum.thodi@huawei.com>, Ben Widawsky
 <bwidawsk@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 0/3] QEMU/CXL: A few more fixes for 7.1 related to LSA
Date: Wed, 17 Aug 2022 15:57:56 +0100
Message-ID: <20220817145759.32603-1-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

The recent addition of CXL Region setup to the 6.0-rc1 Linux kernel
has allowed us to test a few paths that weren't exercised fully until
now.  That threw up a mixture of bugs in QEMU emulation and the kernel
(kernel fixes already posted).

The first patch is down to a wrong assumption about RO MemoryRegions
and was hit due to a kernel bug overruning the mailbox and into
another register region.  Kernel bug fix:

https://lore.kernel.org/linux-cxl/20220815154044.24733-1-Jonathan.Cameron@huawei.com

The later 2 have shown up because the Get / Set LSA commands
have started getting proper user in the kernel.

With these fixes in place I've tested an 8 way interleave on a host
bridge to directly connected CXL devices and zeroed LSA regions.
On that we can bring up a CXL region on which we can create an
fsdax namespace and make a filesystem. For now, the cookie used
to identify device for re establishing that region/namespace will
be 0. A new feature patch will follow that will add the ability
to provide the necessary serial numbers for correct namespace
cookie creation allowing the namespace/filesystem to be remounted
after a full restart.

Jonathan Cameron (3):
  hw/cxl: Add stub write function for RO MemoryRegionOps entries.
  hw/cxl: Fix Get LSA input payload size which should be 8 bytes.
  hw/cxl: Correctly handle variable sized mailbox input payloads.

 hw/cxl/cxl-device-utils.c  | 12 +++++++++---
 hw/cxl/cxl-mailbox-utils.c |  4 ++--
 2 files changed, 11 insertions(+), 5 deletions(-)

-- 
2.32.0


