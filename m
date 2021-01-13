Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 832FF2F453B
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 08:34:48 +0100 (CET)
Received: from localhost ([::1]:52690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzag3-0005qx-K8
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 02:34:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzaMb-0007Nt-L3
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 02:14:41 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:50943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzaMZ-00040A-Dz
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 02:14:41 -0500
Received: by mail-pj1-x102d.google.com with SMTP id md11so565901pjb.0
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 23:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=aEip5Hk2/fjLfGZXwReicQlq3aDOOOt574rHluS0oAk=;
 b=ELmy/UVulmvm7jsn0Ai5jpmTQ4UY/zASOWbG1G46BJwf2bhDHpVaSklRhuxZunO3CV
 D/Z5nXlpt6iE3jBami3JeQoYwHTasOEPALhdMYp+2+KNRQq1v+6nLUMD8Y8qD1wEfFHU
 VXE3RZXkezzG90ZEFlIdoWr36x9PyxpkumLAFZ7pIrdo0s4tOmM2nq0282q66p5fLQtZ
 1RI0EwXypOUS/OmyUCxCcrY2+VIJOR8QpsNAded457OGCTgPdLhQph4JDsF2hMtNN/W1
 giXFPgxVRRiY9obNMy0zIWx4ZA6R5GMu0Jd2imSOwK8wnpGVCig7ctU3hhTjZbHsOQDh
 vYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=aEip5Hk2/fjLfGZXwReicQlq3aDOOOt574rHluS0oAk=;
 b=Py0MqNweo0DMT9G9V+TltC9hhKWyzzdt+rqmXu0g8FmfMVQKg6GnajJW5jZ+fEEpJc
 qtXk7lJ6kkFAFFJqyLkaE195imnh1LM/wpyRqW9eXBNGtzE9fqpVv7XkViCY9/33g4gg
 C/sJfHAx6fYCo0o0GMb3vaSh3upzM8UQvZCPi2eJpIi1R9gGllbDE/YeO0DgAbcT5lKf
 mlmOSKJRE3eMBQxGcNhiD66snCWopiNgJAQrTXai6hmso/5z1E7LqTojecckFhzDqkd8
 pMKG1hcZkhQETm5uPKozP9X10bga2du0AgW63sbcjW4oNFujWC+W8OF1zNJgJ9bF/FS0
 RQ1Q==
X-Gm-Message-State: AOAM5333kR1x0/y9a0h2idPvT2X8udB4TDhUhSK5iYJW6I/yKafInN49
 mt/k2au/pHJkdkiJ3/FQaJYate+0MvbDa0w2
X-Google-Smtp-Source: ABdhPJxO5/7RNxR1qK0Y7EJuh+odqt1AZIFRlyu4lOmFaat8B6Gq9yDYgw0/qFqzOXHQPiuoU4rZGw==
X-Received: by 2002:a17:90a:cc0a:: with SMTP id
 b10mr808814pju.59.1610522078049; 
 Tue, 12 Jan 2021 23:14:38 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id l7sm1361888pjy.29.2021.01.12.23.14.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 23:14:37 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC v4 08/16] target/riscv: add gen_shifti() and gen_shiftiw()
 helper functions
Date: Wed, 13 Jan 2021 15:13:40 +0800
Message-Id: <20210113071350.24852-9-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210113071350.24852-1-frank.chang@sifive.com>
References: <20210113071350.24852-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102d.google.com
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
 target/riscv/insn_trans/trans_rvi.c.inc | 54 ++-----------------------
 target/riscv/translate.c                | 43 ++++++++++++++++++++
 2 files changed, 47 insertions(+), 50 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index d04ca0394cf..7b894201840 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -261,54 +261,17 @@ static bool trans_andi(DisasContext *ctx, arg_andi *a)
 }
 static bool trans_slli(DisasContext *ctx, arg_slli *a)
 {
-    if (a->shamt >= TARGET_LONG_BITS) {
-        return false;
-    }
-
-    if (a->rd != 0) {
-        TCGv t = tcg_temp_new();
-        gen_get_gpr(t, a->rs1);
-
-        tcg_gen_shli_tl(t, t, a->shamt);
-
-        gen_set_gpr(a->rd, t);
-        tcg_temp_free(t);
-    } /* NOP otherwise */
-    return true;
+    return gen_shifti(ctx, a, tcg_gen_shl_tl);
 }
 
 static bool trans_srli(DisasContext *ctx, arg_srli *a)
 {
-    if (a->shamt >= TARGET_LONG_BITS) {
-        return false;
-    }
-
-    if (a->rd != 0) {
-        TCGv t = tcg_temp_new();
-        gen_get_gpr(t, a->rs1);
-
-        tcg_gen_shri_tl(t, t, a->shamt);
-        gen_set_gpr(a->rd, t);
-        tcg_temp_free(t);
-    } /* NOP otherwise */
-    return true;
+    return gen_shifti(ctx, a, tcg_gen_shr_tl);
 }
 
 static bool trans_srai(DisasContext *ctx, arg_srai *a)
 {
-    if (a->shamt >= TARGET_LONG_BITS) {
-        return false;
-    }
-
-    if (a->rd != 0) {
-        TCGv t = tcg_temp_new();
-        gen_get_gpr(t, a->rs1);
-
-        tcg_gen_sari_tl(t, t, a->shamt);
-        gen_set_gpr(a->rd, t);
-        tcg_temp_free(t);
-    } /* NOP otherwise */
-    return true;
+    return gen_shifti(ctx, a, tcg_gen_sar_tl);
 }
 
 static bool trans_add(DisasContext *ctx, arg_add *a)
@@ -369,16 +332,7 @@ static bool trans_addiw(DisasContext *ctx, arg_addiw *a)
 
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


