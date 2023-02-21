Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF39E69EAF9
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 00:04:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUbed-0006tQ-5P; Tue, 21 Feb 2023 18:02:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUbeH-0006TD-Rq
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 18:02:14 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUbe7-0006GG-2R
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 18:02:13 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so2220963wmq.2
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 15:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xDMNOIz79tcmby+L8OATHD+W52NLofe0+su2iOTYJEQ=;
 b=HeftGAQqSghpOttwPvyrMfQYbdGYzTnMCZ1uK/uCkUwCmOgDp5RnlIxUJGdTIc+ury
 WDzmEmb7RCyHzTQR1aH09qepYDzyPUPsn9aYSvQAD9nU0zp9N5iurjEzSCPmAxBG9Wna
 xiTERmCOwdvjU8OejZXMdKD3OZegrH1Hm2k0cFS8JMT5CYiYyHp6ietXdr96SlY9tceg
 DdYkHHdQChFvOSe0esS5dFlqGGIIvXISq3msUde97qLlhcfObLMWQ0M6D1moz+K6oEc1
 fapKgti8OMJrYrUMPcXDlI0bdslfBpIKBIIuLJPg7tUaIklxkntIyhk++Hx5MZKgD+2S
 hZvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xDMNOIz79tcmby+L8OATHD+W52NLofe0+su2iOTYJEQ=;
 b=nMoxa3A7uNzAyQ6KaLclb6W9FgXNfAfPlRPQAOHmc/YN1B980ZvppRJol4cq9IpYV2
 5NL1PA+fdtgODpmyLyLhRsGqb8buWGFD5k1Q1GRb9zcNLXPsyfalwQPAnVVZ6rWQiPQs
 afZKNlYBFMiLNa1+CmGKTkmBRRhsFAyMpLvZu/kEy+6o9J2Q0/G+FbZUar4EzLAejzzM
 G9g4l5C2zfaxGy0zGbm+1z2kBRa1ZVi1/+HLZAh2rbpRfd4vfekZRZ+uaaxtlk0XXi+A
 lJy2s1NUbNzgtWp/qtqY8b3wrmXb1+UMmNNHVrSeMT2J9pM3p7qZyswrVsZRonQQ8LPG
 aq4Q==
X-Gm-Message-State: AO0yUKWt/v9h/BsECDGB1f4G5fZUpAAlL6X7RvWxuWYQzwqEmhdagDDQ
 Ti+ZWP8cM1vq+MTmTuFJeXpfrQ==
X-Google-Smtp-Source: AK7set9m00fBCBhDw5omQ+3dwDpKYoDqBBONDVMEX5XwolsBH+tTG+sMRSt/5m9zgoFwO4cKQYgomg==
X-Received: by 2002:a05:600c:164a:b0:3e2:20c7:6556 with SMTP id
 o10-20020a05600c164a00b003e220c76556mr212862wmn.35.1677020519427; 
 Tue, 21 Feb 2023 15:01:59 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 c22-20020a7bc856000000b003e01493b136sm5857812wml.43.2023.02.21.15.01.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 15:01:58 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 862381FFC5;
 Tue, 21 Feb 2023 22:52:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 nicolas.eder@lauterbach.com, Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, mads@ynddal.dk,
 Marek Vasut <marex@denx.de>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Eduardo Habkost <eduardo@habkost.net>, Bin Meng <bin.meng@windriver.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Chris Wulff <crwulff@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Hildenbrand <david@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v3 16/24] gdbstub: specialise stub_can_reverse
Date: Tue, 21 Feb 2023 22:52:19 +0000
Message-Id: <20230221225227.3735319-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221225227.3735319-1-alex.bennee@linaro.org>
References: <20230221225227.3735319-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

---
v3
  - rename gdb_stub_can_revers -> gdb_can_reverse
---
 gdbstub/internals.h |  1 +
 gdbstub/gdbstub.c   | 13 ++-----------
 gdbstub/softmmu.c   |  5 +++++
 gdbstub/user.c      |  5 +++++
 4 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index 90069a9415..5f2e24c4f3 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -128,6 +128,7 @@ CPUState *gdb_first_attached_cpu(void);
 void gdb_append_thread_id(CPUState *cpu, GString *buf);
 int gdb_get_cpu_index(CPUState *cpu);
 unsigned int gdb_get_max_cpus(void); /* both */
+bool gdb_can_reverse(void); /* softmmu, stub for user */
 
 void gdb_create_default_process(GDBState *s);
 
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index f9950200b8..e107aa065c 100644
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
@@ -1307,7 +1298,7 @@ static void handle_step(GArray *params, void *user_ctx)
 
 static void handle_backward(GArray *params, void *user_ctx)
 {
-    if (!stub_can_reverse()) {
+    if (!gdb_can_reverse()) {
         gdb_put_packet("E22");
     }
     if (params->len == 1) {
@@ -1558,7 +1549,7 @@ static void handle_query_supported(GArray *params, void *user_ctx)
         g_string_append(gdbserver_state.str_buf, ";qXfer:features:read+");
     }
 
-    if (stub_can_reverse()) {
+    if (gdb_can_reverse()) {
         g_string_append(gdbserver_state.str_buf,
             ";ReverseStep+;ReverseContinue+");
     }
diff --git a/gdbstub/softmmu.c b/gdbstub/softmmu.c
index 65aa2018a7..5363ff066d 100644
--- a/gdbstub/softmmu.c
+++ b/gdbstub/softmmu.c
@@ -443,6 +443,11 @@ unsigned int gdb_get_max_cpus(void)
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
index 15ff3ab08d..a716ad05b2 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -404,6 +404,11 @@ unsigned int gdb_get_max_cpus(void)
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
2.39.1


