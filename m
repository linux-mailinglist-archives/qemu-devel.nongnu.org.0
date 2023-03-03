Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A062F6A8F90
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 04:01:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXvcp-0007WE-4p; Thu, 02 Mar 2023 21:58:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXvcl-0007Ua-E0
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:58:23 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXvcj-0001ou-MD
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:58:23 -0500
Received: by mail-pj1-x1031.google.com with SMTP id x34so1210009pjj.0
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 18:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677812301;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3WIxe+smKoqvvD+KwVzWzoBm2ZPTc7NcUurnb42ciEE=;
 b=KksIPJN2jDvsGZjjtxBd96APwfcAAkQTUQzr5RgyG8to8hnhVD8BrCWSKVulK20iQP
 f+BmpEiWOKM11NT1kWWYWJjFQtBvK+ubSTe0uwRVxU+tWNEnNML8Y8w5qgumyE1e4Jpt
 oC09KQaZM1WzOLHF6iuiiWVAECsz4krJj9tpXl4HzWJqBwRt73fE1GvM/fExZA2HGdWC
 3zs79m+Rtz1Idl8ezm1DpwcDtRPEnNzCZ1xW+6WwL2rQyB19Ez+bxBW9Ji+HvdWRkFI1
 mVYPdzPFOMFklEo1D8XOWNWVf1MgakrDNT+3ogxZTKwzxz+KMcCdquMEx0YKftNDCIxd
 56jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677812301;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3WIxe+smKoqvvD+KwVzWzoBm2ZPTc7NcUurnb42ciEE=;
 b=V3ekmxUJeY8eYz4/DEQcnA6ad1l3M0jAFPURhz81RswLEPcmuiDVpUfPtt48DMpTbL
 vJFdVT9cxJrxQPpgFd6OPM1UZLx2PGHA6kLWH4LLN5c/R7268bx93GcAGUv2wpjiw5A+
 p1UkU8wwTfCLLHOHyzbWV1P1gkQ+A0p4HXszSRzXtXnKSZszvYFg5IFTWbRkqq4GDxmK
 CVaDH2w3RezA6IJL/d/dhCnsNqjUW85e+MoXHQJxUVscKD4FGzivAVxPmKqQ2fhtkYXN
 ZC4bdoBkqqi8mn5Sr5sMyuV7wOdmjeRp5s9yw41SoZVgcX7n2F2elmc7p5MNn5QBEHB6
 4lVw==
X-Gm-Message-State: AO0yUKVlZAqLsP2iIgKmI2jzpAl4aqId82rEAuVo2wVtfLH4qoGos0Z4
 cBRn0IUNtXH0vjnBWELTs04AU9EmIBB0Tjmimbo=
X-Google-Smtp-Source: AK7set/yQPTHoZdM7zP3mzt9Sj+vDpMpr1/EYA6LaPXRe/QTWEi2UhnfZfSP247hH4r8t0gDc7G95w==
X-Received: by 2002:a17:903:1d2:b0:19c:be07:4af2 with SMTP id
 e18-20020a17090301d200b0019cbe074af2mr594838plh.45.1677812300880; 
 Thu, 02 Mar 2023 18:58:20 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:f3e6:4626:fbc8:b2ce])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a17090301c400b001992e74d055sm372244plh.12.2023.03.02.18.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 18:58:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH v4.5 16/29] gdbstub: introduce gdb_get_max_cpus
Date: Thu,  2 Mar 2023 18:57:52 -0800
Message-Id: <20230303025805.625589-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303025805.625589-1-richard.henderson@linaro.org>
References: <20230303025805.625589-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

From: Alex Bennée <alex.bennee@linaro.org>

This is needed for handling vcont packets as the way of calculating
max cpus vhanges between user and softmmu mode.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Message-Id: <20230302190846.2593720-17-alex.bennee@linaro.org>
---
 gdbstub/internals.h |  1 +
 gdbstub/gdbstub.c   | 11 +----------
 gdbstub/softmmu.c   |  9 +++++++++
 gdbstub/user.c      | 17 +++++++++++++++++
 4 files changed, 28 insertions(+), 10 deletions(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index d8c0292d99..26a6468a69 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -129,6 +129,7 @@ bool gdb_got_immediate_ack(void);
 CPUState *gdb_first_attached_cpu(void);
 void gdb_append_thread_id(CPUState *cpu, GString *buf);
 int gdb_get_cpu_index(CPUState *cpu);
+unsigned int gdb_get_max_cpus(void); /* both */
 
 void gdb_create_default_process(GDBState *s);
 
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index ed38ab0aaa..1b783100c2 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -624,16 +624,7 @@ static int gdb_handle_vcont(const char *p)
     GDBProcess *process;
     CPUState *cpu;
     GDBThreadIdKind kind;
-#ifdef CONFIG_USER_ONLY
-    int max_cpus = 1; /* global variable max_cpus exists only in system mode */
-
-    CPU_FOREACH(cpu) {
-        max_cpus = max_cpus <= cpu->cpu_index ? cpu->cpu_index + 1 : max_cpus;
-    }
-#else
-    MachineState *ms = MACHINE(qdev_get_machine());
-    unsigned int max_cpus = ms->smp.max_cpus;
-#endif
+    unsigned int max_cpus = gdb_get_max_cpus();
     /* uninitialised CPUs stay 0 */
     newstates = g_new0(char, max_cpus);
 
diff --git a/gdbstub/softmmu.c b/gdbstub/softmmu.c
index ab2d182654..3a5587d387 100644
--- a/gdbstub/softmmu.c
+++ b/gdbstub/softmmu.c
@@ -440,6 +440,15 @@ int gdb_target_memory_rw_debug(CPUState *cpu, hwaddr addr,
     return cpu_memory_rw_debug(cpu, addr, buf, len, is_write);
 }
 
+/*
+ * cpu helpers
+ */
+
+unsigned int gdb_get_max_cpus(void)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+    return ms->smp.max_cpus;
+}
 
 /*
  * Softmmu specific command helpers
diff --git a/gdbstub/user.c b/gdbstub/user.c
index 92663d971c..e10988a62b 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -393,6 +393,23 @@ int gdb_target_memory_rw_debug(CPUState *cpu, hwaddr addr,
     return cpu_memory_rw_debug(cpu, addr, buf, len, is_write);
 }
 
+/*
+ * cpu helpers
+ */
+
+unsigned int gdb_get_max_cpus(void)
+{
+    CPUState *cpu;
+    unsigned int max_cpus = 1;
+
+    CPU_FOREACH(cpu) {
+        max_cpus = max_cpus <= cpu->cpu_index ? cpu->cpu_index + 1 : max_cpus;
+    }
+
+    return max_cpus;
+}
+
+
 /*
  * Break/Watch point helpers
  */
-- 
2.34.1


