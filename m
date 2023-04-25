Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2397F6EE884
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 21:48:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prOX8-0001tJ-Vt; Tue, 25 Apr 2023 15:41:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOX7-0001og-6P
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:41:01 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOX4-00070h-Ci
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:41:00 -0400
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4ec81773cf7so6505632e87.2
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 12:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451657; x=1685043657;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tw0I+ADtSsoTUZP6PXChoGX/kwSbfoaMV4Di5FGXG0I=;
 b=qodv4JENsXPBVovyhFUKZiakrWc+JtBQ6Wn4u/RUJHQ0ExSkxXNwsXQ7frv46tt2IL
 4+rfpWjdEb9ImjCsyC9hHqewN8ejk4tAMUUUvvX/vnbpiCYb41v6Mh7ykHRM8n3CUxB2
 GGCGpKN8t4DQYT9OMn94g+ZX4SLpFgHVYBI9YAjmWIz6d2WGRJKr22V2AHA605sti8+e
 3i3cKAvQwEenPbsvpej19ha2PeBy7vAR2RuMXo5eoLAOjj+Qf6VSPwjWWBhy3wkW64d3
 HbPqDDA2x4DbwjFyAU806LCEMysLCK/aRTfuPRSIHD1BKInKenNwogf3UlJPcev2ZLlB
 iDVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451657; x=1685043657;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tw0I+ADtSsoTUZP6PXChoGX/kwSbfoaMV4Di5FGXG0I=;
 b=WpXfzF/GFBbWP5rZt9yinj4R+cJdy0JNaV5r4XYsfgwzLs5SPgz59fWHXwW/c9ec6W
 qol9idGLf6+qRpr3KVscVIrFv0oa73TRy9Wv1uWbsmK1Pc37HTIjETH/FVoee5JhGj2H
 ThuJLYtuvzafSx0gqB9VNsg8unax+U++lRI4CyuQkrh+ovRIg24qY1yyijR2Y2DL8uBk
 4GegMkUu1+oCe5/FPG1JkDj9PnduWtn+mxn8I5oS/cTI7Bzkmw3Wt8kPvPEsawAGgFMS
 rpaVncsp4B7q6r3PM00I/8xr6RBSRx8hsHa3nscg24eQ3jR3TGJpXykossBLoEylfJBZ
 cv0A==
X-Gm-Message-State: AAQBX9fhA8deWJkCp4pWW19sDyJwweoiPjq9H4LbcRsNgoq5eS1dI4XQ
 q8ChcPpj+Hp61gH6VwLbmtefQ6QvDXEw8pIkpO8mHw==
X-Google-Smtp-Source: AKy350Y/IHUC14UxPo3NY6acFM5I8+9X8Eyof9Hbv9MSIQnTBf5QqDHN0F1xHnVDBrxXQl91QRD6bw==
X-Received: by 2002:ac2:43ce:0:b0:4db:3e7e:51d3 with SMTP id
 u14-20020ac243ce000000b004db3e7e51d3mr4814225lfl.55.1682451657679; 
 Tue, 25 Apr 2023 12:40:57 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 d8-20020ac25448000000b004ec55ac6cd1sm2175662lfn.136.2023.04.25.12.40.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:40:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 44/57] tcg/aarch64: Use atom_and_align_for_opc
Date: Tue, 25 Apr 2023 20:31:33 +0100
Message-Id: <20230425193146.2106111-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x133.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 38 +++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 8e5f3d3688..1d6d382edd 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1593,6 +1593,8 @@ typedef struct {
     TCGReg base;
     TCGReg index;
     TCGType index_ext;
+    MemOp align;
+    MemOp atom;
 } HostAddress;
 
 bool tcg_target_has_memory_bswap(MemOp memop)
@@ -1646,8 +1648,14 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     TCGType addr_type = TARGET_LONG_BITS == 64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    unsigned a_bits = get_alignment_bits(opc);
-    unsigned a_mask = (1u << a_bits) - 1;
+    MemOp atom_u;
+    unsigned a_mask;
+
+    h->align = atom_and_align_for_opc(s, &h->atom, &atom_u, opc,
+                                      have_lse2 ? MO_ATOM_WITHIN16
+                                                : MO_ATOM_IFALIGN,
+                                      false);
+    a_mask = (1 << h->align) - 1;
 
 #ifdef CONFIG_SOFTMMU
     unsigned s_bits = opc & MO_SIZE;
@@ -1693,7 +1701,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
      * bits within the address.  For unaligned access, we check that we don't
      * cross pages using the address of the last byte of the access.
      */
-    if (a_bits >= s_bits) {
+    if (a_mask >= s_mask) {
         x3 = addr_reg;
     } else {
         tcg_out_insn(s, 3401, ADDI, TARGET_LONG_BITS == 64,
@@ -1713,11 +1721,9 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     ldst->label_ptr[0] = s->code_ptr;
     tcg_out_insn(s, 3202, B_C, TCG_COND_NE, 0);
 
-    *h = (HostAddress){
-        .base = TCG_REG_X1,
-        .index = addr_reg,
-        .index_ext = addr_type
-    };
+    h->base = TCG_REG_X1,
+    h->index = addr_reg;
+    h->index_ext = addr_type;
 #else
     if (a_mask) {
         ldst = new_ldst_label(s);
@@ -1735,17 +1741,13 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     }
 
     if (USE_GUEST_BASE) {
-        *h = (HostAddress){
-            .base = TCG_REG_GUEST_BASE,
-            .index = addr_reg,
-            .index_ext = addr_type
-        };
+        h->base = TCG_REG_GUEST_BASE;
+        h->index = addr_reg;
+        h->index_ext = addr_type;
     } else {
-        *h = (HostAddress){
-            .base = addr_reg,
-            .index = TCG_REG_XZR,
-            .index_ext = TCG_TYPE_I64
-        };
+        h->base = addr_reg;
+        h->index = TCG_REG_XZR;
+        h->index_ext = TCG_TYPE_I64;
     }
 #endif
 
-- 
2.34.1


