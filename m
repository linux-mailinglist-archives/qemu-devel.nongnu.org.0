Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB8566B4B3
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 00:05:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHC3F-0002zW-Kl; Sun, 15 Jan 2023 18:04:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jeb.study@gmail.com>)
 id 1pHBEP-0002v9-IG
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 17:12:02 -0500
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jeb.study@gmail.com>)
 id 1pHBEN-00016R-Un
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 17:12:01 -0500
Received: by mail-qv1-xf31.google.com with SMTP id qb7so18572770qvb.5
 for <qemu-devel@nongnu.org>; Sun, 15 Jan 2023 14:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Oe8DiqX11uSsWGagYZMSO3WxdK6H6MVE3dQfJDVGkZo=;
 b=HRxQuijvpD/nZJ5YnzftFx8pUVha49arzIpPoOZDN1wjnfr9X99MMcm4EZ4n64XcCl
 7mTfx1ftf9r4Bl17H4FO42jdS2iQ/aKVt8gPdahzSUuS9GHE+/xh8xck5dSLaEyFuM+z
 TrsidWRwqN/d0Zk0E2EG35CAIi2htrHAwGhLxtsp+WKUkKMr/4vv67kSlCMO3WrEZbTb
 K4kcBWRjsXBo1uNwv6rnjUGlmJ6U+0PpTxjUxYuBhaT453rVKaj66VMpBAVOq+kgaDoZ
 IyFX2nytn9EB+SBfW9CuvIJw0GwHBqNZo7KifgLcryuCDRu+tHbHsLNmFt3A62NFJ0/u
 mkDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Oe8DiqX11uSsWGagYZMSO3WxdK6H6MVE3dQfJDVGkZo=;
 b=zY63qDQlP0ng1fVgDbZKnWmQxGIoAtzufqfHOO+VDPP2z7nGcshMGI393XPQiZnL7l
 xk7C0XVWfsue/209la6ws1VRTijg9HJbQzUpuwz7/WadZ7trBdpXEhokVBJsCGidppaV
 hQhFvDnm0m2yw5qtGnDrp/LEJ+R60/SPsDz/2pbRLJiVCuqzhaZC6BrMnx+xHiafCmWA
 PxpebvLLRlmYx4K9LYsMPo6sTpI3+zLJWavc5YGMicIu9RRqR5gWdlqnR+RRPlbjxrYk
 zvd7wcgVt43jC2zjUz8Kck1N0qBs5vIDhl0LZ92GGur1YXMdQCDf9AzVenYOVQUlqwSb
 w0SA==
X-Gm-Message-State: AFqh2kruAUBtQaPZegwUSQeb4bICJUGDRquAu8BI6MHSugcpcV0Bk8P2
 oPXej2a1LWjLxznjPjucGZO4Pwhiv31Wtw==
X-Google-Smtp-Source: AMrXdXvxMBaM7J7HhOz4hSlcmvf40XknfoE4BzOGY4YIkjYp+itKQy6ndBtdptTm2FJUvXG6X0EflQ==
X-Received: by 2002:a0c:e98c:0:b0:534:dfcc:f423 with SMTP id
 z12-20020a0ce98c000000b00534dfccf423mr6716616qvn.48.1673820717888; 
 Sun, 15 Jan 2023 14:11:57 -0800 (PST)
Received: from debian-vmhost.local ([199.111.213.15])
 by smtp.gmail.com with ESMTPSA id
 k2-20020a05620a414200b006faaf6dc55asm17161883qko.22.2023.01.15.14.11.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 14:11:57 -0800 (PST)
From: "John Berberian, Jr" <jeb.study@gmail.com>
To: qemu-devel@nongnu.org
Cc: "John Berberian, Jr" <jeb.study@gmail.com>, Stefan Weil <sw@weilnetz.de>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH] Fix exec migration on Windows (w32+w64).
Date: Sun, 15 Jan 2023 17:11:56 -0500
Message-Id: <20230115221156.3113483-1-jeb.study@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=jeb.study@gmail.com; helo=mail-qv1-xf31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 15 Jan 2023 18:04:31 -0500
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

* Use cmd instead of /bin/sh on Windows.

* Try to auto-detect cmd.exe's path, but default to a hard-coded path.

Note that this will require that gspawn-win32-helper.exe and
gspawn-win32-helper-console.exe are included in the Windows binary
distributions (cc: Stefan Weil).

Signed-off-by: John Berberian, Jr <jeb.study@gmail.com>
---
 migration/exec.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/migration/exec.c b/migration/exec.c
index 375d2e1b54..f65e7db7df 100644
--- a/migration/exec.c
+++ b/migration/exec.c
@@ -24,11 +24,29 @@
 #include "io/channel-command.h"
 #include "trace.h"
 
+#ifdef WIN32
+const char *exec_get_cmd_path(void);
+const char *exec_get_cmd_path(void)
+{
+    g_autofree char *detected_path = g_new(char, MAX_PATH);
+    if (GetSystemDirectoryA(detected_path, MAX_PATH) == 0) {
+        warn_report("Could not detect cmd.exe path, using default.");
+        return "C:\\Windows\\System32\\cmd.exe";
+    }
+    pstrcat(detected_path, MAX_PATH, "\\cmd.exe");
+    return g_steal_pointer(&detected_path);
+}
+#endif
 
 void exec_start_outgoing_migration(MigrationState *s, const char *command, Error **errp)
 {
     QIOChannel *ioc;
+
+#ifdef WIN32
+    const char *argv[] = { exec_get_cmd_path(), "/c", command, NULL };
+#else
     const char *argv[] = { "/bin/sh", "-c", command, NULL };
+#endif
 
     trace_migration_exec_outgoing(command);
     ioc = QIO_CHANNEL(qio_channel_command_new_spawn(argv,
@@ -55,7 +73,12 @@ static gboolean exec_accept_incoming_migration(QIOChannel *ioc,
 void exec_start_incoming_migration(const char *command, Error **errp)
 {
     QIOChannel *ioc;
+
+#ifdef WIN32
+    const char *argv[] = { exec_get_cmd_path(), "/c", command, NULL };
+#else
     const char *argv[] = { "/bin/sh", "-c", command, NULL };
+#endif
 
     trace_migration_exec_incoming(command);
     ioc = QIO_CHANNEL(qio_channel_command_new_spawn(argv,
-- 
2.39.0


