Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7422F2C85
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 11:21:53 +0100 (CET)
Received: from localhost ([::1]:58152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzGoC-0005eu-Ot
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 05:21:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGCG-00051r-OS
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:42:40 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:35840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGCF-0007vV-3i
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:42:40 -0500
Received: by mail-pj1-x102f.google.com with SMTP id l23so1312457pjg.1
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 01:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=rWSIZHZDjqIuwdV86CYsQb0YQNX3HHzBj1A0787Bohs=;
 b=BTcAtLH5nKNg0lUpSq6jXhOoUdyLpKoMX1YPctYGtCRMuXiMcVk6wGkiK7i/5dC1Ry
 ItpXj9IuO98c8stqvrQSUZXSinM2/KpEQdE4+vJboOJMlaugMll7u8sWgl0jng69pGBk
 o5dC6Kx0MbMxICyOOyYPKmG9+DcvOcHv7HeieQVkOGb9B6Lak+cj/RmSYjYJxQ7tuW5F
 XFgvR7x9TBl4zcem9CGEbuaKevl4xyA0cnSQm2HTJRerdZ2t/2UvN8BPxAiseXW0xiCn
 NiWObrqvQkDixz11jEy/uH+22m1Y/FlRBtHLqKvgX3bSi5uA6KpIBLZlzbzc8JfS5a0o
 Wysg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=rWSIZHZDjqIuwdV86CYsQb0YQNX3HHzBj1A0787Bohs=;
 b=q/6vh7hDySTxfVa++Cr/fj7JbE5tkmngpOgTBNOvQMYMJAHoIcg3M6gdBGPoZqb/vz
 dLCa0o48twZwWnYqq5WeRwdDldn+za+L/KnurhpFLuZOgsJ0rgaiBc4yDblrOLalBe9b
 kxb1MahAM7nP8PklVFQHAy3iN4/dnRi5nrJUpt03K/EQYP1vWbxQt0zn3YrsItfbaBQF
 wUWnNkUIkGBNUNHOeXgFL6gX+cKCK/vpsr2tD6ixkwGH2R/8N7aLJpSEBsurvVy9QGv7
 xLclDQNmMAWQC6bprGJkLNk9BU9uiJsjb/DMGwVxSRiysA2E5xvZ8YcbcdL4e1sim761
 L67w==
X-Gm-Message-State: AOAM532s3s1HKxH7lfnkqNOgfyrFudsTsBje1GAZvt7L/fqw5/fZUi29
 x6zAKZiWU+EKnj7FMCP9mH1ySqZCqbsjuPjS
X-Google-Smtp-Source: ABdhPJyWZJSmwNIEYbYT6nxFIBVMrrxxyepD4W8aBaGrdZYfMSqypw+d16JWecHOLVksHoO30BvqrA==
X-Received: by 2002:a17:902:ed0d:b029:da:c83b:5f40 with SMTP id
 b13-20020a170902ed0db02900dac83b5f40mr4006894pld.20.1610444557663; 
 Tue, 12 Jan 2021 01:42:37 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.42.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:42:37 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v6 38/72] target/riscv: rvv-1.0: whole register move
 instructions
Date: Tue, 12 Jan 2021 17:39:12 +0800
Message-Id: <20210112093950.17530-39-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102f.google.com
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


