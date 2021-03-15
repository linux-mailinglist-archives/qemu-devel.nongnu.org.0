Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E89A433C656
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 20:05:25 +0100 (CET)
Received: from localhost ([::1]:60150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLsWq-0006Ys-TQ
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 15:05:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLsEU-000769-2Z
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:46:26 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:34602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLsER-0001Zb-BT
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:46:25 -0400
Received: by mail-oi1-x231.google.com with SMTP id x78so35532179oix.1
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 11:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+NXtQw9hpPp+VCgrduDja0oQSnznjQ9crwR/vZ//mYY=;
 b=f6qxrE6oixFYCdfFGub7m3xnhSzQaVDKQs4aN1k7F4zjBdMYVQ1u+zIE9U+zBsIpf7
 gLgtHqBlwSgWqAA/+I7mgrflqhNqaOF6NNdM4iVF2DJuPNgwpTyOGOcuKwH4ZcZo2kOe
 64byb4xatyST2V4WyIl4C1QEtTxKLgt3Xk4ss5ECy8AafwoKaqlV3r9YaGyh1QGh9FUL
 7tF+OZXRcvTJikGImtzCt+syuiY7j3LIPYX8sNHgfoipQQkK2LPaSovcnPuoidOY89S/
 3cfZP8xGRti+TmWm89QNMiT8wOMENjnK12qhDLQpmcbCLREiZj2mrEn+qgXnQVQDf5jJ
 ABRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+NXtQw9hpPp+VCgrduDja0oQSnznjQ9crwR/vZ//mYY=;
 b=t7Ocyk+lIauAUfqoK3mk805lagjovwhL/HlygvP08+VyxNmyYLgjdg57MY4e1igHKY
 z+LSzbFx79jV370G/EsULLjMaVa6RtewlfiAdFlU/XIIa68bHI+IGSkAniRtoW1DIr45
 npVKgotU6wX0lC2VkWEp8SG3sk94t3TldplAFULXjcB4RXylbVPEM19bR3lUAz0KUxFF
 nDmhDhuubzfVwwhMgbko1jBF0eeVYvHxFOrW4jYV5de4eytl6Dd3p3cpTLtp15ZY4Xi0
 77t2DlNqivAhIRYFVEoNlRqR0qlsLR3KduSCM2o3N3LvRVj6noKciMaVkquogrURIcVi
 80hg==
X-Gm-Message-State: AOAM532TOCYANaFuhFxXAqfE1SW6cqAZ+DMpLfu2hPr6F4llFxc/BMMX
 sPKWqKTwmX7U60q63NtK4IS+KyTcviaL+0w5
X-Google-Smtp-Source: ABdhPJzRHOM1mtgKaoIO9deyFovEZ8PmEbUSDK6DuxT7Nr3PrPy5Lqnn/y2iJSnI7bwTsxX8LWh5Hg==
X-Received: by 2002:aca:fcd2:: with SMTP id a201mr393209oii.66.1615833982308; 
 Mon, 15 Mar 2021 11:46:22 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id o25sm7519851otk.11.2021.03.15.11.46.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 11:46:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 04/17] target/ppc: Do not call hreg_compute_mem_idx after
 ppc_store_msr
Date: Mon, 15 Mar 2021 12:46:02 -0600
Message-Id: <20210315184615.1985590-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315184615.1985590-1-richard.henderson@linaro.org>
References: <20210315184615.1985590-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x231.google.com
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In ppc_store_msr we call hreg_compute_hflags, which itself
calls hreg_compute_mem_idx.  Rely on ppc_store_msr to update
everything required by the msr update.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/machine.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/target/ppc/machine.c b/target/ppc/machine.c
index 87d7bffb86..f6eeda9642 100644
--- a/target/ppc/machine.c
+++ b/target/ppc/machine.c
@@ -125,9 +125,6 @@ static int cpu_load_old(QEMUFile *f, void *opaque, int version_id)
     env->msr ^= env->msr_mask & ~((1ULL << MSR_TGPR) | MSR_HVB);
     ppc_store_msr(env, msr);
 
-    /* Recompute mmu indices */
-    hreg_compute_mem_idx(env);
-
     return 0;
 }
 
@@ -418,14 +415,12 @@ static int cpu_post_load(void *opaque, int version_id)
 
     /*
      * Invalidate all supported msr bits except MSR_TGPR/MSR_HVB
-     * before restoring
+     * before restoring.  Note that this recomputes hflags and mem_idx.
      */
     msr = env->msr;
     env->msr ^= env->msr_mask & ~((1ULL << MSR_TGPR) | MSR_HVB);
     ppc_store_msr(env, msr);
 
-    hreg_compute_mem_idx(env);
-
     return 0;
 }
 
-- 
2.25.1


