Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4803D0272
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 22:01:33 +0200 (CEST)
Received: from localhost ([::1]:58046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5vvo-0008PQ-2a
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 16:01:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5vpT-0007G6-Hr
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 15:54:59 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:55910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5vpR-00085h-44
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 15:54:59 -0400
Received: by mail-pj1-x102f.google.com with SMTP id gx2so305867pjb.5
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 12:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P7/BMHsXFM5u+/5zB8fL6SRcNTVkT9GgtafQt9Cnl+M=;
 b=WtI7UFlqddpgzW2NCnXw6PoKts83f4wKociSZm7AKqCGbQgFUBuL703TsocVjPLVq9
 2RTRSEV4mX/xHNr/LUEPVErtHAJN6ztN5y5CLZZnkhQAvd4gnl6ShCJyD21iXLZD1ra7
 tM7EDKI5OZJHxFA1AZ6z6El6Ntzk+8qYyDD0X/ey10Hz6ZVczL3wD3qqM2KZEBBGAnnn
 LpJ237P1/lITC5wDLaRdM2W+N5LoapF0uUMgTPHdOZtNa2pIjzh6YkCIwtINT76Pe8ge
 K3ssmpysS7R16Ev7sXuE2E8WcnJXd3CxlVG1Z33YjqcIRP6kJDjyOxRu9Kl/a6JrRCWb
 MAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P7/BMHsXFM5u+/5zB8fL6SRcNTVkT9GgtafQt9Cnl+M=;
 b=dvpo9jjGv7E+V7cFvVlalk5X/rGp0jPpUp1Oj5PKFkAflpRo39M+rhMX/MkxNjdePB
 CAyokRAxuLsWrFu7Qy+WyHyO7OfvsiOQNoDHBm5D3JOx8qRNCiqU6sLSxMcX00IYLD1u
 gEjtOXnaPqa5n4FY7GrpEYxj397hb1+UDSW7Ywp65iowfP3x3pSCf1MiR9uIENkrx/Lk
 bKqw+sC7ZtibDuaTt2Q0d7UZ07bkpk2etKme9IJii7WlCxH5/njhT+wchXXai3s2ntRa
 ryDnPoAi/M47hVhMvSq+b2u4WPFYI5veYanNcqaKTwKRUlBu/TNppNWrPsPTmvarmbb8
 riYA==
X-Gm-Message-State: AOAM533Eox+gyMQehTwIaxCif8+PeX3M+b9dceeYMiugk9leAx7fTgmo
 wUsgplpx6ljHn6nODLv6LWmoy1OedW8RFw==
X-Google-Smtp-Source: ABdhPJxPaJn5pnNWgTBHTtsdHXeAW3zwYbsZW6xXx7vGYYBs80Hnr00ugdWhQHVOI6aOwchoFgfI8w==
X-Received: by 2002:a17:90a:bd94:: with SMTP id
 z20mr32430995pjr.214.1626810895884; 
 Tue, 20 Jul 2021 12:54:55 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id j25sm15422179pfh.77.2021.07.20.12.54.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 12:54:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 v6 10/17] target/i386: Implement debug_check_breakpoint
Date: Tue, 20 Jul 2021 09:54:32 -1000
Message-Id: <20210720195439.626594-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720195439.626594-1-richard.henderson@linaro.org>
References: <20210720195439.626594-1-richard.henderson@linaro.org>
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


