Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A64283AF93E
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 01:23:40 +0200 (CEST)
Received: from localhost ([::1]:39282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvTGV-0000Wp-H8
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 19:23:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTBy-0000W8-0G
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:18:58 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:40799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTBu-0005t6-Q5
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:18:57 -0400
Received: by mail-pf1-x42c.google.com with SMTP id q192so8293775pfc.7
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 16:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=TgPkvwGFYNi/hYwy/BPIxcT+EKYHn3/r3keK0x0OnG4=;
 b=ng4UbGz+4bSiP3QBdO9ZCPfTrdov4DoP8s8jajACg345WFYhQ4aooioSoT1DTLo9MJ
 RHTAE8r7shaTQFInzCZF5h0yiFJtg3Hb2jipDDNtm1FlGIuqYquovu2if6JJ7XHO3rUP
 YpVhHvdY1Bvf4RcPQRgZXQZ3JE4eAj9hbfYypW8xmlRYIxWMl2ZnttkqL8uiXvZAneFj
 eReM96UKeki3gVXnua/Kr8oy4ztEKNSpZC83S1lPMVTyzOwZAlvqXvepsEn3vFso3hUH
 v4FMt4qvhAfW6I4mttt+MrI6FZmAe8C8u1VMAT5kyMewu39oYRwtfOrueu0bLXxHlcPT
 aQ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TgPkvwGFYNi/hYwy/BPIxcT+EKYHn3/r3keK0x0OnG4=;
 b=SGx03ZyZi07wnOn42ZnUUOo+H8/ZB5GkVKc++e5pvmb2X/g69eAxYflMOYxcQm6vcP
 Z1felb0Ze9UF42Gu8obdoVeOKjD2qRa3HQhJ6Vi1sMmHyByP01Tul5c4nMQlxHaMxaS+
 kmm5WNoUm9NdvGtq93dqNeV+a2VJ9MqiQpW/7uC6CVd22VlJZO1HgHxN3ZGiQzm3W3Ex
 HPxSPLoGQ4Rov9T5+OzwdjhndfFDC1Q2uOMirx+zEDHoK3rR/pe2h+icY3cqVl39zeYD
 wO+IAbfFVRvsMlg2kmdcOByZbpo+tCZ1VeTYKuU5vBOdqIvnKVjbY9naDrgi0gTBw/8S
 WtFA==
X-Gm-Message-State: AOAM530uHX7/nPldh/A7/oX1k2tPFoYefoPjNhRIrPHqd68Msg6sCWEb
 kPWp2Pu+uofwHTxKi0UUxEAL9fkptfyUFw==
X-Google-Smtp-Source: ABdhPJyyT99BGAl/gCzHOw/bFqf9CSZrWpmzW3SNmIOW6Eyzyi462j7x8lUO+rnnSeb8q6NpVZVYjA==
X-Received: by 2002:aa7:9912:0:b029:2e9:c500:41fc with SMTP id
 z18-20020aa799120000b02902e9c50041fcmr627878pff.20.1624317533533; 
 Mon, 21 Jun 2021 16:18:53 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 135sm14429952pgf.20.2021.06.21.16.18.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 16:18:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/29] tcg/aarch64: Merge tcg_out_rev{16,32,64}
Date: Mon, 21 Jun 2021 16:18:23 -0700
Message-Id: <20210621231849.1871164-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621231849.1871164-1-richard.henderson@linaro.org>
References: <20210621231849.1871164-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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

Pass in the input and output size.  We currently use 3 of the 5
possible combinations; the others may be used by new tcg opcodes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 42 ++++++++++++++----------------------
 1 file changed, 16 insertions(+), 26 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 27cde314a9..8619e54fca 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -475,9 +475,7 @@ typedef enum {
     /* Data-processing (1 source) instructions.  */
     I3507_CLZ       = 0x5ac01000,
     I3507_RBIT      = 0x5ac00000,
-    I3507_REV16     = 0x5ac00400,
-    I3507_REV32     = 0x5ac00800,
-    I3507_REV64     = 0x5ac00c00,
+    I3507_REV       = 0x5ac00000, /* + size << 10 */
 
     /* Data-processing (2 source) instructions.  */
     I3508_LSLV      = 0x1ac02000,
@@ -1417,19 +1415,11 @@ static void tcg_out_brcond(TCGContext *s, TCGType ext, TCGCond c, TCGArg a,
     }
 }
 
