Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AF2527515
	for <lists+qemu-devel@lfdr.de>; Sun, 15 May 2022 04:59:58 +0200 (CEST)
Received: from localhost ([::1]:58928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nq4U9-0000q1-02
	for lists+qemu-devel@lfdr.de; Sat, 14 May 2022 22:59:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1nq4Qr-0003fq-OL; Sat, 14 May 2022 22:56:33 -0400
Received: from mail-sender.a4lg.com ([153.120.152.154]:53433
 helo=mail-sender-0.a4lg.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1nq4Qq-0005It-8I; Sat, 14 May 2022 22:56:33 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id 0F355300089;
 Sun, 15 May 2022 02:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1652583390;
 bh=iBuz9s2lVnC1Qr79+mx564AyUY+YXnNGXVW4c6ve6F8=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 Mime-Version:Content-Transfer-Encoding;
 b=HD5dv8367S4x4ScTO4akMsL0tm4Sf/O2Bo15zN5F1fYMScSs7RY+Xw4StYyCnEGLB
 I1PJqUvRJCrO0mMdJujvO9jveRbIe/fJhWu5dVbVjf2U6XzHb0d4qH01Vlp55AxFxs
 FCkwa09siK5Ho3mona0L7QQkcc8PtUl0LhE9JK4Q=
From: Tsukasa OI <research_trasio@irq.a4lg.com>
To: Tsukasa OI <research_trasio@irq.a4lg.com>,
 Alistair Francis <alistair23@gmail.com>,
 Frank Chang <frank.chang@sifive.com>
Cc: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v2 2/5] target/riscv: Disable "G" by default
Date: Sun, 15 May 2022 11:56:08 +0900
Message-Id: <cab7205f1d7668f642fa242386543334af6bc1bd.1652583332.git.research_trasio@irq.a4lg.com>
In-Reply-To: <cover.1652583332.git.research_trasio@irq.a4lg.com>
References: <cover.1652435138.git.research_trasio@irq.a4lg.com>
 <cover.1652583332.git.research_trasio@irq.a4lg.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=153.120.152.154;
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

Because "G" virtual extension expands to "IMAFD", we cannot separately
disable extensions like "F" or "D" without disabling "G".  Because all
"IMAFD" are enabled by default, it's harmless to disable "G" by default.

Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
---
 target/riscv/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 00bf26ec8b..3ea68d5cd7 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -812,7 +812,7 @@ static Property riscv_cpu_properties[] = {
     /* Defaults for standard extensions */
     DEFINE_PROP_BOOL("i", RISCVCPU, cfg.ext_i, true),
     DEFINE_PROP_BOOL("e", RISCVCPU, cfg.ext_e, false),
-    DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, true),
+    DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
     DEFINE_PROP_BOOL("m", RISCVCPU, cfg.ext_m, true),
     DEFINE_PROP_BOOL("a", RISCVCPU, cfg.ext_a, true),
     DEFINE_PROP_BOOL("f", RISCVCPU, cfg.ext_f, true),
-- 
2.34.1


