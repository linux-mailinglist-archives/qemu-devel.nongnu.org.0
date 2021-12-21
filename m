Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F9147C448
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 17:58:05 +0100 (CET)
Received: from localhost ([::1]:58534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mziSi-0005rx-1d
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 11:58:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziIr-0008Rl-LI
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:47:53 -0500
Received: from [2607:f8b0:4864:20::630] (port=34685
 helo=mail-pl1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziIo-0007cP-Of
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:47:53 -0500
Received: by mail-pl1-x630.google.com with SMTP id x15so10792581plg.1
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 08:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/xVyuuUpWpjZuLGW0kevSwG/8cAXGRFDzbVxjAUHy5Q=;
 b=yx9SWpXrU71kdtl4gOausxcn/zMLK0ZX4VO7pLYXC5BZXwsb1FN/IGrzZaLNtBwgVO
 jcNURXcAvB+BukvlxPa5TbbvyQuoOKaCWf10PX5uP89HPv6ZzFsP9Q7Kd70zV4yBGXw5
 c44kIh2k2tOrFkQ79Z49l6noxvEiHjtiMQs5MCGmOX5YWHSYvG8t2RmvvhyTfJ7jfcIl
 ILgLjUOEed00JSyCZeIvpF7T2ZuyhDXeU4p00IwISBoqna7k1uUqKLUs1lP0QINwQrHW
 lJVajyKO8kZxQbccE1EH/6bthz2f1T5WR3J8ZrzqLV0QRxSV4qGDw53CcefOd5+j0Cfe
 LdeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/xVyuuUpWpjZuLGW0kevSwG/8cAXGRFDzbVxjAUHy5Q=;
 b=VJoENWopqiCbKhwK8YxBZD6c0VVPeUr2jt2BP5m9BV0za4lZU7XYH4RuhStmEwWP5Q
 NPoGX/UkupDEmp5SYy0JmGAX1sYsdEMI6vAz25qMe9Zc8fTwSD39VNsUCNGGXYmAySOf
 Wx8b+KpPiLLLe1JS61TiFkECSJ7Pn5Z8BB3rWu0jyU+VgSNCx048SeWsneOw8Wxgf+wf
 tzXh/kIzCvrgK/UJznqY9+O6ClfNJa6p2T2Ns1cM+w7tT11+vtXs21D6aAB5x+I+UV1/
 LmOTDgDbK0hF1bhRK8suKXl52cvsStexmM9VczoDGMcIGfhLGoqbFrGj/+K9WnngoELP
 sIGQ==
X-Gm-Message-State: AOAM5320M3CCTGIym4orbE4M7+xyZ0MP/50MYg3HX8u+H+6RKNUKGGZM
 vp6ZQgi/FbChLbjnyZc5I1EDbuXUG51QmQ==
X-Google-Smtp-Source: ABdhPJzXJT4OsYkVJL5zwdswxi1wjE3Cski4jry0aDmbmjUR3RcvebqVrMEOlxlS6LcruM5UGP3pHg==
X-Received: by 2002:a17:902:8544:b0:148:fef0:5736 with SMTP id
 d4-20020a170902854400b00148fef05736mr4175790plo.154.1640105267487; 
 Tue, 21 Dec 2021 08:47:47 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id b192sm2256818pga.35.2021.12.21.08.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 08:47:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/31] tcg/loongarch64: Implement tcg_out_mov and tcg_out_movi
Date: Tue, 21 Dec 2021 08:47:15 -0800
Message-Id: <20211221164737.1076007-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221164737.1076007-1-richard.henderson@linaro.org>
References: <20211221164737.1076007-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::630
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Cc: WANG Xuerui <git@xen0n.name>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: WANG Xuerui <git@xen0n.name>

Signed-off-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211221054105.178795-10-git@xen0n.name>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 137 +++++++++++++++++++++++++++++++
 1 file changed, 137 insertions(+)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 615bed9096..bb45ea0fcf 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -247,6 +247,141 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
     tcg_out_opc_dbar(s, 0);
 }
 
