Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A956EE8A5
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 21:51:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prOYR-0003G6-B9; Tue, 25 Apr 2023 15:42:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOYI-00035h-MV
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:42:15 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOYD-0007SX-4P
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:42:12 -0400
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4efea4569f5so4058201e87.3
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 12:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451727; x=1685043727;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bVx5ipNFndzzTu/iPLxsCUzCu2+By2v8JyYAdLF1dlA=;
 b=NYRqaN9ZY+sndgk27czSOKr2IiFUlMGeVCXIGc17ugaVjI8VvY47KcfsCKQqf+8IRO
 X+SxaegTWZgst5QO6dLlrPBrJ3gYqdlioMbjOpfhHCW0DhcCbbEJ//X7KPYz/CAVUmRQ
 O3NZbdYohnY0OuxBg3+NYUSBvgK9BH7RiMuMzgJ+n8DXMlSoOUz2a0EM5N5z+VeALCB2
 J9+lpL6qOeihxXb8e3223E2FVXKUw8aCQMefvCCBZQyCDcWuFUTuJ4u8yd7RcwuQrsVr
 Xk0xR3PGBd2mhKakAB3CBi/nXJkgM4H/YEp/FFVbS/f8byo/HeOgA57LrgHb/UVTN7vQ
 rI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451727; x=1685043727;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bVx5ipNFndzzTu/iPLxsCUzCu2+By2v8JyYAdLF1dlA=;
 b=QItVyAe3YKJ7/sa+l6xeg1zyLzWySoSZCMF/2655xGyiQpgQio3ACFGYUVbdFtE1Su
 FZhDfDD7XmW/uMv1Eptf0LIuBtuhHnK5TprzwAEFA9v+0zPmixaA8fcSoFPbmFE8ftCL
 EizvQjpgr3BKpi07+Sk9kqdkYVhiKhYE9E12mQApc0yfv9V7ks7EU7LZPIZJJtwTVCAx
 eBSjLfEbyy1oQj7+B9InK+nb2g4SlH337oIClTT+XgNn6CB4lq6TtN1ufJu6ZCPiott6
 Bf+uzxsEqsNZY8lUNACoQ+j7ptX36Qi76kDMj1GyOWwt3foh6i876iFyYpJAWQAY9PuZ
 2a7A==
X-Gm-Message-State: AAQBX9fg+GFi41w2HpNGhsbC4Zg0+gpqLjrXmFgbLR/UtmeG8TlCRwGS
 vGHqx+b8YTjtb4L3hAynW3NOiK9IuB077fdsloUc0A==
X-Google-Smtp-Source: AKy350bZVClALK/HXPsbzYBLmyHdyAHuMayjA/CmQpZoSxSkblDEj3FzyFQDKzHdmX0CJ7CU/zCw2Q==
X-Received: by 2002:ac2:443b:0:b0:4ee:e0c7:4358 with SMTP id
 w27-20020ac2443b000000b004eee0c74358mr4507496lfl.31.1682451727510; 
 Tue, 25 Apr 2023 12:42:07 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 d8-20020ac25448000000b004ec55ac6cd1sm2175662lfn.136.2023.04.25.12.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:42:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 52/57] tcg/i386: Honor 64-bit atomicity in 32-bit mode
Date: Tue, 25 Apr 2023 20:31:41 +0100
Message-Id: <20230425193146.2106111-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Use the fpu to perform 64-bit loads and stores.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 44 +++++++++++++++++++++++++++++++++------
 1 file changed, 38 insertions(+), 6 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 6a492bb9e7..671937ff5d 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -468,6 +468,10 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 #define OPC_GRP5        (0xff)
 #define OPC_GRP14       (0x73 | P_EXT | P_DATA16)
 
+#define OPC_ESCDF       (0xdf)
+#define ESCDF_FILD_m64  5
+#define ESCDF_FISTP_m64 7
+
 /* Group 1 opcode extensions for 0x80-0x83.
    These are also used as modifiers for OPC_ARITH.  */
 #define ARITH_ADD 0
@@ -2093,7 +2097,20 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
             datalo = datahi;
             datahi = t;
         }
-        if (h.base == datalo || h.index == datalo) {
+        if (h.atom == MO_64) {
+            /*
+             * Atomicity requires that we use use a single 8-byte load.
+             * For simplicity and code size, always use the FPU for this.
+             * Similar insns using SSE/AVX are merely larger.
+             * Load from memory in one go, then store back to the stack,
+             * from whence we can load into the correct integer regs.
+             */
+            tcg_out_modrm_sib_offset(s, OPC_ESCDF + h.seg, ESCDF_FILD_m64,
+                                     h.base, h.index, 0, h.ofs);
+            tcg_out_modrm_offset(s, OPC_ESCDF, ESCDF_FISTP_m64, TCG_REG_ESP, 0);
+            tcg_out_modrm_offset(s, movop, datalo, TCG_REG_ESP, 0);
+            tcg_out_modrm_offset(s, movop, datahi, TCG_REG_ESP, 4);
+        } else if (h.base == datalo || h.index == datalo) {
             tcg_out_modrm_sib_offset(s, OPC_LEA, datahi,
                                      h.base, h.index, 0, h.ofs);
             tcg_out_modrm_offset(s, movop + h.seg, datalo, datahi, 0);
@@ -2163,12 +2180,27 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
         if (TCG_TARGET_REG_BITS == 64) {
             tcg_out_modrm_sib_offset(s, movop + P_REXW + h.seg, datalo,
                                      h.base, h.index, 0, h.ofs);
+            break;
+        }
+        if (use_movbe) {
+            TCGReg t = datalo;
+            datalo = datahi;
+            datahi = t;
+        }
+        if (h.atom == MO_64) {
+            /*
+             * Atomicity requires that we use use one 8-byte store.
+             * For simplicity, and code size, always use the FPU for this.
+             * Similar insns using SSE/AVX are merely larger.
+             * Assemble the 8-byte quantity in required endianness
+             * on the stack, load to coproc unit, and store.
+             */
+            tcg_out_modrm_offset(s, movop, datalo, TCG_REG_ESP, 0);
+            tcg_out_modrm_offset(s, movop, datahi, TCG_REG_ESP, 4);
+            tcg_out_modrm_offset(s, OPC_ESCDF, ESCDF_FILD_m64, TCG_REG_ESP, 0);
+            tcg_out_modrm_sib_offset(s, OPC_ESCDF + h.seg, ESCDF_FISTP_m64,
+                                     h.base, h.index, 0, h.ofs);
         } else {
-            if (use_movbe) {
-                TCGReg t = datalo;
-                datalo = datahi;
-                datahi = t;
-            }
             tcg_out_modrm_sib_offset(s, movop + h.seg, datalo,
                                      h.base, h.index, 0, h.ofs);
             tcg_out_modrm_sib_offset(s, movop + h.seg, datahi,
-- 
2.34.1


