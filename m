Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB7C6A660A
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 03:59:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCf3-0001Yj-MO; Tue, 28 Feb 2023 21:57:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCev-00016l-Cr
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:38 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCet-0003HI-Oc
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:37 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 me6-20020a17090b17c600b0023816b0c7ceso7822582pjb.2
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iTyx8bHq8GJOs/1JkrWd4tO7K8HyRdDNRU1FxCeCPXc=;
 b=uAJsfINQqonRYKW2guustQ1Rai0LxE3OcDObRXN31GS4i/IuWFE9LwGyOzcRiS6SH7
 sxFUZOeufF05X1lcBmlY3Y/uVbh8K1FxKIIurgG9cOLwB08lnWtmTaScU/HYdi9ciFy1
 H+0Ur57Q0d4Wr6z4UjfzqRCUZGtZK8smmP/J0gm0WZ4gaZGlGmnzoIzABZwOBGeCw5NT
 Ed094PI9VBozJWhF9A/wODA5obEA7kTm1z0R+p5nuFZL86wglORYiQXywzj+JS8zkiFb
 UOa+vv5xrOXsTC+kavrxNZS+VNZswRAgAQQQdMBBOVC+o81p1nn0X1HEdlnh1Hius0Dk
 JGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iTyx8bHq8GJOs/1JkrWd4tO7K8HyRdDNRU1FxCeCPXc=;
 b=VqLReQ7nciPyqI34bPVOhASdObaVLqBywvBG4uJo9ypGU2z+e/0Fa45fwhHzVIvmUj
 vfA4H8R/T58FU3fyIpdyXmXh/qn9WzukNJT7HPLSnH4KkmJd2om6tZnNJHYveghHQxoj
 I1C6ih4afv/U0LnEPYaGrmtWYFu/vP2DPZ5Del1O86ytYX1XLlpZOzwdntFbYdy/IuF6
 5Guf27w2UeSDYi1G/ANuXc1lG0hdMEOYHFkEJIZN81drKHYYAgVdkMCFmOn/v+BcDOLP
 sKzXXvtIxzXE2EiXjfYqzQzBww3QqADA8oSY5rlPUnS7jDxKvwIbDs5CgJH26K48VYtQ
 NZEg==
X-Gm-Message-State: AO0yUKUBgyuspiI9rsugTiReXu+wyRu3+j3/uS0xf2Zm1gRne4QJfueG
 cHKich/slGzsG/nftgNNVSGo7JXMc7M8CD6kquM=
X-Google-Smtp-Source: AK7set/TmtOtRtpXY2KMw2ZeM4aEYUh7/+DN3FuiA/SYaeV2FMFRW27BdGjaCSviVe0t+7zqIadn5g==
X-Received: by 2002:a17:902:be16:b0:19a:6ec0:50c2 with SMTP id
 r22-20020a170902be1600b0019a6ec050c2mr4460806pls.26.1677639454408; 
 Tue, 28 Feb 2023 18:57:34 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jg15-20020a17090326cf00b0019adbef6a63sm7210120plb.235.2023.02.28.18.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:57:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Taylor Simpson <tsimpson@quicinc.com>
Subject: [PULL 28/62] target/hexagon: Replace `tb_pc()` with `tb->pc`
Date: Tue, 28 Feb 2023 16:56:09 -1000
Message-Id: <20230301025643.1227244-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Message-Id: <20230227135202.9710-25-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index 807037c586..ab40cfc283 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -23,6 +23,7 @@
 #include "qapi/error.h"
 #include "hw/qdev-properties.h"
 #include "fpu/softfloat-helpers.h"
+#include "tcg/tcg.h"
 
 static void hexagon_v67_cpu_init(Object *obj)
 {
@@ -263,7 +264,8 @@ static void hexagon_cpu_synchronize_from_tb(CPUState *cs,
 {
     HexagonCPU *cpu = HEXAGON_CPU(cs);
     CPUHexagonState *env = &cpu->env;
-    env->gpr[HEX_REG_PC] = tb_pc(tb);
+    tcg_debug_assert(!(cs->tcg_cflags & CF_PCREL));
+    env->gpr[HEX_REG_PC] = tb->pc;
 }
 
 static bool hexagon_cpu_has_work(CPUState *cs)
-- 
2.34.1


