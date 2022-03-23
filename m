Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B72F4E568D
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 17:33:36 +0100 (CET)
Received: from localhost ([::1]:60972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX3vT-0008Qw-6l
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 12:33:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nX3QC-0005vW-J2
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 12:01:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nX3Q9-0005Xt-50
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 12:01:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648051272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A+ayduay7JRuzW94gwHdU2UbSxzSU6pNHOPX7LtVeV0=;
 b=hO0DnNILow/BtiUvd/L5TMXdmJfgDopSo5tXvDm8q1nKIpE2U9i9h6AqZVagUPRli7ciYH
 A1hDCFkDYbaRDkmguWGCPNg3Pb9FUMAtp2MLccVtGUvd1+eH6MY+A95jcLkTr/Nvqlidb7
 QmGdHmiGwufaT/Zw1QQRM+G5PP8aZqw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-iEtANM1BOc6St1qcylqeug-1; Wed, 23 Mar 2022 12:01:09 -0400
X-MC-Unique: iEtANM1BOc6St1qcylqeug-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EAD1883395E;
 Wed, 23 Mar 2022 16:01:08 +0000 (UTC)
Received: from localhost (unknown [10.39.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB518C26E80;
 Wed, 23 Mar 2022 16:01:07 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 24/32] include: move progress API to qemu-progress.h
Date: Wed, 23 Mar 2022 19:57:35 +0400
Message-Id: <20220323155743.1585078-25-marcandre.lureau@redhat.com>
In-Reply-To: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qemu-common.h        | 4 ----
 include/qemu/qemu-progress.h | 8 ++++++++
 qemu-img.c                   | 1 +
 util/qemu-progress.c         | 2 +-
 4 files changed, 10 insertions(+), 5 deletions(-)
 create mode 100644 include/qemu/qemu-progress.h

diff --git a/include/qemu-common.h b/include/qemu-common.h
index bc73daecb4e9..fee2181af218 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -24,10 +24,6 @@
 int qemu_main(int argc, char **argv, char **envp);
 #endif
 
-
-void qemu_progress_init(int enabled, float min_skip);
-void qemu_progress_end(void);
-void qemu_progress_print(float delta, int max);
 const char *qemu_get_vm_name(void);
 
 /* OS specific functions */
diff --git a/include/qemu/qemu-progress.h b/include/qemu/qemu-progress.h
new file mode 100644
index 000000000000..137e1c316fd0
--- /dev/null
+++ b/include/qemu/qemu-progress.h
@@ -0,0 +1,8 @@
+#ifndef QEMU_PROGRESS_H
+#define QEMU_PROGRESS_H
+
+void qemu_progress_init(int enabled, float min_skip);
+void qemu_progress_end(void);
+void qemu_progress_print(float delta, int max);
+
+#endif /* QEMU_PROGRESS_H */
diff --git a/qemu-img.c b/qemu-img.c
index 1caddfb23a71..13cb2ec72fbd 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -26,6 +26,7 @@
 #include <getopt.h>
 
 #include "qemu-common.h"
+#include "qemu/qemu-progress.h"
 #include "qemu-version.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-block-core.h"
diff --git a/util/qemu-progress.c b/util/qemu-progress.c
index 20d51f8c128b..aa994668f1c4 100644
--- a/util/qemu-progress.c
+++ b/util/qemu-progress.c
@@ -23,7 +23,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
+#include "qemu/qemu-progress.h"
 
 struct progress_state {
     float current;
-- 
2.35.1.273.ge6ebfd0e8cbb


