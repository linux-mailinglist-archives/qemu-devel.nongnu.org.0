Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C907325C20
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 04:48:21 +0100 (CET)
Received: from localhost ([::1]:32878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFU72-0003Ek-Cd
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 22:48:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTiG-0000o1-AM
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:22:44 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:41106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTiE-0001rJ-BB
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:22:44 -0500
Received: by mail-pf1-x42e.google.com with SMTP id q20so5311300pfu.8
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 19:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=rWSIZHZDjqIuwdV86CYsQb0YQNX3HHzBj1A0787Bohs=;
 b=d36yhWqOKyOfbRWoMJhz/BPGdg5fJhq7UxlkF+fsoYDZUQxigwLRaR6LXUMDSZxzXf
 2BSVgrOv/VohHPts+W7czOWoXSsloE/IWXEubFB5qt4AygHfTOrRACLMdVDMR6AOfuY0
 /hMsXJ+i2/CZSz2q0p/P+sVEHyZZM0pYies/Xm3QJic4mJTAwDbAOCGtnIbVGXNYjDyT
 V1+rkS+PIL6Whj4bVB5pGNZx9uUGD6Aunyt+QFhZ7WsiK+p0t8SX0oJ1yv3Wo3sPCf5P
 KXdDWT5NhEDlrqkSWUEfg65oKRQ/x+C3XOs5G5m9kIAN4Rtm06ONQLotJokRzaN1BL8M
 X8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=rWSIZHZDjqIuwdV86CYsQb0YQNX3HHzBj1A0787Bohs=;
 b=VAWYxW0O0t73BUMiyR/Tt4x49589z7GZfJCaMNisI+cOLcQTGyET1uXxphtvBqrbUp
 2hW8fqb8297/kGxFiQrPA1FoyJ2bRJXPRXs5B9ULwY2H2AEexICFKJV7RwL56OSY0iob
 SNFBdb3lzj2sVRL0pA8Lpa4VR532+pKJJ8lggTBZ529Vv1NhgAiyHBl7Rxu+muWfw/Hi
 eJVMCT93w/ZEXV6BXPA6AqXJbZ8k2NR0z3M82MCS/oUPGVYObN30lGIfRsGdMHjEKuqK
 m6XxPqjSRRLUqp6x2uQowbc0CxX1niJN4V54hr9kT0IY32xAUqIQn2hSdqTDzn7gfEk+
 LuYw==
X-Gm-Message-State: AOAM533WuskqfiqJYTN0YLhOECEIRa8A0idREDWjPVpNZYcy5vim3GzL
 VoRX+utMjZC1WX/7HlwYP+qLmiuWH0rGyA==
X-Google-Smtp-Source: ABdhPJyU3dR5pKpxs5Fg9y/41hAdfTsjMx8ncD91suOmHZgmiQvbKw5FuagKckiZV5DceANlWUmk6A==
X-Received: by 2002:a63:ee4e:: with SMTP id n14mr1017634pgk.422.1614309760685; 
 Thu, 25 Feb 2021 19:22:40 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:22:40 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v7 38/75] target/riscv: rvv-1.0: whole register move
 instructions
Date: Fri, 26 Feb 2021 11:18:22 +0800
Message-Id: <20210226031902.23656-39-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Frank Chang <frank.chang@sifive.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
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
---
 target/riscv/insn32.decode              |  4 ++++
 target/riscv/insn_trans/trans_rvv.c.inc | 25 +++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 8516a12b126..beef6ca7167 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -625,6 +625,10 @@ vrgatherei16_vv 001110 . ..... ..... 000 ..... 1010111 @r_vm
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
index 63e31299b3b..f92e5c806c8 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3489,3 +3489,28 @@ static bool trans_vcompress_vm(DisasContext *s, arg_r *a)
     }
     return false;
 }
+
+/*
+ * Whole Vector Register Move Instructions ignore vtype and vl setting.
+ * Thus, we don't need to check vill bit. (Section 17.6)
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
2.17.1


