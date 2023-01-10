Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A1D664BD4
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 20:00:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFIiH-000760-Lv; Tue, 10 Jan 2023 12:47:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFIiE-00072N-8v
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:47:02 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFIiC-0003aS-JM
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:47:01 -0500
Received: by mail-wr1-x42a.google.com with SMTP id bs20so12610928wrb.3
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 09:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SFp5fLykrTmSrzOYijtFAOoQNLwJRutVy2bxJGeiOow=;
 b=qgXIUn96/XpkFKbF8mC+27Idw4WpE34vO5zxCuMhIeV18k0x8CLEXePY1w1j2j+GqN
 hmC63EGoL18CFoOdXuvBSzQ10uGedVmMbY/Wrg+shxs8T6IFtAekZgFhh5v27UxkEJNB
 S8pdE+5lQj3NkPlLNo/VehZGJEIMW8IoczmbKGXDWBaue6PPuUWjlhajkNL47eXqgxF4
 no1dRRFGyf+sf5Fu+scLzGq7KOnLh7GTG7wvsH2ABxbRzf0GCoBxa2TUBTdY8LUirGwM
 3vAIBv4w8tzbM1LUd+CTJuYa5oFITtkcoZJ/wc68Meq9iOgjGCmuxylyGzZND8yJXyxh
 Q1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SFp5fLykrTmSrzOYijtFAOoQNLwJRutVy2bxJGeiOow=;
 b=QF5hMmfTr0Vly3WpI4swrd4cQ/7TZcJPQbzOnpydEAkVh/GM3DA8ATEAmVPeKbO0m2
 dshHFkbMjxtyPhYVY4yl10rPO7q3UzPXKC3K79OI/7naIXkuwV5z1BXEDgdh2Dhm2RLo
 6iWgt0SCqSkIrgzY3T+W72rnVd62+NIOV5/H7QQNMejCq0Q2YncZJl9IMsAuuLEtXEag
 kRhBsaZgiVMW5ZUNaUHlbm8Dg7nVtU0//2VlVhm1LvFHe1mNgExB6zEajRRNr5E0aOwt
 D4EZyfY1AYaQb2Z3E+s9IWiHnBc0suUDyDEDvyJU0sxi4KOlM9fboX98ulrQGn4CgJcq
 +8Eg==
X-Gm-Message-State: AFqh2kpOxHNfI8fyzbZjg0Xx+EImYMIqP62Je/qRfxsda2i/0CEfq9sS
 Cm4mqPAiB4McmDMEfKqp9iYudg==
X-Google-Smtp-Source: AMrXdXt3NRKz70KxP+igSuUAb24Sj9c3fykq1hASH9Zy4YpYvCnqAHbOfMJKcI5CmOUWTiBv4m0awg==
X-Received: by 2002:a5d:6145:0:b0:2bb:6b92:d4cc with SMTP id
 y5-20020a5d6145000000b002bb6b92d4ccmr8176826wrt.53.1673372818709; 
 Tue, 10 Jan 2023 09:46:58 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a5d6402000000b00297dcfdc90fsm11713916wru.24.2023.01.10.09.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 09:46:58 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 249D91FFCF;
 Tue, 10 Jan 2023 17:39:26 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Beraldo Leal <bleal@redhat.com>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Ed Maste <emaste@freebsd.org>, Yanan Wang <wangyanan55@huawei.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 John G Johnson <john.g.johnson@oracle.com>, Emilio Cota <cota@braap.org>
Subject: [PATCH 26/26] cpu-exec: assert that plugin_mem_cbs is NULL after
 execution
Date: Tue, 10 Jan 2023 17:39:22 +0000
Message-Id: <20230110173922.265055-27-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230110173922.265055-1-alex.bennee@linaro.org>
References: <20230110173922.265055-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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

From: Emilio Cota <cota@braap.org>

Fixes: #1381

Signed-off-by: Emilio Cota <cota@braap.org>
Message-Id: <20230108165107.62488-1-cota@braap.org>
[AJB: manually applied follow-up fix]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/qemu/plugin.h | 4 ++++
 accel/tcg/cpu-exec.c  | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
index e0ebedef84..fb338ba576 100644
--- a/include/qemu/plugin.h
+++ b/include/qemu/plugin.h
@@ -59,6 +59,8 @@ get_plugin_meminfo_rw(qemu_plugin_meminfo_t i)
 #ifdef CONFIG_PLUGIN
 extern QemuOptsList qemu_plugin_opts;
 
+#define QEMU_PLUGIN_ASSERT(cond) g_assert(cond)
+
 static inline void qemu_plugin_add_opts(void)
 {
     qemu_add_opts(&qemu_plugin_opts);
@@ -250,6 +252,8 @@ void qemu_plugin_user_postfork(bool is_child);
 
 #else /* !CONFIG_PLUGIN */
 
+#define QEMU_PLUGIN_ASSERT(cond)
+
 static inline void qemu_plugin_add_opts(void)
 { }
 
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 6bd29227f3..f272504611 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -504,6 +504,7 @@ static void cpu_exec_exit(CPUState *cpu)
     if (cc->tcg_ops->cpu_exec_exit) {
         cc->tcg_ops->cpu_exec_exit(cpu);
     }
+    QEMU_PLUGIN_ASSERT(cpu->plugin_mem_cbs == NULL);
 }
 
 void cpu_exec_step_atomic(CPUState *cpu)
@@ -1031,6 +1032,7 @@ int cpu_exec(CPUState *cpu)
 
             cpu_loop_exec_tb(cpu, tb, pc, &last_tb, &tb_exit);
 
+            QEMU_PLUGIN_ASSERT(cpu->plugin_mem_cbs == NULL);
             /* Try to align the host and virtual clocks
                if the guest is in advance */
             align_clocks(&sc, cpu);
-- 
2.34.1