-static inline void tcg_out_rev64(TCGContext *s, TCGReg rd, TCGReg rn)
+static inline void tcg_out_rev(TCGContext *s, int ext, MemOp s_bits,
+                               TCGReg rd, TCGReg rn)
 {
-    tcg_out_insn(s, 3507, REV64, TCG_TYPE_I64, rd, rn);
-}
-
-static inline void tcg_out_rev32(TCGContext *s, TCGReg rd, TCGReg rn)
-{
-    tcg_out_insn(s, 3507, REV32, TCG_TYPE_I32, rd, rn);
-}
-
-static inline void tcg_out_rev16(TCGContext *s, TCGReg rd, TCGReg rn)
-{
-    tcg_out_insn(s, 3507, REV16, TCG_TYPE_I32, rd, rn);
+    /* REV, REV16, REV32 */
+    tcg_out_insn_3507(s, I3507_REV | (s_bits << 10), ext, rd, rn);
 }
 
 static inline void tcg_out_sxt(TCGContext *s, TCGType ext, MemOp s_bits,
@@ -1737,13 +1727,13 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp memop, TCGType ext,
     case MO_UW:
         tcg_out_ldst_r(s, I3312_LDRH, data_r, addr_r, otype, off_r);
         if (bswap) {
-            tcg_out_rev16(s, data_r, data_r);
+            tcg_out_rev(s, TCG_TYPE_I32, MO_16, data_r, data_r);
         }
         break;
     case MO_SW:
         if (bswap) {
             tcg_out_ldst_r(s, I3312_LDRH, data_r, addr_r, otype, off_r);
-            tcg_out_rev16(s, data_r, data_r);
+            tcg_out_rev(s, TCG_TYPE_I32, MO_16, data_r, data_r);
             tcg_out_sxt(s, ext, MO_16, data_r, data_r);
         } else {
             tcg_out_ldst_r(s, (ext ? I3312_LDRSHX : I3312_LDRSHW),
@@ -1753,13 +1743,13 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp memop, TCGType ext,
     case MO_UL:
         tcg_out_ldst_r(s, I3312_LDRW, data_r, addr_r, otype, off_r);
         if (bswap) {
-            tcg_out_rev32(s, data_r, data_r);
+            tcg_out_rev(s, TCG_TYPE_I32, MO_32, data_r, data_r);
         }
         break;
     case MO_SL:
         if (bswap) {
             tcg_out_ldst_r(s, I3312_LDRW, data_r, addr_r, otype, off_r);
-            tcg_out_rev32(s, data_r, data_r);
+            tcg_out_rev(s, TCG_TYPE_I32, MO_32, data_r, data_r);
             tcg_out_sxt(s, TCG_TYPE_I64, MO_32, data_r, data_r);
         } else {
             tcg_out_ldst_r(s, I3312_LDRSWX, data_r, addr_r, otype, off_r);
@@ -1768,7 +1758,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp memop, TCGType ext,
     case MO_Q:
         tcg_out_ldst_r(s, I3312_LDRX, data_r, addr_r, otype, off_r);
         if (bswap) {
-            tcg_out_rev64(s, data_r, data_r);
+            tcg_out_rev(s, TCG_TYPE_I64, MO_64, data_r, data_r);
         }
         break;
     default:
@@ -1788,21 +1778,21 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp memop,
         break;
     case MO_16:
         if (bswap && data_r != TCG_REG_XZR) {
-            tcg_out_rev16(s, TCG_REG_TMP, data_r);
+            tcg_out_rev(s, TCG_TYPE_I32, MO_16, TCG_REG_TMP, data_r);
             data_r = TCG_REG_TMP;
         }
         tcg_out_ldst_r(s, I3312_STRH, data_r, addr_r, otype, off_r);
         break;
     case MO_32:
         if (bswap && data_r != TCG_REG_XZR) {
-            tcg_out_rev32(s, TCG_REG_TMP, data_r);
+            tcg_out_rev(s, TCG_TYPE_I32, MO_32, TCG_REG_TMP, data_r);
             data_r = TCG_REG_TMP;
         }
         tcg_out_ldst_r(s, I3312_STRW, data_r, addr_r, otype, off_r);
         break;
     case MO_64:
         if (bswap && data_r != TCG_REG_XZR) {
-            tcg_out_rev64(s, TCG_REG_TMP, data_r);
+            tcg_out_rev(s, TCG_TYPE_I64, MO_64, TCG_REG_TMP, data_r);
             data_r = TCG_REG_TMP;
         }
         tcg_out_ldst_r(s, I3312_STRX, data_r, addr_r, otype, off_r);
@@ -2184,15 +2174,15 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_bswap64_i64:
-        tcg_out_rev64(s, a0, a1);
+        tcg_out_rev(s, TCG_TYPE_I64, MO_64, a0, a1);
         break;
     case INDEX_op_bswap32_i64:
     case INDEX_op_bswap32_i32:
-        tcg_out_rev32(s, a0, a1);
+        tcg_out_rev(s, TCG_TYPE_I32, MO_32, a0, a1);
         break;
     case INDEX_op_bswap16_i64:
     case INDEX_op_bswap16_i32:
-        tcg_out_rev16(s, a0, a1);
+        tcg_out_rev(s, TCG_TYPE_I32, MO_16, a0, a1);
         break;
 
     case INDEX_op_ext8s_i64:
-- 
2.25.1


