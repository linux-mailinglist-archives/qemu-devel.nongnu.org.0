Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7D33B78E7
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:54:31 +0200 (CEST)
Received: from localhost ([::1]:44072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJoV-0004cu-1W
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:54:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIwT-00043b-Cl
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:58:42 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:34360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIwK-0002zs-Pw
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:58:41 -0400
Received: by mail-pf1-x42c.google.com with SMTP id i6so132276pfq.1
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5GjlKcFtUOLo4ZBmg8lM1encCtfhP3Rvv45Irrywiqg=;
 b=et54Nylpa39ECeEAt9TlV7zeaIKDNMlWPF+zOgQp8u0AVtA8Cf2JurxOYnH0lRoSOd
 19ObGeyOvTd6u9juuqz0kNVI90nT4x4XRW6mofjvBVW/Yj5f0H+EO/pyAF6fXkwsJmNy
 ukkBnkuiOzO9rTUt/VoVXMMNgON2+N5PJAVbg2xn7ezkLH7gUZ8lFPTljt2C216DHNNX
 paXjY43B4R0+ocIw2BQrLhow/kkTN6XRp+ZzDxJPcqHon+ygEWrCPBSRzkSzsNgQFVhK
 JnAdA1e4lsZ2EjuWYc2s5LJyR4jAe+Zd+wL60x3JFPzVy1Mi/cyQNuLy85X8rTTl03/M
 fwTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5GjlKcFtUOLo4ZBmg8lM1encCtfhP3Rvv45Irrywiqg=;
 b=T+RRYQkyJuBSQA7kLT9FFCa3nH9ZqoU17/MOLjfEspioRTYNVdy24sa8eoptzskWfw
 hFIBf2Q31uhhryMQ9ntkyrXTeJASomTW3RGC2VzwanU5R7WAqG9zNfoVgZrIlGsBBDX1
 RihHhGKjERwXFcZmRErVeGfHCQpAC3KCebliwjNMFypP5jVhOXLUJDnaPdKzJZVDpx8Y
 LYqs8sVS0zN4hkc+BIcUFG27GipnKNXqjQR4pNqOeAjG0/q8HF53uTf12I6PExTkxpDk
 36Vu5wgICSpMSo+aoScTrHfgA9MdCNdDaxbu3s8c4ybJWouqZtmcyvoZoY3w9d3LaP9p
 fd9w==
X-Gm-Message-State: AOAM530cN9+moSl2bBahzynvZBDEhy0UyIgQ6fvLBeCKbQawNFbeQi2l
 6/vGxlXdAR2u38RReq6qK1nWZ/tSYyDY5w==
X-Google-Smtp-Source: ABdhPJx4FVjXCmdc/D4MHZ/PPWhcjJ4y/UtZgHCl7zkPkOJZ9U7REk0APlhX6kb/DfFLoSZMJOT1/g==
X-Received: by 2002:a62:5e04:0:b029:2ea:a8dc:25d3 with SMTP id
 s4-20020a625e040000b02902eaa8dc25d3mr31561852pfb.6.1624993109867; 
 Tue, 29 Jun 2021 11:58:29 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 21sm18002849pfh.103.2021.06.29.11.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:58:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 49/63] tcg/mips: Support bswap flags in tcg_out_bswap32
Date: Tue, 29 Jun 2021 11:54:41 -0700
Message-Id: <20210629185455.3131172-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Merge tcg_out_bswap32 and tcg_out_bswap32s.
Use the flags in the internal uses for loads and stores.

For mips32r2 bswap32 with zero-extension, standardize on
WSBH+ROTR+DEXT.  This is the same number of insns as the
previous DSBH+DSHD+DSRL but fits in better with the flags check.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 39 ++++++++++++++++-----------------------
 1 file changed, 16 insertions(+), 23 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index a9f9f527f6..bf0eb84e2d 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -579,27 +579,20 @@ static void tcg_out_bswap_subr(TCGContext *s, const tcg_insn_unit *sub)
     tcg_debug_assert(ok);
 }
 
