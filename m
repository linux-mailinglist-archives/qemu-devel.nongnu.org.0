Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 641BA62F1E0
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 10:52:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovxzk-0007z1-Ob; Fri, 18 Nov 2022 04:49:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxzI-0007eW-ET
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:48:45 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxzG-00027d-Jf
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:48:44 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 b1-20020a17090a7ac100b00213fde52d49so4574258pjl.3
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 01:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TiMHFur+OZBmf7nFVW9KTqozig+8dJ3+v+HcOHcl0n4=;
 b=IobpO2dRe8aoW9a1TCtal/bG1lsQNGSsuKC9SSFIjPxmmn89MIR82qk++2kOoUHA/9
 qTVH2BLHbk/YssLy1wETf77tkdVKDsMTB559/6YjRpeJM07lxpurF/mV82OP+f1lZtO9
 ijAOrtEOLFE7DO5upa1tqYW2cjD4CRF7xbINae60ZbIMb8oWtZYrDV2IEs1zyFprPkya
 TppP+3pUqyQ9sifg4dVyTOZTC06EeibbTAEL2sr2S6KRheac8amYQxI2VpcoCVSKiaPl
 UmLjMdJTxL59YoJqJIxowQpCeI0QfIoLlL8Kew24U4lLZju5JsvQkQgZS7pFVPQ60QxW
 Mgwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TiMHFur+OZBmf7nFVW9KTqozig+8dJ3+v+HcOHcl0n4=;
 b=Bw6Ew8shAyBaHH3zaeueCBsDWbGjJ85c0xv3wQqZcCw6edGGV1N1ndsHnFskhGvPSR
 /Wn4Nuz1pZqrMZP072QRb2EpC+KqRTHjBLbQK8+xIBTPh1k1ytxlgjPT74C0CvII0Jk/
 il0E54+hlpLx10xmOm5jRJL5V9n1KfBX6G2MLEImnsfpBbG4UGh4GrDxMareRCb4Vt1Q
 fMtabeznV9OOWmjvL2Sme3Mbmq/RaSdFtzN2gVcWlll1qrCtDy9Y7k88jrIfAcZBM5ab
 GIneqsD5bjJA+9ToTcM2GLt/Kguju5GpQ4HcLYw2bmyWUrwHmiq0t+5D0RnRbZyuW2vV
 eYqw==
X-Gm-Message-State: ANoB5pkLXyxy4dvAL7Fm15CZAdxsCPBdz3OgHo/Y1REwYUSDBycaEKUU
 60hdjK2OJB3qjLT+ldEtQntShuLtSuRcZg==
X-Google-Smtp-Source: AA0mqf4CjPRPrNV6SlTuiyydX6GoLU1gZ5TQg9AV8+mmw0NylotostA2cyQKPU58QlT3mvoclsIS3Q==
X-Received: by 2002:a17:90a:fd85:b0:218:4953:58a4 with SMTP id
 cx5-20020a17090afd8500b00218495358a4mr13130686pjb.57.1668764921326; 
 Fri, 18 Nov 2022 01:48:41 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:90b2:345f:bf0a:c412])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a170902e54c00b0018862bb3976sm3115421plf.308.2022.11.18.01.48.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 01:48:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 24/29] tcg/i386: Replace is64 with type in qemu_ld/st
 routines
Date: Fri, 18 Nov 2022 01:47:49 -0800
Message-Id: <20221118094754.242910-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221118094754.242910-1-richard.henderson@linaro.org>
References: <20221118094754.242910-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

