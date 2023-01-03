Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA3865C632
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 19:27:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pClrj-0000UH-Kg; Tue, 03 Jan 2023 13:18:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClrZ-00006z-Cz
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:18:14 -0500
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClrX-0005Jk-UU
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:18:13 -0500
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-466c5fb1c39so435156267b3.10
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 10:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LAidI3WiD+zjwr6by+YYhTTuNMWH39p6ritGq9qXxUI=;
 b=kCyD9Mi7i/IPif+tk7C0ea2vhfSsSePSMQ4VpxXUYxNopCBXGFWj6wF5br+VwXgWRp
 946e35stI1DLZwbf/SmOxDQDG408CLuwchnMbi6q5FEUecaYh6B2ORZdj32IxghzuRVj
 cdeyyE7nZF2RY9ZRxEVcdaOhCKRgt2iwNGGUHiAzXQlZMX6DJzs9dAc9eFS4EpHRdGg5
 fePN6MENJ7JKNXUq0zHuCVo/fmPonCWKrY15pUWcMpkhLWHsnDyl9163VrvnSt9O9jvp
 uiXhP/LbxKOPmnMy2DuWevNsxikttSw5Rvl0qkVQXECyJmUGmzdJcS6P2D9uq37dw1D3
 Llmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LAidI3WiD+zjwr6by+YYhTTuNMWH39p6ritGq9qXxUI=;
 b=g1wtnEcPRy4kigDA/Ady7K9ZoqVKPnYunqTGSia3MYOavmIGAN3XSMm9ezo9PyCCD7
 ULNcxmr1kPwuD87u+0geLvV+YtCZ20HeeNgRUJ4+AUn4QHrjEVvdbHrMkAvMGA+NC40y
 FeUfHo6C9xsP5zX+KQFUwAbw8vLndIBHp4bWBGDu96qCJQzjfJT40igI6XTK6o+CQ5TW
 zHrEUrs2e37K4uYtgnHQIsXZ+dYv3GaV7PdJMjRJHk/Obx9q3vEbuaEAS4wgS4CyCFmc
 TSMvgV1R3ToOEuI+Rm9fEdvqK3jRepRrDt4CMhckLqTBVjaoYQ9Qb0ubTxQUhtUsBfb7
 oU2g==
X-Gm-Message-State: AFqh2kpnHPZZQr+N146ZrAf8ZCet4AyogBIa+NNQsyBwvk9EgvA2u9gA
 rvOzbbEWKqim8Cf7PNvPl6R/yZoc0gMqfEA6rvg=
X-Google-Smtp-Source: AMrXdXtqL/AIft81E1rhze0dCIIutyTgvgMZ+FqJ1O3aUeDFnXDQQNwTruAg6vhE6ZrIyPriC3hYgQ==
X-Received: by 2002:a81:1e4a:0:b0:48f:a921:40eb with SMTP id
 e71-20020a811e4a000000b0048fa92140ebmr16168277ywe.35.1672769890698; 
 Tue, 03 Jan 2023 10:18:10 -0800 (PST)
Received: from stoup.. ([2607:fb90:8060:51a2:184b:6e49:c396:be2])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a05620a440200b006fed2788751sm23042354qkp.76.2023.01.03.10.18.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 10:18:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
Subject: [RFC PATCH 27/40] target/arm: Split out strongarm_class_init
Date: Tue,  3 Jan 2023 10:16:33 -0800
Message-Id: <20230103181646.55711-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103181646.55711-1-richard.henderson@linaro.org>
References: <20230103181646.55711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=richard.henderson@linaro.org; helo=mail-yw1-x112f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Use an intermediate function to share code between
sa1100_class_init and sa1110_class_init.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu_tcg.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 1ef825b39e..c6d50f326e 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -837,21 +837,24 @@ static void ti925t_class_init(ARMCPUClass *acc)
     acc->reset_sctlr = 0x00000070;
 }
 
-static void sa1100_class_init(ARMCPUClass *acc)
+static void strongarm_class_init(ARMCPUClass *acc)
 {
-    acc->dtb_compatible = "intel,sa1100";
     set_class_feature(acc, ARM_FEATURE_STRONGARM);
     set_class_feature(acc, ARM_FEATURE_DUMMY_C15_REGS);
-    acc->midr = 0x4401A11B;
     acc->reset_sctlr = 0x00000070;
 }
 
+static void sa1100_class_init(ARMCPUClass *acc)
+{
+    strongarm_class_init(acc);
+    acc->dtb_compatible = "intel,sa1100";
+    acc->midr = 0x4401A11B;
+}
+
 static void sa1110_class_init(ARMCPUClass *acc)
 {
-    set_class_feature(acc, ARM_FEATURE_STRONGARM);
-    set_class_feature(acc, ARM_FEATURE_DUMMY_C15_REGS);
+    strongarm_class_init(acc);
     acc->midr = 0x6901B119;
-    acc->reset_sctlr = 0x00000070;
 }
 
 static void pxa250_class_init(ARMCPUClass *acc)
-- 
2.34.1


