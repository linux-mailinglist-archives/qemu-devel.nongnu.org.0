Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F9750BDAF
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 18:55:49 +0200 (CEST)
Received: from localhost ([::1]:51544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhwZQ-00039k-Gn
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 12:55:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwWY-0008WM-Fe
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:52:50 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:43697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwWW-0007DQ-Vc
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:52:50 -0400
Received: by mail-pl1-x62f.google.com with SMTP id d15so12079923pll.10
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zx3qhK8H+v+NAZcjuR7FBLrFsz8zqhmn66xWRsawstk=;
 b=Pfx6xKA5r1keX+VBskm7QPgSFS6yNGAPEoYsg0EOXnoOEsUNrdg4hDaQ127s9XcPra
 3WOUjyzGD0GOfUmMRCzNrjm0ZYmDBLcodFhw2sTmnaYCMhMNAvIWTON0ktTjV8b5u9df
 Nky0z10nRPa9M7JIbajrlJCAv7FyYLhdUpGzj2GVbuEAXdFXK0L8Ei76xkQkzGCMhihd
 RVYKy1PnZih+R1WGa1v1VGmUhWAO1Wnn84IQY+oN2FGH349cGlDCAq3ryPDSwSO921Ah
 z8VKc7cYX4av24uljOMpDUNVXPtRLckpg3+WhsMCT0ndgOKQIC/2JRJqlBZOuwk/DWzn
 o8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zx3qhK8H+v+NAZcjuR7FBLrFsz8zqhmn66xWRsawstk=;
 b=7THJlb54XzKQgCictnby5b42mx6sdfx1cSoLQDkZ4BEmTLBFtCh+cmq8Q7dlzwgkNk
 a+NQmM/x5oGzAfFanSGczUnKRZIFE8tuFUFjZNSxNqIIJKAdqODnLNQc8Ote7gixdlCv
 /IByLmjG45fkOg9/v8ltM76PN2ILiY5ZoOpJfxRRLnhEdb66CxF7pWDcBvbEpMK86HVm
 jLA3kVGv79okHuWcnYFaQt4o0810G7sUcJhm+b9RKYPW2Q2vPFwWv1/g7YQOAS4hQL3/
 wKVwjwICmUxI8SEhEGQLnRqe942kii8Z4gAsaQwPLWXpJXogO5ssKPidJVfVQSkC0S0Q
 JdiA==
X-Gm-Message-State: AOAM5302CyxALOWT5BE2mJmqd9zZCdo/w68e83WL/g1GjfinVPLcLa2H
 EiBJcPJ+tLKZbJNOBfdupzYc5dF9p+CK4SA2
X-Google-Smtp-Source: ABdhPJyo+Dg9J3/5cLb4CaAcY4jQI+2BiPdwZlfoP6BGJeFXiuUqC18d5NVjdbw0T8h51FqnyvDikw==
X-Received: by 2002:a17:902:a987:b0:158:b020:e5b8 with SMTP id
 bh7-20020a170902a98700b00158b020e5b8mr5317274plb.103.1650646367740; 
 Fri, 22 Apr 2022 09:52:47 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 6-20020a17090a030600b001cd4989ff5fsm6835904pje.38.2022.04.22.09.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:52:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 03/68] linux-user/nios2: Drop syscall 0 "workaround"
Date: Fri, 22 Apr 2022 09:51:33 -0700
Message-Id: <20220422165238.1971496-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Syscall 0 is __NR_io_setup for this target; there is nothing
to work around.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Fixes: a0a839b65b6 ("nios2: Add usermode binaries emulation")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-4-richard.henderson@linaro.org>
---
 linux-user/nios2/cpu_loop.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index 2e9296750d..91737c568f 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -55,10 +55,6 @@ void cpu_loop(CPUNios2State *env)
                                  env->regs[7], env->regs[8], env->regs[9],
                                  0, 0);
 
-                if (env->regs[2] == 0) {    /* FIXME: syscall 0 workaround */
-                    ret = 0;
-                }
-
                 env->regs[2] = abs(ret);
                 /* Return value is 0..4096 */
                 env->regs[7] = ret > 0xfffff000u;
-- 
2.34.1


