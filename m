Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9106C4798
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 11:28:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pevgt-0003rH-BK; Wed, 22 Mar 2023 06:27:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pevgq-0003r5-Hg
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 06:27:32 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pevgn-0006zY-TS
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 06:27:32 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PhPm25kCMz6J7rP;
 Wed, 22 Mar 2023 18:26:58 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 22 Mar 2023 10:27:25 +0000
To: Michael Tsirkin <mst@redhat.com>, <qemu-devel@nongnu.org>
CC: <linuxarm@huawei.com>, Fan Ni <fan.ni@samsung.com>, Dave Jiang
 <dave.jiang@intel.com>, <linux-cxl@vger.kernel.org>
Subject: [RESEND PATCH 0/2] hw/cxl: Fix decoder commit and uncommit handling
Date: Wed, 22 Mar 2023 10:27:29 +0000
Message-ID: <20230322102731.4219-1-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Resending because all but patch 1 seem to have failed to make it out of
our network.

Issue reported in discussion of:
https://lore.kernel.org/all/20230228224014.1402545-1-fan.ni@samsung.com/

The committed bit for HDM decoders is expected reset when commit transitions
from 1->0.  Whilst looking at that it was noticed that hardware was resetting
the commit bit which is not an option allowed by the CXL spec.

In common with many other areas the code did not take into account
big endian architectures, so fix that whilst we are here.

Note testing this exposed a kernel bug around repeated attempts to clear
a decoder out of order. That's been reported but not yet fixed.

Jonathan Cameron (2):
  hw/cxl: Fix endian handling for decoder commit.
  hw/cxl: Fix incorrect reset of commit and associated clearing of
    committed.

 hw/cxl/cxl-component-utils.c | 14 ++++++++------
 hw/mem/cxl_type3.c           | 28 +++++++++++++++++++++++++---
 2 files changed, 33 insertions(+), 9 deletions(-)

-- 
2.37.2


