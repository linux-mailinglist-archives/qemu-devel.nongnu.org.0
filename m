Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3C5699AF2
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 18:14:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShnY-0000qP-CA; Thu, 16 Feb 2023 12:11:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnU-0000a1-4g
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:52 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnO-0007tG-IB
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:51 -0500
Received: by mail-wm1-x331.google.com with SMTP id n33so2119703wms.0
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 09:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uCZjE6lvYgX4qXFndfs51jkpgm8/Sewi06RQDXzjFJQ=;
 b=KySVwczsfpIVPV8who6SfOSo1JBJqKfK5g7CJZm7YN8bpyA3rEXqxxJiDvoxbJO2XZ
 yLwxKd61O6wJq7nh52igkgqJEOQBiAXfrmXzsOIehYLkOg+igKzimjOmzlMTUcDO5CH4
 nIqPybGtuDLfWqB9cbnqG9IE/LtQSR9y93D+hZER46AVX1yd9Kg0G5KoZWexDn0jR/W/
 vpI+bkvyly6/VL73oRH4BnCMmc0f5V4Dk46BIB5SfsSWLJcEzb/gKH7ptpr5YCtZQRVm
 Q8dqPeTXpeXwJbl2pW9LDsNlCzD4r7VAUQCzxSBE5aZeqeim/oxz5YTcvdZn1OluJE+P
 fOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uCZjE6lvYgX4qXFndfs51jkpgm8/Sewi06RQDXzjFJQ=;
 b=ld3V/LUqb9Uj89R37rVz1egw3NwABEvj2yo+sSxFGtOw2VbP+1PP1uUs56o+58kCAt
 vqCWYYHLSdhUZUrE+f5Z6TeljUwc+xCKQCXEk04n1dM9jgqfb2OUqQa7F8t/CEuHuHrw
 D8PT4pnNIwKAx5WVk2mS8UbNEEZUaVukMZJSWVugfCz8D8VTT2wHIQGEO85TqRqKv8CL
 RoPLKCTzf7Eal4l4Dv4ABp95pt7H4x3PkoXb0DshXh+pWzvhyKzcEtdSYIxuTUXNWBz0
 KLB2fsKvCb1VucNIbAzn6iJwrJMmiQ50RtGZEMSSh3zZmmmL/pO/ZdgRiiPtEp1+wRiu
 r57A==
X-Gm-Message-State: AO0yUKW1rZki8dSECnT1LYZnAvrsaVBy2r8/L3h5cTy8rR6hLOmvY3BZ
 d7GfCiLo8q/ztG19RZJB1ssN2dm8hx73YS16
X-Google-Smtp-Source: AK7set8q2F5XUJrywUA2ae4S0Ykr+l9SjIVjpwIsHe8c7UV9ddthbRitqfhNmAyG3Lp4icxMvOb+lQ==
X-Received: by 2002:a05:600c:1c07:b0:3df:9858:c033 with SMTP id
 j7-20020a05600c1c0700b003df9858c033mr2530230wms.8.1676567505761; 
 Thu, 16 Feb 2023 09:11:45 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002c556a4f1casm2049107wru.42.2023.02.16.09.11.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 09:11:45 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/30] target/arm: Move PC alignment check
Date: Thu, 16 Feb 2023 17:11:17 +0000
Message-Id: <20230216171123.2518285-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216171123.2518285-1-peter.maydell@linaro.org>
References: <20230216171123.2518285-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

From: Fabiano Rosas <farosas@suse.de>

Move this earlier to make the next patch diff cleaner. While here
update the comment slightly to not give the impression that the
misalignment affects only TCG.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/machine.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/arm/machine.c b/target/arm/machine.c
index 5f261526525..b4c3850570c 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -839,6 +839,15 @@ static int cpu_post_load(void *opaque, int version_id)
         }
     }
 
+    /*
+     * Misaligned thumb pc is architecturally impossible. Fail the
+     * incoming migration. For TCG it would trigger the assert in
+     * thumb_tr_translate_insn().
+     */
+    if (!is_a64(env) && env->thumb && (env->regs[15] & 1)) {
+        return -1;
+    }
+
     hw_breakpoint_update_all(cpu);
     hw_watchpoint_update_all(cpu);
 
@@ -856,15 +865,6 @@ static int cpu_post_load(void *opaque, int version_id)
         }
     }
 
-    /*
-     * Misaligned thumb pc is architecturally impossible.
-     * We have an assert in thumb_tr_translate_insn to verify this.
-     * Fail an incoming migrate to avoid this assert.
-     */
-    if (!is_a64(env) && env->thumb && (env->regs[15] & 1)) {
-        return -1;
-    }
-
     if (!kvm_enabled()) {
         pmu_op_finish(&cpu->env);
     }
-- 
2.34.1


