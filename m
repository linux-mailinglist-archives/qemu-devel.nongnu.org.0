Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED6C50A19F
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 16:11:06 +0200 (CEST)
Received: from localhost ([::1]:41228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhXWS-0001or-IN
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 10:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhXDZ-0004ct-Iq
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:51:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhXDX-0006CY-GN
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:51:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650549090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oDByLMgCYMHJe0+lnh+tjldX7ObszOaXPf06zZNPboo=;
 b=Bd9lw6QjfsuB3SOyBPx8/BHbLXk2NIuBkZKUyYHOzfB46lZ5dimhfAHH/CEamt2tzU6Jrr
 035O/QKHtkx8NRx/XN2tHMqogeAR0bfmJi3r5FRGTkE2XiRJX7+CpVCY+BW69saSUk1/23
 5Kc0NAwr9a3klc41ZV/cAIbJogUyF7o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-218-oJL8viRSMiaQAaE6iIMDqA-1; Thu, 21 Apr 2022 09:51:27 -0400
X-MC-Unique: oJL8viRSMiaQAaE6iIMDqA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD0A6801E67;
 Thu, 21 Apr 2022 13:51:26 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D87C4C2811F;
 Thu, 21 Apr 2022 13:51:25 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 17/30] include: move qdict_{crumple,flatten} declarations
Date: Thu, 21 Apr 2022 17:49:27 +0400
Message-Id: <20220421134940.2887768-18-marcandre.lureau@redhat.com>
In-Reply-To: <20220421134940.2887768-1-marcandre.lureau@redhat.com>
References: <20220421134940.2887768-1-marcandre.lureau@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 richard.henderson@linaro.org, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Move them where they belong, since the functions are implemented in block-qdict.c.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220420132624.2439741-25-marcandre.lureau@redhat.com>
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
index 5312bd25649f..06a0e342fe9e 100644
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
2.36.0


