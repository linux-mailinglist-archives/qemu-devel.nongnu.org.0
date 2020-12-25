Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 652062E2C56
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Dec 2020 21:28:34 +0100 (CET)
Received: from localhost ([::1]:46656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksthR-00037I-HA
	for lists+qemu-devel@lfdr.de; Fri, 25 Dec 2020 15:28:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kstZI-0002zJ-6C
 for qemu-devel@nongnu.org; Fri, 25 Dec 2020 15:20:08 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:36803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kstZF-00059q-Bs
 for qemu-devel@nongnu.org; Fri, 25 Dec 2020 15:20:07 -0500
Received: by mail-pl1-x633.google.com with SMTP id j1so2730492pld.3
 for <qemu-devel@nongnu.org>; Fri, 25 Dec 2020 12:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=VXmyEYzdYmPuTOx3NJVtk+/Y1Dnx3UzO+mJ+oYiTdRI=;
 b=gDNcdOOitM98DUvzBebltt3ekox2HBxtkgCaRY+Sq2z1nBjYmbctc8H/joG93vubdM
 YkLdZYo6LR725g5QcdVvdUq2gfP1TWmuvcUEWSj45FLBa3/3l6ttlyJ5PM1p9lIqmY7Q
 /GWVv9JTI3RdC43xigSzKflZ5ZSANbH51yi/8mudpupmD9Q719LtTNvMB4RkYfAHbrrX
 Cqn0g2HNOC+1jQwmfs6p9hQY9YTRcsqq2UYQ7UBW0kaEaOqlNCj2SbbJOKRzwqwltHQM
 l/NOlOgQf0M2zl+blVCmGjWOuLQBoo+ifz+1knI1dTtFsRLW0HWNL4iSwPXEJweiokev
 Aoag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VXmyEYzdYmPuTOx3NJVtk+/Y1Dnx3UzO+mJ+oYiTdRI=;
 b=Z00CaBOToUFt8Crohp38a2b+/Gw3Y3WYErJb57P3gfIqK2LNO73P5VTbTZCxvuwOCq
 U2RrbKXVr2hU1u6GWWARNrYnQkVqGl9UlhVhb1BvYZz0L24XE2pZAOSpfr5Wx7kJlbkN
 +JWgSHPbNbiYctl4S1J6PEKWQkoZyQGoUAGDdNSmF34g6hmaxWrvb4TysiTxbE1uvNTn
 HGaqlvtuBayJ4hljh14ToUXGQtEG9qnuE158P3in4lgIM8Nt7ha1G7crMTpjyefOi5Oh
 cKBkviHEo7r7L6vXFELxbUxwHA9KGW+BCBEdMAotSdC+TD1fSy5A/r9BTO0r+NZhheHW
 C+MQ==
X-Gm-Message-State: AOAM533SaW9qs1Bg77O2Sb1dtxOBfCkxrTrccu30lpSefPzoEZayhyh/
 QdzhtDDLJAAxHR9N/bKMyKrtmHv2V4w/kw==
X-Google-Smtp-Source: ABdhPJyP+7VLPw17hyQGAalZt4JZM8ERjL5QcXF85sylljWrH6xpWHvY6IMhftUdLO6gw53cWoxHLA==
X-Received: by 2002:a17:90a:c082:: with SMTP id
 o2mr10106229pjs.197.1608927603815; 
 Fri, 25 Dec 2020 12:20:03 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id l8sm5816497pjt.32.2020.12.25.12.20.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Dec 2020 12:20:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/16] tcg/s390x: Implement tcg_out_ld/st for vector types
Date: Fri, 25 Dec 2020 12:19:45 -0800
Message-Id: <20201225201956.692861-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201225201956.692861-1-richard.henderson@linaro.org>
References: <20201225201956.692861-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 117 +++++++++++++++++++++++++++++++++----
 1 file changed, 105 insertions(+), 12 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 6140385e4e..bae70b9119 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -250,6 +250,12 @@ typedef enum S390Opcode {
     RX_STC      = 0x42,
     RX_STH      = 0x40,
 
+    VRX_VL      = 0xe706,
+    VRX_VLLEZ   = 0xe704,
+    VRX_VST     = 0xe70e,
+    VRX_VSTEF   = 0xe70b,
+    VRX_VSTEG   = 0xe70a,
+
     NOP         = 0x0707,
 } S390Opcode;
 
