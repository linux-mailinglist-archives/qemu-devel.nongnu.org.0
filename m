Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB215257435
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Aug 2020 09:20:22 +0200 (CEST)
Received: from localhost ([::1]:41292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCe73-0007X1-Tg
	for lists+qemu-devel@lfdr.de; Mon, 31 Aug 2020 03:20:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pannengyuan@huawei.com>)
 id 1kCe49-0002cq-GR
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 03:17:21 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:56136 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pannengyuan@huawei.com>)
 id 1kCe45-0005sc-Hd
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 03:17:21 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 7DA61B96BD416CD6C654;
 Mon, 31 Aug 2020 15:17:05 +0800 (CST)
Received: from opensource.huawei.com (10.175.100.152) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Mon, 31 Aug 2020 15:16:57 +0800
From: Pan Nengyuan <pannengyuan@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 02/10] elf2dmp/qemu_elf: Plug memleak in QEMU_Elf_init
Date: Mon, 31 Aug 2020 09:43:07 -0400
Message-ID: <20200831134315.1221-3-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200831134315.1221-1-pannengyuan@huawei.com>
References: <20200831134315.1221-1-pannengyuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.100.152]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35;
 envelope-from=pannengyuan@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/31 03:17:06
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_06_12=1.947,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: kuhn.chenqun@huawei.com, Pan Nengyuan <pannengyuan@huawei.com>,
 zhang.zhanghailiang@huawei.com, Viktor
 Prutyanov <viktor.prutyanov@phystech.edu>, euler.robot@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Missing g_error_free in QEMU_Elf_init() error path. Fix that.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
Reviewed-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
---
Cc: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
---
- v2: no changes in v2
---
 contrib/elf2dmp/qemu_elf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/elf2dmp/qemu_elf.c b/contrib/elf2dmp/qemu_elf.c
index 0db7816586..b601b6d7ba 100644
--- a/contrib/elf2dmp/qemu_elf.c
+++ b/contrib/elf2dmp/qemu_elf.c
@@ -126,6 +126,7 @@ int QEMU_Elf_init(QEMU_Elf *qe, const char *filename)
     qe->gmf = g_mapped_file_new(filename, TRUE, &gerr);
     if (gerr) {
         eprintf("Failed to map ELF dump file \'%s\'\n", filename);
+        g_error_free(gerr);
         return 1;
     }
 
-- 
2.18.2


