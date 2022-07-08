Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DA156BD35
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 18:07:57 +0200 (CEST)
Received: from localhost ([::1]:37622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9qWK-0003RI-8j
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 12:07:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pmz-0003gk-DX
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:21:05 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:43715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pmx-0003IP-O9
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:21:05 -0400
Received: by mail-pl1-x62f.google.com with SMTP id r1so16590508plo.10
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ojyZOIf2uqXDhLYPW4II9jqD/RYb57Q1CkTjNakDECE=;
 b=Ugm1HCxkCao/v3DlPh90pZ+19YwR0BAOX8TjVko46238qJmZWwWqS/+93D7imAmP80
 KccZBJDy5gFrkcYzu3N5271KDlcbo05kz8XexqLEIDVSxXZi2ddCQmI3z6rsjKWSApr/
 KGVFZhRc8ayjwihQjgzA2sywVqdOBnL8hkAe+vSyhpN190MAHOoe2sdBZP8ymBpSeBrf
 pXejthiWHlksyMUVCe6w/WwWnkSTSBsp8yJXImSmh6FsbOq15ATsFAExl0VkD8CwIZCW
 Djj4zbaeirmx9xFlnjQD+uUDQkihpeh5wDnSfJwhLWuzdBeFXBQAJl7VJJNdWRt7Ylt1
 HFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ojyZOIf2uqXDhLYPW4II9jqD/RYb57Q1CkTjNakDECE=;
 b=WiYjH1BxBkfX920RRX2yWMj/sRoTJPpE+sKsvjCwlLnJURQMJdKJ5RXo81DxgSz43v
 Dt+XX4OdTYnVH4HLI2PvXvO0JxpjDpT1xliTyhaOA28Pn88OALHWIw+fEQmjRcxtZ5Ys
 vl2YtTt/EV1xlwSeZm2mfUotgIBNsQ6Z5T0XYK+tmEaFo2JMEbrY9v71fPYRC0pnK9a9
 jtzhkeY0ks+5dijVAFTB5Yj/fbGybVndNcHPH08KynzGAsysc4OAHKhX6mToKzKwN0Bx
 L5pgImd8QaaCiDZVZ2QrcrB59S4hIPjOLiuUWoyu6Mlyw3eAm3rTngtB86Ta9/sdC7u+
 aORg==
X-Gm-Message-State: AJIora/3KbErsuuLdLJJ2emtW5womkHuZgOAgMa2L6tamvcfQvnvDrQ+
 +oG0krhEF32xRt2nbQTKjQhIRnnqCL/7nc5d
X-Google-Smtp-Source: AGRyM1vstiEKDzjpvHFHgrNCQ01dzvERlldhTdyZXCjkLHAeGvha8+s4PiVVWQPigqk+x+IJYUj6HA==
X-Received: by 2002:a17:902:8345:b0:167:879c:abe8 with SMTP id
 z5-20020a170902834500b00167879cabe8mr4250447pln.7.1657293662404; 
 Fri, 08 Jul 2022 08:21:02 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 cp2-20020a170902e78200b0015e8d4eb1d7sm30067741plb.33.2022.07.08.08.21.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:21:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 44/45] target/arm: Enable SME for user-only
Date: Fri,  8 Jul 2022 20:45:39 +0530
Message-Id: <20220708151540.18136-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Enable SME, TPIDR2_EL0, and FA64 if supported by the cpu.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 9b54443843..5de7e097e9 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -210,6 +210,17 @@ static void arm_cpu_reset(DeviceState *dev)
                                              CPACR_EL1, ZEN, 3);
             env->vfp.zcr_el[1] = cpu->sve_default_vq - 1;
         }
+        /* and for SME instructions, with default vector length, and TPIDR2 */
+        if (cpu_isar_feature(aa64_sme, cpu)) {
+            env->cp15.sctlr_el[1] |= SCTLR_EnTP2;
+            env->cp15.cpacr_el1 = FIELD_DP64(env->cp15.cpacr_el1,
+                                             CPACR_EL1, SMEN, 3);
+            env->vfp.smcr_el[1] = cpu->sme_default_vq - 1;
+            if (cpu_isar_feature(aa64_sme_fa64, cpu)) {
+                env->vfp.smcr_el[1] = FIELD_DP64(env->vfp.smcr_el[1],
+                                                 SMCR, FA64, 1);
+            }
+        }
         /*
          * Enable 48-bit address space (TODO: take reserved_va into account).
          * Enable TBI0 but not TBI1.
-- 
2.34.1


