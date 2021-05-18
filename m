Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 523E538814A
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 22:21:56 +0200 (CEST)
Received: from localhost ([::1]:54546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj6Dz-0002Yl-Ag
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 16:21:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj64T-0000Tp-Gv
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:12:05 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:37742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj64O-0006DB-MS
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:12:05 -0400
Received: by mail-oi1-x22d.google.com with SMTP id h9so10994673oih.4
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 13:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iRIwmv/u97xPnpJtsivAqnqvUPyTpMn8dKYh7FflpCs=;
 b=RweNGdj98f77+VX/ZBp/221GVzK3yABDYjt2BKsHyEnqPZHFkizm6hoSDqr2plKuMr
 lR1Psf6VcGdSdbp3pOw0YB2J8Ur9yIYGDK/grpb4GWT/6yg5Zk/srWJPeVmIb69Az3GH
 SJo7DKZGY/YcAiP5Ecv3gKOUi5ysP3Q/sJu9vcqyV0mpaKHRvzfyzE2V63kUrp139AF9
 KnBRA4j5u5zxvQX4qlg6ZYdZGcV9nIag6ncM6PWrynRF7Xn8kKYFvcT6iQjRV0NCGbrA
 ocZUiD/Pdmmta18NTt9pd9KGuN6lX1F+8Y6C3Ealw7Eiu//M/BoODaPxRCjmMrtHe6E3
 ILJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iRIwmv/u97xPnpJtsivAqnqvUPyTpMn8dKYh7FflpCs=;
 b=mGCEztqIDDfaINJL2vYmEL41SomZ6QiTLSKaaaxv+xw46vdJdZ2fVNds9Lxq0QzdxR
 SLznAg1s48YAWwhxJZ9eVFWPZ0iiu9rT4nWtzA6jyX8JXliTdOf0MdzVM+N4l1SJIQCP
 5M/8bq7V1h1M/iC713GXBEbKP9B9Pv/V8SA6jzl7mZW2b6Z5hqRUiiowU/mX7cv44SqU
 Fqdj1/32DhYHeXwEmc5YaWvMrxvp/3jZNHyNNeLzlCFicoQaSDbllrxYhFXcoTtN/UrE
 YojqdPZoda9R8SfjZ734Ma9CQp+CMFPvzey8LmML1LWUepfLIIMHdQGZC4H49hbU0CQL
 fl8A==
X-Gm-Message-State: AOAM530lpocJI8xKpZDHRi6cOn7V8cD47U3aKFt5uO6W49alTvIdClFL
 r8nDMK+yK+3+H6fhx46RjUP9ewA6xPvPpl6s
X-Google-Smtp-Source: ABdhPJyngulsCPOW502wxRQ83+ZdyEAxCsOXU19sn231kcBH4NIHtNh4mBZBi6yFwSZB3Xq6ZnsLRg==
X-Received: by 2002:aca:4a52:: with SMTP id x79mr4956852oia.115.1621368718451; 
 Tue, 18 May 2021 13:11:58 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id u27sm3953204oof.38.2021.05.18.13.11.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 13:11:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/24] target/ppc: Remove type argument from get_bat_6xx_tlb
Date: Tue, 18 May 2021 15:11:32 -0500
Message-Id: <20210518201146.794854-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518201146.794854-1-richard.henderson@linaro.org>
References: <20210518201146.794854-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/mmu_helper.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 506b0e4d90..0809210d3b 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -379,25 +379,22 @@ static inline void bat_size_prot(CPUPPCState *env, target_ulong *blp,
 }
 
 static int get_bat_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
-                           target_ulong virtual, MMUAccessType access_type,
-                           int type)
+                           target_ulong virtual, MMUAccessType access_type)
 {
     target_ulong *BATlt, *BATut, *BATu, *BATl;
     target_ulong BEPIl, BEPIu, bl;
     int i, valid, prot;
     int ret = -1;
+    bool ifetch = access_type == MMU_INST_FETCH;
 
     LOG_BATS("%s: %cBAT v " TARGET_FMT_lx "\n", __func__,
-             type == ACCESS_CODE ? 'I' : 'D', virtual);
-    switch (type) {
-    case ACCESS_CODE:
+             ifetch ? 'I' : 'D', virtual);
+    if (ifetch) {
         BATlt = env->IBAT[1];
         BATut = env->IBAT[0];
-        break;
-    default:
+    } else {
         BATlt = env->DBAT[1];
         BATut = env->DBAT[0];
-        break;
     }
     for (i = 0; i < env->nb_BATs; i++) {
         BATu = &BATut[i];
@@ -407,7 +404,7 @@ static int get_bat_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
         bat_size_prot(env, &bl, &valid, &prot, BATu, BATl);
         LOG_BATS("%s: %cBAT%d v " TARGET_FMT_lx " BATu " TARGET_FMT_lx
                  " BATl " TARGET_FMT_lx "\n", __func__,
-                 type == ACCESS_CODE ? 'I' : 'D', i, virtual, *BATu, *BATl);
+                 ifetch ? 'I' : 'D', i, virtual, *BATu, *BATl);
         if ((virtual & 0xF0000000) == BEPIu &&
             ((virtual & 0x0FFE0000) & ~bl) == BEPIl) {
             /* BAT matches */
@@ -441,7 +438,7 @@ static int get_bat_6xx_tlb(CPUPPCState *env, mmu_ctx_t *ctx,
                 LOG_BATS("%s: %cBAT%d v " TARGET_FMT_lx " BATu " TARGET_FMT_lx
                          " BATl " TARGET_FMT_lx "\n\t" TARGET_FMT_lx " "
                          TARGET_FMT_lx " " TARGET_FMT_lx "\n",
-                         __func__, type == ACCESS_CODE ? 'I' : 'D', i, virtual,
+                         __func__, ifetch ? 'I' : 'D', i, virtual,
                          *BATu, *BATl, BEPIu, BEPIl, bl);
             }
         }
@@ -1415,7 +1412,7 @@ static int get_physical_address_wtlb(CPUPPCState *env, mmu_ctx_t *ctx,
         } else {
             /* Try to find a BAT */
             if (env->nb_BATs != 0) {
-                ret = get_bat_6xx_tlb(env, ctx, eaddr, access_type, type);
+                ret = get_bat_6xx_tlb(env, ctx, eaddr, access_type);
             }
             if (ret < 0) {
                 /* We didn't match any BAT entry or don't have BATs */
-- 
2.25.1


