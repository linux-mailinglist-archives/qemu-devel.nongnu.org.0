Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0644635120B
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 11:29:01 +0200 (CEST)
Received: from localhost ([::1]:54680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRtdM-00057R-2H
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 05:29:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lRtbc-0003n8-Sl
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 05:27:12 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:46672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lRtbZ-0000df-9O
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 05:27:12 -0400
Received: by mail-pf1-x42c.google.com with SMTP id x126so976802pfc.13
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 02:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=s1ROoQRiz1dGdLno8ouoW5xDhrvQijY7dLfwVfiERNc=;
 b=QuX5NDryylj9tTYo6zXQBIcOVFgSUBUW22MYhX1yAkjezBRt771Bq2WAnxFrJereeL
 GktW0Dt11Um4u053xzHT/PP6tAGUdFzXadIn3bKkHoknZYabNo3jDlZCAeZ0hp70qR/0
 71HCHQBrxPnflCN+ueLASnHXJe3neWXhyGouC/T1ffIBV/HI4CVoWWkgeJYrP5VleiR0
 OrWzaYMgbv6HmLMyvxEjpuilCjTa8uxW0eaRKRMc/mk0EUHqOluScSdIjoXBIakHtu+t
 Z5Pij/bsFEA3dl8amDWOEijiQz8eqIw1To5aVGOm41kxoez4Ebm09FrhYYyWhRPrt+Jm
 d9bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=s1ROoQRiz1dGdLno8ouoW5xDhrvQijY7dLfwVfiERNc=;
 b=S+Wk4+tVkzvGdYhwR50RNnotlb6oAwi7FVO8ClFaZJRZCcmSR55KX6muqC8vMCmgF7
 XaIIGfUoKA7F3St/OxtwDJZ2P/yhd8XMzxdb8wn9+x7pofdc29HLCoNPgtTW/1CLmu9S
 4sPAY/0S4BJpUjS2G143xEXK/BUNAdUeU1RupZWylYfl9W0YUPI5ooST0RUFuP+FCqkg
 8aScZAnViT1Ls/rHWWr8lb8gy5xPrvF0mi+F/qdZnm6m6SeaeQ2z46rkV8MKk5ErWMeH
 SmtZThxGgTadUrKbR6VrpbWCenhil/3i9YeNsli9XEdYFOZ8QIW74HSl3ngLcife24/y
 AHbQ==
X-Gm-Message-State: AOAM533jNAPQDNUqBYpxg9Y6nLblAM70O+oytrl+4+GkSgPnKSSds1eB
 Hmp5ZOFs+0D47TiSmDba9osckNPREOp/cTRL
X-Google-Smtp-Source: ABdhPJwXCHXaMsbA/KNtd8Gb2rbNTK/6Vzjv5NVNqJhx63zCVuX8iCAACQ/I2VzK8TRHt59Vvt1XLQ==
X-Received: by 2002:a65:654e:: with SMTP id a14mr6691734pgw.328.1617269227635; 
 Thu, 01 Apr 2021 02:27:07 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id i7sm4751319pgq.16.2021.04.01.02.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 02:27:07 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC v2 1/4] target/riscv: add RNMI cpu feature
Date: Thu,  1 Apr 2021 17:26:48 +0800
Message-Id: <20210401092659.12014-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210401092659.12014-1-frank.chang@sifive.com>
References: <20210401092659.12014-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 hw/riscv/riscv_hart.c         |  8 +++++++
 include/hw/riscv/riscv_hart.h |  2 ++
 target/riscv/cpu.c            | 40 +++++++++++++++++++++++++++++++++++
 target/riscv/cpu.h            | 12 ++++++++++-
 target/riscv/cpu_bits.h       |  6 ++++++
 5 files changed, 67 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
