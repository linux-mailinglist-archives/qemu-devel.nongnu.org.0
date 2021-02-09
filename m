Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8106B315241
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 16:00:57 +0100 (CET)
Received: from localhost ([::1]:52402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9UVc-0004mW-F8
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 10:00:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9USu-00037y-8D
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 09:58:08 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:46481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9USq-0007yE-Kd
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 09:58:06 -0500
Received: by mail-wr1-x42c.google.com with SMTP id q7so22206608wre.13
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 06:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uc4RZWI7+w0BT57t4r5+2CJILrnoNbHsZtumHYwvxvk=;
 b=d4NwVLDFqDl3cOqGoIKRMaNeenZ7lcCD/bf5mzbkWIldiLOsWiPTp8AbkGfqgKD5iO
 Imqis0VYbZYHJqrT4BW/VF8ppJ6WsWTgbKIvWp8MRs57iDbwWfxQrBFNj9RXu+YZuRgQ
 Gr1UId/rBgvh6ElvzoR7QqRE1dFJHSNon4JValQdsIbJg1/wE9MD75q89MYm85JCuYBW
 IwCvrMMLoGTImCtHLkK0cDEtSFI1JmAOxe5ulyJ6AC6dYtMcFjo7sMeW1JmWdQE69Xev
 EvwF7A15zfxxlKuo34vwgKXZwFl9Qz70SZ0biZHW2yZrv1Coysk2jcZkfXoEKZngb0Jn
 BHvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uc4RZWI7+w0BT57t4r5+2CJILrnoNbHsZtumHYwvxvk=;
 b=JBZ3rgp62wUm7aFVFUXNYO4EtETpsTQ3koYTTcHldDkVgp2nIozUjvplFdVaYVrB1O
 /5XJpR9bfdr8VuXLnkragBh675qW79uD1YL5Gua8owNrRHgFteTobaO61+oaUPxefp3H
 7wKl9CF4k7g1gy0a33U7E8VUyZKQawlgimpL1sQ08SodnN2MalNgFZZyN21TVEaduajH
 Ku7HgriEDkRfXA9rcIgSa5zyVQERNN85Y4A5MVABewVQc45YH8ohdmn8LvJID1oEEvNr
 pc8Bw9nfB0aQ0g05xDkbL1X5Hr1OIO7uyDHp5FK1DMPAa3WD6kbUYdhwCU3aY5DfsBHb
 fDdw==
X-Gm-Message-State: AOAM5314N/yVqCaSCKveVA7HQNUuSfKX0UR2diwSi8zG5UmyttfsVqWl
 AMGop5eVoIx3PWzpw3BE9NE9OSAhTtB8/w==
X-Google-Smtp-Source: ABdhPJwbZW1wFP/SvinLbgOKsfr0AhAUPrgUzHQAAoo0yYLgFP3WUmGC7r+OuFD3McgjUea7e7R/jQ==
X-Received: by 2002:a5d:6b0a:: with SMTP id v10mr26110680wrw.183.1612882683393; 
 Tue, 09 Feb 2021 06:58:03 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h207sm5304061wme.18.2021.02.09.06.58.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 06:58:02 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] trace: fix "-trace file=..."
Date: Tue,  9 Feb 2021 15:57:58 +0100
Message-Id: <20210209145759.141231-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210209145759.141231-1-pbonzini@redhat.com>
References: <20210209145759.141231-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: armbru@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Because trace_opt_parse always deletes the options it has parsed,
trace_init_file's call to qemu_find_opts_singleton always
creates an empty -trace option group.  Therefore, the subsequent
qemu_opt_get(opts, "file") always returns NULL.

To fix this, save the last "-trace file=..." option in a global
variable and use it later in trace_init_file.

This is similar to what was done before commit 92eecfff32 ("trace:
remove argument from trace_init_file", 2020-11-11), except contained
within trace/control.c and without memory leaks.

Fixes: 92eecfff32 ("trace: remove argument from trace_init_file", 2020-11-11)
Cc: stefanha@redhat.com
Reported-by: armbru@redhat.com
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 trace/control.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/trace/control.c b/trace/control.c
index cd04dd4e0c..4be38e1af2 100644
--- a/trace/control.c
+++ b/trace/control.c
@@ -40,6 +40,7 @@ static size_t nevent_groups;
 static uint32_t next_id;
 static uint32_t next_vcpu_id;
 static bool init_trace_on_startup;
+static char *trace_opts_file;
 
 QemuOptsList qemu_trace_opts = {
     .name = "trace",
@@ -224,10 +225,8 @@ static void trace_init_events(const char *fname)
 
 void trace_init_file(void)
 {
-    QemuOpts *opts = qemu_find_opts_singleton("trace");
-    const char *file = qemu_opt_get(opts, "file");
 #ifdef CONFIG_TRACE_SIMPLE
-    st_set_trace_file(file);
+    st_set_trace_file(trace_opts_file);
     if (init_trace_on_startup) {
         st_set_trace_file_enabled(true);
     }
@@ -238,11 +237,11 @@ void trace_init_file(void)
      * backend. However we should only override -D if we actually have
      * something to override it with.
      */
-    if (file) {
-        qemu_set_log_filename(file, &error_fatal);
+    if (trace_opts_file) {
+        qemu_set_log_filename(trace_opts_file, &error_fatal);
     }
 #else
-    if (file) {
+    if (trace_opts_file) {
         fprintf(stderr, "error: --trace file=...: "
                 "option not supported by the selected tracing backends\n");
         exit(1);
@@ -303,6 +302,8 @@ void trace_opt_parse(const char *optarg)
     }
     trace_init_events(qemu_opt_get(opts, "events"));
     init_trace_on_startup = true;
+    g_free(trace_opts_file);
+    trace_opts_file = g_strdup(qemu_opt_get(opts, "file"));
     qemu_opts_del(opts);
 }
 
-- 
2.29.2



