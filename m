Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFD638812B
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 22:15:22 +0200 (CEST)
Received: from localhost ([::1]:34332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj67d-0005uT-Ba
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 16:15:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj64M-0000JD-Rl
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:11:58 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:43928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj64K-00068f-Qa
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:11:58 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 u19-20020a0568302493b02902d61b0d29adso9751115ots.10
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 13:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a7/fohj61j76TyyFJ4tR2jXYVerXRa1Mweo4AkQY9Lk=;
 b=FA67xz5i1zckkWigmxHDp3HcDrA5bxUPPsLgfLvqFeXCwme7SiaGKvqrMob4Oc9k2j
 B2QYyx4oKL/szxZKWP6pf1n3Fu1rxNVV2+UKadfJTkUmRDkXAI2XkxktH4IhKCDXe/D2
 nlfmTOv1qFYglzOSA9tT5Nd/CB28HcH8OWO5by1ySNP2jBKCHc2rPHCySqgTBRIL5lED
 gzvRopNiO3M0qYqoz4Zgk/avZamP2NG8FloJrWEwkuqV3Za36l1lE4vfqcqHmTJgWz2r
 q+/uXkFoljf8W/vPipyUmialtSMOnbt90GUjnSe/1omJgKsLo4/p7O6uirYmgd8AZcgw
 1XcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a7/fohj61j76TyyFJ4tR2jXYVerXRa1Mweo4AkQY9Lk=;
 b=UJCJ4yG9lMEoHJrz+Zqr2/fLAr11e7JcJV4d4COuYf/fbMAp4HTurzWSGZk1BryMhp
 z/jrxlSQxvALrxdL4aiiOdFDyB6XnS/DaVgmgyt86QgZjTOIHPLRkYUKQ8Xwh+u/8ZyI
 L99bSphxgwpYB28luLtC/4CQZnqR1wqhY8HMWVlZ4bzXskmjNj+MzNnOWufrACoWz/N0
 EBL0QmNPIQsaKpT0j6Ca4GY6/6qGKsf8USEPrZyq64v8A1ChRtyhJoRIPPOfLqbcRxu9
 kdai+CNYqiovs0QBp6VKHDJFFMqwc9jTHlgRESIiYLnsSGdDhvDwPDZ/018DBuOtFPA5
 AueA==
X-Gm-Message-State: AOAM532kIRHy5rEocruttvAclSLkLfOHHHS5gnh88P6zi9T9Bk49CpNP
 3ujq0MNYJfZWkOUX+ItBZj4N3ekznckoZ/aT
X-Google-Smtp-Source: ABdhPJyh+BzP6IMCpjNFsZbmoLU6txZT9hsBhMG0U5qoZbqPehCS7Ie3aRQ9iyu+No3DCR6reEiMcw==
X-Received: by 2002:a9d:37e2:: with SMTP id x89mr5993137otb.352.1621368715588; 
 Tue, 18 May 2021 13:11:55 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id u27sm3953204oof.38.2021.05.18.13.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 13:11:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/24] target/ppc: Remove type argument from check_prot
Date: Tue, 18 May 2021 15:11:29 -0500
Message-Id: <20210518201146.794854-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518201146.794854-1-richard.henderson@linaro.org>
References: <20210518201146.794854-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32e.google.com
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
Cc: bruno.larsen@eldorado.org.br, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can now use MMU_INST_FETCH from access_type for this.
Use prot_for_access_type to simplify everything.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/mmu_helper.c | 35 +++++++----------------------------
 1 file changed, 7 insertions(+), 28 deletions(-)

diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 2aa1b777de..e3912e4094 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -32,6 +32,7 @@
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "qemu/qemu-print.h"
+#include "internal.h"
 #include "mmu-book3s-v3.h"
 #include "mmu-radix64.h"
 
@@ -126,33 +127,11 @@ static int pp_check(int key, int pp, int nx)
     return access;
 }
 
-static int check_prot(int prot, MMUAccessType access_type, int type)
+static int check_prot(int prot, MMUAccessType access_type)
 {
-    int ret;
-
-    if (type == ACCESS_CODE) {
-        if (prot & PAGE_EXEC) {
-            ret = 0;
-        } else {
-            ret = -2;
-        }
-    } else if (access_type == MMU_DATA_STORE) {
-        if (prot & PAGE_WRITE) {
-            ret = 0;
-        } else {
-            ret = -2;
-        }
-    } else {
-        if (prot & PAGE_READ) {
-            ret = 0;
-        } else {
-            ret = -2;
-        }
-    }
-
-    return ret;
+    return prot & prot_for_access_type(access_type) ? 0 : -2;
 }
-
+ 
 static int ppc6xx_tlb_pte_check(mmu_ctx_t *ctx, target_ulong pte0,
                                 target_ulong pte1, int h,
                                 MMUAccessType access_type, int type)
@@ -182,7 +161,7 @@ static int ppc6xx_tlb_pte_check(mmu_ctx_t *ctx, target_ulong pte0,
             /* Keep the matching PTE information */
             ctx->raddr = pte1;
             ctx->prot = access;
-            ret = check_prot(ctx->prot, access_type, type);
+            ret = check_prot(ctx->prot, access_type);
             if (ret == 0) {
                 /* Access granted */
                 qemu_log_mask(CPU_LOG_MMU, "PTE access granted !\n");
@@ -441,7 +420,7 @@ static int get_bat_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
                     (virtual & 0x0001F000);
                 /* Compute access rights */
                 ctx->prot = prot;
-                ret = check_prot(ctx->prot, access_type, type);
+                ret = check_prot(ctx->prot, access_type);
                 if (ret == 0) {
                     LOG_BATS("BAT %d match: r " TARGET_FMT_plx " prot=%c%c\n",
                              i, ctx->raddr, ctx->prot & PAGE_READ ? 'R' : '-',
@@ -733,7 +712,7 @@ static int mmu40x_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
         check_perms:
             /* Check from TLB entry */
             ctx->prot = tlb->prot;
-            ret = check_prot(ctx->prot, access_type, type);
+            ret = check_prot(ctx->prot, access_type);
             if (ret == -2) {
                 env->spr[SPR_40x_ESR] = 0;
             }
-- 
2.25.1


