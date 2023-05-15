Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 287EE703082
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 16:49:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyZLa-0000rG-4g; Mon, 15 May 2023 10:38:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZJz-0005Q1-Gp
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:37:08 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZJo-00060s-TE
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:37:07 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1ab267e3528so91646755ad.0
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 07:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161415; x=1686753415;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DtY46dQ1btaM3hQ34MrgQ/0EC+dDpusLxNLWdyRhtMo=;
 b=C1NxuCWASvRkqmkfxHc6ktErupL+w5No5cEXZ5xw6iGTz8gM7SpDRfVIoksPFtA8sj
 GdYFTHaJNMxcO4IfGkIt5xNmuqxeeuMGj4bqz3Jl36QlXTDRF9YJKdUC83yp1xR0+q9Q
 kGVU5NGx/axkBQ9U/Ifuu/+blj7Nv7GSPz78EFJBI5tQPiDUT8q3+qqZDHtiHyGBhgKn
 TI0fSX+d3wSruyd/VfmRiNeZtIXzwq1aSqizT8iGvoBkQarmAmSr6ZgnhMbqiwrrXXHs
 UWemPR0TImK4NkkdMWYhBGUWmj2KW230UVCJPgfqlMyaiOHP+joj3qs6UP6mIRDEGMcc
 sLcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161415; x=1686753415;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DtY46dQ1btaM3hQ34MrgQ/0EC+dDpusLxNLWdyRhtMo=;
 b=CGI0Wy/fkHslO/ekqwbS52VT8iQbNtAsHuADW8of/DJddwWL71FBU1i7zOJzDMrHRE
 ZaeHwH+gXDMX8fK/KN0BAg73xXU6TUUDI/+ZKkVsCDnm0CAhL1XJ0xzBJVING4ChtuIf
 KJcx8LBf+taUyK4Elu/jccc5iKo9Z78J/3fj746ioZwVtVoEmqW+Chl7Y0X6EM58XqT1
 JNLSoDN2RkqiKRrhHkKftytQUFW05Z5gfcLKk5gaU5zwDS0gzgJEdO1ufuckQUL9LEKj
 SQKm5qr6wawdRgHxuQOThHer9MCfm0hV4UciTE6w0bJNvqYpE6UH2i0fouNBdoPv3yn/
 tIVw==
X-Gm-Message-State: AC+VfDyXYiqOj6AOxKP3kJt19SgRcGavuQidWAEi3hmhL+t8TvqrNqjr
 qYPKLNAbgnl5Ia7akmAW0jwS8fvFN60B0poxgoU=
X-Google-Smtp-Source: ACHHUZ4NobYqBaIXciE3MljHFQG7Lzhz2QKVy4779+0e4m7R+R1rAecRp9Z+36v8kUgmAW4ayoByFA==
X-Received: by 2002:a17:902:dc81:b0:1ac:8cd6:9323 with SMTP id
 n1-20020a170902dc8100b001ac8cd69323mr21982705pld.22.1684161415640; 
 Mon, 15 May 2023 07:36:55 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a1709026ac600b001aadfdfcd06sm8942735plt.299.2023.05.15.07.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:36:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH v5 48/54] tcg/sparc64: Use atom_and_align_for_opc
Date: Mon, 15 May 2023 07:33:07 -0700
Message-Id: <20230515143313.734053-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
 tcg/sparc64/tcg-target.c.inc | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index bb23038529..9676b745a2 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -1009,6 +1009,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 typedef struct {
     TCGReg base;
     TCGReg index;
+    TCGAtomAlign aa;
 } HostAddress;
 
 bool tcg_target_has_memory_bswap(MemOp memop)
@@ -1028,13 +1029,13 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 {
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    unsigned a_bits = get_alignment_bits(opc);
-    unsigned s_bits = opc & MO_SIZE;
+    MemOp s_bits = opc & MO_SIZE;
     unsigned a_mask;
 
     /* We don't support unaligned accesses. */
-    a_bits = MAX(a_bits, s_bits);
-    a_mask = (1u << a_bits) - 1;
+    h->aa = atom_and_align_for_opc(s, opc, MO_ATOM_IFALIGN, false);
+    h->aa.align = MAX(h->aa.align, s_bits);
+    a_mask = (1u << h->aa.align) - 1;
 
 #ifdef CONFIG_SOFTMMU
     int mem_index = get_mmuidx(oi);
@@ -1086,11 +1087,13 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     cc = TARGET_LONG_BITS == 64 ? BPCC_XCC : BPCC_ICC;
     tcg_out_bpcc0(s, COND_NE, BPCC_PN | cc, 0);
 #else
-    if (a_bits != s_bits) {
-        /*
-         * Test for at least natural alignment, and defer
-         * everything else to the helper functions.
-         */
+    /*
+     * If the size equals the required alignment, we can skip the test
+     * and allow host SIGBUS to deliver SIGBUS to the guest.
+     * Otherwise, test for at least natural alignment and defer
+     * everything else to the helper functions.
+     */
+    if (s_bits != get_alignment_bits(opc)) {
         tcg_debug_assert(check_fit_tl(a_mask, 13));
         tcg_out_arithi(s, TCG_REG_G0, addr_reg, a_mask, ARITH_ANDCC);
 
-- 
2.34.1


