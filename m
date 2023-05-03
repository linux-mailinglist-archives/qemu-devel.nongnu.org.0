Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 767E36F5105
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:17:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6dq-0004W7-S0; Wed, 03 May 2023 03:11:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dQ-0002vo-Fl
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:10:47 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dI-00072Q-6U
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:10:43 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f19a80a330so29525565e9.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097830; x=1685689830;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ie4qD4RsOKAembPT/VL7Wty2S+rmvIpYPQ8gnkDX74w=;
 b=ivJXbfqOVAy4sCeV//Ge6LVUFpdTvj1BhbXCSm5CJyRqssQFp64eDlkhxnars94GTj
 phlLEQarljBSjQSZkEA4UHsBdoCxELuW3DbI1EJFHDizk1Vk5461uIRRuVOvKJ1OPbd4
 UJnaI8vTv0b1Mz9mAxEnMPPTBvmVBwq9IDGLSlhL19jKEOhoSYXcRsfMp3AxdqrCjgTN
 cG0DDKfHQj8SKOPt02OMg7rLm65NV1diYL7Cut0VhjskovLP/lfpMQ8o9WsQjGHVqFqV
 BP1lp3HDe1hz4QiA+0jiEbMDusR/jHjqbcZhxRSbA8YtJPUA2NCI9TMQwNwf3NA1dNwO
 opHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097830; x=1685689830;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ie4qD4RsOKAembPT/VL7Wty2S+rmvIpYPQ8gnkDX74w=;
 b=lAqQp8l+CXj/ymaW4gZkP5J/cDcp/XqscA5v9QSidQJbToREiHJHHu60OIUELxNZRi
 LcO1Y2Mq8MQztAfOYkqx6OcDdiPjQK8dPy6rcj73dyHwEmmU/+/unthwRh2IovJdpVKQ
 PNb0/JHX0C64JfZxlxR6accD8/mrmdX3+73lBw1RCYTvlUuhWg/6ZoS2DOGB30lpwIsT
 b3FNFktgMuB/+/vMAAHiP6lZXBGwkvBShQ1mg8p9AVaEbvdjewU/dnf1g+sva5i1JZu0
 bdFmcGdVTZROXGl/mGfjP1B7+MN+oMyW0Xq+OMPXQ5jhtAZ1JzOxT91eRqYAThGuMWTn
 mIvQ==
X-Gm-Message-State: AC+VfDzkDPsmZTWRhDdRX+FdWaC+TKDrrL00J53DpuvhAvMXTZNGYw9M
 wiXrCEIfjPJt/XOGYCmRjoqWNwBRNRjLlhJQ/1InLQ==
X-Google-Smtp-Source: ACHHUZ4czBAuYg5PD74PnM7UXKB0nTkIO8m84kc17GVPb7HKLNytjD1Jl8oMwfIymz2zI5+3/nP9uw==
X-Received: by 2002:a7b:c446:0:b0:3ee:6d55:8b73 with SMTP id
 l6-20020a7bc446000000b003ee6d558b73mr13330105wmi.29.1683097830591; 
 Wed, 03 May 2023 00:10:30 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c444900b003f173be2ccfsm54223673wmn.2.2023.05.03.00.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:10:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 43/57] tcg/i386: Use atom_and_align_for_opc
Date: Wed,  3 May 2023 08:06:42 +0100
Message-Id: <20230503070656.1746170-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
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

No change to the ultimate load/store routines yet, so some atomicity
conditions not yet honored, but plumbs the change to alignment through
the relevant functions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 7c72bf6684..3e21f067d6 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1774,6 +1774,8 @@ typedef struct {
     int index;
     int ofs;
     int seg;
+    MemOp align;
+    MemOp atom;
 } HostAddress;
 
 bool tcg_target_has_memory_bswap(MemOp memop)
@@ -1895,8 +1897,12 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 {
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    unsigned a_bits = get_alignment_bits(opc);
-    unsigned a_mask = (1 << a_bits) - 1;
+    MemOp atom_u;
+    unsigned a_mask;
+
+    h->align = atom_and_align_for_opc(s, &h->atom, &atom_u, opc,
+                                      MO_ATOM_IFALIGN, false);
+    a_mask = (1 << h->align) - 1;
 
 #ifdef CONFIG_SOFTMMU
     int cmp_ofs = is_ld ? offsetof(CPUTLBEntry, addr_read)
@@ -1941,10 +1947,12 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
                          TLB_MASK_TABLE_OFS(mem_index) +
                          offsetof(CPUTLBDescFast, table));
 
-    /* If the required alignment is at least as large as the access, simply
-       copy the address and mask.  For lesser alignments, check that we don't
-       cross pages for the complete access.  */
-    if (a_bits >= s_bits) {
+    /*
+     * If the required alignment is at least as large as the access, simply
+     * copy the address and mask.  For lesser alignments, check that we don't
+     * cross pages for the complete access.
+     */
+    if (a_mask >= s_mask) {
         tcg_out_mov(s, ttype, TCG_REG_L1, addrlo);
     } else {
         tcg_out_modrm_offset(s, OPC_LEA + trexw, TCG_REG_L1,
@@ -1976,12 +1984,12 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_L0, TCG_REG_L0,
                offsetof(CPUTLBEntry, addend));
 
-    *h = (HostAddress) {
-        .base = addrlo,
-        .index = TCG_REG_L0,
-    };
+    h->base = addrlo;
+    h->index = TCG_REG_L0;
+    h->ofs = 0;
+    h->seg = 0;
 #else
-    if (a_bits) {
+    if (a_mask) {
         ldst = new_ldst_label(s);
 
         ldst->is_ld = is_ld;
@@ -1996,8 +2004,10 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
         s->code_ptr += 4;
     }
 
-    *h = x86_guest_base;
     h->base = addrlo;
+    h->index = x86_guest_base.index;
+    h->ofs = x86_guest_base.ofs;
+    h->seg = x86_guest_base.seg;
 #endif
 
     return ldst;
-- 
2.34.1


