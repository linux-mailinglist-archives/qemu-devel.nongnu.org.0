Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA694CDD24
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 20:08:27 +0100 (CET)
Received: from localhost ([::1]:43662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQDHu-0003tW-NS
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 14:08:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQD9K-0004XY-CU
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 13:59:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQD9I-0000c3-R5
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 13:59:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646420372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dr7TgERg2M+5Wx15veC+gXsvWxwtL5g/gm+1KkXlVBQ=;
 b=Sv+FbrBf1dnqTCj3K57WzApNzdrrh/Vmd8lququeiBOq6mB88ntotYENnaSrKWd5HLqdV/
 FNo7NuBfUCBrqImVmZ6XNjuCrB3r7ys7N4gLE9MugZ1zepYndnuw6sOLCpKYWiwvxPGLTk
 jXWsbzViFsl+d0J1PRPX2kuoil39I3k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-62-xA_oxV19Ofuq9BvH0c-BTA-1; Fri, 04 Mar 2022 13:59:29 -0500
X-MC-Unique: xA_oxV19Ofuq9BvH0c-BTA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 507581006AA5;
 Fri,  4 Mar 2022 18:59:28 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8AB5787B87;
 Fri,  4 Mar 2022 18:58:49 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/8] util: remove use of is_daemonized flag from logging
 code
Date: Fri,  4 Mar 2022 18:56:16 +0000
Message-Id: <20220304185620.3272401-5-berrange@redhat.com>
In-Reply-To: <20220304185620.3272401-1-berrange@redhat.com>
References: <20220304185620.3272401-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 libvir-list@redhat.com, Stefan Weil <sw@weilnetz.de>,
 Hanna Reitz <hreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to decouple knowledge of daemonization from other code. What the
logging code really wants to know is whether it can use stdio or not.
Add an API to let the logging code be informed of this fact explicitly.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 include/qemu/log.h |  1 +
 softmmu/vl.c       |  3 +++
 util/log.c         | 12 +++++++++---
 3 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/include/qemu/log.h b/include/qemu/log.h
index 9b80660207..a35e11a788 100644
--- a/include/qemu/log.h
+++ b/include/qemu/log.h
@@ -147,6 +147,7 @@ typedef struct QEMULogItem {
 
 extern const QEMULogItem qemu_log_items[];
 
+void qemu_log_stdio_disable(void);
 void qemu_set_log(int log_flags);
 void qemu_log_needs_buffers(void);
 void qemu_set_log_filename(const char *filename, Error **errp);
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 1fe028800f..f6f33e15e4 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3664,6 +3664,9 @@ void qemu_init(int argc, char **argv, char **envp)
                     error_report("Option not supported in this build");
                     exit(1);
                 }
+                if (is_daemonized()) {
+                    qemu_log_stdio_disable();
+                }
             }
         }
     }
diff --git a/util/log.c b/util/log.c
index 2ee1500bee..a123622ee3 100644
--- a/util/log.c
+++ b/util/log.c
@@ -33,6 +33,12 @@ QemuLogFile *qemu_logfile;
 int qemu_loglevel;
 static int log_append = 0;
 static GArray *debug_regions;
+static bool stdio_disabled;
+
+void qemu_log_stdio_disable(void)
+{
+    stdio_disabled = true;
+}
 
 /* Return the number of characters emitted.  */
 int qemu_log(const char *fmt, ...)
@@ -92,7 +98,7 @@ void qemu_set_log(int log_flags)
      *   If we are daemonized,
      *     we will only log if there is a logfilename.
      */
-    if (qemu_loglevel && (!is_daemonized() || logfilename)) {
+    if (qemu_loglevel && (!stdio_disabled || logfilename)) {
         need_to_open_file = true;
     }
     QEMU_LOCK_GUARD(&qemu_logfile_mutex);
@@ -110,7 +116,7 @@ void qemu_set_log(int log_flags)
                 _exit(1);
             }
             /* In case we are a daemon redirect stderr to logfile */
-            if (is_daemonized()) {
+            if (stdio_disabled) {
                 dup2(fileno(logfile->fd), STDERR_FILENO);
                 fclose(logfile->fd);
                 /* This will skip closing logfile in qemu_log_close() */
@@ -118,7 +124,7 @@ void qemu_set_log(int log_flags)
             }
         } else {
             /* Default to stderr if no log file specified */
-            assert(!is_daemonized());
+            assert(!stdio_disabled);
             logfile->fd = stderr;
         }
         /* must avoid mmap() usage of glibc by setting a buffer "by hand" */
-- 
2.34.1


