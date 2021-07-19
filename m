Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4BD3CEE17
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 23:25:51 +0200 (CEST)
Received: from localhost ([::1]:55622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5alq-0000At-F6
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 17:25:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5aj8-0004VZ-B4
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:23:02 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:38508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5aj6-0000uz-FK
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:23:02 -0400
Received: by mail-pf1-x429.google.com with SMTP id i14so5738074pfd.5
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 14:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1SYl6z4JM6oqxGI/nixKvmomGJ8etB/EcKsdFgvob4o=;
 b=RZbswz7PF6dQ3OhUhhzVrGsR1pnMNOZ0ZSXwA1SV2b0IyqQ/aYsoCIihK53QgS/qDJ
 eOqPawMxfX40uXum3QSlGuG9BO4+v/kMrXL7JhCGvX7Az2d0TwH6DQIiRAY0QVhmZBuz
 0F+DdR7NM5rm/aqYcHnvsvYjVzD9RKGGpneVVGLGU5QFbwIzhhQz8WHRkiXu52OATvE2
 HhkO3ZxlAyCSgMMQc2UIQ51fN4PnS6BvFQpMu+LSnmtuCTr3zy6xc1TtnGhx1d+TWcKp
 iY+76vitr1qp/6Yrtt+vbGWAVGYRDSbpMK9qXzniX32PgMGqJ9kEM3VuqNKrA7CMW2Oj
 3aYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1SYl6z4JM6oqxGI/nixKvmomGJ8etB/EcKsdFgvob4o=;
 b=Vost8+mYnlA/7If1VGdWj3XP2eRsvUTVpO0n+B5c0dpIWnMnLXQvSXaClzzeBd1o+L
 D5bGxq9cOxpuVZmDpohoQlPzwKbV/BR06G2tQHGElwu708wdorF4OGrjCZBtEWDb9Oui
 i8BpqFHxMKdAHUSElcpbrzq3Ig6QcPX9HmyXOTKUyyLVL+6WSoaUZcrVrUE+bvG9dq/y
 cuwWxdAXYFMSgoaonDHzO7A1+omtqTOG1E5LE7a2QxdNVBH5XoW6ZBAXUh2b39k04x9c
 jU5LfBCG9A2OV6XAHfus+zmheltNIg/Yigkp5KjJ3+5Q8q9FlKMZ6/haPJyp6S0Vc2JK
 E+Rw==
X-Gm-Message-State: AOAM532N568f8XLAWAu0UXkUFAfJQ5QwQiGyUmCU8jGO2Oi8N6JpTH8L
 g7sGJBNUaRteGdFJ8VlLeI4JeKNidXB54Q==
X-Google-Smtp-Source: ABdhPJxYZl7qcQO3zFE3xwKVxt3g96x8Hfh57cFaEJ4CqAVpMp65hlmpA2DlQw1mVBRRXQ++/EiZ1Q==
X-Received: by 2002:a05:6a00:10cd:b029:30a:ea3a:4acf with SMTP id
 d13-20020a056a0010cdb029030aea3a4acfmr28748825pfu.51.1626729779234; 
 Mon, 19 Jul 2021 14:22:59 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id e4sm25008434pgi.94.2021.07.19.14.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 14:22:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 v4 11/15] target/i386: Implement debug_check_breakpoint
Date: Mon, 19 Jul 2021 11:22:35 -1000
Message-Id: <20210719212239.428740-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210719212239.428740-1-richard.henderson@linaro.org>
References: <20210719212239.428740-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Return false for RF set, as we do in i386_tr_breakpoint_check.

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


