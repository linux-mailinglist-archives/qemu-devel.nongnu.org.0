Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 463202DD351
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 15:55:35 +0100 (CET)
Received: from localhost ([::1]:51816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpugo-0005Xc-95
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 09:55:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpudz-0003RV-L4
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:52:39 -0500
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:37640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpuds-0004wP-Th
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:52:38 -0500
Received: by mail-oi1-x231.google.com with SMTP id l207so32474108oib.4
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 06:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=v7Fq+nWbx6XhMoBO6EO91HUGM4GfBbdLJgZ/TQ6xfhk=;
 b=O/YZcRp7EhJ/7EowOEtsTqHHpu/94I6+ukBCy84SXmQDhYJzKvCSPONrGMt0vkayRM
 FVkZJLrQHpBml4IS7o1JKTSxhN+00LIdBCDOyJ9oFFQGas15ucjEB9+0vHYkIT50sL3E
 wS4dbMms3uQSMlXW+5jXkGBZRwWU54gtP+q6V1ycpxlE1UYidV9iCyMhRhOtjHCHdG54
 t5DfQJkACmgB6gc3HSPV/kVFG8bYCmE4HcPBcT1QkAs6kfTDQNdBE3ykACJ0gLTZXCB3
 IWDUYXRUdgpRA5D5jvly60wsOasjqVfpeO3L8e9p6SBtQtq1Un/afuCP2KcAXzMpirwC
 pxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v7Fq+nWbx6XhMoBO6EO91HUGM4GfBbdLJgZ/TQ6xfhk=;
 b=Xjes/ueeFnmrpU3wlbNTf/U9Hh0l8KiVen0sw2ZJjw6BheZKUIPG2t0Qn/KpWKFFhF
 dMd1BEcTA3WHxCshdwLo7QS8pHfobG+KpjEJzEB9nxgl3fqqcQ75Pti1f7dFU15fncgd
 WyT6torL8qmmQs8CNf+Cluf1YbKuAyW08J0Q9ZjG17yFHkF4luoRScsXekMs62Po9QVS
 thf79ucUAtRqPNgJRxENd8S+HAHRtYCxPF2KOLaZPiOLlcjm2CIBsGWHflFUylyZ6Meu
 dQe/DVR9PofL2sWG8VulC6JmpR+mzpzGyiwgo72cOBbV3RP0qvliV+0tvtrmPJCjOH+J
 tEXA==
X-Gm-Message-State: AOAM533yMkDSBWEbTWRQvtXia9h9MhehyWIrIzbNzdFBoLkH559zZmUX
 9LRURDS50TW7Pwfqd8mQvMxvYnnL1Y+SyOdz
X-Google-Smtp-Source: ABdhPJwatRudaJf1CpWF7eSteq3My3fgup8XET400hWsXsRVCseibpV3DGEGx+Z1L8uXcLcGSuj9zg==
X-Received: by 2002:a05:6808:49a:: with SMTP id
 z26mr4873555oid.137.1608216750898; 
 Thu, 17 Dec 2020 06:52:30 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id x130sm1136342oif.3.2020.12.17.06.52.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 06:52:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 12/23] tcg: Convert tcg_gen_dupi_vec to TCG_CONST
Date: Thu, 17 Dec 2020 08:52:04 -0600
Message-Id: <20201217145215.534637-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201217145215.534637-1-richard.henderson@linaro.org>
References: <20201217145215.534637-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x231.google.com
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

Because we now store uint64_t in TCGTemp, we can now always
store the full 64-bit duplicate immediate.  So remove the
difference between 32- and 64-bit hosts.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c   |  9 ++++-----
 tcg/tcg-op-vec.c | 39 ++++++++++-----------------------------
 tcg/tcg.c        |  7 +------
 3 files changed, 15 insertions(+), 40 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 1eda7dc419..af07c6f628 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1116,11 +1116,10 @@ void tcg_optimize(TCGContext *s)
         case INDEX_op_dup2_vec:
             assert(TCG_TARGET_REG_BITS == 32);
             if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
-                tmp = arg_info(op->args[1])->val;
-                if (tmp == arg_info(op->args[2])->val) {
-                    tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
-                    break;
-                }
+                tcg_opt_gen_movi(s, &temps_used, op, op->args[0],
+                                 deposit64(arg_info(op->args[1])->val, 32, 32,
+                                           arg_info(op->args[2])->val));
+                break;
             } else if (args_are_copies(op->args[1], op->args[2])) {
                 op->opc = INDEX_op_dup_vec;
                 TCGOP_VECE(op) = MO_32;
diff --git a/tcg/tcg-op-vec.c b/tcg/tcg-op-vec.c
index cdbf11c573..9fbed1366c 100644
--- a/tcg/tcg-op-vec.c
+++ b/tcg/tcg-op-vec.c
@@ -216,25 +216,17 @@ void tcg_gen_mov_vec(TCGv_vec r, TCGv_vec a)
     }
 }
 
