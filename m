Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9E26A6600
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 03:59:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCey-000183-U2; Tue, 28 Feb 2023 21:57:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCek-0000ii-Mw
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:26 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCej-00036T-2o
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:26 -0500
Received: by mail-pl1-x632.google.com with SMTP id ky4so12589671plb.3
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6gdCFmDPKfs8EJLeaCLXwTHbx4v/g6J2Bq4Q6QAK+Es=;
 b=ShtPk+bWJdK5FdNSNGSZ9tynJsOf+KmMugFPkVEieWoKSaOhwhquTz977LoRASptK5
 58aWdMlLvZxVAmz9hXgXODZZxncStHRwkvqMuz5nxTnvFN/lOKJ7rLcUUoMBJvjjykHR
 /oY8k5lRCUtBCmuInZT8DVZ2Qlw6+fWdE9jH/c+MrQzMhGSlGBpvzJRyP8XFJ+NWFYK7
 zjSmyh8c0uIxBDBXsHU9iJDYF8aQiQnMnnms5rFsuL+aCS+jB0vn+yrZKuixiUhlGe4T
 z6+pY8ijYl2diCrZCRg5kIqm0nNunxP/xvvZlrbFq9opNnELmyrwDrSL7bRd5WhAaAh2
 QImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6gdCFmDPKfs8EJLeaCLXwTHbx4v/g6J2Bq4Q6QAK+Es=;
 b=b37o2+KVjRII+5o6gBWh0+9AZCpDd1gmMiKNmgR1uYwRIf9rql280DyYmE/GQyW+Ok
 aJ8USCRIWSs068FkHEGcn3Kwe9QlyUj6Edyo/YvmTRimGV52O7tgFXRxIXtPhdT9ZAzt
 F+/j8xQtJkbCtymCbzuNNllDrI+ELg/7pbFEp3m4/m3hq5ti9n82NLsYoNpx9xWLsMCw
 /msHkpjnmJVBIdjbe5IXW0TeRK5M67UbZDAb3jy+f3GWZsynEmon4VT+UeG2M7PUpOJ+
 U/RMqBDC/aSWbXOtIWvnwPoWd3xrPpMzsxOfQaBQSJ776Vxy+8HTnlXZXbD7UA8A+uNn
 V8dg==
X-Gm-Message-State: AO0yUKXRMxY7anh1a6lu3ElLnH/v5QZaI34lzzY1qr2HcNrohG81HlZu
 RbJ6gYo90r+zzZUw/CKp/KnSI6YjU8OpbJNoNsQ=
X-Google-Smtp-Source: AK7set+2cCDclEAe/9Q77SdgSBgiI+ZKH4cgg/FG0BEgr/b4GKNxgltFj7wwcHbZLgTrZ7FQx7x5Cw==
X-Received: by 2002:a17:903:2804:b0:19d:f63:3df4 with SMTP id
 kp4-20020a170903280400b0019d0f633df4mr4274080plb.13.1677639444316; 
 Tue, 28 Feb 2023 18:57:24 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jg15-20020a17090326cf00b0019adbef6a63sm7210120plb.235.2023.02.28.18.57.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:57:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 22/62] target/openrisc: Replace `tb_pc()` with `tb->pc`
Date: Tue, 28 Feb 2023 16:56:03 -1000
Message-Id: <20230301025643.1227244-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Message-Id: <20230227135202.9710-19-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/openrisc/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index 4c11a1f7ad..0ce4f796fa 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -22,6 +22,7 @@
 #include "qemu/qemu-print.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "tcg/tcg.h"
 
 static void openrisc_cpu_set_pc(CPUState *cs, vaddr value)
 {
@@ -43,7 +44,8 @@ static void openrisc_cpu_synchronize_from_tb(CPUState *cs,
 {
     OpenRISCCPU *cpu = OPENRISC_CPU(cs);
 
-    cpu->env.pc = tb_pc(tb);
+    tcg_debug_assert(!(cs->tcg_cflags & CF_PCREL));
+    cpu->env.pc = tb->pc;
 }
 
 static void openrisc_restore_state_to_opc(CPUState *cs,
-- 
2.34.1


