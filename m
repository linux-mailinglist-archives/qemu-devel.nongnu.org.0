Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAD74FA078
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 02:13:36 +0200 (CEST)
Received: from localhost ([::1]:43430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncyjP-00013Y-BY
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 20:13:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncydp-0008Bw-R8
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 20:07:49 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:37577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncydo-0003QO-8s
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 20:07:49 -0400
Received: by mail-pg1-x52f.google.com with SMTP id 32so6969883pgl.4
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 17:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d2bF5Nr0rwxv79nY64ioUunD/Z2b0emNBLOrA8/hvIQ=;
 b=dhtm9mZg0TIdFZEFeKCvOtc1WY2lqY3eZ0b1jp3xI+9KYfK5Hd8kT0iWhvGbBpHaoI
 ctJrRJXufe9HaQMbngSZuXG6LeylrxXNLH5/u5fS/yHd3oEwEVqN5RbX7WXeymeYaCvI
 opcYvUSa34+lvY4DyLOl3TNPSte66uXePCHTJDHyhxl7Z1kKgm97Geni7FfVtvoEgfvK
 4ybrO7786w6dOHxsCNlYIO0oZkX/Y1COMpS/yycb0SbOY8DVyJcJRYmg1MySNet2WVVt
 EKQ7Z6oT4M5igS7myrCyXq3n+Rn/ocMBZ981CHXw5yU0ac5RuTsObAEJCy3IjeBf8ney
 jLrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d2bF5Nr0rwxv79nY64ioUunD/Z2b0emNBLOrA8/hvIQ=;
 b=1zU9Cl90LcVS8Fix1nuuN+5nGt5Hkdk2sxjkZrmY1/q6EdCmMeeqHV2sE5yIlL/hyn
 /1dAcgxlLqeYFQlgTnxSv2TXIZhSTqJ+W9AGVOfvdI2objo9e9K5BZEwR8n1G1d1ZpX3
 PxXr/tw/J2l4DTSoQFfB8ztq94tJh8SnbxYypgmDwvrnCn0uVc4xU53m2zYtLfFcLpKL
 M3HVS4BaXh3Xu8kjjkwLQMcbgT8zhb6Qr2tY/GeRX1oZZaEFSr7xk4YUKLuD07AJlRzd
 FMxVRM1pljKbHoFdBEyoECnAwrMoxbKjfr3nnz7w4oLZLT2Sza8fy59PTv9k7TaOLWPQ
 Fbsw==
X-Gm-Message-State: AOAM531drQARi9wbBO7XADuBY2Zf/J+Yp7Uewy5SrgJWeHRNr1Y4qpie
 6/lNmkqdvdmgYFZb4gQQWjUBOdBSDHuwIA==
X-Google-Smtp-Source: ABdhPJxC4PNj81OUMlq/bFSAi12408yAljYn0B2/AEV4R3lppp3RmOyxuwvjyTxwlgeVdCXPxJd15A==
X-Received: by 2002:a05:6a00:985:b0:505:9b3b:3fd6 with SMTP id
 u5-20020a056a00098500b005059b3b3fd6mr797141pfg.30.1649462866894; 
 Fri, 08 Apr 2022 17:07:46 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 t69-20020a637848000000b0039831d6dc23sm22073961pgc.94.2022.04.08.17.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 17:07:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/16] target/arm: Set ID_DFR0.PerfMon for qemu-system-arm
 -cpu max
Date: Fri,  8 Apr 2022 17:07:30 -0700
Message-Id: <20220409000742.293691-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220409000742.293691-1-richard.henderson@linaro.org>
References: <20220409000742.293691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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

We set this for qemu-system-aarch64, but failed to do so
for the strictly 32-bit emulation.

Fixes: 3bec78447a9 ("target/arm: Provide ARMv8.4-PMU in '-cpu max'")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu_tcg.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 43ac3e27fa..9569e496e0 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -1029,6 +1029,10 @@ static void arm_max_initfn(Object *obj)
     t = cpu->isar.id_pfr2;
     t = FIELD_DP32(t, ID_PFR2, SSBS, 1);
     cpu->isar.id_pfr2 = t;
+
+    t = cpu->isar.id_dfr0;
+    t = FIELD_DP32(t, ID_DFR0, PERFMON, 5); /* v8.4-PMU */
+    cpu->isar.id_dfr0 = t;
 }
 #endif /* !TARGET_AARCH64 */
 
-- 
2.25.1


