Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 542FC2123D3
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jul 2020 14:57:51 +0200 (CEST)
Received: from localhost ([::1]:42866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqymk-0007Yd-D4
	for lists+qemu-devel@lfdr.de; Thu, 02 Jul 2020 08:57:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jqylN-00066P-Kb
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 08:56:25 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:21860
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jqylM-0004Uk-70
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 08:56:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593694583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RzCcw/J903H7d+tOkDz+NR6v5DuG2R6mW41FFwjovBM=;
 b=PH8ZZrU2mSOzgh5UjfuLcjKQaUiV6zZe0/HekwfnvwHJXM+8sb+GGwPZLauY1jMNga57ji
 RdP2NIyt5Fyo/pn3qtZIs/I/48VLiiKSGcC8HUX5F95+TP5j8y+jwPTsKHWmEemaRSS6+F
 mv7vVbkWhLZlUCOcrRhhOfCVpriTcm8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-0a3UHkgTOdejo403e1ZbGw-1; Thu, 02 Jul 2020 08:56:19 -0400
X-MC-Unique: 0a3UHkgTOdejo403e1ZbGw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8CB719057A3;
 Thu,  2 Jul 2020 12:56:18 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.36.110.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 12B482B4CA;
 Thu,  2 Jul 2020 12:56:15 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] util: validate whether O_DIRECT is supported after
 failure
Date: Thu,  2 Jul 2020 13:56:10 +0100
Message-Id: <20200702125612.2176194-2-berrange@redhat.com>
In-Reply-To: <20200702125612.2176194-1-berrange@redhat.com>
References: <20200702125612.2176194-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 03:42:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 P J P <ppandit@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently we suggest that a filesystem may not support O_DIRECT after
seeing an EINVAL. Other things can cause EINVAL though, so it is better
to do an explicit check, and then report a definitive error message.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 util/osdep.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/util/osdep.c b/util/osdep.c
index 4829c07ff6..e2b7507ee2 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -332,9 +332,11 @@ int qemu_open(const char *name, int flags, ...)
     }
 
 #ifdef O_CLOEXEC
-    ret = open(name, flags | O_CLOEXEC, mode);
-#else
+    flags |= O_CLOEXEC;
+#endif
     ret = open(name, flags, mode);
+
+#ifndef O_CLOEXEC
     if (ret >= 0) {
         qemu_set_cloexec(ret);
     }
@@ -342,8 +344,13 @@ int qemu_open(const char *name, int flags, ...)
 
 #ifdef O_DIRECT
     if (ret == -1 && errno == EINVAL && (flags & O_DIRECT)) {
-        error_report("file system may not support O_DIRECT");
-        errno = EINVAL; /* in case it was clobbered */
+        int newflags = flags & ~O_DIRECT;
+        ret = open(name, newflags, mode);
+        if (ret != -1) {
+            close(ret);
+            error_report("file system does not support O_DIRECT");
+            errno = EINVAL;
+        }
     }
 #endif /* O_DIRECT */
 
-- 
2.26.2


