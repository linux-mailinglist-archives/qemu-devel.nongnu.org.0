Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 252C236F8B5
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 12:54:49 +0200 (CEST)
Received: from localhost ([::1]:52268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcQnI-0005ks-68
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 06:54:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQUN-0007rj-E9
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:35:17 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:45853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQUD-0001OF-9Y
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:35:15 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 s5-20020a7bc0c50000b0290147d0c21c51so490242wmh.4
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 03:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=k/QNncVOfgNFtyff4VhYfFUA9Rr1T2/8onXFCTv7J8I=;
 b=kH/1u7Kh6YjjVBmzvdggPkA5ZxDtrEq5+QVJQF7QXl9RDUORjZ493g9vDyZYR4XzFE
 mUAqP1+nfgsmRsdJsboZm2jPibJ96Wdfx+pVlK3ucSJpkSzarTNwbXOIPgbPjRq4x/fQ
 7XyBTXV+2dsd4DRnPm/4yR/GjVVzxooOBjzH0CmMxaTE+O4q9FhAZn9fJlwbUL3t/tdA
 /HnKLgPiP/dlP0DeZnH3Wcm/aOex2YsNMOtVeRbERl8gmQg1up8sUe1zlkQZc2A1IH+F
 K0SZXUXOrwaPzhpXSi4NG+6P+0h2eaeFLILp+Bpvgjn7JzX8+xKe2ozrbhq6YNxB/Opv
 lQBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k/QNncVOfgNFtyff4VhYfFUA9Rr1T2/8onXFCTv7J8I=;
 b=iFNdXJ9k4cbdca+p0am7Zuvs47XoihsH5V11g8EkArFZ0ZuquD14Wo82CBCWW72diP
 l8weJ8Yk2trS8A6ZbDE80AoSteYUEvB4vdhsmej27erT4u5S/scXztj/lq8mdpXVn83R
 Mabme723IyjhUjEXelCcwrRWXWQB/E523F/b/DEO516LE5V5vIYUQgDIHh9ANBEixYmr
 BhxCtud9NwtfJF4wXhYff0l2hFh/wFf0tLuhOzXmlKkX8dm5qBIIcVRLvc57qKH8rpDi
 dZGIEXexdGmR2tf3M/0NSxAZTLcR5p8TqdU0WHY4uLnwxvnkJmxvY+0VoEwBIG9PUoN1
 Fbrg==
X-Gm-Message-State: AOAM533cac/Vm3v8fMruAKdLHU/GADsr3yvmf8KVTCeFPb8crj/h6Jz6
 qje2uC+zlGRHr7j9AGuPMSl/3E6/0dSTgkBJ
X-Google-Smtp-Source: ABdhPJykpCsQyXn/ZZSNe4FOx/UDilfL4xON7xszCX7xphZY3vVvvdJ2TujE+tyCLuexljQ0szHAnA==
X-Received: by 2002:a1c:f708:: with SMTP id v8mr16122319wmh.133.1619778903560; 
 Fri, 30 Apr 2021 03:35:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 18sm12997817wmo.47.2021.04.30.03.35.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 03:35:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 33/43] target/arm: Enforce alignment for VLDn/VSTn (multiple)
Date: Fri, 30 Apr 2021 11:34:27 +0100
Message-Id: <20210430103437.4140-34-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210430103437.4140-1-peter.maydell@linaro.org>
References: <20210430103437.4140-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210419202257.161730-24-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-neon.c.inc | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index 9c2b0760278..e706c37c80a 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -429,7 +429,7 @@ static bool trans_VLDST_multiple(DisasContext *s, arg_VLDST_multiple *a)
 {
     /* Neon load/store multiple structures */
     int nregs, interleave, spacing, reg, n;
-    MemOp endian = s->be_data;
+    MemOp mop, align, endian;
     int mmu_idx = get_mem_index(s);
     int size = a->size;
     TCGv_i64 tmp64;
@@ -473,20 +473,36 @@ static bool trans_VLDST_multiple(DisasContext *s, arg_VLDST_multiple *a)
     }
 
     /* For our purposes, bytes are always little-endian.  */
+    endian = s->be_data;
     if (size == 0) {
         endian = MO_LE;
     }
+
+    /* Enforce alignment requested by the instruction */
+    if (a->align) {
+        align = pow2_align(a->align + 2); /* 4 ** a->align */
+    } else {
+        align = s->align_mem ? MO_ALIGN : 0;
+    }
+
     /*
      * Consecutive little-endian elements from a single register
      * can be promoted to a larger little-endian operation.
      */
     if (interleave == 1 && endian == MO_LE) {
+        /* Retain any natural alignment. */
+        if (align == MO_ALIGN) {
+            align = pow2_align(size);
+        }
         size = 3;
     }
+
     tmp64 = tcg_temp_new_i64();
     addr = tcg_temp_new_i32();
     tmp = tcg_const_i32(1 << size);
     load_reg_var(s, addr, a->rn);
+
+    mop = endian | size | align;
     for (reg = 0; reg < nregs; reg++) {
         for (n = 0; n < 8 >> size; n++) {
             int xs;
@@ -494,15 +510,16 @@ static bool trans_VLDST_multiple(DisasContext *s, arg_VLDST_multiple *a)
                 int tt = a->vd + reg + spacing * xs;
 
                 if (a->l) {
-                    gen_aa32_ld_internal_i64(s, tmp64, addr, mmu_idx,
-                                             endian | size);
+                    gen_aa32_ld_internal_i64(s, tmp64, addr, mmu_idx, mop);
                     neon_store_element64(tt, n, size, tmp64);
                 } else {
                     neon_load_element64(tmp64, tt, n, size);
-                    gen_aa32_st_internal_i64(s, tmp64, addr, mmu_idx,
-                                             endian | size);
+                    gen_aa32_st_internal_i64(s, tmp64, addr, mmu_idx, mop);
                 }
                 tcg_gen_add_i32(addr, addr, tmp);
+
+                /* Subsequent memory operations inherit alignment */
+                mop &= ~MO_AMASK;
             }
         }
     }
-- 
2.20.1


