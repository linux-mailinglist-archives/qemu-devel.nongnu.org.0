Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2838F6A862A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:20:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXlfE-0006JC-MZ; Thu, 02 Mar 2023 11:20:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXlf8-0005x2-3k
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:20:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXlf6-0001Ny-Dl
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:20:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677774007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AXsmp13+L/pl0ri4cE1J2JNq9k9keXfcyCbDzLs9IX4=;
 b=UASOzErblZbZDTMxC3RlXxfsynL57cbWTHzjX30O05rHHRKwbOgEgEZunxobayprwmMlSB
 fjzKjEs9AvtaWMamqjIlfaK8MAcI3K1BFKb3rZpxskzQkYPu0oozyP2d4LqD+b9731Ld7s
 aNoLJn/mbUc3qBcib0oxOZfy+0U8KgM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-292-65V_3RmWP-y6NH5YLKUbnA-1; Thu, 02 Mar 2023 11:20:04 -0500
X-MC-Unique: 65V_3RmWP-y6NH5YLKUbnA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C90E8021BB;
 Thu,  2 Mar 2023 16:20:04 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 723D1400D79D;
 Thu,  2 Mar 2023 16:20:03 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "John Berberian, Jr" <jeb.study@gmail.com>
Subject: [PULL 2/2] Fix exec migration on Windows (w32+w64).
Date: Thu,  2 Mar 2023 17:19:59 +0100
Message-Id: <20230302161959.9844-3-quintela@redhat.com>
In-Reply-To: <20230302161959.9844-1-quintela@redhat.com>
References: <20230302161959.9844-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: "John Berberian, Jr" <jeb.study@gmail.com>

* Use cmd instead of /bin/sh on Windows.

* Try to auto-detect cmd.exe's path, but default to a hard-coded path.

Note that this will require that gspawn-win[32|64]-helper.exe and
gspawn-win[32|64]-helper-console.exe are included in the Windows binary
distributions (cc: Stefan Weil).

Signed-off-by: "John Berberian, Jr" <jeb.study@gmail.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
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
2.39.2