index 613ea2aaa0b..b8cb5088638 100644
--- a/hw/riscv/riscv_hart.c
+++ b/hw/riscv/riscv_hart.c
@@ -33,6 +33,10 @@ static Property riscv_harts_props[] = {
     DEFINE_PROP_STRING("cpu-type", RISCVHartArrayState, cpu_type),
     DEFINE_PROP_UINT64("resetvec", RISCVHartArrayState, resetvec,
                        DEFAULT_RSTVEC),
+    DEFINE_PROP_UINT64("rnmi_irqvec", RISCVHartArrayState, rnmi_irqvec,
+                       DEFAULT_RNMI_IRQVEC),
+    DEFINE_PROP_UINT64("rnmi_excpvec", RISCVHartArrayState, rnmi_excpvec,
+                       DEFAULT_RNMI_EXCPVEC),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -47,6 +51,10 @@ static bool riscv_hart_realize(RISCVHartArrayState *s, int idx,
 {
     object_initialize_child(OBJECT(s), "harts[*]", &s->harts[idx], cpu_type);
     qdev_prop_set_uint64(DEVICE(&s->harts[idx]), "resetvec", s->resetvec);
+    qdev_prop_set_uint64(DEVICE(&s->harts[idx]), "rnmi_irqvec",
+                                s->rnmi_irqvec);
+    qdev_prop_set_uint64(DEVICE(&s->harts[idx]), "rnmi_excpvec",
+                                s->rnmi_excpvec);
     s->harts[idx].env.mhartid = s->hartid_base + idx;
     qemu_register_reset(riscv_harts_cpu_reset, &s->harts[idx]);
     return qdev_realize(DEVICE(&s->harts[idx]), NULL, errp);
diff --git a/include/hw/riscv/riscv_hart.h b/include/hw/riscv/riscv_hart.h
index bbc21cdc9a6..48e6730d832 100644
--- a/include/hw/riscv/riscv_hart.h
+++ b/include/hw/riscv/riscv_hart.h
@@ -38,6 +38,8 @@ struct RISCVHartArrayState {
     uint32_t hartid_base;
     char *cpu_type;
     uint64_t resetvec;
+    uint64_t rnmi_irqvec;
+    uint64_t rnmi_excpvec;
     RISCVCPU *harts;
 };
 
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7d6ed80f6b6..9fb6ceb0ad8 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -137,6 +137,14 @@ static void set_feature(CPURISCVState *env, int feature)
     env->features |= (1ULL << feature);
 }
 
+static void set_rnmi_vectors(CPURISCVState *env, int irqvec, int excpvec)
+{
+#ifndef CONFIG_USER_ONLY
+    env->rnmi_irqvec = irqvec;
+    env->rnmi_excpvec = excpvec;
+#endif
+}
+
 static void set_resetvec(CPURISCVState *env, int resetvec)
 {
 #ifndef CONFIG_USER_ONLY
@@ -373,6 +381,23 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
     }
 }
 
+#ifndef CONFIG_USER_ONLY
+static void riscv_cpu_set_rnmi(void *opaque, int irq, int level)
+{
+    RISCVCPU *cpu = opaque;
+    CPURISCVState *env = &cpu->env;
+    CPUState *cs = CPU(cpu);
+
+    if (level) {
+        env->nmip |= 1 << irq;
+        cpu_interrupt(cs, CPU_INTERRUPT_RNMI);
+    } else {
+        env->nmip &= ~(1 << irq);
+        cpu_reset_interrupt(cs, CPU_INTERRUPT_RNMI);
+    }
+}
+#endif
+
 static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
@@ -416,6 +441,16 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 
     set_resetvec(env, cpu->cfg.resetvec);
 
+    if (cpu->cfg.rnmi) {
+        set_feature(env, RISCV_FEATURE_RNMI);
+        set_rnmi_vectors(env, cpu->cfg.rnmi_irqvec, cpu->cfg.rnmi_excpvec);
+#ifndef CONFIG_USER_ONLY
+        env->nmie = true;
+        qdev_init_gpio_in_named(DEVICE(cpu), riscv_cpu_set_rnmi,
+                                "rnmi", TARGET_LONG_BITS);
+#endif
+    }
+
     /* If only XLEN is set for misa, then set misa from properties */
     if (env->misa == RV32 || env->misa == RV64) {
         /* Do some ISA extension error checking */
@@ -555,6 +590,11 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
+    DEFINE_PROP_BOOL("rnmi", RISCVCPU, cfg.rnmi, false),
+    DEFINE_PROP_UINT64("rnmi_irqvec", RISCVCPU, cfg.rnmi_irqvec,
+                       DEFAULT_RNMI_IRQVEC),
+    DEFINE_PROP_UINT64("rnmi_excpvec", RISCVCPU, cfg.rnmi_excpvec,
+                       DEFAULT_RNMI_EXCPVEC),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0a33d387ba8..7d2bb7e7003 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -80,7 +80,8 @@
 enum {
     RISCV_FEATURE_MMU,
     RISCV_FEATURE_PMP,
-    RISCV_FEATURE_MISA
+    RISCV_FEATURE_MISA,
+    RISCV_FEATURE_RNMI,
 };
 
 #define PRIV_VERSION_1_10_0 0x00011000
@@ -178,6 +179,12 @@ struct CPURISCVState {
     target_ulong mcause;
     target_ulong mtval;  /* since: priv-1.10.0 */
 
+    /* NMI */
+    bool nmie;
+    target_ulong nmip;
+    target_ulong rnmi_irqvec;
+    target_ulong rnmi_excpvec;
+
     /* Hypervisor CSRs */
     target_ulong hstatus;
     target_ulong hedeleg;
@@ -304,6 +311,9 @@ struct RISCVCPU {
         bool mmu;
         bool pmp;
         uint64_t resetvec;
+        bool rnmi;
+        uint64_t rnmi_irqvec;
+        uint64_t rnmi_excpvec;
     } cfg;
 };
 
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index caf45992070..8e5f0be599a 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -526,6 +526,12 @@
 /* Default Reset Vector adress */
 #define DEFAULT_RSTVEC      0x1000
 
+/* Default RNMI Interrupt Vector address */
+#define DEFAULT_RNMI_IRQVEC     0x1000
+
+/* Default RNMI Exception Vector address */
+#define DEFAULT_RNMI_EXCPVEC    0x1000
+
 /* Exception causes */
 #define EXCP_NONE                                -1 /* sentinel value */
 #define RISCV_EXCP_INST_ADDR_MIS                 0x0
-- 
2.17.1


