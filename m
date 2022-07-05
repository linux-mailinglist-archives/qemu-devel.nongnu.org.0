Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3A2566386
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 09:07:21 +0200 (CEST)
Received: from localhost ([::1]:56212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8ceW-0000rT-NP
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 03:07:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1o8cXJ-0005Pf-Vw
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 02:59:54 -0400
Received: from mail.loongson.cn ([114.242.206.163]:60008 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1o8cXI-0006U1-0l
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 02:59:53 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj+Nf4cNiOfsJAA--.30074S3; 
 Tue, 05 Jul 2022 14:59:43 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, laurent@vivier.eu, yangxiaojuan@loongson.cn
Subject: [PATCH] tcg/tci: Fix enable-debug got an error
Date: Tue,  5 Jul 2022 14:59:43 +0800
Message-Id: <20220705065943.2353930-2-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220705065943.2353930-1-gaosong@loongson.cn>
References: <20220705065943.2353930-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxj+Nf4cNiOfsJAA--.30074S3
X-Coremail-Antispam: 1UD129KBjvJXoW7uF1kur4ftw1xuF4rKFy3Jwb_yoW8XFyUpa
 y8J3WqkFyrJ3yUAwsxZFW8K34UJrnYk3WUC3Z7Gw10vwnFqFWFvw4Yyw43Wr1xXFWUta1F
 vF929F1YgFWDJaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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

When building tcg configure with --enable-tcg-interpreter and --enable-debug,
We may got an error:

In file included from ../tcg/tcg.c:432:
/root/code/github/soft-qemu/qemu/tcg/tci/tcg-target.c.inc: In function 'tcg_target_init':
/root/code/github/soft-qemu/qemu/tcg/tci/tcg-target.c.inc:829:9: error: too few arguments to function 'qemu_set_log'
  829 |         qemu_set_log(strtol(envval, NULL, 0));
      |         ^~~~~~~~~~~~
In file included from /root/code/github/soft-qemu/qemu/include/exec/log.h:4,
                 from ../tcg/tcg.c:61:
/root/code/github/soft-qemu/qemu/include/qemu/log.h:84:6: note: declared here
   84 | bool qemu_set_log(int log_flags, Error **errp);
      |      ^~~~~~~~~~~~

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 tcg/tci/tcg-target.c.inc | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 98337c567a..b7c41fe6c3 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -824,9 +824,15 @@ static void tcg_out_nop_fill(tcg_insn_unit *p, int count)
 static void tcg_target_init(TCGContext *s)
 {
 #if defined(CONFIG_DEBUG_TCG_INTERPRETER)
+    Error *err = NULL;
     const char *envval = getenv("DEBUG_TCG");
     if (envval) {
-        qemu_set_log(strtol(envval, NULL, 0));
+        if (qemu_set_log(strtol(envval, NULL, 0), &err)) {
+            error_report("DEBUG_TCG got an errr, envval %s", envval);
+        }
+        if (err) {
+            g_error_free(err);
+        }
     }
 #endif
 
-- 
2.31.1