Prepare for TCG_TYPE_I128 by not using a boolean.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 54 ++++++++++++++++++++++++++-------------
 1 file changed, 36 insertions(+), 18 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index eb93807b5f..e38f08bd12 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1772,7 +1772,7 @@ static void * const qemu_st_helpers[MO_SIZE + 1] = {
  * Record the context of a call to the out of line helper code for the slow path
  * for a load or store, so that we can later generate the correct helper code
  */
-static void add_qemu_ldst_label(TCGContext *s, bool is_ld, bool is_64,
+static void add_qemu_ldst_label(TCGContext *s, bool is_ld, TCGType type,
                                 MemOpIdx oi,
                                 TCGReg datalo, TCGReg datahi,
                                 TCGReg addrlo, TCGReg addrhi,
@@ -1783,7 +1783,7 @@ static void add_qemu_ldst_label(TCGContext *s, bool is_ld, bool is_64,
 
     label->is_ld = is_ld;
     label->oi = oi;
-    label->type = is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
+    label->type = type;
     label->datalo_reg = datalo;
     label->datahi_reg = datahi;
     label->addrlo_reg = addrlo;
@@ -2124,10 +2124,10 @@ static inline int setup_guest_base_seg(void)
 
 static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
                                    TCGReg base, int index, intptr_t ofs,
-                                   int seg, bool is64, MemOp memop)
+                                   int seg, TCGType type, MemOp memop)
 {
     bool use_movbe = false;
-    int rexw = is64 * P_REXW;
+    int rexw = (type == TCG_TYPE_I32 ? 0 : P_REXW);
     int movop = OPC_MOVL_GvEv;
 
     /* Do big-endian loads with movbe.  */
@@ -2220,7 +2220,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
 /* XXX: qemu_ld and qemu_st could be modified to clobber only EDX and
    EAX. It will be useful once fixed registers globals are less
    common. */
-static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
+static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, TCGType type)
 {
     TCGReg datalo, datahi, addrlo;
     TCGReg addrhi __attribute__((unused));
@@ -2232,7 +2232,16 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
 #endif
 
     datalo = *args++;
-    datahi = (TCG_TARGET_REG_BITS == 32 && is64 ? *args++ : 0);
+    switch (type) {
+    case TCG_TYPE_I32:
+        datahi = 0;
+        break;
+    case TCG_TYPE_I64:
+        datahi = (TCG_TARGET_REG_BITS == 32 ? *args++ : 0);
+        break;
+    default:
+        g_assert_not_reached();
+    }
     addrlo = *args++;
     addrhi = (TARGET_LONG_BITS > TCG_TARGET_REG_BITS ? *args++ : 0);
     oi = *args++;
@@ -2243,10 +2252,10 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
                      label_ptr, offsetof(CPUTLBEntry, addr_read));
 
     /* TLB Hit.  */
-    tcg_out_qemu_ld_direct(s, datalo, datahi, TCG_REG_L1, -1, 0, 0, is64, opc);
+    tcg_out_qemu_ld_direct(s, datalo, datahi, TCG_REG_L1, -1, 0, 0, type, opc);
 
     /* Record the current context of a load into ldst label */
-    add_qemu_ldst_label(s, true, is64, oi, datalo, datahi,
+    add_qemu_ldst_label(s, true, type, oi, datalo, datahi,
                         TCG_REG_L1, addrhi, s->code_ptr, label_ptr);
 #else
     a_bits = get_alignment_bits(opc);
@@ -2255,9 +2264,9 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
     }
     tcg_out_qemu_ld_direct(s, datalo, datahi, addrlo, x86_guest_base_index,
                            x86_guest_base_offset, x86_guest_base_seg,
-                           is64, opc);
+                           type, opc);
     if (a_bits) {
-        add_qemu_ldst_label(s, true, is64, oi, datalo, datahi,
+        add_qemu_ldst_label(s, true, type, oi, datalo, datahi,
                             addrlo, addrhi, s->code_ptr, label_ptr);
     }
 #endif
@@ -2315,7 +2324,7 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
     }
 }
 
-static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
+static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, TCGType type)
 {
     TCGReg datalo, datahi, addrlo;
     TCGReg addrhi __attribute__((unused));
@@ -2327,7 +2336,16 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
 #endif
 
     datalo = *args++;
-    datahi = (TCG_TARGET_REG_BITS == 32 && is64 ? *args++ : 0);
+    switch (type) {
+    case TCG_TYPE_I32:
+        datahi = 0;
+        break;
+    case TCG_TYPE_I64:
+        datahi = (TCG_TARGET_REG_BITS == 32 ? *args++ : 0);
+        break;
+    default:
+        g_assert_not_reached();
+    }
     addrlo = *args++;
     addrhi = (TARGET_LONG_BITS > TCG_TARGET_REG_BITS ? *args++ : 0);
     oi = *args++;
@@ -2341,7 +2359,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
     tcg_out_qemu_st_direct(s, datalo, datahi, TCG_REG_L1, -1, 0, 0, opc);
 
     /* Record the current context of a store into ldst label */
-    add_qemu_ldst_label(s, false, is64, oi, datalo, datahi,
+    add_qemu_ldst_label(s, false, type, oi, datalo, datahi,
                         TCG_REG_L1, addrhi, s->code_ptr, label_ptr);
 #else
     a_bits = get_alignment_bits(opc);
@@ -2351,7 +2369,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
     tcg_out_qemu_st_direct(s, datalo, datahi, addrlo, x86_guest_base_index,
                            x86_guest_base_offset, x86_guest_base_seg, opc);
     if (a_bits) {
-        add_qemu_ldst_label(s, false, is64, oi, datalo, datahi,
+        add_qemu_ldst_label(s, false, type, oi, datalo, datahi,
                             addrlo, addrhi, s->code_ptr, label_ptr);
     }
 #endif
@@ -2649,17 +2667,17 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_qemu_ld_i32:
-        tcg_out_qemu_ld(s, args, 0);
+        tcg_out_qemu_ld(s, args, TCG_TYPE_I32);
         break;
     case INDEX_op_qemu_ld_i64:
-        tcg_out_qemu_ld(s, args, 1);
+        tcg_out_qemu_ld(s, args, TCG_TYPE_I64);
         break;
     case INDEX_op_qemu_st_i32:
     case INDEX_op_qemu_st8_i32:
-        tcg_out_qemu_st(s, args, 0);
+        tcg_out_qemu_st(s, args, TCG_TYPE_I32);
         break;
     case INDEX_op_qemu_st_i64:
-        tcg_out_qemu_st(s, args, 1);
+        tcg_out_qemu_st(s, args, TCG_TYPE_I64);
         break;
 
     OP_32_64(mulu2):
-- 
2.34.1


