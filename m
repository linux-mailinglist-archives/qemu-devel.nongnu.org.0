Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEA15C0088
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 16:58:43 +0200 (CEST)
Received: from localhost ([::1]:32856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob1BS-0005e3-Mo
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 10:58:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luzhipeng@cestc.cn>)
 id 1ob0yn-00014a-OU
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 10:45:38 -0400
Received: from [106.39.185.57] (port=45880 helo=smtp.cecloud.com)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luzhipeng@cestc.cn>) id 1ob0yk-0003bj-Eh
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 10:45:37 -0400
Received: from localhost (localhost [127.0.0.1])
 by smtp.cecloud.com (Postfix) with ESMTP id 8FE08FC0203;
 Wed, 21 Sep 2022 22:45:27 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain
 (1.39.88.218.broad.cd.sc.dynamic.163data.com.cn [218.88.39.1])
 by smtp.cecloud.com (postfix) whith ESMTP id
 P51403T281470991921520S1663771526472673_; 
 Wed, 21 Sep 2022 22:45:27 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <bd417a792bb145b1b5cfa71a0d7b43f0>
X-RL-SENDER: luzhipeng@cestc.cn
X-SENDER: luzhipeng@cestc.cn
X-LOGIN-NAME: luzhipeng@cestc.cn
X-FST-TO: qemu-devel@nongnu.org
X-RCPT-COUNT: 4
X-SENDER-IP: 218.88.39.1
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: luzhipeng <luzhipeng@cestc.cn>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 lu zhipeng <luzhipeng@cestc.cn>
Subject: [PATCH] qcow2: fix memory leak in qcow2_read_extensions
Date: Wed, 21 Sep 2022 22:45:15 +0800
Message-Id: <20220921144515.1166-1-luzhipeng@cestc.cn>
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

Free feature_table if it is failed in bdrv_pread.

Signed-off-by: lu zhipeng <luzhipeng@cestc.cn>
---
 block/qcow2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/qcow2.c b/block/qcow2.c
index c6c6692fb7..c8fc3a6160 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -275,6 +275,7 @@ static int qcow2_read_extensions(BlockDriverState *bs, uint64_t start_offset,
                 if (ret < 0) {
                     error_setg_errno(errp, -ret, "ERROR: ext_feature_table: "
                                      "Could not read table");
+                    g_free(feature_table);
                     return ret;
                 }
 
-- 
2.31.1




