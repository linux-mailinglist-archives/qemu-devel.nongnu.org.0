Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C8243C1F3
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 06:59:11 +0200 (CEST)
Received: from localhost ([::1]:45764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfb1r-00080K-16
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 00:59:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfazA-0005I1-KM; Wed, 27 Oct 2021 00:56:24 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:51101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfaz7-0005CN-SD; Wed, 27 Oct 2021 00:56:24 -0400
Received: by mail-wm1-x32b.google.com with SMTP id b71so651542wmd.0;
 Tue, 26 Oct 2021 21:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xgqwxzvm1yoHh/fzT0KNAI1LNIKM1+1SON195Vhqr/o=;
 b=UIt/DChPhUSIG3lPRxfquQIOiN8e1V2Th5+2iNdfQj7m3mYpVBQQqAYP2M2LCr6BYY
 gRMA8o/+e/70yDg4rCkYg2bzYmTHrZdG5Zx2vddBTSa1urIsbPiz2F5TnaTTfTeps4MH
 rT6/QuqxOUbBgunO03a5iIVxNwtji6BQLsZt0VxB6ynhdHcRB+PERGTA/qFCC0Gckqof
 Bkgrc76D82hMdY43vpI5nsOTyrIExwSidVj1P7uk8Qga2Y4prQ+bBtRJ5RmNNu7K5jMv
 Y6GqrLu+ecKgF0UTmKHqY7zK41kYULWr6Gu4IK9BrnTP1aSVF4jIiPHPWWZEar9Bx64f
 w/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Xgqwxzvm1yoHh/fzT0KNAI1LNIKM1+1SON195Vhqr/o=;
 b=IdyejG1GBsz/aqZJcdugp04p0p0oxzUS6sVXsK+qszKlKEHUVE0mp4sFcNeBHU7viA
 F5rVdVQdlXXW8WD+Lc7FG3tT3JSm5aw4EmPWFvbOoh/q/ZUM8uD2pW0Y1OewnxV9UAmd
 zTSbsP846nj133KSToG0H8PIXV/CU8JNZ7L11ESknkHzGgo/k7w+wDur3Tsurs4cWxsK
 8sB1rUFVxL6XAj1jqPfc6cdEijsvg+APXp7oXTKiWvwRh9CEM+DrMvW1vN3x1y+AmH3y
 1L8msSwuJ4yGIfrQ3TZOGLUvIUk0xV48M6PT20CZEI6o7xd7szteXkdBWrvCyYXwcg94
 0xWA==
X-Gm-Message-State: AOAM530rSc5m/vcqyvS3OVnrRoSWWuzpbvEfSUp/L78J9FfvxU+eOxMd
 B5tcaVfwb7ecO+eIjOg8hh60ldaBiaQ=
X-Google-Smtp-Source: ABdhPJxvYP8nzccWn/Pb7Y8T8dSn8DgzFW7W6toZ5ataKUxFc4MRnJFYsTuz4UfH6l0cDcuYBNtgug==
X-Received: by 2002:a7b:c927:: with SMTP id h7mr3288597wml.68.1635310579926;
 Tue, 26 Oct 2021 21:56:19 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id d3sm21667468wrb.36.2021.10.26.21.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 21:56:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/4] target/arm: Introduce store_cpu_field_constant() helper
Date: Wed, 27 Oct 2021 06:56:05 +0200
Message-Id: <20211027045607.1261526-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027045607.1261526-1-f4bug@amsat.org>
References: <20211027045607.1261526-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similarly to the store_cpu_field() helper which takes a TCG
temporary, store its value to the CPUState, introduce the
store_cpu_field_constant() helper which store a constant to
CPUState (without using any TCG temporary).

Update the single store_cpu_offset() user in do_coproc_insn().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/translate-a32.h | 11 ++++++++---
 target/arm/translate.c     |  2 +-
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate-a32.h b/target/arm/translate-a32.h
index 88f15df60e8..2e708ca3dbc 100644
--- a/target/arm/translate-a32.h
+++ b/target/arm/translate-a32.h
@@ -61,14 +61,19 @@ static inline TCGv_i32 load_cpu_offset(int offset)
 
 #define load_cpu_field(name) load_cpu_offset(offsetof(CPUARMState, name))
 
-static inline void store_cpu_offset(TCGv_i32 var, int offset)
+static inline void store_cpu_offset(TCGv_i32 var, int offset, bool is_temp)
 {
     tcg_gen_st_i32(var, cpu_env, offset);
-    tcg_temp_free_i32(var);
+    if (is_temp) {
+        tcg_temp_free_i32(var);
+    }
 }
 
 #define store_cpu_field(var, name) \
-    store_cpu_offset(var, offsetof(CPUARMState, name))
+    store_cpu_offset(var, offsetof(CPUARMState, name), true)
+
+#define store_cpu_field_constant(val, name) \
+    store_cpu_offset(tcg_constant_i32(val), offsetof(CPUARMState, name), false)
 
 /* Create a new temporary and set it to the value of a CPU register.  */
 static inline TCGv_i32 load_reg(DisasContext *s, int reg)
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 083a6d6ed77..5061e55f2c0 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4855,7 +4855,7 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
                     tcg_temp_free_i32(tmp);
                 } else {
                     TCGv_i32 tmp = load_reg(s, rt);
-                    store_cpu_offset(tmp, ri->fieldoffset);
+                    store_cpu_offset(tmp, ri->fieldoffset, true);
                 }
             }
         }
-- 
2.31.1


