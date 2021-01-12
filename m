Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F812F263B
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 03:23:46 +0100 (CET)
Received: from localhost ([::1]:58458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz9LV-0002wZ-2l
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 21:23:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kz9It-000119-Ae
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 21:21:03 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:42186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kz9Ij-0002Cb-Fr
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 21:21:03 -0500
Received: by mail-pf1-x433.google.com with SMTP id h10so448404pfo.9
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 18:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=J88EfHnkgaDqglpHzFIx/TsUyRcYxAOR3TBWd0dXw+s=;
 b=egI5yo2FwWpA4s2ZeCzcfFA0N68ATeDddI2TtHH45gvFXKvcoHwVmo3ZuhbUqMUWq/
 wjDQWfU53WsJAEydNvLB7ekPm/yodKy2Bz+oH/Nc2n6D7VFbCVOecgPPeOiqotPz7H9C
 bafcL0BOAopP4NdPtLwYhM2Ukv8VvyE4eDDkdiLp8telqjnOINfKW4dpIBi9Wwxbk1qm
 SBs3bLDsMtkbnUfl7/TDNYZp8JYkKLz7i6kv3qVa8YIKTL89MHwMFZgBUUEaUNa4XBGp
 z4m4c7FXPelhLm8hE4gT/3FRu6uuTUW9x6pCe667+GyJgrDocWc3R5gm7dnITiyD/18j
 OyfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=J88EfHnkgaDqglpHzFIx/TsUyRcYxAOR3TBWd0dXw+s=;
 b=oYDySGYFvlpk5mJRl5YnJWtW8bkB+dgg3VCdwdx/b+cdLMQoQueEATJRuqm2VSiEwz
 bOR4tApL16GjWmVWLAlxmJ8Igt+eT85fGURjZW+L7B8fjTfiLcooLhap13BScssWcf3c
 zQkoni7lxnFrzZ3AkGDrvPeTNH9vYcI3SAm6w/cPBW2+3HXXzndw92ECoh0X4ob5Moi8
 poUn2eFcOj7cjxrRseJ0iDEA59nyJKsPHfYxms8v43hiwqQeJyU07iqXdCvNJ3M3rMH4
 jhAqnXjlaUpB/LIxpeu3u8CENzqU4yH/bovv1pewDByGqs/ydZ5hXiMTRSAd2rfU2qD/
 oGrw==
X-Gm-Message-State: AOAM531SQOJpe1sBQIMZbJS6BLdOPBUuJelOxy4rK/qtqqV8EtRZWnlG
 I92Arh/eSFRsaRGx6ImEvITFOwauOX/4Q/FR
X-Google-Smtp-Source: ABdhPJy1okOLoEzI7i3Cz2yCZg+LU1eIWKiY/cjQ6TErSUXNvlHs4e8PEsKYZK/ty+74ilnv+y3xvw==
X-Received: by 2002:a62:25c7:0:b029:156:72a3:b0c0 with SMTP id
 l190-20020a6225c70000b029015672a3b0c0mr2226677pfl.59.1610418049401; 
 Mon, 11 Jan 2021 18:20:49 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id x14sm981326pfp.77.2021.01.11.18.20.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 18:20:48 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC v3 08/16] target/riscv: add gen_shifti() and gen_shiftiw()
 helper functions
