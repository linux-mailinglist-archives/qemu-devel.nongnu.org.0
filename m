Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBA8703076
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 16:48:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyZKM-0005n8-NB; Mon, 15 May 2023 10:37:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZJk-0004lt-4y
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:36:57 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZJi-0005wq-FF
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:36:51 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1a516fb6523so120170055ad.3
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 07:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161409; x=1686753409;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=udci6EEhxJsFM3OJ4RCi5N8U0RcK0CcyHoB02ejCoyw=;
 b=GUtI0IckYyMCaETSFMXz9jpRAioavRDtkAzg8O9UEOOfc9DCWCt38FQ1Wqhf+6uE/z
 2NMv3/GtZxP24jmmmiScPagnNf9fReO7LLnhfUs7CaYvQC+XWZxiy7enU9TzM457gCxe
 5zqN07howVaXg4nAwcvBDSTRWiw+ov5fqBcvIMWf3wM28HjOvKUYs81IndTHgCtbmRCH
 OvVJqQUOQmlDxZVnzlUahLohKJlZ6P0l33g8gbmDfhJprVSLTEHbziMSEBuNdYc6volQ
 W/UOcnukelK7NCU4QeYZiZaHxoAkHD/dzZuNu9Kmsh6bgYeokc7R6rNbuD4f3d/tz+j7
 ga+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161409; x=1686753409;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=udci6EEhxJsFM3OJ4RCi5N8U0RcK0CcyHoB02ejCoyw=;
 b=Mo6dwGHAq0e10lgBlHlrHsBip/2U+6h2msgEJa/zb++na9vgCdw1GCAgdNOCDIx6GM
 lITn+zzRrqCfEtf/X6HN6IgGlrJbkbQ/b5VJ8wKfOcEil5Pw9UzpLsHJ5Yrc1Nxdqk26
 iBy+eykhrz3pAGZSj8a7t0rj366E/jtr7IR/XTxN8GPTun/BXc70EfzHJ0Aj3ICCnB2Q
 maGbI3ZgQUiGuK1yVBGwE4XQIzjf4yOUz87O4s9neBoVw7mHKaY//38DAWpVzNyqt3tQ
 IVLGJh9ZijNk4uyZYFE08ew0LFrPlk5gByiOj5/XOtImzBQJUheo3vgpwsjpdD+IyAaj
 tEvA==
X-Gm-Message-State: AC+VfDxpVOTHOMo6uhEbggJKZnK5pqN8uhgg8vNqPjoU527Z61WqDJ15
 l7v98EgsrrhuhA59yXFhBTlvL91f4EvA4tvEfbk=
X-Google-Smtp-Source: ACHHUZ5bDIkV7zY5LFJWUsa/CBY3mzbTIQ0Mdzcm5MGgVa4RHMbvD1LdlbvlDIQ/N7OwncTuFeDHnA==
X-Received: by 2002:a17:902:7b81:b0:1ae:89a:92 with SMTP id
 w1-20020a1709027b8100b001ae089a0092mr5437652pll.59.1684161409297; 
 Mon, 15 May 2023 07:36:49 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a1709026ac600b001aadfdfcd06sm8942735plt.299.2023.05.15.07.36.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:36:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH v5 40/54] tcg/i386: Use atom_and_align_for_opc
Date: Mon, 15 May 2023 07:32:59 -0700
Message-Id: <20230515143313.734053-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

No change to the ultimate load/store routines yet, so some atomicity
conditions not yet honored, but plumbs the change to alignment through
the relevant functions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v5: Removed r-b for changes to HostAddress.
---
 tcg/i386/tcg-target.c.inc | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 6d55ba5a1c..3b8528e332 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1774,6 +1774,7 @@ typedef struct {
     int index;
     int ofs;
     int seg;
+    TCGAtomAlign aa;
 } HostAddress;
 
 bool tcg_target_has_memory_bswap(MemOp memop)
@@ -1895,8 +1896,18 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 {
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    unsigned a_bits = get_alignment_bits(opc);
-    unsigned a_mask = (1 << a_bits) - 1;
+    unsigned a_mask;
+
+#ifdef CONFIG_SOFTMMU
+    h->index = TCG_REG_L0;
+    h->ofs = 0;
+    h->seg = 0;
+#else
+    *h = x86_guest_base;
+#endif
+    h->base = addrlo;
+    h->aa = atom_and_align_for_opc(s, opc, MO_ATOM_IFALIGN, false);
+    a_mask = (1 << h->aa.align) - 1;
 
 #ifdef CONFIG_SOFTMMU
     int cmp_ofs = is_ld ? offsetof(CPUTLBEntry, addr_read)
@@ -1946,7 +1957,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
      * copy the address and mask.  For lesser alignments, check that we don't
      * cross pages for the complete access.
      */
-    if (a_bits >= s_bits) {
+    if (a_mask >= s_mask) {
         tcg_out_mov(s, ttype, TCG_REG_L1, addrlo);
     } else {
         tcg_out_modrm_offset(s, OPC_LEA + trexw, TCG_REG_L1,
@@ -1977,13 +1988,8 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     /* TLB Hit.  */
     tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_L0, TCG_REG_L0,
                offsetof(CPUTLBEntry, addend));
-
-    *h = (HostAddress) {
-        .base = addrlo,
-        .index = TCG_REG_L0,
-    };
 #else
-    if (a_bits) {
+    if (a_mask) {
         ldst = new_ldst_label(s);
 
         ldst->is_ld = is_ld;
@@ -1997,9 +2003,6 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
         ldst->label_ptr[0] = s->code_ptr;
         s->code_ptr += 4;
     }
-
-    *h = x86_guest_base;
-    h->base = addrlo;
 #endif
 
     return ldst;
-- 
2.34.1


