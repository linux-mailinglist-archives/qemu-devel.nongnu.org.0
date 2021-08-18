Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F38573F0BD3
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 21:32:54 +0200 (CEST)
Received: from localhost ([::1]:45030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRJ0-0000hv-1l
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 15:32:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR6B-0000GG-HS
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:19:39 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:33386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR68-0008Qb-Oy
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:19:39 -0400
Received: by mail-pg1-x529.google.com with SMTP id c17so3316914pgc.0
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/Z52jqMahW7nYTfuwDqraaBizHHqXiMT/VaDEwV5Efo=;
 b=xbIrwcNJ1V/kEMd7kGaQls5ij5Jln7gfOszv5nuiGbAE5X/352ozSaPvP22YvcyFWu
 Rp2hLZbT+rFrRHetLioIdcsAQ0f4VBvCUuTkNqO0ytkMC98L6NHQm9F/BmrHlZ6cf9/D
 jvejx92Jve+d5Vgb9Ll0nQQh7L0VHAmZE04D40ash/NY/BCoT82uwlrQ4OQ4RBBQI9e+
 ltLgS+jPrpy0oPIDZ+nzaFkth8SJ1yGAVPNfgULYNzTss4i+4WL8/wYC2JWTl47MqTM5
 xU01WMIU4w7iWqahIZRV47ijIgBcYBxyvm5RZ+1XHpvR9yeXzD+suXk9IT9eaYmd/mD8
 nzNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Z52jqMahW7nYTfuwDqraaBizHHqXiMT/VaDEwV5Efo=;
 b=NPQzHUvPwKQByw4lOXcvDbhnkSks0Md9dJcvdVSjvLCtxCYwu38JBZXtSZgOhvZ39T
 YB+3iD5cJ+KXe3tC1qW4wEWY8eTiIYikES8S24C38PE5RdKuEIm76gjlzI/QqC8/h/G6
 749CrqUI9ex5xrRkKB1GMzYO4TdXK2gouQog+mmy4JDjoQVzxh/nNe4X8qSj8vgnvqC+
 yNdAMa2Wzq+kdkv2oyH2x/V4/R8566khY8OVjbiHJBziqlt3AKNaNVAHmJT87Hu2HVX6
 K/9esu7BZTS1NyRh+5zcxET8oVIoOfYDLSxWL/AFus02M2vUyb3QkPmHRorj2NKzibxw
 veaA==
X-Gm-Message-State: AOAM531G/GHeqy0tpBh5cBCSKgUX6hW4sG3BrXsH/LsaotL2hanT82LY
 wEKKDvsGWmdZc+09gKFLbXnuKbJ5k00mTw==
X-Google-Smtp-Source: ABdhPJxv0sruHjp0txDr+tNhMQz4fgiEcP6pSogs7fcK/P/TJvi7HzBteWfizK4RI+CyDu02kM13gQ==
X-Received: by 2002:a65:51c8:: with SMTP id i8mr6625299pgq.451.1629314375410; 
 Wed, 18 Aug 2021 12:19:35 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id a6sm524108pjs.40.2021.08.18.12.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:19:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/66] target/ppc: Set fault address in
 ppc_cpu_do_unaligned_access
Date: Wed, 18 Aug 2021 09:18:24 -1000
Message-Id: <20210818191920.390759-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We ought to have been recording the virtual address for reporting
to the guest trap handler.

Cc: qemu-ppc@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/excp_helper.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 0df358f93f..d7743704ac 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1504,6 +1504,20 @@ void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
 {
     CPUPPCState *env = cs->env_ptr;
 
+    switch (env->mmu_model) {
+    case POWERPC_MMU_SOFT_4xx:
+    case POWERPC_MMU_SOFT_4xx_Z:
+        env->spr[SPR_40x_DEAR] = vaddr;
+        break;
+    case POWERPC_MMU_BOOKE:
+    case POWERPC_MMU_BOOKE206:
+        env->spr[SPR_BOOKE_DEAR] = vaddr;
+        break;
+    default:
+        env->spr[SPR_DAR] = vaddr;
+        break;
+    }
+
     cs->exception_index = POWERPC_EXCP_ALIGN;
     env->error_code = 0;
     cpu_loop_exit_restore(cs, retaddr);
-- 
2.25.1


