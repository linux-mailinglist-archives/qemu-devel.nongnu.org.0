Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 900E3650C6E
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 14:07:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Fn3-0004dp-P2; Mon, 19 Dec 2022 08:02:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p7Fml-0004Uz-6O
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 08:02:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p7Fmh-0007Cf-6P
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 08:02:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671454941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wzWaSBpVzZ+UszDBN2auCYULSVVrv+uDnPPKe4kNt7I=;
 b=h1QUlsIbLE0vO9pmYOT2AoHC00vM7EtN9pKbtPjBNOCpTM/ys4QyYM6WbGAMEOm9EY2NH+
 4eKLsYrNC/HTmhBhTwuGjJfXl5ffJoi3py05YvUCKFBwSnbOV1ZkyK7ndNPg9IKMNpc27p
 sbd5K1xf7tNlPqa0zP8aMsfsYGC+aqs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-70-mFdMVFyuMJy-tJT1BG9NhQ-1; Mon, 19 Dec 2022 08:02:16 -0500
X-MC-Unique: mFdMVFyuMJy-tJT1BG9NhQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10B1F887434;
 Mon, 19 Dec 2022 13:02:09 +0000 (UTC)
Received: from virtlab420.virt.lab.eng.bos.redhat.com
 (virtlab420.virt.lab.eng.bos.redhat.com [10.19.152.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6669D14171B6;
 Mon, 19 Dec 2022 13:02:08 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-ppc@nongnu.org,
 xen-devel@lists.xenproject.org, Laurent Vivier <lvivier@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, virtio-fs@redhat.com,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Paul Durrant <paul@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Greg Kurz <groug@kaod.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 3/6] tools/virtiofsd: add G_GNUC_PRINTF for logging functions
Date: Mon, 19 Dec 2022 08:02:02 -0500
Message-Id: <20221219130205.687815-4-berrange@redhat.com>
In-Reply-To: <20221219130205.687815-1-berrange@redhat.com>
References: <20221219130205.687815-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tools/virtiofsd/fuse_log.c       | 1 +
 tools/virtiofsd/fuse_log.h       | 6 ++++--
 tools/virtiofsd/passthrough_ll.c | 1 +
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/tools/virtiofsd/fuse_log.c b/tools/virtiofsd/fuse_log.c
index 745d88cd2a..2de3f48ee7 100644
--- a/tools/virtiofsd/fuse_log.c
+++ b/tools/virtiofsd/fuse_log.c
@@ -12,6 +12,7 @@
 #include "fuse_log.h"
 
 
+G_GNUC_PRINTF(2, 0)
 static void default_log_func(__attribute__((unused)) enum fuse_log_level level,
                              const char *fmt, va_list ap)
 {
diff --git a/tools/virtiofsd/fuse_log.h b/tools/virtiofsd/fuse_log.h
index 8d7091bd4d..e5c2967ab9 100644
--- a/tools/virtiofsd/fuse_log.h
+++ b/tools/virtiofsd/fuse_log.h
@@ -45,7 +45,8 @@ enum fuse_log_level {
  * @param ap format string arguments
  */
 typedef void (*fuse_log_func_t)(enum fuse_log_level level, const char *fmt,
-                                va_list ap);
+                                va_list ap)
+    G_GNUC_PRINTF(2, 0);
 
 /**
  * Install a custom log handler function.
@@ -68,6 +69,7 @@ void fuse_set_log_func(fuse_log_func_t func);
  * @param level severity level (FUSE_LOG_ERR, FUSE_LOG_DEBUG, etc)
  * @param fmt sprintf-style format string including newline
  */
-void fuse_log(enum fuse_log_level level, const char *fmt, ...);
+void fuse_log(enum fuse_log_level level, const char *fmt, ...)
+    G_GNUC_PRINTF(2, 3);
 
 #endif /* FUSE_LOG_H_ */
diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 20f0f41f99..40ea2ed27f 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -4182,6 +4182,7 @@ static void setup_nofile_rlimit(unsigned long rlimit_nofile)
     }
 }
 
+G_GNUC_PRINTF(2, 0)
 static void log_func(enum fuse_log_level level, const char *fmt, va_list ap)
 {
     g_autofree char *localfmt = NULL;
-- 
2.38.1


