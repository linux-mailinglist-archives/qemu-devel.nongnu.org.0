Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FE1698AC8
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 03:59:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSUTc-0004Ka-0g; Wed, 15 Feb 2023 21:58:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUTZ-0004AY-OM
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:58:25 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUTX-0005qC-Jg
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:58:25 -0500
Received: by mail-pf1-x42c.google.com with SMTP id ct17so566635pfb.12
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 18:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0XfRS2dDu9SiDclu61/+tgLmkVBKywu8JzeWE1I/auM=;
 b=q8b66nDvwrxE/moTmfzO/ntoYPEJFOue+KI9ArImsIsk0IetKAZk+54eibHL9etUqD
 e3caJ7JA1bsHBzuiJ+/IKhXRiCj5Xd+c3Lqa6PXElgr1tKzDF6AeE9UV+WpsTvwrk0xc
 U/zznYimj1qwcg7FnsLVVbsCe+seuCnTZsKHMh2AHlo/TJAlUz46fgBqoQq7Lcg4sSIo
 iIsh1Vxj2/JFRPZFKF06ScNoL+ZB3CKWLu9zLUV1L2Ck4Poy8wc6/zFAcST6dNVjc398
 PTbiv/qWsdRovGMG0XQszTNP2MF85Zk/41CZ9visFxgP/0Nv/p2BtLh1Nb9AkB3QDY7w
 YJ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0XfRS2dDu9SiDclu61/+tgLmkVBKywu8JzeWE1I/auM=;
 b=SuxGMFSjK2H57w9pQtVla1AOSvZjCYZX61KU1cgwzOnoZpY+tvv6KyBICfOTyJtU0G
 GR3NivGhbZv2WlCGLpB19/MjraK82fEKP3ODFtRXdCjbORIKjKOK3i/EGN4Lj7OuqrVh
 lp1Ojh4wxYbMdulNR3e+I/CjHtz4hZc1PvQMybL84hw24AndSEaxt4/iOOrtqpk03BL7
 CJx3lv53+ehQnuptWCI0sDtfmghX4U+5zQFXK+4e5xI7E6ux4/1IHmgF4/Vy2A722pRQ
 eK/5x5rXlutTCdM3zpLuW6UkZW9vQdunTnI2CP064gHcjnDuZaSX6S7lZRwwC1M+GVn/
 BXEQ==
X-Gm-Message-State: AO0yUKXOX8+G5xVGnWDx2kIfeLhXwh2YOTjOOu+0cF3EFVycBdzhTNG5
 CwqMjJTeiDW5EKGGIAx6+TA+La7jFqTN9+nTCMo=
X-Google-Smtp-Source: AK7set96I6TNJ/BVOjGrRb75bNeOkOb7q7ZuuHwuK441OCYnWTtlzWyj+2i8+g7ftlU7P/G8q45fzg==
X-Received: by 2002:a62:1652:0:b0:5a8:d1a7:772d with SMTP id
 79-20020a621652000000b005a8d1a7772dmr3448789pfw.8.1676516302195; 
 Wed, 15 Feb 2023 18:58:22 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a62aa0e000000b005a816b7c3e8sm89655pff.24.2023.02.15.18.58.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 18:58:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 30/30] tcg/i386: Honor 64-bit atomicity in 32-bit mode
Date: Wed, 15 Feb 2023 16:57:39 -1000
Message-Id: <20230216025739.1211680-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216025739.1211680-1-richard.henderson@linaro.org>
References: <20230216025739.1211680-1-richard.henderson@linaro.org>
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

Use one of the coprocessors to perform 64-bit stores.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 119 +++++++++++++++++++++++++++++++++-----
 1 file changed, 106 insertions(+), 13 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 834978f7a6..2ac0f5cf4e 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -472,6 +472,10 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 #define OPC_GRP5        (0xff)
 #define OPC_GRP14       (0x73 | P_EXT | P_DATA16)
 
+#define OPC_ESCDF       (0xdf)
+#define ESCDF_FILD_m64  5
+#define ESCDF_FISTP_m64 7
+
 /* Group 1 opcode extensions for 0x80-0x83.
    These are also used as modifiers for OPC_ARITH.  */
 #define ARITH_ADD 0
