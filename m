Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F117F5EF89C
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 17:24:27 +0200 (CEST)
Received: from localhost ([::1]:38520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odvOl-0008Cr-3l
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 11:24:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luzhipeng@cestc.cn>)
 id 1odsII-00025n-IH
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 08:05:34 -0400
Received: from [106.39.185.57] (port=33790 helo=smtp.cecloud.com)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luzhipeng@cestc.cn>) id 1odsIF-0005X4-Kk
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 08:05:34 -0400
Received: from localhost (localhost [127.0.0.1])
 by smtp.cecloud.com (Postfix) with ESMTP id AF686FC0206;
 Thu, 29 Sep 2022 20:05:20 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [111.48.58.10])
 by smtp.cecloud.com (postfix) whith ESMTP id
 P51403T281470664831344S1664453119164325_; 
 Thu, 29 Sep 2022 20:05:20 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <7e5587e8cfafaa257b65c392a4a33e64>
X-RL-SENDER: luzhipeng@cestc.cn
X-SENDER: luzhipeng@cestc.cn
X-LOGIN-NAME: luzhipeng@cestc.cn
X-FST-TO: qemu-devel@nongnu.org
X-RCPT-COUNT: 3
X-SENDER-IP: 111.48.58.10
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: luzhipeng <luzhipeng@cestc.cn>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
 lu zhipeng <luzhipeng@cestc.cn>
Subject: [PATCH] elf2dmp: free memory in failure
Date: Thu, 29 Sep 2022 20:04:59 +0800
Message-Id: <20220929120459.2018-1-luzhipeng@cestc.cn>
X-Mailer: git-send-email 2.34.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 106.39.185.57 (failed)
Received-SPF: pass client-ip=106.39.185.57; envelope-from=luzhipeng@cestc.cn;
 helo=smtp.cecloud.com
X-Spam_score_int: 22
X-Spam_score: 2.2
X-Spam_bar: ++
X-Spam_report: (2.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_SBL_CSS=3.335,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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




