Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7C16AF7A7
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 22:31:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZesB-0004hb-6Q; Tue, 07 Mar 2023 16:29:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZes8-0004fh-DX
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:29:24 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZes6-0000v8-LR
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:29:24 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 t25-20020a1c7719000000b003eb052cc5ccso5353wmi.4
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 13:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678224561;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AQeXWxPmgbicvB+LTf6+sZsRCCKyI5yI4jnTigEp1tk=;
 b=zwAZUlVkKcIjMinucHGjYgQL4LITn8KDj/0EwN2G0hNBLEI7MR491Ks40sL+lycsKH
 DX9pCRR3DKvyE0+xrmW+AD75tAm1DP8aqR4pI4NgexFbbhkrohmQAvXKlGtSW44ZK2nl
 nlL7wGEHMhMmeE6TAc95HiGOyPj84OpBuqWP3kcwrIfTPaywCMVber+uCjOq/7jUQPfX
 yfha7P4Q4HpnHCf5LXdRZCa+juaRxst5+CeIJFykQ+YZBkU8X8vo5LUpO9LlC3tvDNTX
 ZbB09ucowz8HK8cINUx/63zJRWud7PTChRkXR07am/bSSdItVOqImsVEILfPrK9jxAm4
 rOQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678224561;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AQeXWxPmgbicvB+LTf6+sZsRCCKyI5yI4jnTigEp1tk=;
 b=H8undOB1a3ubY5nM3uurvBaEfeeYj2wnKQcaTE/ee1z8zb0L6um/zlJc0AW1OqateX
 jvVyOx53mkZk4SGJFenAFYgf7kTjo+9ObyWO75zj1awI+++PFLc4KG5zZwP5PgJKG2id
 h8RKDIZ1vOcXY+6/y3ghTUa2uvM2EuHHWOqATSo/qv0ptQxbaak4NubqYQ0dr+EW66L4
 AV4FlHKtNozadO2qmDYKER4WVAmYjUkNROLnnouVTejXVrv73dWCIxsadqfx7nKXfNh+
 3LSDFa6FKbxxEkNfYflm+gJF9XliPL6pLDHQXvX+vlB/O4f0WPbWuAyeLzw5oa9bc3d/
 7P+g==
X-Gm-Message-State: AO0yUKXN81l2dcmq4X4YnTcGT4jGnlUfefNVS2MmPXosVzM0YWGUFx9A
 eNrZIuQNSwYpRKsaDUpfeGGASA==
X-Google-Smtp-Source: AK7set/5CQds3p4XHPQM7JOQYHIFLHrki2rZnqAHcQHLsRMuZT4ix2p3W2jHMoy2fhXx6MfO9sZDAA==
X-Received: by 2002:a05:600c:19d4:b0:3eb:2b88:7838 with SMTP id
 u20-20020a05600c19d400b003eb2b887838mr14485698wmq.14.1678224560886; 
 Tue, 07 Mar 2023 13:29:20 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a05600c2e4700b003e70a7c1b73sm13519179wmf.16.2023.03.07.13.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 13:29:20 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 602071FFC6;
 Tue,  7 Mar 2023 21:21:41 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 17/30] gdbstub: specialise stub_can_reverse
Date: Tue,  7 Mar 2023 21:21:26 +0000
Message-Id: <20230307212139.883112-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307212139.883112-1-alex.bennee@linaro.org>
References: <20230307212139.883112-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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

Currently we only support replay for softmmu mode so it is a constant
false for user-mode.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Message-Id: <20230302190846.2593720-18-alex.bennee@linaro.org>
Message-Id: <20230303025805.625589-18-richard.henderson@linaro.org>

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index 26a6468a69..be0eef4850 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -130,6 +130,7 @@ CPUState *gdb_first_attached_cpu(void);
 void gdb_append_thread_id(CPUState *cpu, GString *buf);
 int gdb_get_cpu_index(CPUState *cpu);
 unsigned int gdb_get_max_cpus(void); /* both */
+bool gdb_can_reverse(void); /* softmmu, stub for user */
 
 void gdb_create_default_process(GDBState *s);
 
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 1b783100c2..7301466ff5 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -113,15 +113,6 @@ int use_gdb_syscalls(void)
     return gdb_syscall_mode == GDB_SYS_ENABLED;
 }
 
-static bool stub_can_reverse(void)
-{
-#ifdef CONFIG_USER_ONLY
-    return false;
-#else
-    return replay_mode == REPLAY_MODE_PLAY;
-#endif
-}
-
 /* writes 2*len+1 bytes in buf */
 void gdb_memtohex(GString *buf, const uint8_t *mem, int len)
 {
@@ -1308,7 +1299,7 @@ static void handle_step(GArray *params, void *user_ctx)
 
 static void handle_backward(GArray *params, void *user_ctx)
 {
-    if (!stub_can_reverse()) {
+    if (!gdb_can_reverse()) {
         gdb_put_packet("E22");
     }
     if (params->len == 1) {
@@ -1559,7 +1550,7 @@ static void handle_query_supported(GArray *params, void *user_ctx)
         g_string_append(gdbserver_state.str_buf, ";qXfer:features:read+");
     }
 
-    if (stub_can_reverse()) {
+    if (gdb_can_reverse()) {
         g_string_append(gdbserver_state.str_buf,
             ";ReverseStep+;ReverseContinue+");
     }
diff --git a/gdbstub/softmmu.c b/gdbstub/softmmu.c
index 3a5587d387..d2863d0663 100644
--- a/gdbstub/softmmu.c
+++ b/gdbstub/softmmu.c
@@ -450,6 +450,11 @@ unsigned int gdb_get_max_cpus(void)
     return ms->smp.max_cpus;
 }
 
+bool gdb_can_reverse(void)
+{
+    return replay_mode == REPLAY_MODE_PLAY;
+}
+
 /*
  * Softmmu specific command helpers
  */
diff --git a/gdbstub/user.c b/gdbstub/user.c
index e10988a62b..3f6183e66a 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -409,6 +409,11 @@ unsigned int gdb_get_max_cpus(void)
     return max_cpus;
 }
 
+/* replay not supported for user-mode */
+bool gdb_can_reverse(void)
+{
+    return false;
+}
 
 /*
  * Break/Watch point helpers
-- 
2.39.2


