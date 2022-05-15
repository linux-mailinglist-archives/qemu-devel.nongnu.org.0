Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1312527517
	for <lists+qemu-devel@lfdr.de>; Sun, 15 May 2022 05:03:34 +0200 (CEST)
Received: from localhost ([::1]:35552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nq4Xd-0004FV-Q8
	for lists+qemu-devel@lfdr.de; Sat, 14 May 2022 23:03:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1nq4R2-0003ze-W2; Sat, 14 May 2022 22:56:45 -0400
Received: from mail-sender-0.a4lg.com
 ([2401:2500:203:30b:4000:6bfe:4757:0]:48462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1nq4R1-0005KD-AV; Sat, 14 May 2022 22:56:44 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id 21754300089;
 Sun, 15 May 2022 02:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1652583401;
 bh=Jfqqtmoi2WLwrqHF9zHmJg4Q/zSEG+Ag6cz00WwP6Ug=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 Mime-Version:Content-Transfer-Encoding;
 b=G+0xJZkBVqrFrHK6GT9kD0wYLqQ90LyPfPSh/eKlCHyGdow53iJwQ3xuxfpdhOPxU
 GklQ+2riCe0sSNCXLEe71Bv/zM4dfGTS7W7YhEGCL3EwEl8nQsByP3sfLbOJANKc6m
 In3tQZ5NV7sNRirAYvPM8IZhEZHU86tHmCLfR2AY=
From: Tsukasa OI <research_trasio@irq.a4lg.com>
To: Tsukasa OI <research_trasio@irq.a4lg.com>,
 Alistair Francis <alistair23@gmail.com>,
 Frank Chang <frank.chang@sifive.com>
Cc: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v2 4/5] target/riscv: FP extension requirements
Date: Sun, 15 May 2022 11:56:10 +0900
Message-Id: <00e7b1c6060dab32ac7d49813b1ca84d3eb63298.1652583332.git.research_trasio@irq.a4lg.com>
In-Reply-To: <cover.1652583332.git.research_trasio@irq.a4lg.com>
References: <cover.1652435138.git.research_trasio@irq.a4lg.com>
 <cover.1652583332.git.research_trasio@irq.a4lg.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:2500:203:30b:4000:6bfe:4757:0;
 envelope-from=research_trasio@irq.a4lg.com; helo=mail-sender-0.a4lg.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU allowed inconsistent configurations that made floating point
arithmetic effectively unusable.

This commit adds certain checks for consistent FP arithmetic:

-   F requires Zicsr
-   Zfinx requires Zicsr
-   Zfh/Zfhmin require F
-   D requires F
-   V requires D

Because F/D/Zicsr are enabled by default (and an error will not occur unless
we manually disable one or more of prerequisites), this commit just enforces
the user to give consistent combinations.

Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
---
 target/riscv/cpu.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 0854ca9103..f910a41407 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -610,11 +610,36 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             cpu->cfg.ext_ifencei = true;
         }
 
+        if (cpu->cfg.ext_f && !cpu->cfg.ext_icsr) {
+            error_setg(errp, "F extension requires Zicsr");
+            return;
+        }
+
+        if ((cpu->cfg.ext_zfh || cpu->cfg.ext_zfhmin) && !cpu->cfg.ext_f) {
+            error_setg(errp, "Zfh/Zfhmin extensions require F extension");
+            return;
+        }
+
+        if (cpu->cfg.ext_d && !cpu->cfg.ext_f) {
+            error_setg(errp, "D extension requires F extension");
+            return;
+        }
+
+        if (cpu->cfg.ext_v && !cpu->cfg.ext_d) {
+            error_setg(errp, "V extension requires D extension");
+            return;
+        }
+
         if (cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinx ||
             cpu->cfg.ext_zhinxmin) {
             cpu->cfg.ext_zfinx = true;
         }
 
+        if (cpu->cfg.ext_zfinx && !cpu->cfg.ext_icsr) {
+            error_setg(errp, "Zfinx extension requires Zicsr");
+            return;
+        }
+
         if (cpu->cfg.ext_zk) {
             cpu->cfg.ext_zkn = true;
             cpu->cfg.ext_zkr = true;
-- 
2.34.1