-static void tcg_out_bswap32(TCGContext *s, TCGReg ret, TCGReg arg)
+static void tcg_out_bswap32(TCGContext *s, TCGReg ret, TCGReg arg, int flags)
 {
     if (use_mips32r2_instructions) {
         tcg_out_opc_reg(s, OPC_WSBH, ret, 0, arg);
         tcg_out_opc_sa(s, OPC_ROTR, ret, ret, 16);
+        if (flags & TCG_BSWAP_OZ) {
+            tcg_out_opc_bf(s, OPC_DEXT, ret, ret, 31, 0);
+        }
     } else {
-        tcg_out_bswap_subr(s, bswap32_addr);
-        /* delay slot -- never omit the insn, like tcg_out_mov might.  */
-        tcg_out_opc_reg(s, OPC_OR, TCG_TMP0, arg, TCG_REG_ZERO);
-        tcg_out_mov(s, TCG_TYPE_I32, ret, TCG_TMP3);
-    }
-}
-
-static void tcg_out_bswap32u(TCGContext *s, TCGReg ret, TCGReg arg)
-{
-    if (use_mips32r2_instructions) {
-        tcg_out_opc_reg(s, OPC_DSBH, ret, 0, arg);
-        tcg_out_opc_reg(s, OPC_DSHD, ret, 0, ret);
-        tcg_out_dsrl(s, ret, ret, 32);
-    } else {
-        tcg_out_bswap_subr(s, bswap32u_addr);
+        if (flags & TCG_BSWAP_OZ) {
+            tcg_out_bswap_subr(s, bswap32u_addr);
+        } else {
+            tcg_out_bswap_subr(s, bswap32_addr);
+        }
         /* delay slot -- never omit the insn, like tcg_out_mov might.  */
         tcg_out_opc_reg(s, OPC_OR, TCG_TMP0, arg, TCG_REG_ZERO);
         tcg_out_mov(s, TCG_TYPE_I32, ret, TCG_TMP3);
@@ -1381,7 +1374,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
         if (TCG_TARGET_REG_BITS == 64 && is_64) {
             if (use_mips32r2_instructions) {
                 tcg_out_opc_imm(s, OPC_LWU, lo, base, 0);
-                tcg_out_bswap32u(s, lo, lo);
+                tcg_out_bswap32(s, lo, lo, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
             } else {
                 tcg_out_bswap_subr(s, bswap32u_addr);
                 /* delay slot */
@@ -1394,7 +1387,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
     case MO_SL | MO_BSWAP:
         if (use_mips32r2_instructions) {
             tcg_out_opc_imm(s, OPC_LW, lo, base, 0);
-            tcg_out_bswap32(s, lo, lo);
+            tcg_out_bswap32(s, lo, lo, 0);
         } else {
             tcg_out_bswap_subr(s, bswap32_addr);
             /* delay slot */
@@ -1520,7 +1513,7 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg lo, TCGReg hi,
         break;
 
     case MO_32 | MO_BSWAP:
-        tcg_out_bswap32(s, TCG_TMP3, lo);
+        tcg_out_bswap32(s, TCG_TMP3, lo, 0);
         lo = TCG_TMP3;
         /* FALLTHRU */
     case MO_32:
@@ -1539,9 +1532,9 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg lo, TCGReg hi,
             tcg_out_opc_imm(s, OPC_SW, TCG_TMP0, base, 0);
             tcg_out_opc_imm(s, OPC_SW, TCG_TMP1, base, 4);
         } else {
-            tcg_out_bswap32(s, TCG_TMP3, MIPS_BE ? lo : hi);
+            tcg_out_bswap32(s, TCG_TMP3, MIPS_BE ? lo : hi, 0);
             tcg_out_opc_imm(s, OPC_SW, TCG_TMP3, base, 0);
-            tcg_out_bswap32(s, TCG_TMP3, MIPS_BE ? hi : lo);
+            tcg_out_bswap32(s, TCG_TMP3, MIPS_BE ? hi : lo, 0);
             tcg_out_opc_imm(s, OPC_SW, TCG_TMP3, base, 4);
         }
         break;
@@ -1946,10 +1939,10 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_bswap16(s, a0, a1, a2);
         break;
     case INDEX_op_bswap32_i32:
-        tcg_out_bswap32(s, a0, a1);
+        tcg_out_bswap32(s, a0, a1, 0);
         break;
     case INDEX_op_bswap32_i64:
-        tcg_out_bswap32u(s, a0, a1);
+        tcg_out_bswap32(s, a0, a1, a2);
         break;
     case INDEX_op_bswap64_i64:
         tcg_out_bswap64(s, a0, a1);
-- 
2.25.1


