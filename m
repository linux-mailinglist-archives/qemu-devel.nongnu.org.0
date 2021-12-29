Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C57480EFB
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Dec 2021 03:43:29 +0100 (CET)
Received: from localhost ([::1]:48200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2Ow4-0000hs-Fv
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 21:43:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2OnG-0003hy-GW
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 21:34:22 -0500
Received: from [2607:f8b0:4864:20::62b] (port=40611
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2OnE-0004da-Qo
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 21:34:22 -0500
Received: by mail-pl1-x62b.google.com with SMTP id l15so39298pls.7
 for <qemu-devel@nongnu.org>; Tue, 28 Dec 2021 18:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1cP8poI1ecSTfpKdi4vVjuMlMadCloWz1TdPeYGIdyk=;
 b=GcKmnsPUnq8GGcmvFmlw+gPQFIA5DiO+i4kdwGa/eNRaMVGqU8tNWm2VxdJcA+H/SU
 B+72CNG+Sdh7WDW9ojKbS/lkWLRNJElNgFj4k7h5KbipDn8ECku6x3uoFLDyIOQSBYfO
 9DTxQbG6LmpErTlZBtzQee+DxnuNe+xT6dIxFklcitkuXhHMqrAigrKoXKIzhTkGDLX+
 FS8UKiLIWdzFQdYDw4r5Ew9L7VSKUWG2BXEOLh435qYjL441z8XF1zhtPrxRKy6JViFo
 xR+AjUaJG8eM4s2yNJaCmiAeoBITdk0nK3JWabfLX7aemPkV0l166T0SNJxWmYyPBYpv
 gIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1cP8poI1ecSTfpKdi4vVjuMlMadCloWz1TdPeYGIdyk=;
 b=uc654MT50AXL9dDdtHl2na9//iU1ftD862GKmB3Kq6xGoWQqmdclkz7ax6Jru2RiSW
 aeKo3bpWrHCCIdo0awmEUoD4DTGbu8Hlf/pCoIT5WbKnxihAwD+EgJ8RGB47OaiYyIik
 1uycVK/Go5UAwhMhmWmU9VtF9gjIvwlTPOMVcTw9QK2287dfSG7eo61A1geTrooAbE/+
 t15bY9LYUlBTpcmeNpj1FWHkXkMamQs2PQiT7mrc0RnU5eeBjbxA61YIdv4nun5Pp8fV
 J6JI+Bq/Fp6LH7rLg9ileyLw+9Y9VKQ1JVCMDS29laVeoNKju2BknEouJ/HVwRUOVP4w
 uSuQ==
X-Gm-Message-State: AOAM532cndHTCgXLAtEXQ+NTrJdNsKkgmQB9QOSyqWL/MO+qEKo9stwA
 IVgNMTL75h5dPHFMtD9lFGGYBRtGM3C05DRk
X-Google-Smtp-Source: ABdhPJxHCV72bdEkIxy55IVdIf1ZZyQb8SuqAdxMRquEO31OZaS+6X5oSGLu898a82h6lkwEf47ltA==
X-Received: by 2002:a17:903:2485:b0:148:a3dc:c22a with SMTP id
 p5-20020a170903248500b00148a3dcc22amr24310533plw.172.1640745259403; 
 Tue, 28 Dec 2021 18:34:19 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id m3sm22613635pjz.10.2021.12.28.18.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 18:34:19 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH 08/17] target/riscv: rvv-1.0: Add Zve64f support for widening
 type-convert insns
Date: Wed, 29 Dec 2021 10:33:35 +0800
Message-Id: <20211229023348.12606-9-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211229023348.12606-1-frank.chang@sifive.com>
References: <20211229023348.12606-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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

Vector widening conversion instructions are provided to and from all
supported integer EEWs for Zve64f extension.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 32 +++++++++++++++++++------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index d7e288b87f..9ca8d502b2 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -77,6 +77,17 @@ static bool require_zve64f(DisasContext *s)
     return s->ext_zve64f ? s->sew <= MO_32 : true;
 }
 
