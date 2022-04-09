Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6568F4FA094
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 02:19:40 +0200 (CEST)
Received: from localhost ([::1]:58958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncypH-0003TQ-Hc
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 20:19:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncyds-0008Jc-TY
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 20:07:52 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:42906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncydr-0003Rn-26
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 20:07:52 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 n6-20020a17090a670600b001caa71a9c4aso11193938pjj.1
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 17:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=77IUNxzBr4CUo6OGOs42IJabOTHQjqxfs99nkKvtt9E=;
 b=SAsLnfpQTcLLx8E9ydD4RUjY6NH9oXP3sYX/r+DjhuMJS2HD1GcvacxRb9a+v5mdHs
 +PXYPDeSmYXCzxyTbx4FTgvdkovbTY0lwbLAjM3gjo41sBfaN0M98ib2yqlpf80HgHTV
 Kpg3RTs/ka42wzCJssrFISPIyW55mBSkYH7lErhLaAP1HxMaJs+7Mid2FoBIQckIqpSc
 hvJJQo2qxP3sEVLOKCfFE+z8wLgEBZrunHWRcBwV16qVluP4QYE96Jii8PnLt/Rl3PQD
 WUTFcrsMvBa9o1jf/1VK7TYvdgj/DeyIaFW8yLPirLjyuL12LvRdsuI67XmziQGIrUYl
 kq9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=77IUNxzBr4CUo6OGOs42IJabOTHQjqxfs99nkKvtt9E=;
 b=LLYP4In+mLJ6PvuJ3yOutdXWT46XRqg/yKwpIMzHtovLIlIiKwQsKPRn//3vWlqmIy
 SUn6hoOr6gyPFxK6sE7+GpLuOOUMJBrGT30EYWYygV5Kj6nJN0VsRjET7cg8olTPbfBe
 qZ1Yqde9RWeqUvzZaFJAaqZpo6utR4pcbqspkJTNtXMr69YuyHLqVX3J5peAlZ/JtW5m
 Unqims6XgxXYMepi2eFDBC9M5D0o5IW7MSuDpsS7/zrBQZwIVfLKvnf4WH/gOcWCOQIr
 oNqciwO6ok8e77D4DwkwkTS1GUm/5M2bfb2zUBMVC5Z5fLSLpN1M/O5B5qyd47g5GezP
 VmIw==
X-Gm-Message-State: AOAM533r+oBfzLdoOGunBdhoKj0mtUHmpfbtJZBfwFeK1/kn6q1dEoqc
 6g4zBBSXxVNBP96TBBRqXpU9hSYqIq68mQ==
X-Google-Smtp-Source: ABdhPJxWHbyFsPK/+kf+TtLvzO7tYLUG7EX/rqWRlC3DrO2n03EsAXGbqtP8MUfKNPJXZ7imb7dcIA==
X-Received: by 2002:a17:90a:5983:b0:1c9:ee11:76df with SMTP id
 l3-20020a17090a598300b001c9ee1176dfmr24727413pji.95.1649462869664; 
 Fri, 08 Apr 2022 17:07:49 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 t69-20020a637848000000b0039831d6dc23sm22073961pgc.94.2022.04.08.17.07.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 17:07:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/16] target/arm: Use field names for manipulating EL2 and
 EL3 modes
Date: Fri,  8 Apr 2022 17:07:33 -0700
Message-Id: <20220409000742.293691-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220409000742.293691-1-richard.henderson@linaro.org>
References: <20220409000742.293691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use FIELD_DP{32,64} to manipulate id_pfr1 and id_aa64pfr0
during arm_cpu_realizefn.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5d4ca7a227..6521f350f9 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1795,11 +1795,13 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
          */
         unset_feature(env, ARM_FEATURE_EL3);
 
-        /* Disable the security extension feature bits in the processor feature
-         * registers as well. These are id_pfr1[7:4] and id_aa64pfr0[15:12].
+        /*
+         * Disable the security extension feature bits in the processor
+         * feature registers as well.
          */
-        cpu->isar.id_pfr1 &= ~0xf0;
-        cpu->isar.id_aa64pfr0 &= ~0xf000;
+        cpu->isar.id_pfr1 = FIELD_DP32(cpu->isar.id_pfr1, ID_PFR1, SECURITY, 0);
+        cpu->isar.id_aa64pfr0 = FIELD_DP64(cpu->isar.id_aa64pfr0,
+                                           ID_AA64PFR0, EL3, 0);
     }
 
     if (!cpu->has_el2) {
@@ -1830,12 +1832,14 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     }
 
     if (!arm_feature(env, ARM_FEATURE_EL2)) {
-        /* Disable the hypervisor feature bits in the processor feature
-         * registers if we don't have EL2. These are id_pfr1[15:12] and
-         * id_aa64pfr0_el1[11:8].
+        /*
+         * Disable the hypervisor feature bits in the processor feature
+         * registers if we don't have EL2.
          */
-        cpu->isar.id_aa64pfr0 &= ~0xf00;
-        cpu->isar.id_pfr1 &= ~0xf000;
+        cpu->isar.id_aa64pfr0 = FIELD_DP64(cpu->isar.id_aa64pfr0,
+                                           ID_AA64PFR0, EL2, 0);
+        cpu->isar.id_pfr1 = FIELD_DP32(cpu->isar.id_pfr1,
+                                       ID_PFR1, VIRTUALIZATION, 0);
     }
 
 #ifndef CONFIG_USER_ONLY
-- 
2.25.1


