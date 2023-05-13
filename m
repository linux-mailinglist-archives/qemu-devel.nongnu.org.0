Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0305870152D
	for <lists+qemu-devel@lfdr.de>; Sat, 13 May 2023 10:07:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxkGG-0000gt-K0; Sat, 13 May 2023 04:05:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1pxkGB-0000bq-Sm
 for qemu-devel@nongnu.org; Sat, 13 May 2023 04:05:47 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1pxkGA-000578-3e
 for qemu-devel@nongnu.org; Sat, 13 May 2023 04:05:47 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-30626f4d74aso7022606f8f.0
 for <qemu-devel@nongnu.org>; Sat, 13 May 2023 01:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683965144; x=1686557144;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3qQzmOCm9I15s8dR1uKLFgkkYWJssm91+59ldpNI9f0=;
 b=DW1nJ5NkvvzmvExIbWU6HJeBzGWZ+HxQWRVjxVwJqWZVKBFurr7n20nZ1wNh2kn0rF
 HXHJwLtwLFLo8Y1IdIQbaEKf6jV0JdssbkGfYLuHJZkW33n/AWZdnr6ivDu/etCo2n7Q
 z3soC3EclabGlwLim7AYiTRwyYqj+uanXqyWPk9iMq5tOb/8Yo/j8EjGx5ios8Ob2ovU
 KNjVDYuq7Twi2VSqu91/xuaQOpAsXctyGuH/SVzK0V7jyuH1kRjuquGzh/eMFXbZgK0E
 rcwp2wQsu7TS684CV+upVrsiHg7fxR50UD+xudbj/67HgvWAIjJBiGAjDmDCacm8JNmZ
 Sg7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683965144; x=1686557144;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3qQzmOCm9I15s8dR1uKLFgkkYWJssm91+59ldpNI9f0=;
 b=FZtzSppPGknvH5Em6fRuEXhbDBP2KWYfrmMIV9XBMXAyjuRmY9o/wLZUAtmmOilKaL
 e0p8Jnw1UnDIbxlWW/Utp2uXuCgMLtgNXrdBJUqaZptCg4pu9di/LpCiVooQDOnIGI2e
 Im+wsMb+NSs8wY2PtAXWFRa6CpVtOa8F/F3NPydLc/NA3CVYVbr0IEMEl65YBEq/V9/m
 vVx/I1eiUxTdDWnRQudYuEjdLEKD2mJtjGp7BKeHhY+OrRvdO0QpRZtkdQcdN7X62cdQ
 crjfvIyZM6hz6xuHU7FyHEpJNv82UuQN0thKBTdofxEukIG4KGeA2aF/rddUA0De+ozT
 +t9g==
X-Gm-Message-State: AC+VfDyL9VeGcLY/gnVTSUYdTwePMl20OCoZOi5ubrCUGQ+cFPvIkX/j
 5qHjZLm05Jx0LDlpyUnSH+a75xjjqY0=
X-Google-Smtp-Source: ACHHUZ6wD9Iwe14wdDZIsLyYcUjLL34JF9m24I+5YALt4+Kg8NyOewMlbvrIWnxI9Fsdap9T5NPifA==
X-Received: by 2002:adf:e784:0:b0:309:99c:f23f with SMTP id
 n4-20020adfe784000000b00309099cf23fmr949514wrm.63.1683965143785; 
 Sat, 13 May 2023 01:05:43 -0700 (PDT)
Received: from localhost (cpc1-brnt4-2-0-cust862.4-2.cable.virginm.net.
 [86.9.131.95]) by smtp.gmail.com with ESMTPSA id
 x20-20020a1c7c14000000b003f17af4c4e0sm30625293wmc.9.2023.05.13.01.05.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 May 2023 01:05:43 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Cc: Stafford Horne <shorne@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 3/3] target/openrisc: Setup FPU for detecting tininess before
 rounding
Date: Sat, 13 May 2023 09:05:34 +0100
Message-Id: <20230513080534.580800-4-shorne@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230513080534.580800-1-shorne@gmail.com>
References: <20230513080534.580800-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=shorne@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

OpenRISC defines tininess to be detected before rounding.  Setup qemu to
obey this.

Signed-off-by: Stafford Horne <shorne@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/openrisc/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index 0ce4f796fa..61d748cfdc 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -22,6 +22,7 @@
 #include "qemu/qemu-print.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "fpu/softfloat-helpers.h"
 #include "tcg/tcg.h"
 
 static void openrisc_cpu_set_pc(CPUState *cs, vaddr value)
@@ -90,6 +91,9 @@ static void openrisc_cpu_reset_hold(Object *obj)
     s->exception_index = -1;
     cpu_set_fpcsr(&cpu->env, 0);
 
+    set_float_detect_tininess(float_tininess_before_rounding,
+                              &cpu->env.fp_status);
+
 #ifndef CONFIG_USER_ONLY
     cpu->env.picmr = 0x00000000;
     cpu->env.picsr = 0x00000000;
-- 
2.39.1


