Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 912AC39BDA5
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:51:05 +0200 (CEST)
Received: from localhost ([::1]:57776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpD2G-00040O-KT
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:51:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCRN-00035I-Gm
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:12:58 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:37780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCRH-0003qp-RQ
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:12:57 -0400
Received: by mail-wr1-x42b.google.com with SMTP id i94so4813657wri.4
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 09:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n32frv1K2Ssc6wYL5ATggtwpjBZGV8bN4E1z0WJz+l0=;
 b=L2rxQn4zfSGnN9D4kyT975Q2rQwLdBLyQQXCnb64NqjZ79LhZpcgH9/SYKGuECmsYA
 S40RNff0PxqWAao8n/RYPVXUlM8dj8SqQg1xFlLMU3241xGmbkr0Wspa8F21RZfR2dVl
 xHYwfb6ZO75vAg9aNuoEspL3UGd5HXu2GhQCVrbJFfFJq4u+xl0rfT332c5jqLEK/hoD
 6R28wc2w2pmvxbmLiok0/2gYaQ9jjmTnIXnfwRxXw5yBy9Pm0VxaaxkuVytSAzzOCV2f
 55up5gOvM/k5FLzmclpHGproCaNwXzur+bCQZ3VlavT8CCDeV1ZvJDZ5TZ5L6LJcVA1e
 UzOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n32frv1K2Ssc6wYL5ATggtwpjBZGV8bN4E1z0WJz+l0=;
 b=ovqe97Rx9INN4v8E+7iY1Ri/T8q39c8LKQB/Nkn2Q2c5jK3zIhiyzOdpoEktmWiUiV
 6xPRCZSfCNDvPbrbu9hzEKz5lJFW5WPU9TuEPZDL5rMauZQCZBY72tXUq2vITiD7Ztbz
 /Wsip6k3WRapLThFZfTkQf9DEvtlJbr6sBlsyKr6vSi4AyuFWZ/Z9EkNfnQHp6t/R3lg
 OPn2/S2N9fHFZF6v4g81ByUGcXD8oTpawNC89g3UH9pbnk9QZF7xdtN79/kVK16z0xV3
 QegdZF+BPNJSdeuBOh8ghFK5MHZQeGoRGyQ9UtMqVYNOO19Nh+v/k/tzxfPk5L/x40oD
 ks4g==
X-Gm-Message-State: AOAM533USqvJLZC/bG+s0HnaNDBN+oWIr7MgMQ3rs1rc+Nn1oHQWf1tV
 Ye2Z6uShUvvmzsMiOvXwAln2kQ==
X-Google-Smtp-Source: ABdhPJzV0HzIDpKbGDmqtxQe7LhDLbS8SGeQuf1EQMt6sz97V3whIgLyjr8wu5fOvLeIFtQZKYUmXQ==
X-Received: by 2002:a5d:4203:: with SMTP id n3mr4765868wrq.132.1622823170108; 
 Fri, 04 Jun 2021 09:12:50 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l9sm5987730wme.21.2021.06.04.09.12.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:12:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0518A20015;
 Fri,  4 Jun 2021 16:53:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 92/99] target/arm: remove v7m stub function for !CONFIG_TCG
Date: Fri,  4 Jun 2021 16:53:05 +0100
Message-Id: <20210604155312.15902-93-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

it is needed just once, so just move the CONFIG_TCG check in place.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu-mmu.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/target/arm/cpu-mmu.c b/target/arm/cpu-mmu.c
index c6ac90a61e..e1bebbf73e 100644
--- a/target/arm/cpu-mmu.c
+++ b/target/arm/cpu-mmu.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "sysemu/tcg.h"
 #include "cpu-mmu.h"
 
 int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx)
@@ -155,20 +156,15 @@ int arm_mmu_idx_to_el(ARMMMUIdx mmu_idx)
     }
 }
 
-#ifndef CONFIG_TCG
-ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate)
-{
-    g_assert_not_reached();
-}
-#endif
-
 ARMMMUIdx arm_mmu_idx_el(CPUARMState *env, int el)
 {
     ARMMMUIdx idx;
     uint64_t hcr;
 
-    if (arm_feature(env, ARM_FEATURE_M)) {
-        return arm_v7m_mmu_idx_for_secstate(env, env->v7m.secure);
+    if (tcg_enabled()) {
+        if (arm_feature(env, ARM_FEATURE_M)) {
+            return arm_v7m_mmu_idx_for_secstate(env, env->v7m.secure);
+        }
     }
 
     /* See ARM pseudo-function ELIsInHost.  */
-- 
2.20.1


