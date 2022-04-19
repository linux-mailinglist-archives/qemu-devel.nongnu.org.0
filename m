Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A58F7506460
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 08:24:19 +0200 (CEST)
Received: from localhost ([::1]:43792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nghHe-00051a-OV
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 02:24:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ngglz-0001AG-2R
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:38 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:36666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ngglu-0004R5-Vj
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:32 -0400
Received: by mail-wr1-x42a.google.com with SMTP id u3so20941560wrg.3
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DPaV3Nf/LakxybSDuUjA/jXWl5Jzg2SwVgqYYAm5Mhg=;
 b=gxjfTTFXyRQRwmUErPZpw/gJ7FOrRt8GXPuXLBtGmaY7YA7jM9LxWSk4nwqnsuO/Ai
 yiPVmpg+56/IqZ3w8FfGljW3ABa3NIcTjoWOILsJ2JhkPKVA3QQ1BnMcTdc1lCVf1RqN
 cgnVRth5uWIUWzQPh4iFoacj0c7SglfThLAqOrVlnipwTC9rXWk9WPNElea28lxRiRQZ
 aD7df2uwAUH9NoDMM9lbGfiW80WKrokl6NZyqWWZmsGOzFOeTGPb1AvpCH3ZOKzk6iQT
 I/Ehq6jjPGaBAXVa1msxBpduNJzelGb0sl2ydTXQeeR6RXY6Jj8KbcKu3F+luA/8AOJO
 tGFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DPaV3Nf/LakxybSDuUjA/jXWl5Jzg2SwVgqYYAm5Mhg=;
 b=zG1dcomLAv4OSygdeSyBN8s1DR+k4USmdHSwlukp7Wvhl16tsFOhZ6Uqk7IFVWyjeb
 FcmgnAQ3ReLHggiQuhtYgUAXNOLC0glR2FLaRVFsviHQqTLPQY8bAO6vI4n5D/l9wkqb
 3DcTW6yKVmmk1Uhm2tQwK95xUm2ZvZVg+Sv5GHZj/vQSQovQrwyul6Bp3VYZlb8iYaFF
 52KxxBEpiW/E9V8ckGBaBpczNYp2btX9ufIM4L8q50ktmra+tV2Pm4AilVAzVjhPwBuW
 W6VCjMNtW/mH+haA/SeUe1y4DGAR3d28EkhfoW5ykS83UqrFdNfLlj0ByYtrPhfyAj52
 v+vQ==
X-Gm-Message-State: AOAM531A3rcH6vcyrMSlpgCDFUF3YCn19Riu2iRatWGJYlSDjW90xopv
 sPG09NOnLLfgTGTV0fPlxCBsyqHEAXUOqw==
X-Google-Smtp-Source: ABdhPJy1bLOgwDlGh4SB0pAPHnjw6aWXPJhPG0jqOJKiOPv0dcWfXKwjkaWVx1wLccz+rFpu6giWaQ==
X-Received: by 2002:a5d:6c66:0:b0:20a:847e:10b9 with SMTP id
 r6-20020a5d6c66000000b0020a847e10b9mr11132563wrz.82.1650347489823; 
 Mon, 18 Apr 2022 22:51:29 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:29 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 25/53] include: move dump_in_progress() to runstate.h
Date: Tue, 19 Apr 2022 07:50:41 +0200
Message-Id: <20220419055109.142788-26-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Along with other state tracking functions. Rename it for consistency.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220323155743.1585078-21-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 dump/dump.c               | 4 ++--
 include/qemu-common.h     | 4 ----
 include/sysemu/runstate.h | 1 +
 monitor/qmp-cmds.c        | 4 ++--
 4 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index f57ed76fa7..5d71c47d06 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -1564,7 +1564,7 @@ static void dump_state_prepare(DumpState *s)
     *s = (DumpState) { .status = DUMP_STATUS_ACTIVE };
 }
 
-bool dump_in_progress(void)
+bool qemu_system_dump_in_progress(void)
 {
     DumpState *state = &dump_state_global;
     return (qatomic_read(&state->status) == DUMP_STATUS_ACTIVE);
@@ -1930,7 +1930,7 @@ void qmp_dump_guest_memory(bool paging, const char *file,
 
     /* if there is a dump in background, we should wait until the dump
      * finished */
-    if (dump_in_progress()) {
+    if (qemu_system_dump_in_progress()) {
         error_setg(errp, "There is a dump in process, please wait.");
         return;
     }
diff --git a/include/qemu-common.h b/include/qemu-common.h
index fdb0b16166..5f53a0e112 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -76,8 +76,4 @@ int parse_debug_env(const char *name, int max, int initial);
 
 void page_size_init(void);
 
-/* returns non-zero if dump is in progress, otherwise zero is
- * returned. */
-bool dump_in_progress(void);
-
 #endif
diff --git a/include/sysemu/runstate.h b/include/sysemu/runstate.h
index a535691573..c3f445dd26 100644
--- a/include/sysemu/runstate.h
+++ b/include/sysemu/runstate.h
@@ -69,6 +69,7 @@ void qemu_system_killed(int signal, pid_t pid);
 void qemu_system_reset(ShutdownCause reason);
 void qemu_system_guest_panicked(GuestPanicInformation *info);
 void qemu_system_guest_crashloaded(GuestPanicInformation *info);
+bool qemu_system_dump_in_progress(void);
 
 #endif
 
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 0b04855ce8..883cf1ca4b 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -85,7 +85,7 @@ void qmp_stop(Error **errp)
 {
     /* if there is a dump in background, we should wait until the dump
      * finished */
-    if (dump_in_progress()) {
+    if (qemu_system_dump_in_progress()) {
         error_setg(errp, "There is a dump in process, please wait.");
         return;
     }
@@ -115,7 +115,7 @@ void qmp_cont(Error **errp)
 
     /* if there is a dump in background, we should wait until the dump
      * finished */
-    if (dump_in_progress()) {
+    if (qemu_system_dump_in_progress()) {
         error_setg(errp, "There is a dump in process, please wait.");
         return;
     }
-- 
2.35.1



