Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D2C313943
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 17:24:50 +0100 (CET)
Received: from localhost ([::1]:45786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l99LF-0005lf-Cn
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 11:24:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9338-00016p-HW; Mon, 08 Feb 2021 04:41:50 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:37344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l932o-0000iV-Nd; Mon, 08 Feb 2021 04:41:38 -0500
Received: by mail-ej1-x631.google.com with SMTP id jj19so23550126ejc.4;
 Mon, 08 Feb 2021 01:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=cA5gWcViYoDieZafUy6aPTnopaNU4U3VgWHUxwk9xsc=;
 b=JHucsP7MFEEBQuXa9E83DT42+lpBsK1O6LitLKxWoOyV4zqWkkNQtEfBqK1QsU45f3
 dJho9jObTzOXS3o+ESLz/Lo1IjqOLQobESso+5MLHslhq5ND+9tWW1Qt0Ll7T5UBZAAW
 yugMQcobq1l4yfstlusrThj710pbo57gWu/m08FbcjOoXMJoTI+m/Ss8IsSBvxuxkHAI
 S/92c72z+zGJ/YlE7HOqgv+Rte+XDo7p2X5SNgTkHiwy+j9bCT7Y3e9HKbBvSqQy6ncZ
 96t/xjRfIgjOCscBXnXNrr5TF9WBnl/1rGzISp/srD6vH3HYnELXASHpJuWwHqMpyo4c
 frUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=cA5gWcViYoDieZafUy6aPTnopaNU4U3VgWHUxwk9xsc=;
 b=IR6d8rxyeoxpKdFd8paGWlhphugIKlzDgR4Egvwhb+SLT45S8srFrW4eAhV3FpaRwg
 d+mBUClBvK3y3wq3qzw0QlR6Rc/6ulAZ0ZSPerSfDmAZ6g25xkR514mpvOPIJ2ZMg2yZ
 ZHLiRs8Vv5pjFl5Z/llsV7+zK0wp+xPMk4jvAYfZDHljjzFcwzG+dkt3qtOCsSuqZW5y
 U8PYRMZkWNUXQ6LgvDknuAJK5Dg/EGOopEuJLUcdTCDqWjSzSQZf4zizQ2D65PbqUl34
 hZoPBwZIbwSuNN7dcC3Zal5XNh3RKJMgL0k5+UXs2/xnRYTJfvwAMTC4FFQ9fQJt15I0
 jtiQ==
X-Gm-Message-State: AOAM533LSFch898zFbzm1Xbz2+u0llEOdq8BRNezYlPjXjDu66RMDufr
 8A1CYTyAFUXVZtvwe9i2GTY=
X-Google-Smtp-Source: ABdhPJw6XXMPFxPuUkV1Yn0B/XAx7h9owqiIX+XYqNQIVaRwRMzNeSyQIyonXLRyf5kvdc/GC1kUNA==
X-Received: by 2002:a17:906:1b11:: with SMTP id
 o17mr5638356ejg.295.1612777270030; 
 Mon, 08 Feb 2021 01:41:10 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id r9sm8168400eju.74.2021.02.08.01.41.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Feb 2021 01:41:09 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	Greg Kurz <groug@kaod.org>
Subject: [PATCH] target/ppc: Add E500 L2CSR0 write helper
Date: Mon,  8 Feb 2021 17:40:58 +0800
Message-Id: <1612777258-23354-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Bin Meng <bin.meng@windriver.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

There are several bits in L2CSR0 (exists in the e500mc/e5500/e6500
core) that should be self-cleared when written:

- L2FI  (L2 cache flash invalidate)
- L2FL  (L2 cache flush)
- L2LFC (L2 cache lock flash clear)

Add a write helper to emulate this behavior.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 target/ppc/cpu.h                |  6 ++++++
 target/ppc/translate_init.c.inc | 16 ++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 2609e40..e77911a 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1919,6 +1919,7 @@ typedef PowerPCCPU ArchCPU;
 #define SPR_750FX_HID2        (0x3F8)
 #define SPR_Exxx_L1FINV0      (0x3F8)
 #define SPR_L2CR              (0x3F9)
+#define SPR_Exxx_L2CSR0       (0x3F9)
 #define SPR_L3CR              (0x3FA)
 #define SPR_750_TDCH          (0x3FA)
 #define SPR_IABR2             (0x3FA)
@@ -1974,6 +1975,11 @@ typedef PowerPCCPU ArchCPU;
 #define   L1CSR1_ICFI   0x00000002  /* Instruction Cache Flash Invalidate */
 #define   L1CSR1_ICE    0x00000001  /* Instruction Cache Enable */
 
+/* E500 L2CSR0 */
+#define E500_L2CSR0_L2FI    (1 << 21)   /* L2 cache flash invalidate */
+#define E500_L2CSR0_L2FL    (1 << 11)   /* L2 cache flush */
+#define E500_L2CSR0_L2LFC   (1 << 10)   /* L2 cache lock flash clear */
+
 /* HID0 bits */
 #define HID0_DEEPNAP        (1 << 24)           /* pre-2.06 */
 #define HID0_DOZE           (1 << 23)           /* pre-2.06 */
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index 9867d0a..3ec45cb 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -1735,6 +1735,16 @@ static void spr_write_e500_l1csr1(DisasContext *ctx, int sprn, int gprn)
     tcg_temp_free(t0);
 }
 
+static void spr_write_e500_l2csr0(DisasContext *ctx, int sprn, int gprn)
+{
+    TCGv t0 = tcg_temp_new();
+
+    tcg_gen_andi_tl(t0, cpu_gpr[gprn],
+                    ~(E500_L2CSR0_L2FI | E500_L2CSR0_L2FL | E500_L2CSR0_L2LFC));
+    gen_store_spr(sprn, t0);
+    tcg_temp_free(t0);
+}
+
 static void spr_write_booke206_mmucsr0(DisasContext *ctx, int sprn, int gprn)
 {
     gen_helper_booke206_tlbflush(cpu_env, cpu_gpr[gprn]);
@@ -5029,6 +5039,12 @@ static void init_proc_e500(CPUPPCState *env, int version)
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_e500_l1csr1,
                  0x00000000);
+    if (version != fsl_e500v1 && version != fsl_e500v2) {
+        spr_register(env, SPR_Exxx_L2CSR0, "L2CSR0",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_e500_l2csr0,
+                     0x00000000);
+    }
     spr_register(env, SPR_BOOKE_MCSRR0, "MCSRR0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
-- 
2.7.4


