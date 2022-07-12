Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8481A5714AA
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 10:32:42 +0200 (CEST)
Received: from localhost ([::1]:33966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBBJx-0002v2-Gj
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 04:32:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1oBAq9-0003Ob-0m
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 04:01:59 -0400
Received: from mail.loongson.cn ([114.242.206.163]:57094 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1oBAq6-0001RL-NT
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 04:01:52 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_9JdKs1i3NgYAA--.15429S5; 
 Tue, 12 Jul 2022 16:01:35 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, f4bug@amsat.org, peter.maydell@linaro.org
Subject: [PATCH 3/5] target/loongarch/cpu: Fix coverity errors about excp_names
Date: Tue, 12 Jul 2022 16:01:31 +0800
Message-Id: <20220712080133.4176971-4-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220712080133.4176971-1-yangxiaojuan@loongson.cn>
References: <20220712080133.4176971-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx_9JdKs1i3NgYAA--.15429S5
X-Coremail-Antispam: 1UD129KBjvJXoWruFyrury7uFW7ZryxWw17KFg_yoW8JF1xpF
 sFvr9FgryfJrWDZw1kJayYqrn8Xw43GFn2ga1SkFyrtr1Sqr92vF1vqa9YvF15J397XrWU
 uF4fAryFq3W5XaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
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

Fix out-of-bounds errors when access excp_names[] array. the valid
boundary size of excp_names should be 0 to ARRAY_SIZE(excp_names)-1.
However, the general code do not consider the max boundary.

Fix coverity CID: 1489758

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 target/loongarch/cpu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 8294b05ee8..8e17b61a85 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -140,7 +140,7 @@ static void loongarch_cpu_do_interrupt(CPUState *cs)
 
     if (cs->exception_index != EXCCODE_INT) {
         if (cs->exception_index < 0 ||
-            cs->exception_index > ARRAY_SIZE(excp_names)) {
+            cs->exception_index >= ARRAY_SIZE(excp_names)) {
             name = "unknown";
         } else {
             name = excp_names[cs->exception_index];
@@ -190,8 +190,8 @@ static void loongarch_cpu_do_interrupt(CPUState *cs)
         cause = cs->exception_index;
         break;
     default:
-        qemu_log("Error: exception(%d) '%s' has not been supported\n",
-                 cs->exception_index, excp_names[cs->exception_index]);
+        qemu_log("Error: exception(%d) has not been supported\n",
+                 cs->exception_index);
         abort();
     }
 
-- 
2.31.1


