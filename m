Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8F243FA61
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 12:01:11 +0200 (CEST)
Received: from localhost ([::1]:48356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgOhC-0003tx-J5
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 06:01:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNmD-0006pm-VE
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 05:02:17 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:55116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNly-000688-7g
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 05:02:15 -0400
Received: by mail-pj1-x1033.google.com with SMTP id np13so6745101pjb.4
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 02:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iameDzlIZFC5MBedioABTAKKK+y1l970ikbZ8jXbdM0=;
 b=PaNXJPzbMaSLzDVlfXImvtsS38css70TC/W44eeCiKqvA2w3qa9EJhDLfdm8DZBQHC
 w5F0drL/wf9Y9FoDHdjjnifugNdzLmcxf6EfLrAM+p5PNQgdazSiQpW8LVVzEjC4CYLm
 BgD/6R8xbDGZDuey5XeDK2HreeOiLTDkWhKBK50yny1thBUyrUAYVP215JfCuEAuKA1Y
 Qtv88dUK95VGNzWg1+3JqcnrVYE54RqWWePJIk9NSvkYt9AaOdrvnu3L5vZRH3422FUP
 IXiWpBO0qmBDPZRG4axwtCbXCcQsJaEo+YYUOpnULUfrk+B2JzhGWTrMddkugD0In7Gx
 5qCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iameDzlIZFC5MBedioABTAKKK+y1l970ikbZ8jXbdM0=;
 b=HSva5IB7eBS07F7ZCF3Ie8/gO9Dg7usDsbTjzolYagC4LVuGqpLMgHFinC8L1AteA1
 JKcnFmYMaQIBwPD1WhIfEbaMm+POvXrSR73G9KI9WLl5/RNyBQLMrKQ4x925Ekv5GbWk
 iH3E501P9wPxCg+McE5NapL0DTarCwvww/ZFf5J+JUA+CjBkn4wiKh1SPDyCMyRwgqo/
 EsnAgmt1tYVx855TnkaAf5nBOjyQnpLtgpMvDt43l8be2pE/Z0P0PIgdI9BVAB4FI6yF
 9NPKN/ZbP3nk6zRQOVvJ3PhQuYPpXU9JZlhS194uFTeDNJZMqMM8CdzsQpzDSEKL+ct9
 GfvA==
X-Gm-Message-State: AOAM5301PJXqraA++WdTNg9anxhpH3tGj4q5Qmm4UoHnhh6wnULCjX3P
 n/cGOj1Mq68Aw/lGrR5lWQDgN0MGOAVzMr42
X-Google-Smtp-Source: ABdhPJycdKKpYnAg5GyJ9Q20+bSQF7sf/XG1avpahLo89N3zR0t7LjLti+r3QQrA9H2LUZtTKCwbKw==
X-Received: by 2002:a17:90a:5992:: with SMTP id
 l18mr18139670pji.127.1635498120881; 
 Fri, 29 Oct 2021 02:02:00 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:02:00 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v9 39/76] target/riscv: rvv-1.0: whole register move
 instructions
Date: Fri, 29 Oct 2021 16:58:44 +0800
Message-Id: <20211029085922.255197-40-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Add the following instructions:

* vmv1r.v
* vmv2r.v
* vmv4r.v
* vmv8r.v

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode              |  4 ++++
 target/riscv/insn_trans/trans_rvv.c.inc | 25 +++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index ab5fdbf9be8..06a80763112 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -650,6 +650,10 @@ vrgatherei16_vv 001110 . ..... ..... 000 ..... 1010111 @r_vm
 vrgather_vx     001100 . ..... ..... 100 ..... 1010111 @r_vm
 vrgather_vi     001100 . ..... ..... 011 ..... 1010111 @r_vm
 vcompress_vm    010111 - ..... ..... 010 ..... 1010111 @r
+vmv1r_v         100111 1 ..... 00000 011 ..... 1010111 @r2rd
+vmv2r_v         100111 1 ..... 00001 011 ..... 1010111 @r2rd
+vmv4r_v         100111 1 ..... 00011 011 ..... 1010111 @r2rd
+vmv8r_v         100111 1 ..... 00111 011 ..... 1010111 @r2rd
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 89f88a0ea70..91e7c14ec44 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3259,3 +3259,28 @@ static bool trans_vcompress_vm(DisasContext *s, arg_r *a)
     }
     return false;
 }
+
+/*
+ * Whole Vector Register Move Instructions ignore vtype and vl setting.
+ * Thus, we don't need to check vill bit. (Section 16.6)
+ */
+#define GEN_VMV_WHOLE_TRANS(NAME, LEN)                          \
+static bool trans_##NAME(DisasContext *s, arg_##NAME * a)       \
+{                                                               \
+    if (require_rvv(s) &&                                       \
+        QEMU_IS_ALIGNED(a->rd, LEN) &&                          \
+        QEMU_IS_ALIGNED(a->rs2, LEN)) {                         \
+        /* EEW = 8 */                                           \
+        tcg_gen_gvec_mov(MO_8, vreg_ofs(s, a->rd),              \
+                         vreg_ofs(s, a->rs2),                   \
+                         s->vlen / 8 * LEN, s->vlen / 8 * LEN); \
+        mark_vs_dirty(s);                                       \
+        return true;                                            \
+    }                                                           \
+    return false;                                               \
+}
+
+GEN_VMV_WHOLE_TRANS(vmv1r_v, 1)
+GEN_VMV_WHOLE_TRANS(vmv2r_v, 2)
+GEN_VMV_WHOLE_TRANS(vmv4r_v, 4)
+GEN_VMV_WHOLE_TRANS(vmv8r_v, 8)
-- 
2.25.1


