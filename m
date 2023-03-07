Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5022C6AF7A1
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 22:30:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZesB-0004hd-Jt; Tue, 07 Mar 2023 16:29:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZes9-0004gX-OI
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:29:25 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZes7-0000vG-4T
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:29:25 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 o11-20020a05600c4fcb00b003eb33ea29a8so18072wmq.1
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 13:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678224562;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XLOB2+PFvPgJsQrZslVnHnvebb88TMXYYzglXLeqcS8=;
 b=KmnPUjoznmoBpLpN84K6aHA9TJ1iIGD+inL8IhkPeX4FlTgEPTMNHrVrUuL9Bv0BXu
 Gs3FwENIwX7xIjUFnaKSm3EUfrh/NzGZCHNaOMoRE78vJ9h6KCrSDjFQecK24BRLGPmI
 oAg5gwT2KRk+GmyTSa9AK3JVfQbEzBaCSgsMGGUP1gtqij8jD3PJOkGzk80BASmBDy4q
 SqdiqLxfBE8Rbpcl4oWw0LmjlPPuc9ZRvPk+sXRXFQyzspiwssaSnbIC7LfYtkvL3lPM
 IYk5KhuOjmL7KGBkq6gxdZtFYVbGh+7vh5uZdbZXUd2nyHsUJxZaT+Il4zOzAHWZIk+G
 yEMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678224562;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XLOB2+PFvPgJsQrZslVnHnvebb88TMXYYzglXLeqcS8=;
 b=bLMo0hmkULz/VghulB/r/25G8XnpV6FKpf5bZbeWZYn9/MTvlwRjhk09be8tb2ZV5W
 jOdAJ+gJkJQn4Vh184Cm9Qn40kb0hO6/mmZgmWoBFtj261N7vFeuR9E8BwdoofFUc/iv
 /m5+AubAi8hJXgeDICJy85hwOlDYeyUYSUFJGb8+bGZtjjklfZi48TreRjslYcfmYoJl
 GhXR1R/SUV2QVAntf4c45I34RfrViDY50FfsOkoH73Q6zCuFsrJlgddsBuLziugCR8nn
 d+E64QFR7hLxt/nIBPb2Exii2JrktYW9IPT5muOOPCHyFBEZYqWtvpMiuCPY4iCsCCkg
 hdXw==
X-Gm-Message-State: AO0yUKWzQD0qygBAHRMlYraeYylb8GnX8mp01wbXnKAFB6MWZAMaklFs
 N9beo07QTuYRkj87nx2D/wgmZLZUgiWG15jPRHc=
X-Google-Smtp-Source: AK7set9ufy0kV+R5OI7CzK9plGm0lwNMCoPQD36zyOAityXiEsSS70Gaxv80Ka5lj8oS9ZUCMo1k4A==
X-Received: by 2002:a05:600c:46c6:b0:3e2:1368:e395 with SMTP id
 q6-20020a05600c46c600b003e21368e395mr13965198wmo.33.1678224561758; 
 Tue, 07 Mar 2023 13:29:21 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 q18-20020a5d5752000000b002ce3d3d17e5sm12220587wrw.79.2023.03.07.13.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 13:29:20 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 441421FFC5;
 Tue,  7 Mar 2023 21:21:41 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 16/30] gdbstub: introduce gdb_get_max_cpus
Date: Tue,  7 Mar 2023 21:21:25 +0000
Message-Id: <20230307212139.883112-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307212139.883112-1-alex.bennee@linaro.org>
References: <20230307212139.883112-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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

This is needed for handling vcont packets as the way of calculating
max cpus vhanges between user and softmmu mode.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Message-Id: <20230302190846.2593720-17-alex.bennee@linaro.org>
Message-Id: <20230303025805.625589-17-richard.henderson@linaro.org>

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
2.39.2


