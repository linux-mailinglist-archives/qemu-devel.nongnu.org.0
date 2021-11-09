Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E735944AE1B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 13:54:13 +0100 (CET)
Received: from localhost ([::1]:50514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkQdg-0002k3-Nj
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 07:54:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mkQc7-0000Hf-Fw
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 07:52:35 -0500
Received: from mail.loongson.cn ([114.242.206.163]:37720 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mkQc4-0006KD-7B
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 07:52:35 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Cx+dD5bophXJYBAA--.3628S6;
 Tue, 09 Nov 2021 20:52:17 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/30] target/loongarch: Define exceptions for LoongArch.
Date: Tue,  9 Nov 2021 20:51:43 +0800
Message-Id: <1636462329-1716-5-git-send-email-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1636462329-1716-1-git-send-email-yangxiaojuan@loongson.cn>
References: <1636462329-1716-1-git-send-email-yangxiaojuan@loongson.cn>
X-CM-TRANSID: AQAAf9Cx+dD5bophXJYBAA--.3628S6
X-Coremail-Antispam: 1UD129KBjvJXoW7AFWxZw15Jry8tFW5ZFWxtFb_yoW8Aw1xpr
 nrZr13tw4jqa9Iywn5Zr10qFnxXr18Gr47uan3Jry7ursIqryIqF1ktasxtFn8Way5AF1I
 vr1rAr1xuF48WwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, philmd@redhat.com,
 i.qemu@xen0n.name, richard.henderson@linaro.org, laurent@vivier.eu,
 peterx@redhat.com, f4bug@amsat.org, yangxiaojuan@loongson.cn,
 alistair.francis@wdc.com, maobibo@loongson.cn, gaosong@loongson.cn,
 pbonzini@redhat.com, mark.cave-ayland@ilande.co.uk, chenhuacai@loongson.cn,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch introduces all possible exceptions.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/cpu.c | 13 +++++++++++++
 target/loongarch/cpu.h | 17 +++++++++++++++--
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index a53c8ebfb5..16443159cc 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -37,6 +37,19 @@ static const char * const excp_names[EXCP_LAST + 1] = {
     [EXCP_BREAK] = "Break",
     [EXCP_INE] = "Instruction Non-existent",
     [EXCP_FPE] = "Floating Point Exception",
+    [EXCP_IPE] = "Error privilege level access",
+    [EXCP_TLBL] = "TLB load",
+    [EXCP_TLBS] = "TLB store",
+    [EXCP_INST_NOTAVAIL] = "TLB inst not exist",
+    [EXCP_TLBM] = "TLB modify",
+    [EXCP_TLBPE] = "TLB priviledged error",
+    [EXCP_TLBNX] = "TLB execute-inhibit",
+    [EXCP_TLBNR] = "TLB read-inhibit",
+    [EXCP_EXT_INTERRUPT] = "Interrupt",
+    [EXCP_DBP] = "Debug breakpoint",
+    [EXCP_IBE] = "Instruction bus error",
+    [EXCP_DBE] = "Data bus error",
+    [EXCP_DINT] = "Debug interrupt",
 };
 
 const char *loongarch_exception_name(int32_t exception)
diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index 10fcd53104..399c4cb5e8 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -369,8 +369,21 @@ enum {
     EXCP_BREAK,
     EXCP_INE,
     EXCP_FPE,
-
-    EXCP_LAST = EXCP_FPE,
+    EXCP_IPE,
+    EXCP_TLBL,
+    EXCP_TLBS,
+    EXCP_INST_NOTAVAIL,
+    EXCP_TLBM,
+    EXCP_TLBPE,
+    EXCP_TLBNX,
+    EXCP_TLBNR,
+    EXCP_EXT_INTERRUPT,
+    EXCP_DBP,
+    EXCP_IBE,
+    EXCP_DBE,
+    EXCP_DINT,
+
+    EXCP_LAST = EXCP_DINT,
 };
 
 #define LOONGARCH_CPU_TYPE_SUFFIX "-" TYPE_LOONGARCH_CPU
-- 
2.27.0


