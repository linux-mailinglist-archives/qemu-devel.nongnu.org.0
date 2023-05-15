Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D645703053
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 16:43:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyZLY-0000ff-N5; Mon, 15 May 2023 10:38:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZJw-0005P8-Tf
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:37:08 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZJo-00060B-7H
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:37:04 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1aaff9c93a5so87248725ad.2
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 07:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161413; x=1686753413;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DCduZxszzPV9k+ZJiXPHrxUp5Yyx6mQ092je6pWUrHc=;
 b=WOBf4/FuGoLoJGVXoHMkSiONeFatm8YlDzIbg4fdSjTlzHZY8ZMqr1B/hg87tz+tBV
 VF9alinKnIkbmYeiTI+2VM6V4N6s1dKMY9SqLTeatc3Yyku3FinHRDrX1J0EPOueiQUu
 gYfmiYIBCnC36KZ9CdA1uIT4fRgUObiv1NkDS55j5vOaz6UVxAh/NsfSbi+1VJ0L4/x6
 0m2xzm6RwbroQRECR8OBJZaSzV0F6Nh+6nRecj/hGK/XzUiCi820oxDBPZAkZjozealh
 eaJ40weq7s/kTznVX6979afRVT7NIC4YWILVYNykswJ9ilKEtobNvIQnTHmx6kMBOWJp
 7JNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161413; x=1686753413;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DCduZxszzPV9k+ZJiXPHrxUp5Yyx6mQ092je6pWUrHc=;
 b=IN8iByqWq9+lwr9Rm/J9UHs/Hp/ijk2Q4SbRZjeVniiCQhnrEGu4WaeVSOdZrHEE59
 0GyCw5Jrlu5FnmThjuz8RL8yACv+cY5hI8gyjXpAVJsqoGJronWzG3GpSHSYbM7i9N/6
 eeWgJheZwQVUQRj4pygIRSsPtrKeP8aRN09P/gmgO32u2E2zunBkPqk1VgYwh7brdPlE
 zDVDqL9PjUtLbbBLCxxx5cUifrlFq/PExjTl1UbHxgIgpxhelmC9ADCTSoT2GWu/SUP9
 95GWJ7NegSpHNumkaE+QRbv3NIbsIIRunLfxvndS8C7LOqzRLcsBdk8XvjCkohgiL7UV
 8nkg==
X-Gm-Message-State: AC+VfDw2Bcmt+l7qJr6daqsYVmDvYfBNxEOIodyR7OR0hL5Yn0QDyqa/
 6PoMiYFNt56GDhzPOKWhd/uDlorSmQbJjlS0eBU=
X-Google-Smtp-Source: ACHHUZ41yM6MCtPWUtL2qIbIM19B73BxM1ylYquXl2gV7498o1koyKjY5PuWXP/vVf1NmYHKYwfpXg==
X-Received: by 2002:a17:903:120d:b0:1ae:b38:b6a with SMTP id
 l13-20020a170903120d00b001ae0b380b6amr7585127plh.58.1684161413302; 
 Mon, 15 May 2023 07:36:53 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a1709026ac600b001aadfdfcd06sm8942735plt.299.2023.05.15.07.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:36:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH v5 45/54] tcg/ppc: Use atom_and_align_for_opc
Date: Mon, 15 May 2023 07:33:04 -0700
Message-Id: <20230515143313.734053-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
 tcg/ppc/tcg-target.c.inc | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index b62a163014..b5c49895f3 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -2015,6 +2015,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 typedef struct {
     TCGReg base;
     TCGReg index;
+    TCGAtomAlign aa;
 } HostAddress;
 
 bool tcg_target_has_memory_bswap(MemOp memop)
@@ -2034,7 +2035,23 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 {
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    unsigned a_bits = get_alignment_bits(opc);
+    MemOp a_bits;
+
+    /*
+     * Book II, Section 1.4, Single-Copy Atomicity, specifies:
+     *
+     * Before 3.0, "An access that is not atomic is performed as a set of
+     * smaller disjoint atomic accesses. In general, the number and alignment
+     * of these accesses are implementation-dependent."  Thus MO_ATOM_IFALIGN.
+     *
+     * As of 3.0, "the non-atomic access is performed as described in
+     * the corresponding list", which matches MO_ATOM_SUBALIGN.
+     */
+    h->aa = atom_and_align_for_opc(s, opc,
+                                   have_isa_3_00 ? MO_ATOM_SUBALIGN
+                                                 : MO_ATOM_IFALIGN,
+                                   false);
+    a_bits = h->aa.align;
 
 #ifdef CONFIG_SOFTMMU
     int mem_index = get_mmuidx(oi);
-- 
2.34.1


