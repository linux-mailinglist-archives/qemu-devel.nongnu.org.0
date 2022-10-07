Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E729D5F72AB
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 04:03:36 +0200 (CEST)
Received: from localhost ([::1]:59576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogci7-0002UW-IC
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 22:03:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luzhipeng@cestc.cn>)
 id 1ogcgr-000136-SR
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 22:02:17 -0400
Received: from [106.39.185.57] (port=39228 helo=smtp.cecloud.com)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luzhipeng@cestc.cn>) id 1ogcgo-0000Qf-U3
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 22:02:17 -0400
Received: from localhost (localhost [127.0.0.1])
 by smtp.cecloud.com (Postfix) with ESMTP id 437B1FC0203;
 Fri,  7 Oct 2022 10:02:05 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [110.188.55.41])
 by smtp.cecloud.com (postfix) whith ESMTP id
 P51403T281471112442224S1665108122326090_; 
 Fri, 07 Oct 2022 10:02:05 +0800 (CST)
X-UNIQUE-TAG: <dce595579a222316e47d117fbf61dd2b>
X-RL-SENDER: luzhipeng@cestc.cn
X-SENDER: luzhipeng@cestc.cn
X-LOGIN-NAME: luzhipeng@cestc.cn
X-FST-TO: qemu-devel@nongnu.org
X-RCPT-COUNT: 3
X-SENDER-IP: 110.188.55.41
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: luzhipeng <luzhipeng@cestc.cn>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
 lu zhipeng <luzhipeng@cestc.cn>
Subject: [PATCH RESEND] elf2dmp: free memory in failure
Date: Fri,  7 Oct 2022 10:01:28 +0800
Message-Id: <20221007020128.760-1-luzhipeng@cestc.cn>
X-Mailer: git-send-email 2.34.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 106.39.185.57 (failed)
Received-SPF: pass client-ip=106.39.185.57; envelope-from=luzhipeng@cestc.cn;
 helo=smtp.cecloud.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: lu zhipeng <luzhipeng@cestc.cn>

The 'kdgb' is allocating memory in get_kdbg(), but it is not freed in
error path. So fix that.

Signed-off-by: lu zhipeng <luzhipeng@cestc.cn>
---
 contrib/elf2dmp/main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/elf2dmp/main.c b/contrib/elf2dmp/main.c
index b9fc6d230c..d77b8f98f7 100644
--- a/contrib/elf2dmp/main.c
+++ b/contrib/elf2dmp/main.c
@@ -125,6 +125,7 @@ static KDDEBUGGER_DATA64 *get_kdbg(uint64_t KernBase, struct pdb_reader *pdb,
 
     if (va_space_rw(vs, KdDebuggerDataBlock, kdbg, kdbg_hdr.Size, 0)) {
         eprintf("Failed to extract entire KDBG\n");
+        free(kdbg);
         return NULL;
     }
 
-- 
2.31.1




