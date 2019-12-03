Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D99BA10FDEF
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Dec 2019 13:43:54 +0100 (CET)
Received: from localhost ([::1]:52790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ic7Wz-0007oA-4y
	for lists+qemu-devel@lfdr.de; Tue, 03 Dec 2019 07:43:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48911)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhengxiang9@huawei.com>) id 1ic7JV-00084R-Ak
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 07:29:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhengxiang9@huawei.com>) id 1ic7JN-0003j8-MJ
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 07:29:53 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:40894 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhengxiang9@huawei.com>)
 id 1ic7JG-0003Q7-F6; Tue, 03 Dec 2019 07:29:44 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 631662E73581EE20096E;
 Tue,  3 Dec 2019 20:29:31 +0800 (CST)
Received: from HGHY4Z004218071.china.huawei.com (10.133.224.57) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.439.0; Tue, 3 Dec 2019 20:29:23 +0800
From: Xiang Zheng <zhengxiang9@huawei.com>
To: <peter.maydell@linaro.org>, <thuth@redhat.com>, <lvivier@redhat.com>
Subject: [PATCH 2/5] tests: fw_cfg: Support read/write of fw_cfg registers on
 aarch64
Date: Tue, 3 Dec 2019 20:27:50 +0800
Message-ID: <20191203122753.19792-3-zhengxiang9@huawei.com>
X-Mailer: git-send-email 2.15.1.windows.2
In-Reply-To: <20191203122753.19792-1-zhengxiang9@huawei.com>
References: <20191203122753.19792-1-zhengxiang9@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.224.57]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
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
Cc: lersek@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 kraxel@redhat.com, wanghaibin.wang@huawei.com, pbonzini@redhat.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Refer to the fw_cfg registers locations of x86 and arm in
docs/specs/fw_cfg.txt, the test codes need to differ on the addresses
for read/write.

Besides, fix the endian problems in mm_fw_cfg_select().

Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
---
 tests/libqos/fw_cfg.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/tests/libqos/fw_cfg.c b/tests/libqos/fw_cfg.c
index 1f46258f96..c1518c5e81 100644
--- a/tests/libqos/fw_cfg.c
+++ b/tests/libqos/fw_cfg.c
@@ -57,7 +57,14 @@ uint64_t qfw_cfg_get_u64(QFWCFG *fw_cfg, uint16_t key)
 
 static void mm_fw_cfg_select(QFWCFG *fw_cfg, uint16_t key)
 {
-    qtest_writew(fw_cfg->qts, fw_cfg->base, key);
+    const char *arch = qtest_get_arch();
+    uint64_t offset = 0;
+
+    if (!strcmp(arch, "aarch64")) {
+        offset = 8;
+    }
+
+    qtest_writew(fw_cfg->qts, fw_cfg->base + offset, cpu_to_be16(key));
 }
 
 /*
@@ -108,9 +115,15 @@ static void mm_fw_cfg_read(QFWCFG *fw_cfg, void *data, size_t len)
 {
     uint8_t *ptr = data;
     int i;
+    uint64_t offset = 2;
+    const char *arch = qtest_get_arch();
+
+    if (!strcmp(arch, "aarch64")) {
+        offset = 0;
+    }
 
     for (i = 0; i < len; i++) {
-        ptr[i] = qtest_readb(fw_cfg->qts, fw_cfg->base + 2);
+        ptr[i] = qtest_readb(fw_cfg->qts, fw_cfg->base + offset);
     }
 }
 
-- 
2.19.1



