Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5CC388157
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 22:25:14 +0200 (CEST)
Received: from localhost ([::1]:37584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj6HB-0001yb-8o
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 16:25:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj64b-0000gt-VT
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:12:13 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:43646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj64P-0006Fb-IX
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:12:13 -0400
Received: by mail-oi1-x22c.google.com with SMTP id j75so10932921oih.10
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 13:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XCI8pCW9Sv6UEY79hKdFH08fK4Rjq+LJfm07d74fiMU=;
 b=pj3d9+cPiCp8LEIjefJO11Mus94aMLb7/Vz9FS7ifNi6ApHYavKN12J9ZTm2uLGd54
 SdyAdmhHPv1SsW06CsCfrB2rFlAzvDhG7/HvMXRE8CsK2aCvA9V2KkNgmIwgFGr7rrp8
 gmkhv/nN3AZ4x+KdjQ3EbGw6Bi8Lo1+PQgM8JZ966H20UljaYXu9i7z5NL7HDlWffBJ4
 eYqZdY6CtDPPgkQpGMidhHOr3ureKi/0gVGkdn1cv5P6FKg5ynVB5l9o/3LMeMtFGUDK
 cyPdMEVOIF8hJLn6DDN1gbDrL1oxpZJ50M3nLK3MV8a/ninUNs6f4LiitQH9mwpjF1iK
 Z7Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XCI8pCW9Sv6UEY79hKdFH08fK4Rjq+LJfm07d74fiMU=;
 b=fklGMn7373ES81w4sO8QYrMZxlS0iliIIqpQrRDRBMPwrjQxQhKfXy4+U/X2FxMdV8
 MfLNuCt9v4RD4yhqHTKOcHuAx0hK2gJAmxzQmNOKb6n95iWP0wScOjQ9gicNXuSvoHK6
 QBdH5Ob9qW6BeE/nkXEx6t3BfgxMoM2D6f5w41rTZpQTsll3HSgLF0zZEmo/FMp4xBo1
 94v7hxTu3SL4Bg8DmfnKMoUn+TG2FQQ33yhCc6EsqdgXxkAC974su87CsXUpsg7ylNNK
 LLzv4Xp6imbS6M1qfIgPFhJQbwi2iNsesZFbOWNAuWGfG5jPNKlWMmkUvUguCsDVOu63
 sqKA==
X-Gm-Message-State: AOAM531ReR+C10zeR4oCmb7WR1r2kS93S6ZROO+UwJs0TXct0WcQdiGq
 mzwYSQZKA/JRaJ9haLrBkodYApQpoV2FwvA9
X-Google-Smtp-Source: ABdhPJx6fn8uJbcPBXVuyUWUy7JmkKSjAOZS3tnwNhNa4CX3xhF7QHaLafwXvJt2SUDn/aAItglREw==
X-Received: by 2002:aca:2b13:: with SMTP id i19mr5324407oik.138.1621368720383; 
 Tue, 18 May 2021 13:12:00 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id u27sm3953204oof.38.2021.05.18.13.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 13:12:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/24] target/ppc: Remove type argument from mmubooke_check_tlb
Date: Tue, 18 May 2021 15:11:34 -0500
Message-Id: <20210518201146.794854-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518201146.794854-1-richard.henderson@linaro.org>
References: <20210518201146.794854-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22c.google.com
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
Cc: bruno.larsen@eldorado.org.br, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can now use MMU_INST_FETCH from access_type for this.
Unify the I/D code paths, making use of prot_for_access_type.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/mmu_helper.c | 46 +++++++++++++----------------------------
 1 file changed, 14 insertions(+), 32 deletions(-)

diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 6860a2aea0..83e7e0dd13 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -738,9 +738,9 @@ void store_40x_sler(CPUPPCState *env, uint32_t val)
 
 static int mmubooke_check_tlb(CPUPPCState *env, ppcemb_tlb_t *tlb,
                               hwaddr *raddr, int *prot, target_ulong address,
-                              MMUAccessType access_type, int type, int i)
+                              MMUAccessType access_type, int i)
 {
-    int ret, prot2;
+    int prot2;
 
     if (ppcemb_tlb_check(env, tlb, raddr, address,
                          env->spr[SPR_BOOKE_PID],
@@ -772,37 +772,19 @@ found_tlb:
     }
 
     /* Check the address space */
-    if (type == ACCESS_CODE) {
-        if (msr_ir != (tlb->attr & 1)) {
-            LOG_SWTLB("%s: AS doesn't match\n", __func__);
-            return -1;
-        }
-
-        *prot = prot2;
-        if (prot2 & PAGE_EXEC) {
-            LOG_SWTLB("%s: good TLB!\n", __func__);
-            return 0;
-        }
-
-        LOG_SWTLB("%s: no PAGE_EXEC: %x\n", __func__, prot2);
-        ret = -3;
-    } else {
-        if (msr_dr != (tlb->attr & 1)) {
-            LOG_SWTLB("%s: AS doesn't match\n", __func__);
-            return -1;
-        }
-
-        *prot = prot2;
-        if (prot2 & (access_type == MMU_DATA_LOAD ? PAGE_READ : PAGE_WRITE)) {
-            LOG_SWTLB("%s: found TLB!\n", __func__);
-            return 0;
-        }
-
-        LOG_SWTLB("%s: PAGE_READ/WRITE doesn't match: %x\n", __func__, prot2);
-        ret = -2;
+    if ((access_type == MMU_INST_FETCH ? msr_ir : msr_dr) != (tlb->attr & 1)) {
+        LOG_SWTLB("%s: AS doesn't match\n", __func__);
+        return -1;
     }
 
-    return ret;
+    *prot = prot2;
+    if (prot2 & prot_for_access_type(access_type)) {
+        LOG_SWTLB("%s: good TLB!\n", __func__);
+        return 0;
+    }
+
+    LOG_SWTLB("%s: no prot match: %x\n", __func__, prot2);
+    return access_type == MMU_INST_FETCH ? -3 : -2;
 }
 
 static int mmubooke_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
@@ -819,7 +801,7 @@ static int mmubooke_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
     for (i = 0; i < env->nb_tlb; i++) {
         tlb = &env->tlb.tlbe[i];
         ret = mmubooke_check_tlb(env, tlb, &raddr, &ctx->prot, address,
-                                 access_type, type, i);
+                                 access_type, i);
         if (ret != -1) {
             break;
         }
-- 
2.25.1


