Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4D936F8DB
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 12:59:05 +0200 (CEST)
Received: from localhost ([::1]:60400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcQrQ-0000oI-W4
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 06:59:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQUJ-0007po-20
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:35:12 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:46691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQUB-0001Ns-Ui
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:35:10 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 k4-20020a7bc4040000b02901331d89fb83so1383633wmi.5
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 03:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=rsbKj+4V5FpXcPArGe9kv1/8TdlDga2eaABwTD55lB8=;
 b=du1CkkyLakdGn3642gcT7578tb767NovD1+3YdFnfrw0JZF8W9N+98XxgKOxGYJ6YW
 uIUpS6UOLAS7QuBfMAPAyntGZOEhURpzhrW6/7ZEgE1g7L7MgAOpPsTqzgdIZZxEu3ko
 12n33JvXVjl0pbyP5b8RQatu/4Owvifto/HHg2eJIisWaWl4LCekyku5to4F355eUZeY
 6D/+xjuL2g4yxg9mJXDkXzJZyc1qcGvkuSqT4ylgWRQxlYqlYN8dJnHJbo9ULpL6ZATc
 oUK1Dts1Pj3FIamzE5vE8xvoiTOWeyw0IoUTX4Evx0WXxCu2ZtvCWCrR8BMEzIwma4RF
 PSUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rsbKj+4V5FpXcPArGe9kv1/8TdlDga2eaABwTD55lB8=;
 b=E4sY7a3Cq6LKL2DOuhZ6cpyblzYWPDqu17DfWZSH8/ncVJ5lGVmcDzebuDUpiz8c0z
 5rE5VUBbGb+c+kO7TCdf11lVngKX0UmeH7rO5psZ3Ivb7XG5Gka9YH0NPOfbLfaW9YJa
 /1PpIZB+7dYHHjFawCqDYFgCnIaINnpo+tetUmZW65wlhg3bJTUy6bVlprdPgb860t2g
 dPHsigvk/4j9RmPt7JalTeAxQeWgr76NaAXH1KjKk3ndk9mseNgn7ajz06BWrjaPAF2D
 yffnc61HVlwbkxEhE0aohAbnErunGILRTGOdhaP5dQEyM+0ENha+kIf+89Lr5Nz5ThQ6
 zzvQ==
X-Gm-Message-State: AOAM532dfUq0zi14JpWcCIEJbS+XBYDeWJIQUJOCOgejNuOeDkXRaoUX
 deHR9EUdotqmMrZRmiJst//qkN8/d7D8q3Se
X-Google-Smtp-Source: ABdhPJzDd5/329GQ4HYlwRJyWJf10xxeHU6qPnEJlE1gjK/EVPF7oXzbYwBP1GvdRQ5D7Ygad9pGmQ==
X-Received: by 2002:a1c:9a83:: with SMTP id c125mr15729922wme.62.1619778901618; 
 Fri, 30 Apr 2021 03:35:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 18sm12997817wmo.47.2021.04.30.03.35.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 03:35:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/43] target/arm: Enforce alignment for VLDM/VSTM
Date: Fri, 30 Apr 2021 11:34:24 +0100
Message-Id: <20210430103437.4140-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210430103437.4140-1-peter.maydell@linaro.org>
References: <20210430103437.4140-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
Message-id: 20210419202257.161730-21-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-vfp.c.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 10766f210c1..f50afb23e74 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -1503,12 +1503,12 @@ static bool trans_VLDM_VSTM_sp(DisasContext *s, arg_VLDM_VSTM_sp *a)
     for (i = 0; i < n; i++) {
         if (a->l) {
             /* load */
-            gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
+            gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), MO_UL | MO_ALIGN);
             vfp_store_reg32(tmp, a->vd + i);
         } else {
             /* store */
             vfp_load_reg32(tmp, a->vd + i);
-            gen_aa32_st32(s, tmp, addr, get_mem_index(s));
+            gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), MO_UL | MO_ALIGN);
         }
         tcg_gen_addi_i32(addr, addr, offset);
     }
@@ -1586,12 +1586,12 @@ static bool trans_VLDM_VSTM_dp(DisasContext *s, arg_VLDM_VSTM_dp *a)
     for (i = 0; i < n; i++) {
         if (a->l) {
             /* load */
-            gen_aa32_ld64(s, tmp, addr, get_mem_index(s));
+            gen_aa32_ld_i64(s, tmp, addr, get_mem_index(s), MO_Q | MO_ALIGN_4);
             vfp_store_reg64(tmp, a->vd + i);
         } else {
             /* store */
             vfp_load_reg64(tmp, a->vd + i);
-            gen_aa32_st64(s, tmp, addr, get_mem_index(s));
+            gen_aa32_st_i64(s, tmp, addr, get_mem_index(s), MO_Q | MO_ALIGN_4);
         }
         tcg_gen_addi_i32(addr, addr, offset);
     }
-- 
2.20.1


