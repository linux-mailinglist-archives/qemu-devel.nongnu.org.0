Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62846460D47
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 04:30:00 +0100 (CET)
Received: from localhost ([::1]:49478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrXMd-0002U2-Be
	for lists+qemu-devel@lfdr.de; Sun, 28 Nov 2021 22:29:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX0I-00070M-KB
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:06:54 -0500
Received: from [2607:f8b0:4864:20::102a] (port=52738
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX0E-0000Zd-E7
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:06:54 -0500
Received: by mail-pj1-x102a.google.com with SMTP id h24so11520337pjq.2
 for <qemu-devel@nongnu.org>; Sun, 28 Nov 2021 19:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iameDzlIZFC5MBedioABTAKKK+y1l970ikbZ8jXbdM0=;
 b=F0lQhXaJkhQ6+KqxdaBhvVTEzy20eiEWaPtJnzAWxRa3tBh7uOkVWBLGdHukWkCbxu
 1bv8mT66Fd66jumgm28o6uoSogYCqcn80QTqN3b9BEZAs+f6xcPZS89Lj/orXiLkVYyV
 QP0B01kIAwdypWJW8qEtINSV3tKYD+P2UPc32Sq1RKR8TUECSM8DpytdaHP5Nm+11ghy
 gjWeeIg3fsuHbkLfI5Wr3pmMrUw/zKpGjCivfNy3K4H1N7M/kZqRnHno9j3zl4urwZEU
 G4fWXghS4wLyK/bQYIpj+oobCk2BS4TPX0iAT6YWMoEnFW+oXnE4BssyWYRubM7uO0d5
 vbFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iameDzlIZFC5MBedioABTAKKK+y1l970ikbZ8jXbdM0=;
 b=dAfDU6uR90qYbIb4aCk8X9gm0feJcCMoIp+ronn+hU5bTU+2+LCQyRSIbOHRgwmUng
 6yCNbQcLCSVMEVPsU8muTWvhCXpZWGvpSPSvcDcf3jXqzV1hJ/A1NuLw8z6YSeLX3emb
 CwCMpOs/lbFaX04FlMWYXlDITzN6URS8/1hLhdhWB75OdUuqxq2Lw4HCuHIyTVC7WR9h
 Rsh8m298rwTvWsgz1p7FYz+B2uVpMNsugLarCuC0ODDBpe2mJ89rWJUz+YF0hiSyLJ+a
 CC9UKObpM2IOyzY/s3Msc3fmWJEG+lvrdb8G7oUytqgWPFjpaYdwChL20ytlr1lMlnQ5
 8fqg==
X-Gm-Message-State: AOAM5325IoErInyThalb4u6hlm+J02XFS1Q3T9UikexarnzBjZZSLyU4
 lm3g4wGeluNoNIWBpj0n+HwBh1062EQiACD+
X-Google-Smtp-Source: ABdhPJxXeb5YCwsH8fLKJrpA9ZIwBsEIqvy+LDXnuPmf8NU4kn8kgLc+TL+k2THXWr917AyEt4aFcA==
X-Received: by 2002:a17:902:f091:b0:143:b72e:c126 with SMTP id
 p17-20020a170902f09100b00143b72ec126mr56169571pla.61.1638155209172; 
 Sun, 28 Nov 2021 19:06:49 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:06:48 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v10 39/77] target/riscv: rvv-1.0: whole register move
 instructions
Date: Mon, 29 Nov 2021 11:02:59 +0800
Message-Id: <20211129030340.429689-40-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


