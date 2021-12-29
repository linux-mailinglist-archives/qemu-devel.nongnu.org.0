Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A19E9480ED6
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Dec 2021 03:16:49 +0100 (CET)
Received: from localhost ([::1]:47238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2OWG-0005Le-Cz
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 21:16:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2OSk-00029H-8T
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 21:13:11 -0500
Received: from [2607:f8b0:4864:20::429] (port=38855
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2OSh-0001Wt-TK
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 21:13:09 -0500
Received: by mail-pf1-x429.google.com with SMTP id b22so17520337pfb.5
 for <qemu-devel@nongnu.org>; Tue, 28 Dec 2021 18:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lcxkfLDjFOWX3IL1YOje/OBFiAcSnNeG897+Wew0UM0=;
 b=Rdp8y/wVdvneOQLRKWG6pG2OnOxwWvwFQwNbVAdqXXfHC7ei2fY7F5KJTMbYvdzxTT
 jd0nkWu2vusDfL0l5Vnn4YWPMjsYxEdZxQj8a94T/Jd4cPEkj2bqTr+algvkLGaA6MWD
 iD2TAGLTS2dLej/9JrAK+PwVFIRlEU4BlDhh3H5kjT4aGn8h5vBjFzsqUrqRCZAET7mU
 QpSgDY+gfa2PGYpWozvStY2NPZ4FKCmXolYkrtCumvyCFyl0l8/RKCjr9ZAsI1PFwVj4
 Q/hWw7Ibo95e1l0DMBQTEkWEicKMSFzZrXNE/hxgOPLn7gEenkMbEG4EUhsX0bfG2I27
 Wrhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lcxkfLDjFOWX3IL1YOje/OBFiAcSnNeG897+Wew0UM0=;
 b=SooAC2zU3ouvI5vNTupKzNNaCgPGEdssbAvPOOcwIgGYbZKKJnxbUc/EYNtBGuhHkc
 SXnxHxVyr1gGVI30rTnRuwhcMQphHkI00CgCNob8qpPxVX0WRZKnIBXxPLD6P09ilVPT
 9sQpB5WgzJ+T1zKc5T2vZV6M/2H2bMICBePmL2aWQLbp3+KbXwLAQWE9bAMFuiRH2ppD
 6feXReKaEmLoHm1d5CGG9KHwLw3CSnh8lhCYW0mOTxj8lNGTJbJJy3aGqyQ9J9HZ6ZO9
 na3bgwKQVL5sCywu8XJog6UU+iPs4ilKszzzvnWHxNG6HdJnVe+vDy7PuasdWH8KQ8G1
 oaHg==
X-Gm-Message-State: AOAM530PVn5bXMG7bPcIxFgZSPkrxkraLEJcibMu03/UhdxEx8k7NhaH
 UimXXG/0wDPmeveowcjFPdY2sr9isye7MGUk
X-Google-Smtp-Source: ABdhPJyhMFw+9/+RE1c5aJX9wcocOBUUJTnwWCnGNffVPhh2gr1TW9QD0qY3gF2ITds7esB8C40wjQ==
X-Received: by 2002:a65:680a:: with SMTP id l10mr21315621pgt.52.1640743986508; 
 Tue, 28 Dec 2021 18:13:06 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id k8sm15693975pjs.53.2021.12.28.18.13.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 18:13:06 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] target/riscv: rvv-1.0: Call the correct RVF/RVD check
 funtion for narrowing fp/int type-convert insns
Date: Wed, 29 Dec 2021 10:12:48 +0800
Message-Id: <20211229021250.29804-4-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211229021250.29804-1-frank.chang@sifive.com>
References: <20211229021250.29804-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

vfncvt.f.xu.w, vfncvt.f.x.w convert double-width integer to single-width
floating-point. Therefore, should use require_rvf() to check whether
RVF/RVD is enabled.

vfncvt.f.f.w, vfncvt.rod.f.f.w convert double-width floating-point to
single-width integer. Therefore, should use require_scale_rvf() to check
whether RVF/RVD is enabled.
---
 target/riscv/insn_trans/trans_rvv.c.inc | 32 ++++++++++++++++++-------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index f1b44ccad2..6c285c958b 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2719,17 +2719,29 @@ GEN_OPFXV_WIDEN_TRANS(vfwcvt_f_x_v)
 static bool opfv_narrow_check(DisasContext *s, arg_rmr *a)
 {
     return require_rvv(s) &&
-           require_rvf(s) &&
-           (s->sew != MO_64) &&
            vext_check_isa_ill(s) &&
            /* OPFV narrowing instructions ignore vs1 check */
            vext_check_sd(s, a->rd, a->rs2, a->vm);
 }
 
-#define GEN_OPFV_NARROW_TRANS(NAME, HELPER, FRM)                   \
+static bool opfxv_narrow_check(DisasContext *s, arg_rmr *a)
+{
+    return opfv_narrow_check(s, a) &&
+           require_rvf(s) &&
+           (s->sew != MO_64);
+}
+
+static bool opffv_narrow_check(DisasContext *s, arg_rmr *a)
+{
+    return opfv_narrow_check(s, a) &&
+           require_scale_rvf(s) &&
+           (s->sew != MO_8);
+}
+
+#define GEN_OPFV_NARROW_TRANS(NAME, CHECK, HELPER, FRM)            \
 static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
 {                                                                  \
-    if (opfv_narrow_check(s, a)) {                                 \
+    if (CHECK(s, a)) {                                             \
         if (FRM != RISCV_FRM_DYN) {                                \
             gen_set_rm(s, RISCV_FRM_DYN);                          \
         }                                                          \
@@ -2756,11 +2768,15 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
     return false;                                                  \
 }
 
-GEN_OPFV_NARROW_TRANS(vfncvt_f_xu_w, vfncvt_f_xu_w, RISCV_FRM_DYN)
-GEN_OPFV_NARROW_TRANS(vfncvt_f_x_w, vfncvt_f_x_w, RISCV_FRM_DYN)
-GEN_OPFV_NARROW_TRANS(vfncvt_f_f_w, vfncvt_f_f_w, RISCV_FRM_DYN)
+GEN_OPFV_NARROW_TRANS(vfncvt_f_xu_w, opfxv_narrow_check, vfncvt_f_xu_w,
+                      RISCV_FRM_DYN)
+GEN_OPFV_NARROW_TRANS(vfncvt_f_x_w, opfxv_narrow_check, vfncvt_f_x_w,
+                      RISCV_FRM_DYN)
+GEN_OPFV_NARROW_TRANS(vfncvt_f_f_w, opffv_narrow_check, vfncvt_f_f_w,
+                      RISCV_FRM_DYN)
 /* Reuse the helper function from vfncvt.f.f.w */
-GEN_OPFV_NARROW_TRANS(vfncvt_rod_f_f_w, vfncvt_f_f_w, RISCV_FRM_ROD)
+GEN_OPFV_NARROW_TRANS(vfncvt_rod_f_f_w, opffv_narrow_check, vfncvt_f_f_w,
+                      RISCV_FRM_ROD)
 
 static bool opxfv_narrow_check(DisasContext *s, arg_rmr *a)
 {
-- 
2.31.1


