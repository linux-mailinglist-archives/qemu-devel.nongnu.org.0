Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA6125B2BB
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Sep 2020 19:11:01 +0200 (CEST)
Received: from localhost ([::1]:34722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDWHk-0007tl-8g
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 13:11:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kDWGM-0005j2-FA
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 13:09:34 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:41613
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kDWGJ-0001J2-9j
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 13:09:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599066570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yH1xuWvcSuPQwF3fqvmKVLdcmB2cZCQr4VgUC8hgP2k=;
 b=LygADP4++wmwmXa8AlZ64I88HNY19GtETzq4D716mtrJXDqsO3CnNMToAPjVCQUHy49rLT
 HzaVvUdhdx9yQ5AhFauSV6x/e/j2KaFkVXpllKfM+/DLrl7qv2wnNEzQg4OAUgwJ819Rxw
 9eNttXhrPwEuAXRlQ0H06V3ul1IwYC8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-myOb4eC3NEaKmAmIjK0KvA-1; Wed, 02 Sep 2020 13:09:29 -0400
X-MC-Unique: myOb4eC3NEaKmAmIjK0KvA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E6C3100749B;
 Wed,  2 Sep 2020 17:09:28 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.36.110.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B1B019C71;
 Wed,  2 Sep 2020 17:09:20 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 2/8] util: split off a helper for dealing with O_CLOEXEC
 flag
Date: Wed,  2 Sep 2020 18:09:07 +0100
Message-Id: <20200902170913.1785194-3-berrange@redhat.com>
In-Reply-To: <20200902170913.1785194-1-berrange@redhat.com>
References: <20200902170913.1785194-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 03:24:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're going to have multiple callers to open() from qemu_open()
soon. Readability would thus benefit from having a helper for
dealing with O_CLOEXEC.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 util/osdep.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/util/osdep.c b/util/osdep.c
index 3d94b4d732..0d8fa9f016 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -279,6 +279,20 @@ int qemu_lock_fd_test(int fd, int64_t start, int64_t len, bool exclusive)
 }
 #endif
 
+static int qemu_open_cloexec(const char *name, int flags, mode_t mode)
+{
+    int ret;
+#ifdef O_CLOEXEC
+    ret = open(name, flags | O_CLOEXEC, mode);
+#else
+    ret = open(name, flags, mode);
+    if (ret >= 0) {
+        qemu_set_cloexec(ret);
+    }
+#endif
+    return ret;
+}
+
 /*
  * Opens a file with FD_CLOEXEC set
  */
@@ -318,14 +332,7 @@ int qemu_open(const char *name, int flags, ...)
         va_end(ap);
     }
 
-#ifdef O_CLOEXEC
-    ret = open(name, flags | O_CLOEXEC, mode);
-#else
-    ret = open(name, flags, mode);
-    if (ret >= 0) {
-        qemu_set_cloexec(ret);
-    }
-#endif
+    ret = qemu_open_cloexec(name, flags, mode);
 
 #ifdef O_DIRECT
     if (ret == -1 && errno == EINVAL && (flags & O_DIRECT)) {
-- 
2.26.2


