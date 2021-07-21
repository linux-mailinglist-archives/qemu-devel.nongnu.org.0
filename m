Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8203D17E4
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 22:23:34 +0200 (CEST)
Received: from localhost ([::1]:55388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Ikf-0003IW-Gt
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 16:23:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6IOL-0002xz-Ci
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:00:31 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:36815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6IOH-0005sm-LJ
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:00:28 -0400
Received: by mail-pl1-x62b.google.com with SMTP id x16so1651501plg.3
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 13:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P7/BMHsXFM5u+/5zB8fL6SRcNTVkT9GgtafQt9Cnl+M=;
 b=H/hwpR0Nxbawf4a3cwXFxOUcA4/77o3fk6OaNHlX0rjoXkxJX1kDO+1p4wZSpCND3q
 Dy4IKl9OH71OcGREgk3TRS7hHkd1ZwOOPP0ZddJVwBQLBoT6cWthRQ7qy+qO1aUUH+RT
 NjWX4nhK8YfqqxnbHXA/W5AUDcH7pbRFhjqxS1Jq6OFfAMrTZ8PJCqA3hni9EVYP7VJf
 52sDr5YXkMzJ+dWRZQ+31Jr09/3st6Ulo3rH0zn4a3pluPGmvwnWfGQIXsYZENI8fU8k
 d6hrtv6u4ufSxqMNYzck7/j2O9xht7AalHJMn0unje8lpzzhIlYVSd4vsi5abxsYqELl
 7VAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P7/BMHsXFM5u+/5zB8fL6SRcNTVkT9GgtafQt9Cnl+M=;
 b=dbVQPZCiTbjedN3W9Xpx2OCXCb7oydYsnUosxmIaLyhdBXpJWPE+uJCGSk/ulS6z0c
 sIyc7JFeAxQD/Dq6Zg9iBBo1Gn8XszNpk1RJalmbZgkWPCh9aU2T4t7RidEo7OLrNu6r
 eUhKPlYkUZGHgBxxapxpaBdzrL3N5MLlIADHrQEauuFcoDRKQZA/8NDo0sgXRZN4NYRp
 crmiIHinuv0srv+uRs45+1tsIbAvhQq6cJqbCWbSE6k/Ct1qpdqHlj8DDW2q9m5qS7wd
 rqG9rmxasbuWNb9qb0NkRmezcmEwwCS+kMd7cxeAvtXUy7hXT9MVQpLWvWnx9G45lYJU
 gKTA==
X-Gm-Message-State: AOAM531E8ztxLbFz0faBy7ynBzslF/aK4RBNyug+iQt71IJUpkbnNFRu
 3Nxm9A9B2y+2Zgh04CtSXPrF1XZmIXazZg==
X-Google-Smtp-Source: ABdhPJwYenygV08xgyeEah4Va2HTMZ+2UcnujqshVEcCxjOxU6APCyD2u2IxKC/a5gJtb1/f733FNQ==
X-Received: by 2002:a17:902:9004:b029:f0:b40d:38d with SMTP id
 a4-20020a1709029004b02900f0b40d038dmr29068905plp.85.1626897624239; 
 Wed, 21 Jul 2021 13:00:24 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id w3sm706028pjq.12.2021.07.21.13.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 13:00:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/27] target/i386: Implement debug_check_breakpoint
Date: Wed, 21 Jul 2021 09:59:47 -1000
Message-Id: <20210721195954.879535-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721195954.879535-1-richard.henderson@linaro.org>
References: <20210721195954.879535-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Return false for RF set, as we do in i386_tr_breakpoint_check.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/tcg-cpu.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index e96ec9bbcc..238e3a9395 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -54,6 +54,17 @@ static void x86_cpu_synchronize_from_tb(CPUState *cs,
     cpu->env.eip = tb->pc - tb->cs_base;
 }
 
+#ifndef CONFIG_USER_ONLY
+static bool x86_debug_check_breakpoint(CPUState *cs)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
+
+    /* RF disables all architectural breakpoints. */
+    return !(env->eflags & RF_MASK);
+}
+#endif
+
 #include "hw/core/tcg-cpu-ops.h"
 
 static const struct TCGCPUOps x86_tcg_ops = {
@@ -66,6 +77,7 @@ static const struct TCGCPUOps x86_tcg_ops = {
     .tlb_fill = x86_cpu_tlb_fill,
 #ifndef CONFIG_USER_ONLY
     .debug_excp_handler = breakpoint_handler,
+    .debug_check_breakpoint = x86_debug_check_breakpoint,
 #endif /* !CONFIG_USER_ONLY */
 };
 
-- 
2.25.1


