Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3653559204A
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Aug 2022 16:58:10 +0200 (CEST)
Received: from localhost ([::1]:43984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNF44-0006aa-Rh
	for lists+qemu-devel@lfdr.de; Sun, 14 Aug 2022 10:58:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1oNF26-0002Eo-TV
 for qemu-devel@nongnu.org; Sun, 14 Aug 2022 10:56:06 -0400
Received: from mail.xen0n.name ([115.28.160.31]:54606
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1oNF22-0007Oc-Bs
 for qemu-devel@nongnu.org; Sun, 14 Aug 2022 10:56:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
 t=1660488948; bh=7fqqbxSiwMiSghRpfLHiYPLKCY1CYMyCDHuauIcZAKw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qBS+KBezxDdienosyuSGib6/t2haoeLR7NcUUm3t0rtkPpzvodfG6X22PjsHJbwIt
 Zf/CcFs+HwUwSbcaalJNwf9v0vul80LffZFGQmqAWnFYXW1Y0iEpp1G+F4TmlHJQCe
 zPTCligQPabNZiLnc0iwhxDz3EOn6ypcTdas7hik=
Received: from ld50.lan (unknown [101.88.24.16])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 6225A6061B;
 Sun, 14 Aug 2022 22:55:47 +0800 (CST)
From: WANG Xuerui <i.qemu@xen0n.name>
To: qemu-devel@nongnu.org
Cc: WANG Xuerui <i.qemu@xen0n.name>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 WANG Xuerui <git@xen0n.name>
Subject: [PATCH for-7.1 1/4] target/loongarch: Only allow short -cpu arguments
 without type name suffix
Date: Sun, 14 Aug 2022 22:55:19 +0800
Message-Id: <20220814145522.1474927-2-i.qemu@xen0n.name>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814145351.1474753-1-git@xen0n.name>
References: <20220814145351.1474753-1-git@xen0n.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

From: WANG Xuerui <git@xen0n.name>

Previously both "foo" and "foo-loongarch-cpu" are accepted for the -cpu
command-line option, the latter of which being excessively long and
redundant, hence unwanted. Remove support for consistency with other
targets and simpler code.

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 target/loongarch/cpu.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 941e2772bc..dc233ee209 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -573,14 +573,11 @@ static ObjectClass *loongarch_cpu_class_by_name(const char *cpu_model)
 {
     ObjectClass *oc;
 
-    oc = object_class_by_name(cpu_model);
+    g_autofree char *typename = g_strdup_printf(LOONGARCH_CPU_TYPE_NAME("%s"),
+                                                cpu_model);
+    oc = object_class_by_name(typename);
     if (!oc) {
-        g_autofree char *typename 
-            = g_strdup_printf(LOONGARCH_CPU_TYPE_NAME("%s"), cpu_model);
-        oc = object_class_by_name(typename);
-        if (!oc) {
-            return NULL;
-        }
+        return NULL;
     }
 
     if (object_class_dynamic_cast(oc, TYPE_LOONGARCH_CPU)
-- 
2.35.1