@@ -516,6 +522,26 @@ static void tcg_out_insn_RSY(TCGContext *s, S390Opcode op, TCGReg r1,
 #define tcg_out_insn_RX   tcg_out_insn_RS
 #define tcg_out_insn_RXY  tcg_out_insn_RSY
 
+static int RXB(TCGReg v1, TCGReg v2, TCGReg v3, TCGReg v4)
+{
+    return ((v1 & 16) << (7 - 3))
+         | ((v2 & 16) << (6 - 3))
+         | ((v3 & 16) << (5 - 3))
+         | ((v4 & 16) << (4 - 3));
+}
+
+static void tcg_out_insn_VRX(TCGContext *s, S390Opcode op, TCGReg v1,
+                             TCGReg b2, TCGReg x2, intptr_t d2, int m3)
+{
+    tcg_debug_assert(v1 >= TCG_REG_V0 && v1 <= TCG_REG_V31);
+    tcg_debug_assert(d2 >= 0 && d2 <= 0xfff);
+    tcg_debug_assert(x2 <= TCG_REG_R15);
+    tcg_debug_assert(b2 <= TCG_REG_R15);
+    tcg_out16(s, (op & 0xff00) | ((v1 & 15) << 4) | x2);
+    tcg_out16(s, (b2 << 12) | d2);
+    tcg_out16(s, (op & 0x00ff) | RXB(v1, 0, 0, 0) | (m3 << 12));
+}
+
 /* Emit an opcode with "type-checking" of the format.  */
 #define tcg_out_insn(S, FMT, OP, ...) \
     glue(tcg_out_insn_,FMT)(S, glue(glue(FMT,_),OP), ## __VA_ARGS__)
@@ -692,25 +718,92 @@ static void tcg_out_mem(TCGContext *s, S390Opcode opc_rx, S390Opcode opc_rxy,
     }
 }
 
+static void tcg_out_vrx_mem(TCGContext *s, S390Opcode opc_vrx,
+                            TCGReg data, TCGReg base, TCGReg index,
+                            tcg_target_long ofs, int m3)
+{
+    if (ofs < 0 || ofs >= 0x1000) {
+        if (ofs >= -0x80000 && ofs < 0x80000) {
+            tcg_out_insn(s, RXY, LAY, TCG_TMP0, base, index, ofs);
+            base = TCG_TMP0;
+            index = TCG_REG_NONE;
+            ofs = 0;
+        } else {
+            tcg_out_movi(s, TCG_TYPE_PTR, TCG_TMP0, ofs);
+            if (index != TCG_REG_NONE) {
+                tcg_out_insn(s, RRE, AGR, TCG_TMP0, index);
+            }
+            index = TCG_TMP0;
+            ofs = 0;
+        }
+    }
+    tcg_out_insn_VRX(s, opc_vrx, data, base, index, ofs, m3);
+}
 
 /* load data without address translation or endianness conversion */
-static inline void tcg_out_ld(TCGContext *s, TCGType type, TCGReg data,
-                              TCGReg base, intptr_t ofs)
+static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg data,
+                       TCGReg base, intptr_t ofs)
 {
-    if (type == TCG_TYPE_I32) {
-        tcg_out_mem(s, RX_L, RXY_LY, data, base, TCG_REG_NONE, ofs);
-    } else {
-        tcg_out_mem(s, 0, RXY_LG, data, base, TCG_REG_NONE, ofs);
+    switch (type) {
+    case TCG_TYPE_I32:
+        if (likely(data < 16)) {
+            tcg_out_mem(s, RX_L, RXY_LY, data, base, TCG_REG_NONE, ofs);
+            break;
+        }
+        tcg_out_vrx_mem(s, VRX_VLLEZ, data, base, TCG_REG_NONE, ofs, MO_32);
+        break;
+
+    case TCG_TYPE_I64:
+        if (likely(data < 16)) {
+            tcg_out_mem(s, 0, RXY_LG, data, base, TCG_REG_NONE, ofs);
+            break;
+        }
+        /* fallthru */
+
+    case TCG_TYPE_V64:
+        tcg_out_vrx_mem(s, VRX_VLLEZ, data, base, TCG_REG_NONE, ofs, MO_64);
+        break;
+
+    case TCG_TYPE_V128:
+        /* Hint quadword aligned.  */
+        tcg_out_vrx_mem(s, VRX_VL, data, base, TCG_REG_NONE, ofs, 4);
+        break;
+
+    default:
+        g_assert_not_reached();
     }
 }
 
-static inline void tcg_out_st(TCGContext *s, TCGType type, TCGReg data,
-                              TCGReg base, intptr_t ofs)
+static void tcg_out_st(TCGContext *s, TCGType type, TCGReg data,
+                       TCGReg base, intptr_t ofs)
 {
-    if (type == TCG_TYPE_I32) {
-        tcg_out_mem(s, RX_ST, RXY_STY, data, base, TCG_REG_NONE, ofs);
-    } else {
-        tcg_out_mem(s, 0, RXY_STG, data, base, TCG_REG_NONE, ofs);
+    switch (type) {
+    case TCG_TYPE_I32:
+        if (likely(data < 16)) {
+            tcg_out_mem(s, RX_ST, RXY_STY, data, base, TCG_REG_NONE, ofs);
+        } else {
+            tcg_out_vrx_mem(s, VRX_VSTEF, data, base, TCG_REG_NONE, ofs, 1);
+        }
+        break;
+
+    case TCG_TYPE_I64:
+        if (likely(data < 16)) {
+            tcg_out_mem(s, 0, RXY_STG, data, base, TCG_REG_NONE, ofs);
+            break;
+        }
+        /* fallthru */
+
+    case TCG_TYPE_V64:
+        tcg_out_vrx_mem(s, VRX_VSTEG, data, base, TCG_REG_NONE, ofs, 0);
+        break;
+
+    case TCG_TYPE_V128:
+        /* Hint quadword aligned.  */
+        tcg_out_vrx_mem(s, VRX_VST, data, base, TCG_REG_NONE, ofs, 4);
+        break;
+
+    default:
+        g_assert_not_reached();
     }
 }
 
-- 
2.25.1


