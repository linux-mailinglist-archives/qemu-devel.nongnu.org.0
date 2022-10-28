Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B62D1611347
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 15:44:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooPdn-0001mm-Ms; Fri, 28 Oct 2022 09:43:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ooPav-0008Q5-0R
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:40:21 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ooPap-0007tO-Ey
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:40:19 -0400
Received: by mail-wm1-x335.google.com with SMTP id y10so3258381wma.0
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 06:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=67MaQeJ+crA6JBl9YlIp7PqeAcKCV58O0zGZq6jATuo=;
 b=gfuo+czFxos6T631UJx6lpPgd2MAhsvey7l5fH462CM/NFo0WHoL7fQg8E5Va71rHg
 AmQMZLCNQxGJMuGXPAvP2xhPb2VcZ+xeHMmUr54Twqnr+ETWFZOYDvdGQyjPIBjdzI+i
 1oW52P+3bLq9kj4rKUdXmt/KWDyzBIHypEx4z76KRXg0NFUUb8PvljeUTr61UTuX9yDO
 JJV258/KHDDdJohwsATwf+E+Efzx4KciBSSOend7cjzlSILIkVojTPdYgZhBs4Y+T5Qg
 O6wtmMvOqlMZPTsOvppT0Dwp+eZGsrCAD3Do86sisZWeH2HRpcYJ8VjC1Z6FsJ202HRt
 DWHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=67MaQeJ+crA6JBl9YlIp7PqeAcKCV58O0zGZq6jATuo=;
 b=dlVUvzNnBLHGACIl0r8KDn1gjlrUyZlaSngGpjbJpBu0rSPdWGGnmrDKHZVurS2wYs
 kqo9TtF7baRcY7NVKfqoZk+s5AQ3bIHBTd6qkcko+BRQqRF5y0CUbO/Rwq7yw+lSZXAu
 SSciDP0Y/K+jLWBY6WooSHcPssL6bwfcEDcVH2O5LG/Ga5lMQbx1+jcjJPdnfPXSScAT
 BQf7fTCtnX01sYFtY0ckGULmntnhVriZvyZ1AOU2oB+wkMnbvzBvE87A5x7dKN0/5BgB
 wQ9NFT+pAjqgTBJalSAxy/TSu7s7m1kDX7xviKmfY8uLlmmCGhBaAXsE8AG9E1bKKkl0
 H2pw==
X-Gm-Message-State: ACrzQf2GWx4eZgyivvpmR2fSpYpxvrLXc+zs6pGbHzIor+NmdNXdRxkI
 tnq5Nmm8sX/5di7sSV9kwXy1o6Pkhx+Grw==
X-Google-Smtp-Source: AMsMyM4f9L/7woXNOg7v/Lq0xtShVIHRQxiYpFm6f1LWm0EhQtEvnJwGjLa65Vt5XowKqdR2uXswHQ==
X-Received: by 2002:a1c:35c9:0:b0:3c3:d9a:385f with SMTP id
 c192-20020a1c35c9000000b003c30d9a385fmr9393436wma.139.1666964414055; 
 Fri, 28 Oct 2022 06:40:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a5d4110000000b002365cd93d05sm3572858wrp.102.2022.10.28.06.40.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 06:40:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 7/7] target/arm: Report FEAT_EVT for TCG '-cpu max'
Date: Fri, 28 Oct 2022 14:40:02 +0100
Message-Id: <20221028134002.730598-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221028134002.730598-1-peter.maydell@linaro.org>
References: <20221028134002.730598-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Update the ID registers for TCG's '-cpu max' to report the
FEAT_EVT Enhanced Virtualization Traps support.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 target/arm/cpu_tcg.c          | 1 +
 3 files changed, 3 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index cfb4b0768b0..bc330cff463 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -25,6 +25,7 @@ the following architecture extensions:
 - FEAT_DotProd (Advanced SIMD dot product instructions)
 - FEAT_DoubleFault (Double Fault Extension)
 - FEAT_ETS (Enhanced Translation Synchronization)
+- FEAT_EVT (Enhanced Virtualization Traps)
 - FEAT_FCMA (Floating-point complex number instructions)
 - FEAT_FHM (Floating-point half-precision multiplication instructions)
 - FEAT_FP16 (Half-precision floating-point data processing)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 85e0d1daf1c..3a5df146ac2 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1185,6 +1185,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64MMFR2, FWB, 1);      /* FEAT_S2FWB */
     t = FIELD_DP64(t, ID_AA64MMFR2, TTL, 1);      /* FEAT_TTL */
     t = FIELD_DP64(t, ID_AA64MMFR2, BBM, 2);      /* FEAT_BBM at level 2 */
+    t = FIELD_DP64(t, ID_AA64MMFR2, EVT, 2);      /* FEAT_EVT */
     cpu->isar.id_aa64mmfr2 = t;
 
     t = cpu->isar.id_aa64zfr0;
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 60ff539fa18..4553d20edd4 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -65,6 +65,7 @@ void aa32_max_features(ARMCPU *cpu)
     t = FIELD_DP32(t, ID_MMFR4, AC2, 1);          /* ACTLR2, HACTLR2 */
     t = FIELD_DP32(t, ID_MMFR4, CNP, 1);          /* FEAT_TTCNP */
     t = FIELD_DP32(t, ID_MMFR4, XNX, 1);          /* FEAT_XNX */
+    t = FIELD_DP32(t, ID_MMFR4, EVT, 2);          /* FEAT_EVT */
     cpu->isar.id_mmfr4 = t;
 
     t = cpu->isar.id_mmfr5;
-- 
2.25.1


