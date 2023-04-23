Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D9E6EBF1C
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 13:21:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqXlB-0006rX-0z; Sun, 23 Apr 2023 07:20:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangliangzz@126.com>)
 id 1pqXl8-0006rG-4e; Sun, 23 Apr 2023 07:19:58 -0400
Received: from m126.mail.126.com ([220.181.12.36])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wangliangzz@126.com>)
 id 1pqXl4-0001TI-A2; Sun, 23 Apr 2023 07:19:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=ebl07
 GebzCOVDDhGD98t3Ddps69egG12kzEc6uWERm4=; b=GW7qsoNL7G/qJofc4kZtn
 bOdoLX3SIGP/X4oacsowWipvNlod05qGjUVt4q7VPqljycwtSc2WET4h0xdQsE33
 lYA9EUHvL8rBEgcTrxoVx2Gqm6M7o9TKy8P+6eQdYpG4a/gSe+k4kOJ1IXI7iBWQ
 mEyP+nufJ69Lom+W00kCLQ=
Received: from localhost.localdomain (unknown [171.15.162.83])
 by zwqz-smtp-mta-g1-1 (Coremail) with SMTP id _____wA3DbBmEEVknegnBg--.6289S4; 
 Sun, 23 Apr 2023 19:03:03 +0800 (CST)
From: wangliangzz@126.com
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	wangliangzz@126.com
Cc: kwolf@redhat.com, hreitz@redhat.com, eesposit@redhat.com,
 Wang Liang <wangliangzz@inspur.com>
Subject: [PATCH] block/monitor/block-hmp-cmds.c: Fix crash when execute
 hmp_commit
Date: Sun, 23 Apr 2023 19:02:54 +0800
Message-Id: <20230423110254.35672-1-wangliangzz@126.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wA3DbBmEEVknegnBg--.6289S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7JF1rCryUKr1DZF1DAr1fJFb_yoWkCFb_Ga
 18XFZ3X39FvFWSkrsFyFn8ArWrt3y3Cr4ftFs8Ka93WFW8t3Z7Krn7JrnIvFy5XF4Uuas3
 Jr4kZF1DZwnrujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUgdb5UUUUU==
X-Originating-IP: [171.15.162.83]
X-CM-SenderInfo: pzdqwzpldqw6b26rjloofrz/1tbiJBpa1lpEHeikggABs+
Received-SPF: pass client-ip=220.181.12.36; envelope-from=wangliangzz@126.com;
 helo=m126.mail.126.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Wang Liang <wangliangzz@inspur.com>

We need to get the aio_context before calling the blk_is_available.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1615
Signed-off-by: Wang Liang <wangliangzz@inspur.com>
---
 block/monitor/block-hmp-cmds.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/block/monitor/block-hmp-cmds.c b/block/monitor/block-hmp-cmds.c
index 2846083546..ca2599de44 100644
--- a/block/monitor/block-hmp-cmds.c
+++ b/block/monitor/block-hmp-cmds.c
@@ -214,15 +214,17 @@ void hmp_commit(Monitor *mon, const QDict *qdict)
             error_report("Device '%s' not found", device);
             return;
         }
-        if (!blk_is_available(blk)) {
-            error_report("Device '%s' has no medium", device);
-            return;
-        }
 
         bs = bdrv_skip_implicit_filters(blk_bs(blk));
         aio_context = bdrv_get_aio_context(bs);
         aio_context_acquire(aio_context);
 
+        if (!blk_is_available(blk)) {
+            error_report("Device '%s' has no medium", device);
+            aio_context_release(aio_context);
+            return;
+        }
+
         ret = bdrv_commit(bs);
 
         aio_context_release(aio_context);
-- 
2.27.0