-#define MO_REG  (TCG_TARGET_REG_BITS == 64 ? MO_64 : MO_32)
-
-static void do_dupi_vec(TCGv_vec r, unsigned vece, TCGArg a)
-{
-    TCGTemp *rt = tcgv_vec_temp(r);
-    vec_gen_2(INDEX_op_dupi_vec, rt->base_type, vece, temp_arg(rt), a);
-}
-
 TCGv_vec tcg_const_zeros_vec(TCGType type)
 {
     TCGv_vec ret = tcg_temp_new_vec(type);
-    do_dupi_vec(ret, MO_REG, 0);
+    tcg_gen_dupi_vec(MO_64, ret, 0);
     return ret;
 }
 
 TCGv_vec tcg_const_ones_vec(TCGType type)
 {
     TCGv_vec ret = tcg_temp_new_vec(type);
-    do_dupi_vec(ret, MO_REG, -1);
+    tcg_gen_dupi_vec(MO_64, ret, -1);
     return ret;
 }
 
@@ -252,39 +244,28 @@ TCGv_vec tcg_const_ones_vec_matching(TCGv_vec m)
 
 void tcg_gen_dup64i_vec(TCGv_vec r, uint64_t a)
 {
-    if (TCG_TARGET_REG_BITS == 64) {
-        do_dupi_vec(r, MO_64, a);
-    } else if (a == dup_const(MO_32, a)) {
-        do_dupi_vec(r, MO_32, a);
-    } else {
-        TCGv_i64 c = tcg_const_i64(a);
-        tcg_gen_dup_i64_vec(MO_64, r, c);
-        tcg_temp_free_i64(c);
-    }
+    tcg_gen_dupi_vec(MO_64, r, a);
 }
 
 void tcg_gen_dup32i_vec(TCGv_vec r, uint32_t a)
 {
-    do_dupi_vec(r, MO_REG, dup_const(MO_32, a));
+    tcg_gen_dupi_vec(MO_32, r, a);
 }
 
 void tcg_gen_dup16i_vec(TCGv_vec r, uint32_t a)
 {
-    do_dupi_vec(r, MO_REG, dup_const(MO_16, a));
+    tcg_gen_dupi_vec(MO_16, r, a);
 }
 
 void tcg_gen_dup8i_vec(TCGv_vec r, uint32_t a)
 {
-    do_dupi_vec(r, MO_REG, dup_const(MO_8, a));
+    tcg_gen_dupi_vec(MO_8, r, a);
 }
 
 void tcg_gen_dupi_vec(unsigned vece, TCGv_vec r, uint64_t a)
 {
-    if (vece == MO_64) {
-        tcg_gen_dup64i_vec(r, a);
-    } else {
-        do_dupi_vec(r, MO_REG, dup_const(vece, a));
-    }
+    TCGTemp *rt = tcgv_vec_temp(r);
+    tcg_gen_mov_vec(r, tcg_constant_vec(rt->base_type, vece, a));
 }
 
 void tcg_gen_dup_i64_vec(unsigned vece, TCGv_vec r, TCGv_i64 a)
@@ -489,8 +470,8 @@ void tcg_gen_abs_vec(unsigned vece, TCGv_vec r, TCGv_vec a)
             if (tcg_can_emit_vec_op(INDEX_op_sari_vec, type, vece) > 0) {
                 tcg_gen_sari_vec(vece, t, a, (8 << vece) - 1);
             } else {
-                do_dupi_vec(t, MO_REG, 0);
-                tcg_gen_cmp_vec(TCG_COND_LT, vece, t, a, t);
+                tcg_gen_cmp_vec(TCG_COND_LT, vece, t, a,
+                                tcg_constant_vec(type, vece, 0));
             }
             tcg_gen_xor_vec(vece, r, a, t);
             tcg_gen_sub_vec(vece, r, r, t);
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 93f525ea3f..500663e3f5 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -3485,16 +3485,11 @@ static void temp_load(TCGContext *s, TCGTemp *ts, TCGRegSet desired_regs,
              * The targets will, in general, have to do this search anyway,
              * do this generically.
              */
-            if (TCG_TARGET_REG_BITS == 32) {
-                val = dup_const(MO_32, val);
-                vece = MO_32;
-            }
             if (val == dup_const(MO_8, val)) {
                 vece = MO_8;
             } else if (val == dup_const(MO_16, val)) {
                 vece = MO_16;
-            } else if (TCG_TARGET_REG_BITS == 64 &&
-                       val == dup_const(MO_32, val)) {
+            } else if (val == dup_const(MO_32, val)) {
                 vece = MO_32;
             }
 
-- 
2.25.1


