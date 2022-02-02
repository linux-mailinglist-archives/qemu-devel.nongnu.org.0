Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1744D4A75A5
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 17:19:53 +0100 (CET)
Received: from localhost ([::1]:34376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFIMK-0008Rj-5R
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 11:19:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nFGfc-0000Ql-4U
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 09:31:40 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nFGfa-0002tA-6M
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 09:31:39 -0500
Received: from fraeml707-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4JpkkG2Ww3z67n09;
 Wed,  2 Feb 2022 22:31:02 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml707-chm.china.huawei.com (10.206.15.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 2 Feb 2022 15:31:35 +0100
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 2 Feb 2022 14:31:34 +0000
To: <qemu-devel@nongnu.org>, =?UTF-8?q?Alex=20Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Marcel Apfelbaum <marcel@redhat.com>, "Michael S .
 Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
CC: <linux-cxl@vger.kernel.org>, Ben Widawsky <ben.widawsky@intel.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, <linuxarm@huawei.com>, "Shameerali
 Kolothum Thodi" <shameerali.kolothum.thodi@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Saransh Gupta1
 <saransh@ibm.com>, Shreyas Shah <shreyas.shah@elastics.cloud>, Chris Browy
 <cbrowy@avery-design.com>, Samarth Saxena <samarths@cadence.com>, "Dan
 Williams" <dan.j.williams@intel.com>
Subject: [PATCH v5 41/43] qtest/acpi: Add reference CEDT tables.
Date: Wed, 2 Feb 2022 14:10:35 +0000
Message-ID: <20220202141037.17352-42-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220202141037.17352-1-Jonathan.Cameron@huawei.com>
References: <20220202141037.17352-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml743-chm.china.huawei.com (10.201.108.193) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Jonathan Cameron <jonathan.cameron@huawei.com>

More sophisticated tests will come later, but for now deal
with the NULL case.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 tests/data/acpi/pc/CEDT                     | Bin 0 -> 36 bytes
 tests/data/acpi/q35/CEDT                    | Bin 0 -> 36 bytes
 tests/data/acpi/virt/CEDT                   | Bin 0 -> 36 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   3 ---
 4 files changed, 3 deletions(-)

diff --git a/tests/data/acpi/pc/CEDT b/tests/data/acpi/pc/CEDT
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..b44db4ce1db980d783ad568a03c17c2915d111b0 100644
GIT binary patch
literal 36
jcmZ>EbqP^nU|?VjaPoKd2v%^42yj*a0!E-1hz+6veU1hJ

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/CEDT b/tests/data/acpi/q35/CEDT
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..b44db4ce1db980d783ad568a03c17c2915d111b0 100644
GIT binary patch
literal 36
jcmZ>EbqP^nU|?VjaPoKd2v%^42yj*a0!E-1hz+6veU1hJ

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/CEDT b/tests/data/acpi/virt/CEDT
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..b44db4ce1db980d783ad568a03c17c2915d111b0 100644
GIT binary patch
literal 36
jcmZ>EbqP^nU|?VjaPoKd2v%^42yj*a0!E-1hz+6veU1hJ

literal 0
HcmV?d00001

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index c7726cad80..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,4 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/pc/CEDT",
-"tests/data/acpi/q35/CEDT",
-"tests/data/acpi/virt/CEDT",
-- 
2.32.0


