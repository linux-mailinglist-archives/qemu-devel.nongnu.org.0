Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C535784D9
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 16:09:18 +0200 (CEST)
Received: from localhost ([::1]:49842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDRQy-00084h-HY
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 10:09:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDRHW-00026V-9y
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:59:33 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:36464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDRHT-00039y-Jz
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:59:29 -0400
Received: by mail-wr1-x42f.google.com with SMTP id r2so16171812wrs.3
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 06:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=NsboqJpMKAMO89QQrdUhOCnjGLwfFQBesnrYOdMQBAo=;
 b=HkEFlE6Txn+bMsrHiVPvLYMTaS5QJUZBXQaX+YjkAH7MHLrqgwejvKkEFdp3xnFzu5
 Ch+BgFRgz+ZZZyKLrdanlagQGFgcdRPzQ/I0nzbd3TiFccvr79RcoBIejA5+QN8ChvI/
 SP2IL1dTu77fgDcGqVFCjbk9GATZEtlUN0Gn/UJcF+W1UASFz1rlRFCgcNoO6n8BeQdb
 9ShR59Q2RJ2dPms/6wWZkGZPv+qFGSoK8HITQPbphxgKGbJ/zKZywvbyrZzygWK5qMEv
 1WOlmtIeFQlRDGC8DVvaTPtadRUz9jeJhWKgSAfNv6X3sJ9WsA/vo+9cDZVm+JD1f3v/
 n5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NsboqJpMKAMO89QQrdUhOCnjGLwfFQBesnrYOdMQBAo=;
 b=FWpMULss9WDYdEah0t/NF0i5IL74fAMWEQ7GCdAD6llZG4ltGFkqpBq4zCQtppPaUw
 Q07teAwcHiXG7aZX7egmsXPKgPon64oDDoTAFydvGuesOPqwOoCA9B6BvEIiMr9hFjEf
 GH0/mQPEbgfQW5dlvzoV/4aeMtLXijN81yYI+fWCyvt1nmxO1S7Vp6xMYfxwIBhOQz65
 cPOqc2kSOqvNsJeYGs/7qaQ0uOXgB2Aw2Rml7j5vDUcSvVtO2DJa4D888enjaKBuXjuP
 YFkHuN+EECc22jO+Z0l+E8cmvwGIY7wmoOeGgaJ98y4tAv/pA89ltGiHSG6kpf+FQif8
 7c5Q==
X-Gm-Message-State: AJIora/GaXkq+QyO0c/ngRKtKznIL2ZjN7bfaBQMq2bgxCE3h48LkBBm
 PJaqITHUNVlQiggNcfHpyVwgvxeBmaSEBg==
X-Google-Smtp-Source: AGRyM1vTu36vovbzmQA0BACv6ePrAS++xBM0sjDk6zZ8+/0l0W+mgtLD16VdwhPCl0cl/Yt5YxLa5Q==
X-Received: by 2002:a5d:4e0f:0:b0:21d:8ca4:2563 with SMTP id
 p15-20020a5d4e0f000000b0021d8ca42563mr22872447wrt.272.1658152765531; 
 Mon, 18 Jul 2022 06:59:25 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 id15-20020a05600ca18f00b003a31f1edfa7sm1805798wmb.41.2022.07.18.06.59.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 06:59:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/15] target/arm: Fill in VL for tbflags when SME enabled and
 SVE disabled
Date: Mon, 18 Jul 2022 14:59:07 +0100
Message-Id: <20220718135920.13667-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220718135920.13667-1-peter.maydell@linaro.org>
References: <20220718135920.13667-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

When PSTATE.SM, VL = SVL even if SVE is disabled.
This is visible in kselftest ssve-test.

Reported-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220713045848.217364-2-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index cfcad97ce07..6fff7fc64fd 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10882,13 +10882,19 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
     }
     if (cpu_isar_feature(aa64_sme, env_archcpu(env))) {
         int sme_el = sme_exception_el(env, el);
+        bool sm = FIELD_EX64(env->svcr, SVCR, SM);
 
         DP_TBFLAG_A64(flags, SMEEXC_EL, sme_el);
         if (sme_el == 0) {
             /* Similarly, do not compute SVL if SME is disabled. */
-            DP_TBFLAG_A64(flags, SVL, sve_vqm1_for_el_sm(env, el, true));
+            int svl = sve_vqm1_for_el_sm(env, el, true);
+            DP_TBFLAG_A64(flags, SVL, svl);
+            if (sm) {
+                /* If SVE is disabled, we will not have set VL above. */
+                DP_TBFLAG_A64(flags, VL, svl);
+            }
         }
-        if (FIELD_EX64(env->svcr, SVCR, SM)) {
+        if (sm) {
             DP_TBFLAG_A64(flags, PSTATE_SM, 1);
             DP_TBFLAG_A64(flags, SME_TRAP_NONSTREAMING, !sme_fa64(env, el));
         }
-- 
2.25.1


