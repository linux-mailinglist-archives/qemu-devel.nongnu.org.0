Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDB723CE51
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Aug 2020 20:24:24 +0200 (CEST)
Received: from localhost ([::1]:44216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3O5P-0007Jc-US
	for lists+qemu-devel@lfdr.de; Wed, 05 Aug 2020 14:24:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1k3Nyu-0004bc-Dy
 for qemu-devel@nongnu.org; Wed, 05 Aug 2020 14:17:41 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:33810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1k3Nyq-0006UW-W0
 for qemu-devel@nongnu.org; Wed, 05 Aug 2020 14:17:39 -0400
Received: by mail-pg1-x532.google.com with SMTP id t6so24960072pgq.1
 for <qemu-devel@nongnu.org>; Wed, 05 Aug 2020 11:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=JEsnnFYRnVZaq0i2DwuNSLaqhNKEKeJEaJl1TkjXWDY=;
 b=PZrgCSmKb1oY1ZGeU/YExUk6KMJyebctyIkNwjN8iZl+GCeVQzj9zMnUA5xHiGm44R
 oui3/hc1hBukPsrDR2dKR4vOmAOq3rpMj1SyMSzH3ct6FJ8l6MqkUmygnWof8kI9k6FT
 6wyxw/5G60uhr5zk4t5833ZbTvYPclMttmEcwDhNvHamf/QKHRgiIJqf3lrPtKGyTByT
 0CQy5Nf+Xdm/MsbGmpnJLgV4BKBgimM9lgKLlWIXf32OCzIHzxsIfmbBcKTjc8483Igt
 9rYH5KodW3ZHTfqgbc6wVmUUMmo7yrk/sgTZDw4OxvbeeojikP3ZKvphGx7ztAGWH8Yw
 l9lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=JEsnnFYRnVZaq0i2DwuNSLaqhNKEKeJEaJl1TkjXWDY=;
 b=tYmkpx7ZHhVJIY9omTY63KuiCLvR4reS2xyMbYwccCgiCDmYzsuWv69fWPYHBnqDS/
 t52uL41N6TnYxtdkSqzrSrlhmvf+wIiKpXmUhLD1tj/CczhL4DWdPKX9dm4W+WeEWyf0
 BhJxesenvK4D0fAeTCuH+ItrqDVEWLuawJ6AMs7Fjs/dQK2jK5bDzA9WnOZjiXQ07LJz
 EWDqPI6JGYwqr6w6kFTghXZ/VSOH7OhcBGSGvC/aQcTR2slas9458LvyJy2yzQUTgEF+
 tMzFs2c/yJD2sMZS0ShE+H1Xam9pM4UMX3ii8N6H1Z3vYOA4yghOkmIkFDvNQQrra/R7
 8QFg==
X-Gm-Message-State: AOAM532Eq0PXyP6mBX4OdBVN2ZkQVkvwM9Bjl2RJ2hSX6sX1xsZeRe/K
 a8XKIhjR7nnDF49hwTwqLpHT7Vm/LYE=
X-Google-Smtp-Source: ABdhPJzZ586Vu9XBmAKRIdoBA3GDtYL3zEBxDz6xsJL8sUEkEW3ojvVVMfcSa+Gsf8ItsYdDP+fkOw==
X-Received: by 2002:a63:5012:: with SMTP id e18mr4028460pgb.169.1596651455325; 
 Wed, 05 Aug 2020 11:17:35 -0700 (PDT)
Received: from Rfoley-MA01.hsd1.ma.comcast.net
 ([2601:199:4480:60c0:38ab:50b1:ff8a:26ef])
 by smtp.gmail.com with ESMTPSA id a15sm3670196pfo.185.2020.08.05.11.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 11:17:34 -0700 (PDT)
From: Robert Foley <robert.foley@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 13/21] target/openrisc: add BQL to do_interrupt and
 cpu_exec_interrupt
Date: Wed,  5 Aug 2020 14:12:55 -0400
Message-Id: <20200805181303.7822-14-robert.foley@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200805181303.7822-1-robert.foley@linaro.org>
References: <20200805181303.7822-1-robert.foley@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=robert.foley@linaro.org; helo=mail-pg1-x532.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: robert.foley@linaro.org, cota@braap.org, peter.puhov@linaro.org,
 pbonzini@redhat.com, Stafford Horne <shorne@gmail.com>, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is part of a series of changes to remove the implied BQL
from the common code of cpu_handle_interrupt and
cpu_handle_exception.  As part of removing the implied BQL
from the common code, we are pushing the BQL holding
down into the per-arch implementation functions of
do_interrupt and cpu_exec_interrupt.

The purpose of this set of changes is to set the groundwork
so that an arch could move towards removing
the BQL from the cpu_handle_interrupt/exception paths.

This approach was suggested by Paolo Bonzini.
For reference, here are two key posts in the discussion, explaining
the reasoning/benefits of this approach.
https://lists.gnu.org/archive/html/qemu-devel/2020-07/msg08731.html
https://lists.gnu.org/archive/html/qemu-devel/2020-08/msg00044.html

Signed-off-by: Robert Foley <robert.foley@linaro.org>
---
 target/openrisc/interrupt.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/openrisc/interrupt.c b/target/openrisc/interrupt.c
index 3eab771dcd..361f242954 100644
--- a/target/openrisc/interrupt.c
+++ b/target/openrisc/interrupt.c
@@ -28,6 +28,10 @@
 
 void openrisc_cpu_do_interrupt(CPUState *cs)
 {
+    bool bql = !qemu_mutex_iothread_locked();
+    if (bql) {
+        qemu_mutex_lock_iothread();
+    }
 #ifndef CONFIG_USER_ONLY
     OpenRISCCPU *cpu = OPENRISC_CPU(cs);
     CPUOpenRISCState *env = &cpu->env;
@@ -99,6 +103,9 @@ void openrisc_cpu_do_interrupt(CPUState *cs)
 #endif
 
     cs->exception_index = -1;
+    if (bql) {
+        qemu_mutex_unlock_iothread();
+    }
 }
 
 bool openrisc_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
@@ -106,6 +113,7 @@ bool openrisc_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     OpenRISCCPU *cpu = OPENRISC_CPU(cs);
     CPUOpenRISCState *env = &cpu->env;
     int idx = -1;
+    qemu_mutex_lock_iothread();
 
     if ((interrupt_request & CPU_INTERRUPT_HARD) && (env->sr & SR_IEE)) {
         idx = EXCP_INT;
@@ -116,7 +124,9 @@ bool openrisc_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     if (idx >= 0) {
         cs->exception_index = idx;
         openrisc_cpu_do_interrupt(cs);
+        qemu_mutex_unlock_iothread();
         return true;
     }
+    qemu_mutex_unlock_iothread();
     return false;
 }
-- 
2.17.1


