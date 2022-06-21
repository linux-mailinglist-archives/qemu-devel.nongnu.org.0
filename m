Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC59552F31
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 11:53:54 +0200 (CEST)
Received: from localhost ([::1]:45322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3aa1-0005e3-Pt
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 05:53:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3aQr-0007hv-4l; Tue, 21 Jun 2022 05:44:27 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b]:33535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3aQp-0007Ll-FK; Tue, 21 Jun 2022 05:44:24 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-101d2e81bceso8873521fac.0; 
 Tue, 21 Jun 2022 02:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xv0EQkPs1+PTOr4msoUcihme/LmWUDVBAtgz7uWfQ70=;
 b=huSPgLTE0vqNY3baMaiDqffr86vrA26bYXfwRLzxyWKSsVei83bXbvgigXBCMPcKy8
 YRa9LhrrQ87JzCSgk8XtkBMg4VtCIXeoUEAmXnR5rgNLKDGz5WgXUxL/dUzf3gZn5/yU
 9k+OT9nMtZ0kQNU5jlj0cChma25hibCnMgboV/Oqo6rMAyt2NgaN61SON84KUcq7Tcx/
 eO0vEMcpi3JMF+bKs3xIfiaWLpdE0yVocaEo600A5fUMuTVy9kMrRqDhQnflnibOoUSW
 OrR8WZenn6Xi0ZG8XxkYdxmzFhl2NOc2Vhk9KoPCni5LnBw5LghPWE22LMp5kvqgusq0
 KZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xv0EQkPs1+PTOr4msoUcihme/LmWUDVBAtgz7uWfQ70=;
 b=GXxXv77dFFjf7aKbyoNfHHXfJx16EutrbN+aOlWQBBmls2wYZnFgr7GkPWYqgnCoZz
 YeuMc0HszgS9oEXMkUuBXy4RIR6qu3nuPN6eUPkUyTAthon+kDV5iKdtb6EZj3+yn4qs
 UFBlpRHB283fvEoRV4JbPI8A/zN4nvYsmLOnDWSR4Ni4eHkh5y8bbZLuyYBV6QelIvHW
 u/09lGgFsj8ZJ0gb9yObLFljLLARyKKqZuOCdTAn+ZLR2c/XV8P376PbPIsF5wLS2x98
 WR1wfUE3zdeGY+XTg9kRn25re1GWdnigaRiMpOd1l3I4JCkTWtbgdsuJ/sQsBiB+Keq7
 vZlA==
X-Gm-Message-State: AJIora9AtFRVNAZ1Ofd0+AhZsJmxDODDicsWUfmWW/+EYz8R6pLNSbQk
 PWQZO1dV7J0ZDgtKyARXdJJYtKuaBCQEFg==
X-Google-Smtp-Source: AGRyM1tWCy7hsYXjEOtEmXDpglaAvA+qHxfMD/t9GHEKZRZgQ8TiGGlzQEa9ZlBoy4TwkVu+3iaqcg==
X-Received: by 2002:a05:6870:32d5:b0:101:1935:f1d1 with SMTP id
 r21-20020a05687032d500b001011935f1d1mr14861867oac.111.1655804660203; 
 Tue, 21 Jun 2022 02:44:20 -0700 (PDT)
Received: from balboa.ibmuc.com ([187.34.29.129])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a9d7a49000000b0061020865f1asm7555119otm.50.2022.06.21.02.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 02:44:20 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
Subject: [PULL 06/15] target/ppc: Implemented remaining vector divide extended
Date: Tue, 21 Jun 2022 06:43:51 -0300
Message-Id: <20220621094400.122800-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621094400.122800-1-danielhb413@gmail.com>
References: <20220621094400.122800-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

