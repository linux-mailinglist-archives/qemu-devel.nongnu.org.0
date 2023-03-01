Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF0D6A6608
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 03:59:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCfA-0002cu-83; Tue, 28 Feb 2023 21:57:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCes-00015G-UH
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:37 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCer-00035u-Dv
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:34 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 k21-20020a17090aaa1500b002376652e160so11655757pjq.0
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/jph3WTICceFvpS1dBGx8XV34lqmng3+A7zDrw3SAFw=;
 b=TDA225QDVNjMpssf8WdHq8stmGLtORVlXNCUP4FeFKOC7UdmzaCn7H8pbWXccnLfMc
 /IZ6vw4MU9cpWEpOLARSaoOv6f3Cy2kBN9hKo2cHOvXez5PgqUHrjL234FeCrjNQOzCn
 xHYWRBdu4MzNkFzTgHkpjZP106Txdd0+SVnQpz7VWNDSk7OoKX7rZv1n3OU44MANLmCy
 Uq5AcpGGMx5DG0hRSzw0jTPDkd/cGOcrAXoxi3OMElPy/VWD7bsmNQ6ROcuLi8+K228c
 FxQLf4pWXauE4xTXzpJUXbS3DxNFZa1Vd2f8Af0BqzzOgy8/nybucDQXSnHzVU7/Ac/P
 KoiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/jph3WTICceFvpS1dBGx8XV34lqmng3+A7zDrw3SAFw=;
 b=Pi+W2kqp9SybejwHcrO0EeH+5j8SEyThe/EYV6v4osCX+8GM9bHKWlRpYmGmKxl9Cz
 t++EZ/uQpaaiqffuWdWx2Hj7iJKgZ+1Nq05mT/hyGG0DIfX1efBIn5aM3DKNW0fBdonA
 nb0PjNELJvp+Cpc0fpfaC48IoJoZJ4SYXis/y570jpom9na139HrQ17TQ6WT9EcLrjWR
 umw8TaiZnGb0asl90C4v6rrA8gVuNUDB84TNRAn11/32Mr0Ejy7QMrwC5G2cAbBSAuNy
 WX5KiMthqcHIjFx8Hy80QyK5xan/9izxTqGwsLsUSu3FcfSUVSRVKvnkuXDyn0iMZ7Ap
 Hv2Q==
X-Gm-Message-State: AO0yUKVHVlo7LrmshyX6o0Uhgh5W0F1H7pM7+RJcDc3k/XEv/JrbxnyO
 0cP+nz5zyJAWQQr3ILZZBOUsGPxYSI+eqyXzMEI=
X-Google-Smtp-Source: AK7set+2MCz+bnhj8tP6Q5AxYf7hV5jVNURf+J6YDgCegjnj9IPs1yOBOazQCZiqkC8I7VeYv49Odg==
X-Received: by 2002:a17:903:1c8:b0:19d:553:745c with SMTP id
 e8-20020a17090301c800b0019d0553745cmr4818757plh.9.1677639452557; 
 Tue, 28 Feb 2023 18:57:32 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jg15-20020a17090326cf00b0019adbef6a63sm7210120plb.235.2023.02.28.18.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:57:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 27/62] target/hppa: Replace `tb_pc()` with `tb->pc`
Date: Tue, 28 Feb 2023 16:56:08 -1000
Message-Id: <20230301025643.1227244-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

From: Anton Johansson via <qemu-devel@nongnu.org>

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230227135202.9710-24-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/cpu.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 55c190280e..11022f9c99 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -26,7 +26,7 @@
 #include "qemu/module.h"
 #include "exec/exec-all.h"
 #include "fpu/softfloat.h"
-
+#include "tcg/tcg.h"
 
 static void hppa_cpu_set_pc(CPUState *cs, vaddr value)
 {
@@ -48,8 +48,10 @@ static void hppa_cpu_synchronize_from_tb(CPUState *cs,
 {
     HPPACPU *cpu = HPPA_CPU(cs);
 
+    tcg_debug_assert(!(cs->tcg_cflags & CF_PCREL));
+
 #ifdef CONFIG_USER_ONLY
-    cpu->env.iaoq_f = tb_pc(tb);
+    cpu->env.iaoq_f = tb->pc;
     cpu->env.iaoq_b = tb->cs_base;
 #else
     /* Recover the IAOQ values from the GVA + PRIV.  */
@@ -59,7 +61,7 @@ static void hppa_cpu_synchronize_from_tb(CPUState *cs,
     int32_t diff = cs_base;
 
     cpu->env.iasq_f = iasq_f;
-    cpu->env.iaoq_f = (tb_pc(tb) & ~iasq_f) + priv;
+    cpu->env.iaoq_f = (tb->pc & ~iasq_f) + priv;
     if (diff) {
         cpu->env.iaoq_b = cpu->env.iaoq_f + diff;
     }
-- 
2.34.1