Date: Tue, 12 Jan 2021 10:19:49 +0800
Message-Id: <20210112022001.20521-9-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112022001.20521-1-frank.chang@sifive.com>
References: <20210112022001.20521-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x433.google.com
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
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Add gen_shifti() and gen_shiftiw() helper functions to reuse the same
interfaces for immediate shift instructions.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 45 +++----------------------
 target/riscv/translate.c                | 43 +++++++++++++++++++++++
 2 files changed, 47 insertions(+), 41 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index d04ca0394cf..678c8f07238 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -261,52 +261,24 @@ static bool trans_andi(DisasContext *ctx, arg_andi *a)
 }
 static bool trans_slli(DisasContext *ctx, arg_slli *a)
 {
-    if (a->shamt >= TARGET_LONG_BITS) {
-        return false;
-    }
-
     if (a->rd != 0) {
-        TCGv t = tcg_temp_new();
-        gen_get_gpr(t, a->rs1);
-
-        tcg_gen_shli_tl(t, t, a->shamt);
-
-        gen_set_gpr(a->rd, t);
-        tcg_temp_free(t);
+        return gen_shifti(ctx, a, tcg_gen_shl_tl);
     } /* NOP otherwise */
     return true;
 }
 
 static bool trans_srli(DisasContext *ctx, arg_srli *a)
 {
-    if (a->shamt >= TARGET_LONG_BITS) {
-        return false;
-    }
-
     if (a->rd != 0) {
-        TCGv t = tcg_temp_new();
-        gen_get_gpr(t, a->rs1);
-
-        tcg_gen_shri_tl(t, t, a->shamt);
-        gen_set_gpr(a->rd, t);
-        tcg_temp_free(t);
+        return gen_shifti(ctx, a, tcg_gen_shr_tl);
     } /* NOP otherwise */
     return true;
 }
 
 static bool trans_srai(DisasContext *ctx, arg_srai *a)
 {
-    if (a->shamt >= TARGET_LONG_BITS) {
-        return false;
-    }
-
     if (a->rd != 0) {
-        TCGv t = tcg_temp_new();
-        gen_get_gpr(t, a->rs1);
-
-        tcg_gen_sari_tl(t, t, a->shamt);
-        gen_set_gpr(a->rd, t);
-        tcg_temp_free(t);
+        return gen_shifti(ctx, a, tcg_gen_sar_tl);
     } /* NOP otherwise */
     return true;
 }
@@ -369,16 +341,7 @@ static bool trans_addiw(DisasContext *ctx, arg_addiw *a)
 
 static bool trans_slliw(DisasContext *ctx, arg_slliw *a)
 {
-    TCGv source1;
-    source1 = tcg_temp_new();
-    gen_get_gpr(source1, a->rs1);
-
-    tcg_gen_shli_tl(source1, source1, a->shamt);
-    tcg_gen_ext32s_tl(source1, source1);
-    gen_set_gpr(a->rd, source1);
-
-    tcg_temp_free(source1);
-    return true;
+    return gen_shiftiw(ctx, a, tcg_gen_shl_tl);
 }
 
 static bool trans_srliw(DisasContext *ctx, arg_srliw *a)
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 53c0c34ce16..8459b6bcf54 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -810,6 +810,49 @@ static bool gen_shift(DisasContext *ctx, arg_r *a,
     return true;
 }
 
+static bool gen_shifti(DisasContext *ctx, arg_shift *a,
+                       void(*func)(TCGv, TCGv, TCGv))
+{
+    if (a->shamt >= TARGET_LONG_BITS) {
+        return false;
+    }
+
+    TCGv source1 = tcg_temp_new();
+    TCGv source2 = tcg_temp_new();
+
+    gen_get_gpr(source1, a->rs1);
+
+    tcg_gen_movi_tl(source2, a->shamt);
+    (*func)(source1, source1, source2);
+
+    gen_set_gpr(a->rd, source1);
+    tcg_temp_free(source1);
+    tcg_temp_free(source2);
+    return true;
+}
+
+#ifdef TARGET_RISCV64
+
+static bool gen_shiftiw(DisasContext *ctx, arg_shift *a,
+                        void(*func)(TCGv, TCGv, TCGv))
+{
+    TCGv source1 = tcg_temp_new();
+    TCGv source2 = tcg_temp_new();
+
+    gen_get_gpr(source1, a->rs1);
+    tcg_gen_movi_tl(source2, a->shamt);
+
+    (*func)(source1, source1, source2);
+    tcg_gen_ext32s_tl(source1, source1);
+
+    gen_set_gpr(a->rd, source1);
+    tcg_temp_free(source1);
+    tcg_temp_free(source2);
+    return true;
+}
+
+#endif
+
 static void gen_ctz(TCGv ret, TCGv arg1)
 {
     tcg_gen_ctzi_tl(ret, arg1, TARGET_LONG_BITS);
-- 
2.17.1