Implement the following PowerISA v3.1 instructions:
vdivesd: Vector Divide Extended Signed Doubleword
vdiveud: Vector Divide Extended Unsigned Doubleword
vdivesq: Vector Divide Extended Signed Quadword
vdiveuq: Vector Divide Extended Unsigned Quadword

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220525134954.85056-7-lucas.araujo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/helper.h                 |  4 ++
 target/ppc/insn32.decode            |  4 ++
 target/ppc/int_helper.c             | 64 +++++++++++++++++++++++++++++
 target/ppc/translate/vmx-impl.c.inc |  4 ++
 4 files changed, 76 insertions(+)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 9f33e589e0..e7624300df 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -177,6 +177,10 @@ DEF_HELPER_FLAGS_3(VMULOUH, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(VMULOUW, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(VDIVSQ, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(VDIVUQ, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(VDIVESD, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(VDIVEUD, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(VDIVESQ, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(VDIVEUQ, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(vslo, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(vsro, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(vsrv, TCG_CALL_NO_RWG, void, avr, avr, avr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index f6d2d4b257..5b2d7824a0 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -798,3 +798,7 @@ VDIVUQ          000100 ..... ..... ..... 00000001011    @VX
 
 VDIVESW         000100 ..... ..... ..... 01110001011    @VX
 VDIVEUW         000100 ..... ..... ..... 01010001011    @VX
+VDIVESD         000100 ..... ..... ..... 01111001011    @VX
+VDIVEUD         000100 ..... ..... ..... 01011001011    @VX
+VDIVESQ         000100 ..... ..... ..... 01100001011    @VX
+VDIVEUQ         000100 ..... ..... ..... 01000001011    @VX
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 033718dc0e..42f0dcfc52 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1183,6 +1183,70 @@ void helper_VDIVUQ(ppc_avr_t *t, ppc_avr_t *a, ppc_avr_t *b)
     }
 }
 
+void helper_VDIVESD(ppc_avr_t *t, ppc_avr_t *a, ppc_avr_t *b)
+{
+    int i;
+    int64_t high;
+    uint64_t low;
+    for (i = 0; i < 2; i++) {
+        high = a->s64[i];
+        low = 0;
+        if (unlikely((high == INT64_MIN && b->s64[i] == -1) || !b->s64[i])) {
+            t->s64[i] = a->s64[i]; /* Undefined behavior */
+        } else {
+            divs128(&low, &high, b->s64[i]);
+            t->s64[i] = low;
+        }
+    }
+}
+
+void helper_VDIVEUD(ppc_avr_t *t, ppc_avr_t *a, ppc_avr_t *b)
+{
+    int i;
+    uint64_t high, low;
+    for (i = 0; i < 2; i++) {
+        high = a->u64[i];
+        low = 0;
+        if (unlikely(!b->u64[i])) {
+            t->u64[i] = a->u64[i]; /* Undefined behavior */
+        } else {
+            divu128(&low, &high, b->u64[i]);
+            t->u64[i] = low;
+        }
+    }
+}
+
+void helper_VDIVESQ(ppc_avr_t *t, ppc_avr_t *a, ppc_avr_t *b)
+{
+    Int128 high, low;
+    Int128 int128_min = int128_make128(0, INT64_MIN);
+    Int128 neg1 = int128_makes64(-1);
+
+    high = a->s128;
+    low = int128_zero();
+    if (unlikely(!int128_nz(b->s128) ||
+                 (int128_eq(b->s128, neg1) && int128_eq(high, int128_min)))) {
+        t->s128 = a->s128; /* Undefined behavior */
+    } else {
+        divs256(&low, &high, b->s128);
+        t->s128 = low;
+    }
+}
+
+void helper_VDIVEUQ(ppc_avr_t *t, ppc_avr_t *a, ppc_avr_t *b)
+{
+    Int128 high, low;
+
+    high = a->s128;
+    low = int128_zero();
+    if (unlikely(!int128_nz(b->s128))) {
+        t->s128 = a->s128; /* Undefined behavior */
+    } else {
+        divu256(&low, &high, b->s128);
+        t->s128 = low;
+    }
+}
+
 void helper_VPERM(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
 {
     ppc_avr_t result;
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 8c542bcb29..f00aa64bf9 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -3367,6 +3367,10 @@ DIVU32(do_diveuw, do_diveu_i32)
 
 TRANS_FLAGS2(ISA310, VDIVESW, do_vdiv_vmod, MO_32, do_divesw, NULL)
 TRANS_FLAGS2(ISA310, VDIVEUW, do_vdiv_vmod, MO_32, do_diveuw, NULL)
+TRANS_FLAGS2(ISA310, VDIVESD, do_vx_helper, gen_helper_VDIVESD)
+TRANS_FLAGS2(ISA310, VDIVEUD, do_vx_helper, gen_helper_VDIVEUD)
+TRANS_FLAGS2(ISA310, VDIVESQ, do_vx_helper, gen_helper_VDIVESQ)
+TRANS_FLAGS2(ISA310, VDIVEUQ, do_vx_helper, gen_helper_VDIVEUQ)
 
 #undef DIVS32
 #undef DIVU32
-- 
2.36.1