+static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
+{
+    if (ret == arg) {
+        return true;
+    }
+    switch (type) {
+    case TCG_TYPE_I32:
+    case TCG_TYPE_I64:
+        /*
+         * Conventional register-register move used in LoongArch is
+         * `or dst, src, zero`.
+         */
+        tcg_out_opc_or(s, ret, arg, TCG_REG_ZERO);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    return true;
+}
+
+static bool imm_part_needs_loading(bool high_bits_are_ones,
+                                   tcg_target_long part)
+{
+    if (high_bits_are_ones) {
+        return part != -1;
+    } else {
+        return part != 0;
+    }
+}
+
+/* Loads a 32-bit immediate into rd, sign-extended.  */
+static void tcg_out_movi_i32(TCGContext *s, TCGReg rd, int32_t val)
+{
+    tcg_target_long lo = sextreg(val, 0, 12);
+    tcg_target_long hi12 = sextreg(val, 12, 20);
+
+    /* Single-instruction cases.  */
+    if (lo == val) {
+        /* val fits in simm12: addi.w rd, zero, val */
+        tcg_out_opc_addi_w(s, rd, TCG_REG_ZERO, val);
+        return;
+    }
+    if (0x800 <= val && val <= 0xfff) {
+        /* val fits in uimm12: ori rd, zero, val */
+        tcg_out_opc_ori(s, rd, TCG_REG_ZERO, val);
+        return;
+    }
+
+    /* High bits must be set; load with lu12i.w + optional ori.  */
+    tcg_out_opc_lu12i_w(s, rd, hi12);
+    if (lo != 0) {
+        tcg_out_opc_ori(s, rd, rd, lo & 0xfff);
+    }
+}
+
+static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
+                         tcg_target_long val)
+{
+    /*
+     * LoongArch conventionally loads 64-bit immediates in at most 4 steps,
+     * with dedicated instructions for filling the respective bitfields
+     * below:
+     *
+     *        6                   5                   4               3
+     *  3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2
+     * +-----------------------+---------------------------------------+...
+     * |          hi52         |                  hi32                 |
+     * +-----------------------+---------------------------------------+...
+     *       3                   2                   1
+     *     1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
+     * ...+-------------------------------------+-------------------------+
+     *    |                 hi12                |            lo           |
+     * ...+-------------------------------------+-------------------------+
+     *
+     * Check if val belong to one of the several fast cases, before falling
+     * back to the slow path.
+     */
+
+    intptr_t pc_offset;
+    tcg_target_long val_lo, val_hi, pc_hi, offset_hi;
+    tcg_target_long hi32, hi52;
+    bool rd_high_bits_are_ones;
+
+    /* Value fits in signed i32.  */
+    if (type == TCG_TYPE_I32 || val == (int32_t)val) {
+        tcg_out_movi_i32(s, rd, val);
+        return;
+    }
+
+    /* PC-relative cases.  */
+    pc_offset = tcg_pcrel_diff(s, (void *)val);
+    if (pc_offset == sextreg(pc_offset, 0, 22) && (pc_offset & 3) == 0) {
+        /* Single pcaddu2i.  */
+        tcg_out_opc_pcaddu2i(s, rd, pc_offset >> 2);
+        return;
+    }
+
+    if (pc_offset == (int32_t)pc_offset) {
+        /* Offset within 32 bits; load with pcalau12i + ori.  */
+        val_lo = sextreg(val, 0, 12);
+        val_hi = val >> 12;
+        pc_hi = (val - pc_offset) >> 12;
+        offset_hi = val_hi - pc_hi;
+
+        tcg_debug_assert(offset_hi == sextreg(offset_hi, 0, 20));
+        tcg_out_opc_pcalau12i(s, rd, offset_hi);
+        if (val_lo != 0) {
+            tcg_out_opc_ori(s, rd, rd, val_lo & 0xfff);
+        }
+        return;
+    }
+
+    hi32 = sextreg(val, 32, 20);
+    hi52 = sextreg(val, 52, 12);
+
+    /* Single cu52i.d case.  */
+    if (ctz64(val) >= 52) {
+        tcg_out_opc_cu52i_d(s, rd, TCG_REG_ZERO, hi52);
+        return;
+    }
+
+    /* Slow path.  Initialize the low 32 bits, then concat high bits.  */
+    tcg_out_movi_i32(s, rd, val);
+    rd_high_bits_are_ones = (int32_t)val < 0;
+
+    if (imm_part_needs_loading(rd_high_bits_are_ones, hi32)) {
+        tcg_out_opc_cu32i_d(s, rd, hi32);
+        rd_high_bits_are_ones = hi32 < 0;
+    }
+
+    if (imm_part_needs_loading(rd_high_bits_are_ones, hi52)) {
+        tcg_out_opc_cu52i_d(s, rd, rd, hi52);
+    }
+}
+
 /*
  * Entry-points
  */
@@ -262,6 +397,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_mb(s, a0);
         break;
 
+    case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
+    case INDEX_op_mov_i64:
     default:
         g_assert_not_reached();
     }
-- 
2.25.1


