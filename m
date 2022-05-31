Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4EC53914E
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 15:01:56 +0200 (CEST)
Received: from localhost ([::1]:36604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw1VT-0000EH-1O
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 09:01:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nw1AG-0000e3-38
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:40:00 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nw1AC-00086r-RE
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:39:59 -0400
Received: from fraeml713-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LCBbh4rCfz6H8VB;
 Tue, 31 May 2022 20:36:32 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml713-chm.china.huawei.com (10.206.15.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 31 May 2022 14:39:53 +0200
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 31 May 2022 13:39:52 +0100
To: <qemu-devel@nongnu.org>, "Michael S . Tsirkin" <mst@redhat.com>
CC: Paolo Bonzini <pbonzini@redhat.com>, <linux-cxl@vger.kernel.org>,
 <linuxarm@huawei.com>, <alex.bennee@linaro.org>, Marcel Apfelbaum
 <marcel@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, "Adam
 Manzanares" <a.manzanares@samsung.com>, Tong Zhang <ztong0001@gmail.com>,
 "Ben Widawsky" <ben.widawsky@intel.com>, Shameerali Kolothum Thodi
 <shameerali.kolothum.thodi@huawei.com>
Subject: [PATCH] hw/cxl: Fix missing write mask for HDM decoder target list
 registers
Date: Tue, 31 May 2022 13:39:53 +0100
Message-ID: <20220531123953.17582-1-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml713-chm.china.huawei.com (10.201.108.64) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
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

Without being able to write these registers, no interleaving is possible.
More refined checks of HDM register state on commit to follow.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/cxl/cxl-component-utils.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/cxl/cxl-component-utils.c b/hw/cxl/cxl-component-utils.c
index 7985c9bfca..993248b5c0 100644
--- a/hw/cxl/cxl-component-utils.c
+++ b/hw/cxl/cxl-component-utils.c
@@ -174,6 +174,8 @@ static void hdm_init_common(uint32_t *reg_state, uint32_t *write_msk)
         write_msk[R_CXL_HDM_DECODER0_SIZE_LO + i * 0x20] = 0xf0000000;
         write_msk[R_CXL_HDM_DECODER0_SIZE_HI + i * 0x20] = 0xffffffff;
         write_msk[R_CXL_HDM_DECODER0_CTRL + i * 0x20] = 0x13ff;
+        write_msk[R_CXL_HDM_DECODER0_TARGET_LIST_LO + i * 0x20] = 0xffffffff;
+        write_msk[R_CXL_HDM_DECODER0_TARGET_LIST_HI + i * 0x20] = 0xffffffff;
     }
 }
 
-- 
2.32.0


