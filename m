Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 704A0159F34
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Feb 2020 03:53:13 +0100 (CET)
Received: from localhost ([::1]:59394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1i9I-0004GO-HI
	for lists+qemu-devel@lfdr.de; Tue, 11 Feb 2020 21:53:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37804)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j1i7z-00036H-DL
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 21:51:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j1i7y-0008J7-BA
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 21:51:51 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:44507)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j1i7y-0008Ho-5h
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 21:51:50 -0500
Received: by mail-pg1-x544.google.com with SMTP id g3so275420pgs.11
 for <qemu-devel@nongnu.org>; Tue, 11 Feb 2020 18:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yq7KJU9Ckv9q08pvg+q5eWeaYNJVCN2hba4P3REH+bo=;
 b=gnP89x92IDdpzMjIY0Ns2VqXhCiMO6hg9dj7SanEsooSQMdBM16aTZdhHKx1DUPNSs
 /RkCh0jKYvIJ2Z7gdTLhnla4+suZFnSE40L9Kmcgwkp5XPKQksaS2FkOuZ+uNDrtmM27
 Y1i3FBWU4hUC1Nk536xBf12GhjS1nd+LMhVCdZCxo+e/GytSdWuB1SqzJqlt0j0n5tMp
 yXDfDeFTuA6cs76XoGtuhdrzlOi/qU1F31Gg2GUXSWLZZ0XTPyjXtRjIHPhIHD4DFBMo
 ViA9vtDwf+oF3tHrH8+rYSW8C14bZoPjn1yEDHDJMp3iDWw8vW3Ae6eYcycZFLSbfnxS
 sExg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yq7KJU9Ckv9q08pvg+q5eWeaYNJVCN2hba4P3REH+bo=;
 b=QuovduC9CbLkwanZc32KCHB/OJkBUQJsmONNsx5ggheB3ilPDEdq1uJpbAX7EdR1hk
 bLK7GugnUllFX/ZHyk/1aZ6rJX/BVeb61R7aQGxrHtKa+nLgwgMqX3lPsahIiYQr1n5k
 64o/NuHMB7sQWA9iv9GfERIqyYO1x2Zf19yeVlbuH8sn43s5DoyyCUMLoAR/WI6fXJ/l
 W7+xXqoCb+YTjsmLpLR1RvtvPeGb00Lmf4o3NUMvYJz/Fns6/ee+4BWND5ArbYOzmGkk
 ffKh9WA/Eoc8AxxiMpqUfTy8CBXlISrbfHIel1xLHdMCpquCA8jzfAgKZt+Mwn5PA+8S
 5NRA==
X-Gm-Message-State: APjAAAXesNoe6agvi4gIXXt47kseRMmVXqAZBNTrMwbk1ciMGFbaVesM
 Idd/kquTf2pD2WA4pFeMMQyh1jzwkv0=
X-Google-Smtp-Source: APXvYqzpAU+pdkaIom4iKRf0dc99LWBA9zOgVIv7qu1UPRNH736Zrnw7JUlRw8VZR2yoNVrzEg9EFA==
X-Received: by 2002:a65:6384:: with SMTP id h4mr9766690pgv.75.1581475908686;
 Tue, 11 Feb 2020 18:51:48 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id d4sm4815749pjg.19.2020.02.11.18.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 18:51:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] tcg: Add tcg_gen_gvec_5_ptr
Date: Tue, 11 Feb 2020 18:51:44 -0800
Message-Id: <20200212025145.24300-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200212025145.24300-1-richard.henderson@linaro.org>
References: <20200212025145.24300-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
Cc: peter.maydell@linaro.org, tsimpson@quicinc.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extend the vector generator infrastructure to handle
5 vector arguments.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op-gvec.h |  7 +++++++
 tcg/tcg-op-gvec.c         | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/include/tcg/tcg-op-gvec.h b/include/tcg/tcg-op-gvec.h
index 830d68f697..74534e2480 100644
--- a/include/tcg/tcg-op-gvec.h
+++ b/include/tcg/tcg-op-gvec.h
@@ -83,6 +83,13 @@ void tcg_gen_gvec_4_ptr(uint32_t dofs, uint32_t aofs, uint32_t bofs,
                         uint32_t maxsz, int32_t data,
                         gen_helper_gvec_4_ptr *fn);
 
+typedef void gen_helper_gvec_5_ptr(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr,
+                                   TCGv_ptr, TCGv_ptr, TCGv_i32);
+void tcg_gen_gvec_5_ptr(uint32_t dofs, uint32_t aofs, uint32_t bofs,
+                        uint32_t cofs, uint32_t eofs, TCGv_ptr ptr,
+                        uint32_t oprsz, uint32_t maxsz, int32_t data,
+                        gen_helper_gvec_5_ptr *fn);
+
 /* Expand a gvec operation.  Either inline or out-of-line depending on
    the actual vector size and the operations supported by the host.  */
 typedef struct {
diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index 41b4a3c661..327d9588e0 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -290,6 +290,38 @@ void tcg_gen_gvec_4_ptr(uint32_t dofs, uint32_t aofs, uint32_t bofs,
     tcg_temp_free_i32(desc);
 }
 
+/* Generate a call to a gvec-style helper with five vector operands
+   and an extra pointer operand.  */
+void tcg_gen_gvec_5_ptr(uint32_t dofs, uint32_t aofs, uint32_t bofs,
+                        uint32_t cofs, uint32_t eofs, TCGv_ptr ptr,
+                        uint32_t oprsz, uint32_t maxsz, int32_t data,
+                        gen_helper_gvec_5_ptr *fn)
+{
+    TCGv_ptr a0, a1, a2, a3, a4;
+    TCGv_i32 desc = tcg_const_i32(simd_desc(oprsz, maxsz, data));
+
+    a0 = tcg_temp_new_ptr();
+    a1 = tcg_temp_new_ptr();
+    a2 = tcg_temp_new_ptr();
+    a3 = tcg_temp_new_ptr();
+    a4 = tcg_temp_new_ptr();
+
+    tcg_gen_addi_ptr(a0, cpu_env, dofs);
+    tcg_gen_addi_ptr(a1, cpu_env, aofs);
+    tcg_gen_addi_ptr(a2, cpu_env, bofs);
+    tcg_gen_addi_ptr(a3, cpu_env, cofs);
+    tcg_gen_addi_ptr(a4, cpu_env, eofs);
+
+    fn(a0, a1, a2, a3, a4, ptr, desc);
+
+    tcg_temp_free_ptr(a0);
+    tcg_temp_free_ptr(a1);
+    tcg_temp_free_ptr(a2);
+    tcg_temp_free_ptr(a3);
+    tcg_temp_free_ptr(a4);
+    tcg_temp_free_i32(desc);
+}
+
 /* Return true if we want to implement something of OPRSZ bytes
    in units of LNSZ.  This limits the expansion of inline code.  */
 static inline bool check_size_impl(uint32_t oprsz, uint32_t lnsz)
-- 
2.20.1


