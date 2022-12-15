Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A1E64DBC5
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 13:57:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5nhU-00076E-SA; Thu, 15 Dec 2022 07:51:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5nhA-0006qe-MF
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:50 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5nh8-00047M-Mm
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:40 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 c65-20020a1c3544000000b003cfffd00fc0so1633166wma.1
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 04:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SPVz5nzpUxR9kUw3FrhH8ulO7d6/4IhNh0TGhcwS5DA=;
 b=Ob1aCX6fPJzwCw0klTUbHSIT9PQBnLJtbU3l8Y5BhCAdA3utiBtv/8LUNyEOEVSOPK
 Vfm5OMjY9MCEWdS9DoRF55/FJ3N+GHyx+K64XC4FKnzzlU9fqHQpe5zlWiMh00RxWHVs
 qeLaWNYMiGhoYuWhWx7S/jgTsD2tRmT1e3ulZgO6c7teTkq+QXf3cUWSkMY/5iTxs2oh
 mjyH/U7JTtwvtgbdcKqln5q8g7NjK5ChDzEBbEUNGE2+K5B4VLh8zdvdBI+9pMtNrCqD
 qjlbevcLAuO+qDmsKsWV8yI6fZqoCQK4Q/TyNOQwIPk1iNP4u1pOgxFAmRKJHtuhdk+H
 TkEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SPVz5nzpUxR9kUw3FrhH8ulO7d6/4IhNh0TGhcwS5DA=;
 b=zHUtlT6HaeL0tRQ1c2Dr+w2vX+LdpKD+KYf29+SGgSPDhD83YBo/JbmeXW2KKV1kmC
 ujJLJPkUymfZvnrzjzIn+IKdh6bROqGi9+4yf8GH86E5of7uQXwIesXleJcis+Gq4mQU
 orLfwki1zkD/gSwoZzHcV+ewNWRPgwhjb7QoUE+oBwZBIrsduHCKQ8scciVcbLqPi3gD
 /slsUD43OrM6pgLxrP/pyHHIDUeq7sK7JXeDbB9qG9w8acRsxC4oNJhEq/Kq0AyYZcOY
 TEmIeYjoTaR8KOD2CxwbBgQhlaUX9zyWVRRi/gA+6IfyYHqGGFbmL+Db0OZAc4YaOrog
 thnQ==
X-Gm-Message-State: ANoB5pkV6FiBc1jjXLo1dcYa19cGgVMlsEduZX6qX+cSUl8LkU6UJ0s9
 KCgQADJed5ViNz69KIPOr/oT6WuzJAevOSMB
X-Google-Smtp-Source: AA0mqf7gfyZObGM5QaRcsFMuaoaEkMPWxVJstJ9SUf2YSXATMxNwNkUn14VNNvpYiXCqKxEJje3qkg==
X-Received: by 2002:a05:600c:3496:b0:3cf:7385:6783 with SMTP id
 a22-20020a05600c349600b003cf73856783mr29577917wmq.36.1671108638004; 
 Thu, 15 Dec 2022 04:50:38 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a05600c354c00b003cfd64b6be1sm8388787wmq.27.2022.12.15.04.50.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 04:50:37 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/29] target/arm: Restrict arm_cpu_exec_interrupt() to TCG
 accelerator
Date: Thu, 15 Dec 2022 12:50:09 +0000
Message-Id: <20221215125009.980128-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221215125009.980128-1-peter.maydell@linaro.org>
References: <20221215125009.980128-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

When building with --disable-tcg on Darwin we get:

  target/arm/cpu.c:725:16: error: incomplete definition of type 'struct TCGCPUOps'
    cc->tcg_ops->do_interrupt(cs);
    ~~~~~~~~~~~^

Commit 083afd18a9 ("target/arm: Restrict cpu_exec_interrupt()
handler to sysemu") limited this block to system emulation,
but neglected to also limit it to TCG.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Fabiano Rosas <farosas@suse.de>
Message-id: 20221209110823.59495-1-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 38d066c294d..0f55004d7e7 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -528,7 +528,7 @@ static void arm_cpu_reset(DeviceState *dev)
     arm_rebuild_hflags(env);
 }
 
-#ifndef CONFIG_USER_ONLY
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 
 static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
                                      unsigned int target_el,
@@ -725,7 +725,8 @@ static bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     cc->tcg_ops->do_interrupt(cs);
     return true;
 }
-#endif /* !CONFIG_USER_ONLY */
+
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
 void arm_cpu_update_virq(ARMCPU *cpu)
 {
-- 
2.25.1


