Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C98532817
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 12:48:03 +0200 (CEST)
Received: from localhost ([::1]:42278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntS53-0007n2-SU
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 06:48:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ntRtL-0007jl-SY
 for qemu-devel@nongnu.org; Tue, 24 May 2022 06:35:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ntRsm-0007T4-GQ
 for qemu-devel@nongnu.org; Tue, 24 May 2022 06:35:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653388503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8PMK+Ot0EBLTq+zPmfnKNrxoxJrcm8rQ6jKsCqYb15U=;
 b=OdW0B0JDwluNn4ENToBnVuMV5GUWEfFgCnsKrvqM/VCqJd23Vqq6uilS2SIVy0B7Qi/B0E
 rLkZt7OTW+fFr70x8TCIPTFlfoTsEiRb920bvr4Albwsr3EvjYM0uZ1vTh6kWYqPNvpEU/
 r8d2eg4A5ksVkQqaFwAjpe0UFE1+mhU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-rUpyouvOMVa2vGHmBxoV4Q-1; Tue, 24 May 2022 06:35:01 -0400
X-MC-Unique: rUpyouvOMVa2vGHmBxoV4Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 873C0801E80;
 Tue, 24 May 2022 10:35:01 +0000 (UTC)
Received: from localhost (unknown [10.39.192.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E3631410DD7;
 Tue, 24 May 2022 10:35:01 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v4 06/15] qga: use qga_open_cloexec() for safe_open_or_create()
Date: Tue, 24 May 2022 12:34:44 +0200
Message-Id: <20220524103453.162665-7-marcandre.lureau@redhat.com>
In-Reply-To: <20220524103453.162665-1-marcandre.lureau@redhat.com>
References: <20220524103453.162665-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The function takes care of setting CLOEXEC, and reporting error.

The reported error message will differ, from:
  "failed to open file 'foo' (mode: 'r')"
to:
  "Failed to open file 'foo'"

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 qga/commands-posix.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 8ee149e550..28fe19d932 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -27,6 +27,7 @@
 #include "qemu/cutils.h"
 #include "commands-common.h"
 #include "block/nvme.h"
+#include "cutils.h"
 
 #ifdef HAVE_UTMPX
 #include <utmpx.h>
@@ -339,6 +340,7 @@ find_open_flag(const char *mode_str, Error **errp)
 static FILE *
 safe_open_or_create(const char *path, const char *mode, Error **errp)
 {
+    ERRP_GUARD();
     int oflag;
     int fd = -1;
     FILE *f = NULL;
@@ -370,20 +372,17 @@ safe_open_or_create(const char *path, const char *mode, Error **errp)
      * open() is decisive and its third argument is ignored, and the second
      * open() and the fchmod() are never called.
      */
-    fd = open(path, oflag | ((oflag & O_CREAT) ? O_EXCL : 0), 0);
+    fd = qga_open_cloexec(path, oflag | ((oflag & O_CREAT) ? O_EXCL : 0), 0, errp);
     if (fd == -1 && errno == EEXIST) {
+        error_free(*errp);
+        *errp = NULL;
         oflag &= ~(unsigned)O_CREAT;
-        fd = open(path, oflag);
+        fd = qga_open_cloexec(path, oflag, 0, errp);
     }
     if (fd == -1) {
-        error_setg_errno(errp, errno,
-                         "failed to open file '%s' (mode: '%s')",
-                         path, mode);
         goto end;
     }
 
-    qemu_set_cloexec(fd);
-
     if ((oflag & O_CREAT) && fchmod(fd, DEFAULT_NEW_FILE_MODE) == -1) {
         error_setg_errno(errp, errno, "failed to set permission "
                          "0%03o on new file '%s' (mode: '%s')",
-- 
2.36.1


