Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E85A53C129
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 00:58:52 +0200 (CEST)
Received: from localhost ([::1]:39854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwtmE-000877-4w
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 18:58:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskW-0001jF-Cy
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:53:03 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:41937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskS-00010X-1w
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:53:00 -0400
Received: by mail-pf1-x42c.google.com with SMTP id p8so5801462pfh.8
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8ss3EaTY1TKvXRQ5t3puVtJ4SylwysppKIF75i7g6zo=;
 b=e0Dzgjp6I8jGOEppACdfsKJaSp7FXZyc8E20KQp3Cuhp7s8vPjzW0NSt3pLhGncxFX
 tyImvZGGwCsfTg76sDRvWAX/fbxkgIxjLRZ7usEyBJu7kUuxLF4It65jm5QZFEDMltvE
 YUtx8l010oEn9Uon4FXWl/QK442US0lIavmq92Ulrsllh5id14U3VpgdL7UOVoSDP7bo
 8jZjCR8uuqrZCED9bc4X+Qy9xu5mT1/BYpAmdGTJgUfUpiC0LKFMIryOGuQie1TI/i3F
 BvKUk8dZVfb6Iby+kEO259A1Atr0odW86Q3PV8abusC0D8COa7aRwbVXlFMcZUeKPf43
 v25g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8ss3EaTY1TKvXRQ5t3puVtJ4SylwysppKIF75i7g6zo=;
 b=y3yYmSGVkgQkTCFzCSrT2LYqi2iA988LQkxQknuGAqCW4tk5yt17wkIXvo7idMM221
 CSmcp19LvK7zAvi84g6LTTa/4FCC5q5ALToOGmANckLCUAR9c2Ltrd+N59fS5l4AWRyy
 NaL2E+6xu2a/ELTf/+gX4qiJoRYId24kBzuarsLb+oV7FWjebTMGNHiuJPAiWmXJFQdQ
 Zj92yjnbfk4V8EHbhyuhRIvuHK6JMV89qp9OErEp9pOfV+n6v76qz1XcxN5SsBtMfN4l
 BpnFXgkadgjTjwYDIobMjdGz9D4RQH5631FIftrCjIYjxAPg+fgmaMCaWY+R7j5akgpC
 wEbg==
X-Gm-Message-State: AOAM532FMBGQ75a+vdZ4JufaxtzAB/hEZcwjvOkKYZXzepIc7LR6ge68
 1GLS7+LNZUeoP5hP4uN+URWr0xbROSR6WA==
X-Google-Smtp-Source: ABdhPJzcTCLQv16bP3zb47Y/k2mpc3/POxhn5q9iSx21uiCXXGFi3nHX8kVGxj7HP+yOemrA58OJzw==
X-Received: by 2002:a62:1784:0:b0:51b:bc40:28a7 with SMTP id
 126-20020a621784000000b0051bbc4028a7mr7121646pfx.55.1654206774809; 
 Thu, 02 Jun 2022 14:52:54 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a170902ed8e00b0015edfccfdb5sm4039605plj.50.2022.06.02.14.52.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:52:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 69/71] target/arm: Only set ZEN in reset if SVE present
Date: Thu,  2 Jun 2022 14:48:51 -0700
Message-Id: <20220602214853.496211-70-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

There's no reason to set CPACR_EL1.ZEN if SVE disabled.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 75295a14a3..5cb9f9f02c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -203,11 +203,10 @@ static void arm_cpu_reset(DeviceState *dev)
         /* and to the FP/Neon instructions */
         env->cp15.cpacr_el1 = FIELD_DP64(env->cp15.cpacr_el1,
                                          CPACR_EL1, FPEN, 3);
-        /* and to the SVE instructions */
-        env->cp15.cpacr_el1 = FIELD_DP64(env->cp15.cpacr_el1,
-                                         CPACR_EL1, ZEN, 3);
-        /* with reasonable vector length */
+        /* and to the SVE instructions, with default vector length */
         if (cpu_isar_feature(aa64_sve, cpu)) {
+            env->cp15.cpacr_el1 = FIELD_DP64(env->cp15.cpacr_el1,
+                                             CPACR_EL1, ZEN, 3);
             env->vfp.zcr_el[1] = cpu->sve_default_vq - 1;
         }
         /*
-- 
2.34.1


