Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E4366B545
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 02:35:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHEOQ-00051h-LE; Sun, 15 Jan 2023 20:34:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jeb.study@gmail.com>)
 id 1pHEOP-0004zx-1m
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 20:34:33 -0500
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jeb.study@gmail.com>)
 id 1pHEON-0004sC-Ck
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 20:34:32 -0500
Received: by mail-qt1-x836.google.com with SMTP id j9so868033qtv.4
 for <qemu-devel@nongnu.org>; Sun, 15 Jan 2023 17:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bmrl0RcXegZ8dMoKtGhJzHUKGKhWYds+ObkOemeHZW0=;
 b=D146YIF9b2+094TEAXCcpEKzSQKOpBih5iMn9lIwarjnCoGFWHrROqRQGuezLTziYo
 Bte0gS2IJI1JxnPvkcAB44EJUU3PIyIh8U6k6RjOncahcUmJKBNS+i94lduDh4flGl4y
 e0Pfvgtg3P8Xpa7Cj3zQqajhuo9vkL6DJUUelkkP8y+zNWmvm4vBbUeS+BRBHuJTY2S8
 hVzUnako6tV5KIa+8dRCKLNDtk5BNRwIXUooiX4mjAeJZHkuAkKC5q+MilU9Ig5nK9NX
 VS7xXwW5Bd3EiWKIZZkULXbfL3oh4OchewJ8DGVHKMtYRZCtGw4ZUdmyyq55PS4ZQONO
 EjZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bmrl0RcXegZ8dMoKtGhJzHUKGKhWYds+ObkOemeHZW0=;
 b=QlL1vGo3SsRWAH+Coqzieep+Q3zaW2LxfKc7hOVQBa9tE01WSDoVx/0gzGJuNmohOb
 IrL1UpYxzYXfyknFEeAnTrPNwH2j6oCI8FEOtlYCOIuq/dyG8OistTLvzDN3NdfTj7dp
 8iO6AwEzIzxFTWCj7d8o+dWwD1JTzvJS7+1egy/6P3RMXjYu1YJiDfiCcCbDCaODNbrH
 nH6RKtIfhTVtQ4/VFlUdvbHo/TlJMBxFx0o4y7QPO/KbzSJfPThzNnmpx3Zhf2KQaCwH
 uo0Apztn8GVmSvrjRthgeh8wHzSAWKl58aqmY1k8/J3FwMXyxW85l08xVOpO8RdlxwDr
 aGww==
X-Gm-Message-State: AFqh2kqvYB99lOH3KTF/sok2ba3bWY4316+foPDiY006dSSsCvMy9Vzc
 9k7hjLBit4JL+HDKGY6DzsuxCxscYSqMdQ==
X-Google-Smtp-Source: AMrXdXt7/P59M59OaHAg8LByrM3QQqIS2F8XOc+XEP22I2MHy6zgttq8vAPRC6gga9Cj2mgde+8L5w==
X-Received: by 2002:ac8:1103:0:b0:3a8:15d2:6e8f with SMTP id
 c3-20020ac81103000000b003a815d26e8fmr104806304qtj.44.1673832870066; 
 Sun, 15 Jan 2023 17:34:30 -0800 (PST)
Received: from debian-vmhost.local ([199.111.213.15])
 by smtp.gmail.com with ESMTPSA id
 x8-20020ac81208000000b003999d25e772sm13887937qti.71.2023.01.15.17.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 17:34:29 -0800 (PST)
From: "John Berberian, Jr" <jeb.study@gmail.com>
To: qemu-devel@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>, "John Berberian, Jr" <jeb.study@gmail.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH v2] Fix exec migration on Windows (w32+w64).
Date: Sun, 15 Jan 2023 20:34:21 -0500
Message-Id: <20230116013421.3149183-1-jeb.study@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=jeb.study@gmail.com; helo=mail-qt1-x836.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

* Use cmd instead of /bin/sh on Windows.

* Try to auto-detect cmd.exe's path, but default to a hard-coded path.

Note that this will require that gspawn-win[32|64]-helper.exe and
gspawn-win[32|64]-helper-console.exe are included in the Windows binary
distributions (cc: Stefan Weil).

Signed-off-by: "John Berberian, Jr" <jeb.study@gmail.com>
---
Whoops, forgot a header. Here's a revised patch.

 migration/exec.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/migration/exec.c b/migration/exec.c
index 375d2e1b54..38604d73a6 100644
--- a/migration/exec.c
+++ b/migration/exec.c
@@ -23,12 +23,31 @@
 #include "migration.h"
 #include "io/channel-command.h"
 #include "trace.h"
+#include "qemu/cutils.h"
 
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
@@ -55,7 +74,12 @@ static gboolean exec_accept_incoming_migration(QIOChannel *ioc,
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


