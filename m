Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A062C37ED
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 05:13:47 +0100 (CET)
Received: from localhost ([::1]:37050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khmBe-000532-3m
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 23:13:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khm55-00053O-Mw
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 23:06:59 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:38579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khm54-00065X-2Q
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 23:06:59 -0500
Received: by mail-pl1-x643.google.com with SMTP id l1so456037pld.5
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 20:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hIrGetngsQpn6DynYHLevrPArG00BLTGCrdQJNoe/Gs=;
 b=m64eETgyNScp2D+qMQhBNQ4Igs4QupOgTKQo148uBsW3wEN25ZggV4sibRp7O8R5gh
 prjXaZo9ntMfDLLB0lV9ym8t2zIj0mCRAitnxh/PWZcAPvB8xSwlLiurYWaJrqwnHnVU
 ELHefi7a4pxXwI1JLHleZMlxFFIxQxxVDlHxPDU7oeve/Brx50+mEOet/sJtwdbsTLH9
 ykEIo0v3X5niGp1a5+Hy3xCoTlvYrwwBXYZ8pFlAgwdGdmU3DGtZle9otB0jw9nRPH76
 S8D77zT7jdIG+L9zQQnJYK48bR8wi8Wg4zUemm5A8CKcuhv5VAFTl3eHmggLB57sZKkb
 hMPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hIrGetngsQpn6DynYHLevrPArG00BLTGCrdQJNoe/Gs=;
 b=hoZXy5CSMIxnMgXO31QePjxrjd6kOvQ4Eivx9KtOMvR7r/V4tstMegNYaQ+ULx8meR
 yW1zRf6tdwzFINBwO9HyC5jDHWF9HOYlOEN4DU6VW0DiQJam5gGyjNzUlTPkBBjHYBdn
 14teOSNlpGmu1hqQ/NNkNk6d0iiIAfpRwn8B8n4rygmUL202LWOyEJkLZmr/6L1ZLV46
 palksns7zrnLXGH9S03Xl74mu8CzVjII9Waqq5RVzr2Xodqj+aWoJjX+mPE2DhT7iQSS
 Ge22PT08EJDT3A8rnJ0osQb/Y6hNVdggasRBuapNG1grSOSZg4kjqMbd3ABrluDy+CKo
 5doQ==
X-Gm-Message-State: AOAM531za4wUGEQSSRVfqY0eYGCKSq/vUZPpwn+1RR2WXIY/CQomaDkd
 gWScEd9x8YAs3zmGlN/HtjRSZG5u9ZIkQw==
X-Google-Smtp-Source: ABdhPJwun44iIOHwu8QRRnvanFgNYAnL3L/6cclMWAYBrMRbQtcTiJusPOAOBri+zXLwLErII/1CLw==
X-Received: by 2002:a17:902:167:b029:d8:cfe5:bdee with SMTP id
 94-20020a1709020167b02900d8cfe5bdeemr1461916plb.11.1606277216434; 
 Tue, 24 Nov 2020 20:06:56 -0800 (PST)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id f7sm447806pfe.30.2020.11.24.20.06.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 20:06:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/11] target/arm: Enforce alignment for VLDn/VSTn (multiple)
Date: Tue, 24 Nov 2020 20:06:40 -0800
Message-Id: <20201125040642.2339476-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125040642.2339476-1-richard.henderson@linaro.org>
References: <20201125040642.2339476-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-neon.c.inc | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index 32e47331a5..c4be019d9c 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -427,9 +427,12 @@ static void gen_neon_ldst_base_update(DisasContext *s, int rm, int rn,
 
 static bool trans_VLDST_multiple(DisasContext *s, arg_VLDST_multiple *a)
 {
+    static const MemOp mop_align[4] = {
+        0, MO_ALIGN_8, MO_ALIGN_16, MO_ALIGN_32
+    };
     /* Neon load/store multiple structures */
     int nregs, interleave, spacing, reg, n;
-    MemOp endian = s->be_data;
+    MemOp mop, endian = s->be_data;
     int mmu_idx = get_mem_index(s);
     int size = a->size;
     TCGv_i64 tmp64;
@@ -487,6 +490,10 @@ static bool trans_VLDST_multiple(DisasContext *s, arg_VLDST_multiple *a)
     addr = tcg_temp_new_i32();
     tmp = tcg_const_i32(1 << size);
     load_reg_var(s, addr, a->rn);
+
+    /* Enforce the requested alignment for the first memory operation. */
+    mop = endian | size | mop_align[a->align];
+
     for (reg = 0; reg < nregs; reg++) {
         for (n = 0; n < 8 >> size; n++) {
             int xs;
@@ -494,13 +501,16 @@ static bool trans_VLDST_multiple(DisasContext *s, arg_VLDST_multiple *a)
                 int tt = a->vd + reg + spacing * xs;
 
                 if (a->l) {
-                    gen_aa32_ld_i64(s, tmp64, addr, mmu_idx, endian | size);
+                    gen_aa32_ld_i64(s, tmp64, addr, mmu_idx, mop);
                     neon_store_element64(tt, n, size, tmp64);
                 } else {
                     neon_load_element64(tmp64, tt, n, size);
-                    gen_aa32_st_i64(s, tmp64, addr, mmu_idx, endian | size);
+                    gen_aa32_st_i64(s, tmp64, addr, mmu_idx, mop);
                 }
                 tcg_gen_add_i32(addr, addr, tmp);
+
+                /* Subsequent memory operations inherit alignment */
+                mop &= ~MO_AMASK;
             }
         }
     }
-- 
2.25.1