@@ -2400,21 +2404,65 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
             tcg_out_modrm_sib_offset(s, movop + P_REXW + seg, datalo,
                                      base, index, 0, ofs);
         } else {
+            TCGLabel *l1 = NULL, *l2 = NULL;
+            bool use_pair = atom < MO_64;
+
             if (use_movbe) {
                 TCGReg t = datalo;
                 datalo = datahi;
                 datahi = t;
             }
-            if (base != datalo) {
-                tcg_out_modrm_sib_offset(s, movop + seg, datalo,
-                                         base, index, 0, ofs);
-                tcg_out_modrm_sib_offset(s, movop + seg, datahi,
-                                         base, index, 0, ofs + 4);
-            } else {
-                tcg_out_modrm_sib_offset(s, movop + seg, datahi,
-                                         base, index, 0, ofs + 4);
-                tcg_out_modrm_sib_offset(s, movop + seg, datalo,
+
+            if (!use_pair) {
+                /*
+                 * Atomicity requires that we use use a single 8-byte load.
+                 * For simplicity, and code size, always use the FPU for this.
+                 * Similar insns using SSE/AVX are merely larger.
+                 * Load from memory in one go, then store back to the stack,
+                 * from whence we can load into the correct integer regs.
+                 *
+                 * If we've already checked for 8-byte alignment, or not
+                 * checked for alignment at all, that's all we need.
+                 * If we arrive here with lesser but non-zero alignment,
+                 * then we have determined that subalignment can be
+                 * satisfied with two 4-byte loads.
+                 */
+                if (align > MO_8 && align < MO_64) {
+                    use_pair = true;
+                    l1 = gen_new_label();
+                    l2 = gen_new_label();
+
+                    tcg_out_testi(s, base, align == MO_32 ? 4 : 7);
+                    tcg_out_jxx(s, JCC_JNE, l2, true);
+                }
+
+                tcg_out_modrm_sib_offset(s, OPC_ESCDF + seg, ESCDF_FILD_m64,
                                          base, index, 0, ofs);
+                tcg_out_modrm_offset(s, OPC_ESCDF, ESCDF_FISTP_m64,
+                                     TCG_REG_ESP, 0);
+                tcg_out_modrm_offset(s, movop, datalo, TCG_REG_ESP, 0);
+                tcg_out_modrm_offset(s, movop, datahi, TCG_REG_ESP, 4);
+
+                if (use_pair) {
+                    tcg_out_jxx(s, JCC_JMP, l1, true);
+                    tcg_out_label(s, l2);
+                }
+            }
+            if (use_pair) {
+                if (base != datalo) {
+                    tcg_out_modrm_sib_offset(s, movop + seg, datalo,
+                                             base, index, 0, ofs);
+                    tcg_out_modrm_sib_offset(s, movop + seg, datahi,
+                                             base, index, 0, ofs + 4);
+                } else {
+                    tcg_out_modrm_sib_offset(s, movop + seg, datahi,
+                                             base, index, 0, ofs + 4);
+                    tcg_out_modrm_sib_offset(s, movop + seg, datalo,
+                                             base, index, 0, ofs);
+                }
+            }
+            if (l1) {
+                tcg_out_label(s, l1);
             }
         }
         break;
@@ -2577,20 +2625,65 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
     case MO_32:
         tcg_out_modrm_sib_offset(s, movop + seg, datalo, base, index, 0, ofs);
         break;
+
     case MO_64:
         if (TCG_TARGET_REG_BITS == 64) {
             tcg_out_modrm_sib_offset(s, movop + P_REXW + seg, datalo,
                                      base, index, 0, ofs);
         } else {
+            TCGLabel *l1 = NULL, *l2 = NULL;
+            bool use_pair = atom < MO_64;
+
             if (use_movbe) {
                 TCGReg t = datalo;
                 datalo = datahi;
                 datahi = t;
             }
-            tcg_out_modrm_sib_offset(s, movop + seg, datalo,
-                                     base, index, 0, ofs);
-            tcg_out_modrm_sib_offset(s, movop + seg, datahi,
-                                     base, index, 0, ofs + 4);
+
+            if (!use_pair) {
+                /*
+                 * Atomicity requires that we use use one 8-byte store.
+                 * For simplicity, and code size, always use the FPU for this.
+                 * Similar insns using SSE/AVX are merely larger.
+                 * Assemble the 8-byte quantity in required endianness
+                 * on the stack, load to coproc unit, and store.
+                 *
+                 * If we've already checked for 8-byte alignment, or not
+                 * checked for alignment at all, that's all we need.
+                 * If we arrive here with lesser but non-zero alignment,
+                 * then we have determined that subalignment can be
+                 * satisfied with two 4-byte stores.
+                 */
+                if (align > MO_8 && align < MO_64) {
+                    use_pair = true;
+                    l1 = gen_new_label();
+                    l2 = gen_new_label();
+
+                    tcg_out_testi(s, base, align == MO_32 ? 4 : 7);
+                    tcg_out_jxx(s, JCC_JNE, l2, true);
+                }
+
+                tcg_out_modrm_offset(s, movop, datalo, TCG_REG_ESP, 0);
+                tcg_out_modrm_offset(s, movop, datahi, TCG_REG_ESP, 4);
+                tcg_out_modrm_offset(s, OPC_ESCDF, ESCDF_FILD_m64,
+                                     TCG_REG_ESP, 0);
+                tcg_out_modrm_sib_offset(s, OPC_ESCDF + seg, ESCDF_FISTP_m64,
+                                         base, index, 0, ofs);
+
+                if (use_pair) {
+                    tcg_out_jxx(s, JCC_JMP, l1, true);
+                    tcg_out_label(s, l2);
+                }
+            }
+            if (use_pair) {
+                tcg_out_modrm_sib_offset(s, movop + seg, datalo,
+                                         base, index, 0, ofs);
+                tcg_out_modrm_sib_offset(s, movop + seg, datahi,
+                                         base, index, 0, ofs + 4);
+            }
+            if (l1) {
+                tcg_out_label(s, l1);
+            }
         }
         break;
 
-- 
2.34.1


