Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD636A8F8B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 04:01:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXvco-0007Va-MH; Thu, 02 Mar 2023 21:58:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXvcn-0007VB-0x
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:58:25 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXvcl-0001r7-8m
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:58:24 -0500
Received: by mail-pl1-x62d.google.com with SMTP id h8so1315993plf.10
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 18:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677812302;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IZ1Q69yObMWzKVjZpAHDz6uWngdi7nRVdbETM5dlXlg=;
 b=xo0UXvk1TGZ1HfUuDaj07iZE2n10h20QkBB1xcTnOwUvjTcn1L+eavlpIIMeh8/0fx
 e6Kybe/IJluDRHGee0fDAdRkvj4uZVx074uZcyRgfNJytG0Qsoh4oxzgZdW4IaBzSC+M
 GrNZVWBOfS9i4YsXnTvWmHL9ajRevmOxTpLtHdfDk1Y82nvaCJZlvZb1HvYxXJzgTdnS
 f6W5lIvaeQXo97Rpx364i7rWU9hplhFux/kfOFp7H8rkUDpL3c9ozn1FxMBYU5Xlmjth
 9Eo7CudXVGZNx1xQrLKv9TNwyf1txnl5LogXrCUSWu0qIBmwulZIvBGmVAgUXBIVT+8n
 qjTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677812302;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IZ1Q69yObMWzKVjZpAHDz6uWngdi7nRVdbETM5dlXlg=;
 b=fIPtwx4gLjM3CTzf0PZslqmKHzT2cHEYDNQ2Ys67OElCzmAX/wTF5AwveglaQx5pPF
 iNKzhUWmk+BjNkzNIiiBcLdsLqPD1FeHY025O9BFUsSwR2Z2bZ8n3k2FpUrKAPCoAlBG
 eUwcnLHA709TqDBYtgtYn6fzVN/7kIEkh2hiEQmbnGrUw9pvxx+M62pMdcmk1eGXK3wf
 GfNlG3zBrcfB9rxGraYOEyu3M+tlwSnjWPZTw7aBIZBHiDgLNujoIWLv/W777Sx+QMiw
 Eumaf0q3RN1hUPBTgTK/3IgFOzsql+/bnQDT8Bd6fj5CIui95LdrOWY16/5z7WnSB0b+
 d+9A==
X-Gm-Message-State: AO0yUKX1WEkx7NCrtP3XUfbyHtmKN3Pz/d8srQmsq5zd7Da9LivSKDQ9
 K6WU8kb47IM8OVotWOwgmvI04ZukRoABWbWsmAo=
X-Google-Smtp-Source: AK7set8BptIQgqjMiTZwwj28w+Cz0x45lf5aD4wvnN7wGhYVhz/rfhx90k97arIQzkt5LosA3+YtRA==
X-Received: by 2002:a17:902:c94f:b0:19e:73df:b0e9 with SMTP id
 i15-20020a170902c94f00b0019e73dfb0e9mr560756pla.21.1677812301696; 
 Thu, 02 Mar 2023 18:58:21 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:f3e6:4626:fbc8:b2ce])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a17090301c400b001992e74d055sm372244plh.12.2023.03.02.18.58.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 18:58:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4.5 17/29] gdbstub: specialise stub_can_reverse
Date: Thu,  2 Mar 2023 18:57:53 -0800
Message-Id: <20230303025805.625589-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303025805.625589-1-richard.henderson@linaro.org>
References: <20230303025805.625589-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

Currently we only support replay for softmmu mode so it is a constant
false for user-mode.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Message-Id: <20230302190846.2593720-18-alex.bennee@linaro.org>
---
 gdbstub/internals.h |  1 +
 gdbstub/gdbstub.c   | 13 ++-----------
 gdbstub/softmmu.c   |  5 +++++
 gdbstub/user.c      |  5 +++++
 4 files changed, 13 insertions(+), 11 deletions(-)

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
2.34.1