+static bool require_scale_zve64f(DisasContext *s)
+{
+    /* RVV + Zve64f = RVV. */
+    if (has_ext(s, RVV)) {
+        return true;
+    }
+
+    /* Zve64f doesn't support FP64. (Section 18.2) */
+    return s->ext_zve64f ? s->sew <= MO_16 : true;
+}
+
 /* Destination vector register group cannot overlap source mask register. */
 static bool require_vm(int vm, int vd)
 {
@@ -2331,7 +2342,8 @@ static bool opfvv_widen_check(DisasContext *s, arg_rmrr *a)
            require_scale_rvf(s) &&
            (s->sew != MO_8) &&
            vext_check_isa_ill(s) &&
-           vext_check_dss(s, a->rd, a->rs1, a->rs2, a->vm);
+           vext_check_dss(s, a->rd, a->rs1, a->rs2, a->vm) &&
+           require_scale_zve64f(s);
 }
 
 /* OPFVV with WIDEN */
@@ -2370,7 +2382,8 @@ static bool opfvf_widen_check(DisasContext *s, arg_rmrr *a)
            require_scale_rvf(s) &&
            (s->sew != MO_8) &&
            vext_check_isa_ill(s) &&
-           vext_check_ds(s, a->rd, a->rs2, a->vm);
+           vext_check_ds(s, a->rd, a->rs2, a->vm) &&
+           require_scale_zve64f(s);
 }
 
 /* OPFVF with WIDEN */
@@ -2400,7 +2413,8 @@ static bool opfwv_widen_check(DisasContext *s, arg_rmrr *a)
            require_scale_rvf(s) &&
            (s->sew != MO_8) &&
            vext_check_isa_ill(s) &&
-           vext_check_dds(s, a->rd, a->rs1, a->rs2, a->vm);
+           vext_check_dds(s, a->rd, a->rs1, a->rs2, a->vm) &&
+           require_scale_zve64f(s);
 }
 
 /* WIDEN OPFVV with WIDEN */
@@ -2439,7 +2453,8 @@ static bool opfwf_widen_check(DisasContext *s, arg_rmrr *a)
            require_scale_rvf(s) &&
            (s->sew != MO_8) &&
            vext_check_isa_ill(s) &&
-           vext_check_dd(s, a->rd, a->rs2, a->vm);
+           vext_check_dd(s, a->rd, a->rs2, a->vm) &&
+           require_scale_zve64f(s);
 }
 
 /* WIDEN OPFVF with WIDEN */
@@ -2698,14 +2713,16 @@ static bool opfv_widen_check(DisasContext *s, arg_rmr *a)
 static bool opxfv_widen_check(DisasContext *s, arg_rmr *a)
 {
     return opfv_widen_check(s, a) &&
-           require_rvf(s);
+           require_rvf(s) &&
+           require_zve64f(s);
 }
 
 static bool opffv_widen_check(DisasContext *s, arg_rmr *a)
 {
     return opfv_widen_check(s, a) &&
            require_scale_rvf(s) &&
-           (s->sew != MO_8);
+           (s->sew != MO_8) &&
+           require_scale_zve64f(s);
 }
 
 #define GEN_OPFV_WIDEN_TRANS(NAME, CHECK, HELPER, FRM)             \
@@ -2756,7 +2773,8 @@ static bool opfxv_widen_check(DisasContext *s, arg_rmr *a)
            require_scale_rvf(s) &&
            vext_check_isa_ill(s) &&
            /* OPFV widening instructions ignore vs1 check */
-           vext_check_ds(s, a->rd, a->rs2, a->vm);
+           vext_check_ds(s, a->rd, a->rs2, a->vm) &&
+           require_scale_zve64f(s);
 }
 
 #define GEN_OPFXV_WIDEN_TRANS(NAME)                                \
-- 
2.31.1


