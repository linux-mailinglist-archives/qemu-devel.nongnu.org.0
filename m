Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76983508B05
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 16:45:31 +0200 (CEST)
Received: from localhost ([::1]:50200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhBaE-0005Uy-Hz
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 10:45:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhAOR-0000WR-7b
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:29:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhAOP-0004nQ-JY
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:29:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650461352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qDjNUJotEnCRkwof+KAlWlADlw+OLG4urOU2MlfWLiI=;
 b=HPGnQhHMpZZdn6bQ9ktCIbAZivvsnykkla23JDXX7WTJNvrDiPL5fqElbfjeEgouHVWpq/
 1wL3ul+lMKmkCWGNmuGa8C2hVNdeF7CBAN+8X6LCbdnhggJYEoPD0eiALMegPGGnb2hjPZ
 rjWdjgXWORC/uX+V+qEGhTtriNZ75Qc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-442-F-HR3f4iMOuRhmz_u7IETw-1; Wed, 20 Apr 2022 09:29:03 -0400
X-MC-Unique: F-HR3f4iMOuRhmz_u7IETw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3956B803D65;
 Wed, 20 Apr 2022 13:29:03 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 65633C3598B;
 Wed, 20 Apr 2022 13:29:02 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 24/41] include: move qdict_{crumple,flatten} declarations
Date: Wed, 20 Apr 2022 17:26:07 +0400
Message-Id: <20220420132624.2439741-25-marcandre.lureau@redhat.com>
In-Reply-To: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
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
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Move them where they belong, since the functions are implemented in block-qdict.c.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/block/qdict.h      | 3 +++
 include/qapi/qmp/qdict.h   | 3 ---
 softmmu/vl.c               | 1 +
 tests/unit/check-qobject.c | 1 +
 4 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/block/qdict.h b/include/block/qdict.h
index ced2acfb92a0..b4c28d96a9e5 100644
--- a/include/block/qdict.h
+++ b/include/block/qdict.h
@@ -12,6 +12,9 @@
 
 #include "qapi/qmp/qdict.h"
 
+QObject *qdict_crumple(const QDict *src, Error **errp);
+void qdict_flatten(QDict *qdict);
+
 void qdict_copy_default(QDict *dst, QDict *src, const char *key);
 void qdict_set_default_str(QDict *dst, const char *key, const char *val);
 
diff --git a/include/qapi/qmp/qdict.h b/include/qapi/qmp/qdict.h
index 882d950bde89..82e90fc07229 100644
--- a/include/qapi/qmp/qdict.h
+++ b/include/qapi/qmp/qdict.h
@@ -68,7 +68,4 @@ const char *qdict_get_try_str(const QDict *qdict, const char *key);
 
 QDict *qdict_clone_shallow(const QDict *src);
 
-QObject *qdict_crumple(const QDict *src, Error **errp);
-void qdict_flatten(QDict *qdict);
-
 #endif /* QDICT_H */
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 8e3163a09233..b20d470b62a5 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -125,6 +125,7 @@
 #include "qapi/qapi-visit-qom.h"
 #include "qapi/qapi-commands-ui.h"
 #include "qapi/qmp/qdict.h"
+#include "block/qdict.h"
 #include "qapi/qmp/qerror.h"
 #include "sysemu/iothread.h"
 #include "qemu/guest-random.h"
diff --git a/tests/unit/check-qobject.c b/tests/unit/check-qobject.c
index 0ed094e55f3a..c5e850a10cb5 100644
--- a/tests/unit/check-qobject.c
+++ b/tests/unit/check-qobject.c
@@ -15,6 +15,7 @@
 #include "qapi/qmp/qnull.h"
 #include "qapi/qmp/qnum.h"
 #include "qapi/qmp/qstring.h"
+#include "block/qdict.h"
 
 #include <math.h>
 
-- 
2.35.1.693.g805e0a68082a


