Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0558724DDCF
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 19:23:34 +0200 (CEST)
Received: from localhost ([::1]:56372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k9AlJ-0003nn-3K
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 13:23:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1k9AjF-0000fz-Gb
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 13:21:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1k9AjC-0008Pb-RZ
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 13:21:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598030481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6A4RKJTXZTxGB/kuD2qnGKrmwRYHKnweh7ANeOeMpTk=;
 b=WL2Xba6zRUuosCbNGpgZS5RuBmL8jI8AP1QJNWH2uSBCeZLTlhRZPAeboMbjHfJyCrYyL/
 e84MHz2XEAjiZPRs+DR1hB5cWl3B7wnp49/RR1eh+L7Q8+i75TkfHNpREIJhc0sp2h30mX
 uO/mQI5aRDwNFOXDD1r8GsGbax3EJ28=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-q7prIdohMSm7YlhREj8jtA-1; Fri, 21 Aug 2020 13:21:17 -0400
X-MC-Unique: q7prIdohMSm7YlhREj8jtA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A47B873155;
 Fri, 21 Aug 2020 17:21:16 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.36.110.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5169260CD0;
 Fri, 21 Aug 2020 17:21:14 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/6] util: add Error object for qemu_open_internal error
 reporting
Date: Fri, 21 Aug 2020 18:21:02 +0100
Message-Id: <20200821172105.608752-4-berrange@redhat.com>
In-Reply-To: <20200821172105.608752-1-berrange@redhat.com>
References: <20200821172105.608752-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/21 02:43:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of relying on the limited information from errno, we can now
also provide detailed error messages.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 util/osdep.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/util/osdep.c b/util/osdep.c
index 9ff92551e7..9c7118d3cb 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -284,7 +284,7 @@ int qemu_lock_fd_test(int fd, int64_t start, int64_t len, bool exclusive)
  * Opens a file with FD_CLOEXEC set
  */
 static int
-qemu_open_internal(const char *name, int flags, mode_t mode)
+qemu_open_internal(const char *name, int flags, mode_t mode, Error **errp)
 {
     int ret;
 
@@ -298,24 +298,31 @@ qemu_open_internal(const char *name, int flags, mode_t mode)
 
         fdset_id = qemu_parse_fdset(fdset_id_str);
         if (fdset_id == -1) {
+            error_setg(errp, "Could not parse fdset %s", name);
             errno = EINVAL;
             return -1;
         }
 
         fd = monitor_fdset_get_fd(fdset_id, flags);
         if (fd < 0) {
+            error_setg_errno(errp, -fd, "Could not acquire FD for %s flags %x",
+                             name, flags);
             errno = -fd;
             return -1;
         }
 
         dupfd = qemu_dup_flags(fd, flags);
         if (dupfd == -1) {
+            error_setg_errno(errp, errno, "Could not dup FD for %s flags %x",
+                             name, flags);
             return -1;
         }
 
         ret = monitor_fdset_dup_fd_add(fdset_id, dupfd);
         if (ret == -1) {
             close(dupfd);
+            error_setg(errp, "Could not save FD for %s flags %x",
+                       name, flags);
             errno = EINVAL;
             return -1;
         }
@@ -336,6 +343,16 @@ qemu_open_internal(const char *name, int flags, mode_t mode)
     }
 #endif /* ! O_CLOEXEC */
 
+    if (ret == -1) {
+        const char *action = "open";
+        if (flags & O_CREAT) {
+            action = "create";
+        }
+        error_setg_errno(errp, errno, "Could not %s '%s' flags 0x%x",
+                         action, name, flags);
+    }
+
+
     return ret;
 }
 
@@ -352,7 +369,7 @@ int qemu_open_old(const char *name, int flags, ...)
     }
     va_end(ap);
 
-    ret = qemu_open_internal(name, flags, mode);
+    ret = qemu_open_internal(name, flags, mode, NULL);
 
 #ifdef O_DIRECT
     if (ret == -1 && errno == EINVAL && (flags & O_DIRECT)) {
-- 
2.26.2


