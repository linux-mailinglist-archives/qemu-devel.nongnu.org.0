Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2F86F5212
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:44:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6tm-0005Eb-9F; Wed, 03 May 2023 03:27:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tS-0004PV-VE
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:19 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tQ-0005eo-7G
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:17 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f18335a870so29320815e9.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098834; x=1685690834;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XT0knKquCjoNxaSuoAp369zpPbH7Z8eil9lQND/fecA=;
 b=OZD2dFooDbe3E5OsbVXLiGyO4qiRTJifGrFEpqq8WQAE+etrByz2oHMB6vSurhMqOe
 kwtj+nrG5hIRpOp0HFG1Guh9jJ+yOqHRFluXgwiZ/xl60PWI8kee47hBV3ZdvFOTLJlY
 YFnGrI18ObLvl3ETmek5GTqtayxnbSz1TJuOtcJxd7geTBlad8sr3A31CD1TcxaceOnH
 jULQiHJ8jb6mCXb4uY65uZugARQDW12K3MJJ8Hmruux3mPOCdYtzraWUuYr3/VI51Dbz
 0QNqAnPrR8FjOZhvhuHrbPsDxZOxLwxm15c/Szd7iEDj+kmAc0GS2SI3VY6CvRS16AMd
 oo9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098834; x=1685690834;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XT0knKquCjoNxaSuoAp369zpPbH7Z8eil9lQND/fecA=;
 b=WMd9oh5Uw6RWZEX6474HOQkcaK218wa9l3Gum+tMi6ZgKE8tqYtjPUjDzXHVu3kkRN
 FCN/2KsfGvbRgg8wDbN9vnZclmeKyKoDBS/xFdeHCakF17/VruUsb7mLFQm+z7yLjt0e
 qOxtyKDr1jJ89L+xFCR2kAze9PXdS22ntiKKvMHJqFUW1DbTG3FWVslEuQyNaxAoQ/f5
 76BqC429VCwITG5Q6AqtS5uwtpxgkFs9HjOeSzL3jqTUy3rCikzv1ep2gbEy3PZXUsoG
 be7pAmwOq1udOnxU6DIbcLt364Fe3MAY+7A/uot6fi60mdF1sqf21NvR2ngnyXeCnEcx
 ID1w==
X-Gm-Message-State: AC+VfDxjQfKbqybm3nqxGLtZ49GA1deTAZhVwa6t51ftAGTWWgRMGil7
 kd+e+a5N2XFjZmmfCQqZfgu4jhxJDzA+Jo88lm9wPg==
X-Google-Smtp-Source: ACHHUZ6mRepMkOW6zgrxo47yxLqcrGcm/acOB0ychGzfZEXMosHj7jw60Hu26OgQSd5To9cuEuh9+Q==
X-Received: by 2002:a1c:7405:0:b0:3f1:7129:6b25 with SMTP id
 p5-20020a1c7405000000b003f171296b25mr13508300wmc.18.1683098834667; 
 Wed, 03 May 2023 00:27:14 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm974315wmj.23.2023.05.03.00.27.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:27:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 56/84] tcg: Move TLB_FLAGS_MASK check out of get_alignment_bits
Date: Wed,  3 May 2023 08:23:03 +0100
Message-Id: <20230503072331.1747057-57-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
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

The replacement isn't ideal, as the raw count of bits
is not easily synced with exec/cpu-all.h, but it does
remove from tcg.h the target dependency on TARGET_PAGE_BITS_MIN
which is built into TLB_FLAGS_MASK.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-all.h |  3 +++
 include/tcg/tcg.h      |  4 ----
 tcg/tcg-op-ldst.c      | 18 ++++++++++++++++--
 3 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index ad824fee52..95b9947e20 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -317,6 +317,9 @@ CPUArchState *cpu_copy(CPUArchState *env);
  *
  * Use TARGET_PAGE_BITS_MIN so that these bits are constant
  * when TARGET_PAGE_BITS_VARY is in effect.
+ *
+ * The count, if not the placement of these bits is known
+ * to tcg/tcg-op-ldst.c, check_max_alignment().
  */
 /* Zero if TLB entry is valid.  */
 #define TLB_INVALID_MASK    (1 << (TARGET_PAGE_BITS_MIN - 1))
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 24e8cd65ef..1af6cd5ad4 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -305,10 +305,6 @@ static inline unsigned get_alignment_bits(MemOp memop)
         /* A specific alignment requirement.  */
         a = a >> MO_ASHIFT;
     }
-#if defined(CONFIG_SOFTMMU)
-    /* The requested alignment cannot overlap the TLB flags.  */
-    tcg_debug_assert((TLB_FLAGS_MASK & ((1 << a) - 1)) == 0);
-#endif
     return a;
 }
 
diff --git a/tcg/tcg-op-ldst.c b/tcg/tcg-op-ldst.c
index 9eef859c97..c962a2aa17 100644
--- a/tcg/tcg-op-ldst.c
+++ b/tcg/tcg-op-ldst.c
@@ -32,11 +32,23 @@
 #include "tcg-internal.h"
 
 
-static inline MemOp tcg_canonicalize_memop(MemOp op, bool is64, bool st)
+static void check_max_alignment(unsigned a_bits)
+{
+#if defined(CONFIG_SOFTMMU)
+    /*
+     * The requested alignment cannot overlap the TLB flags.
+     * FIXME: Must keep the count up-to-date with "exec/cpu-all.h".
+     */
+    tcg_debug_assert(a_bits + 6 <= tcg_ctx->page_bits);
+#endif
+}
+
+static MemOp tcg_canonicalize_memop(MemOp op, bool is64, bool st)
 {
-    /* Trigger the asserts within as early as possible.  */
     unsigned a_bits = get_alignment_bits(op);
 
+    check_max_alignment(a_bits);
+
     /* Prefer MO_ALIGN+MO_XX over MO_ALIGN_XX+MO_XX */
     if (a_bits == (op & MO_SIZE)) {
         op = (op & ~MO_AMASK) | MO_ALIGN;
@@ -502,6 +514,7 @@ static void tcg_gen_qemu_ld_i128_int(TCGv_i128 val, TCGTemp *addr,
     TCGv_i64 ext_addr = NULL;
     TCGOpcode opc;
 
+    check_max_alignment(get_alignment_bits(memop));
     tcg_gen_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
 
     /* TODO: For now, force 32-bit hosts to use the helper. */
@@ -612,6 +625,7 @@ static void tcg_gen_qemu_st_i128_int(TCGv_i128 val, TCGTemp *addr,
     TCGv_i64 ext_addr = NULL;
     TCGOpcode opc;
 
+    check_max_alignment(get_alignment_bits(memop));
     tcg_gen_req_mo(TCG_MO_ST_LD | TCG_MO_ST_ST);
 
     /* TODO: For now, force 32-bit hosts to use the helper. */
-- 
2.34.1


