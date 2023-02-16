Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4F5698ADF
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 04:02:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSUTW-0003jj-4H; Wed, 15 Feb 2023 21:58:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUTT-0003eU-3A
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:58:19 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUTR-0005oJ-1n
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:58:18 -0500
Received: by mail-pf1-x42a.google.com with SMTP id x13so355916pfu.7
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 18:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=li5lluLj9lzXTBlzleuIeRSOMn7SYzIz3nRkH1+ZWYA=;
 b=F02Xy/SNhesgv4JhzigHi0GH54aez9P+/tCTywf9F8m/WOFrQnYrTWgZYdkXUgeFTv
 rQrYem9MpMMEWqDK8b04nVuxLRNukRyhSwKWnfBD8pZe2xhC7mlOvbzmXLolpRbg3Nit
 ZDwPGKIxtiy24s2qv+JhH4FwDbu705YPeLxQf18+MwUNwLw03f7ZHZ6C+65Vbs0KqPsO
 VlxCN+RW1P2FLfqm6tEUzWkY/Qidv8QAQ7DusWA4yCLL1hNXIFhJ8xtC67UtR5W+Xx+L
 aYqG/6fiiV2266NF/8VMGC7xUuMTtS6a4wlFs3V3eIrPZSGKi4wwyE/liz6n8sYWZgnq
 xOpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=li5lluLj9lzXTBlzleuIeRSOMn7SYzIz3nRkH1+ZWYA=;
 b=5Jbp1HiI2Pb3AXzipkzzHW+T2M8dNncptUznc/lZQW/Zwav6gcAFazh8l8Ifb87g2r
 CcO7RxhwRImTI1xyATAs2loXoybl70+DUws8HtEvTGGm1zSrmW9aO4ZSKRE1Ba3mbC8A
 SnzZBkVxdTgJGyuWEKb+lWKNC1GSOysUsewS5pJe7oRcyargUXsauowdFMwDCVvBVlLd
 r4bOWXTVRYR0XE6lUWDagCzfnTc9PkL50Ge8zivZrU6fCyhvVwJqauClsjHzHiAAs5+q
 8s0L1vRWa2by0CM0zhj0G9TNsaET+GLopzmP/GEmPK2ox6PZ5LXJi8DRErC32/8GW+sM
 6/pg==
X-Gm-Message-State: AO0yUKUQb8C5B2mU7hpu2N3Yfx1GmNCsQTPq8/BfcQK4OQJqB5NWx+jx
 j683hD3aKMfond32YVSvkBU+EBndY3yyqpYjBiw=
X-Google-Smtp-Source: AK7set/QCKwMa6INYseZbC+Q2g2S3JpN4NNNWeCpFrdMCwpbH2d6b29gS3i9aXgFdT8jF55YJtFdGA==
X-Received: by 2002:aa7:9e5d:0:b0:5a8:aae8:1160 with SMTP id
 z29-20020aa79e5d000000b005a8aae81160mr3475025pfq.20.1676516295699; 
 Wed, 15 Feb 2023 18:58:15 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a62aa0e000000b005a816b7c3e8sm89655pff.24.2023.02.15.18.58.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 18:58:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 25/30] tcg/i386: Replace is64 with type in qemu_ld/st
 routines
Date: Wed, 15 Feb 2023 16:57:34 -1000
Message-Id: <20230216025739.1211680-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216025739.1211680-1-richard.henderson@linaro.org>
References: <20230216025739.1211680-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 54 ++++++++++++++++++++++++++-------------
 1 file changed, 36 insertions(+), 18 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index cad1775133..5dcea7e198 100644
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
@@ -2655,17 +2673,17 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
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


