Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2B96F5130
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:23:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6dl-00044o-Gi; Wed, 03 May 2023 03:11:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dL-0002qM-Ez
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:10:43 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dF-00072z-Qw
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:10:38 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f19ab994ccso49127045e9.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097831; x=1685689831;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tw0I+ADtSsoTUZP6PXChoGX/kwSbfoaMV4Di5FGXG0I=;
 b=fwc9zbfEUwtfnGlWwuG+P6ZbcQaKq1wfCvN+bjePFqM7/htQPSXRa9UuF0FwCkttDO
 NG4c6Ft3DcBwmfwJoWaVnzFv/3AU1SgIsIfHSSm95lO/q7AQbV1WPJ0c2H11rbhcbHog
 S6DMjopqMkugCz7wr//9HJZ78I3sBKWUqodXNrJ9/MKO2NsV8ldxO/iRCmcJnqJC6Sen
 9vliFiQRHqMWdoWqZ+SHmw8yvIHFW/HA76WCPaVzxgpldPNDIfAwTnIS/5d5MwajQKk5
 Juwcg+Yya+7ZZ/19vnZ/O1s7jj9qa/AfF6x35MRF0U2XxTbo84sSCutLf2U8q8/DTOB8
 /+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097831; x=1685689831;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tw0I+ADtSsoTUZP6PXChoGX/kwSbfoaMV4Di5FGXG0I=;
 b=DtlHv3H1gkMz//KKa2kArZVnlqKCV3zM/HP1lsuh9DtCE13rcXxkVWOTF6k8ik6pvK
 GCOrAPlYe/F5T/HhKgWCbqndNtYtTTjuPKlUjzvSXvuqO5oTuT+MhUrWUtu0SbxKodnr
 jMCPJFXlBi0P/kugZUFsasR0GdAXXeNFg5dek+zjEK8Q9euZJTN1HRNz6FbhP6JHbi5S
 lb8r+jX4DLEFzTx7GVLdAtDLivQy/ZK5KeOqeaFdylZmhaSJK/QLivBHEiPDdxKePsae
 L3Ig/jSMKaoMyjHjr3eILOg1JVg8F4Em3fQJK09GDWaHB792uvbtU/kAM1WplhrAiX2J
 qJaw==
X-Gm-Message-State: AC+VfDz7TpYq6txhcJL9vjzHK6rXVsFNGXBlAuQV47KtCt0L2kcDkNGT
 7U6B2rgFRh+WM4hFoBWe0dOtUpCH6+tDmfNPOJdCtQ==
X-Google-Smtp-Source: ACHHUZ6LDDWAWyMNJuRPseXryWqfNZ9XxO23VOs71dvhKcia+S8lkmgYZRlHqe96bMv0dX9Vsfx9WA==
X-Received: by 2002:a7b:cd82:0:b0:3f3:3cba:2f1e with SMTP id
 y2-20020a7bcd82000000b003f33cba2f1emr6261301wmj.23.1683097831328; 
 Wed, 03 May 2023 00:10:31 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c444900b003f173be2ccfsm54223673wmn.2.2023.05.03.00.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:10:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 44/57] tcg/aarch64: Use atom_and_align_for_opc
Date: Wed,  3 May 2023 08:06:43 +0100
Message-Id: <20230503070656.1746170-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


