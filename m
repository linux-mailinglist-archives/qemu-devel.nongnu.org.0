Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56ADE2FC02C
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 20:40:22 +0100 (CET)
Received: from localhost ([::1]:49890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1wrV-0006kQ-DV
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 14:40:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l1vpx-0002iE-IE
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:34:41 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:45818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l1vpv-0001GR-TB
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:34:41 -0500
Received: by mail-pl1-x634.google.com with SMTP id b8so10996807plh.12
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 10:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jyybQjiFDPMiQ/WR1CPOwhtb/3DBjHCNWIqS94AKGQU=;
 b=mlnPAlxF+QMsUe2tvcfgE/6Fp8U9beg1EWAgYVXFRqyH4PF7MEtHALAOkvFTUkI4hC
 KLY2P0D3DXlDwdYQStDmt4RvGkqYzU83wiuhxtolrIwHj3rRSJ0dRPq+qgucJB2roH0O
 QFfAko9NFBd0TVrUAb3QkBUJMqx2yUR69TxWZq1hOxW+20TThM4toN5xOM6TwHTcUgjy
 p0FOjRRaYWGaLuMYfl9Z/EAY9LDpkhIzi9Lwcmf87Ug30kC2Mjq9BbXD857vNee+kGtA
 t0wUyYPAC+XlYnIFVswGKJuPbUQH/7ERaLoePD2YNN10om7Ng+HtW66W4n0DtB0FRsDq
 AnKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jyybQjiFDPMiQ/WR1CPOwhtb/3DBjHCNWIqS94AKGQU=;
 b=Tpa4W2plXm7yoPgcFdugawqisZp6qsKxS8LwplDUmXEFIPIyz5zVEAFEoxkLgepyxM
 qgI7Zzv63M971GZOLG2KEH6/m/mbq+D6+EUMYzs3hV2r5zeJ1DzdIBgEJte5ZfBQHu8v
 eXUkfdtDlUa0HYIaAL4uUmHT2MGBAUKhKFfZNMl3DUxJAmrGhXOub6q1OjhhCr+7oIB+
 hYE70UfMBQFRsgXcPB31UVTJyLXE/S4ANtpwPBx8TbAgihj+Mfu4g79bkhjCyGs56cYs
 llMDaPDyca33jd0ZCVVvd/J6m2ObEbDSKXM5e3SvdRC6YKH6QnJC+9ch+UEdXqB0Erfs
 1guQ==
X-Gm-Message-State: AOAM5333UBONVoNhJU/NXXyMb6hCV/Xxj+Pdqw0khF9e56jEtKb/xmTh
 pJ9rSeaMNg6inM/c/WOBeux/bnkLFQn+8g==
X-Google-Smtp-Source: ABdhPJyi6/RhqAtUI+Vn2Qfg2jmvtYCVJwe2+9v9MlcFj1DNXbJ3VBLgE4jozQgNm0QWqfBLmBryVA==
X-Received: by 2002:a17:90a:9414:: with SMTP id
 r20mr1072743pjo.222.1611081278645; 
 Tue, 19 Jan 2021 10:34:38 -0800 (PST)
Received: from localhost.localdomain (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id a136sm20651359pfd.149.2021.01.19.10.34.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 10:34:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] tcg: Adjust tcgv_*_temp/temp_tcgv_*
Date: Tue, 19 Jan 2021 08:34:27 -1000
Message-Id: <20210119183428.556706-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210119183428.556706-1-richard.henderson@linaro.org>
References: <20210119183428.556706-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: lvivier@redhat.com, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Encode the index of the temporary within the "pointer" rather
than its offset.  This breaks a tie with a statically allocated
array of temps.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 34 +++++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 11 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 4d001fed39..996addd90c 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -757,6 +757,11 @@ static inline size_t temp_idx(TCGTemp *ts)
     return ts->index;
 }
 
+/*
+ * TCGArg is a convenience for TCGOps, and never exist outside of
+ * code generation with a specific TCGContext.  Simply store the
+ * pointer value within the TCGArg.
+ */
 static inline TCGArg temp_arg(TCGTemp *ts)
 {
     return (uintptr_t)ts;
@@ -767,15 +772,15 @@ static inline TCGTemp *arg_temp(TCGArg a)
     return (TCGTemp *)(uintptr_t)a;
 }
 
-/* Using the offset of a temporary, relative to TCGContext, rather than
-   its index means that we don't use 0.  That leaves offset 0 free for
-   a NULL representation without having to leave index 0 unused.  */
+/*
+ * TCGv_{i32,i64,ptr,vec} must be independent of TCGContext,
+ * so that the globals that we allocate at startup are valid for
+ * the thread-specfic TCGContext when we generate code.
+ * Reserve 0 for NULL, and use the temp index + 1 otherwise.
+ */
 static inline TCGTemp *tcgv_i32_temp(TCGv_i32 v)
 {
-    uintptr_t o = (uintptr_t)v;
-    TCGTemp *t = (void *)tcg_ctx + o;
-    tcg_debug_assert(offsetof(TCGContext, temps[temp_idx(t)]) == o);
-    return t;
+    return v ? tcg_temp(tcg_ctx, (uintptr_t)v - 1) : NULL;
 }
 
 static inline TCGTemp *tcgv_i64_temp(TCGv_i64 v)
@@ -815,8 +820,7 @@ static inline TCGArg tcgv_vec_arg(TCGv_vec v)
 
 static inline TCGv_i32 temp_tcgv_i32(TCGTemp *t)
 {
-    (void)temp_idx(t); /* trigger embedded assert */
-    return (TCGv_i32)((void *)t - (void *)tcg_ctx);
+    return (TCGv_i32)(t ? (uintptr_t)temp_idx(t) + 1 : 0);
 }
 
 static inline TCGv_i64 temp_tcgv_i64(TCGTemp *t)
@@ -837,12 +841,20 @@ static inline TCGv_vec temp_tcgv_vec(TCGTemp *t)
 #if TCG_TARGET_REG_BITS == 32
 static inline TCGv_i32 TCGV_LOW(TCGv_i64 t)
 {
-    return temp_tcgv_i32(tcgv_i64_temp(t));
+    /*
+     * The 64-bit value is a pair of TCGv_i32, with the low part at index 0.
+     * Since we're encoding the index in @t, pass it through unchanged.
+     */
+    return (TCGv_i32)t;
 }
 
 static inline TCGv_i32 TCGV_HIGH(TCGv_i64 t)
 {
-    return temp_tcgv_i32(tcgv_i64_temp(t) + 1);
+    /*
+     * The 64-bit value is a pair of TCGv_i32, with the high part at index 1.
+     * Since we're encoding the index in @t, add one.
+     */
+    return (TCGv_i32)((uintptr_t)t + 1);
 }
 #endif
 
-- 
2.25.1


