Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B59532C14C5
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 20:52:54 +0100 (CET)
Received: from localhost ([::1]:55086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khHtN-0008GF-Mi
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 14:52:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khHpR-0006F3-D9
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 14:48:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khHpO-0007ly-9i
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 14:48:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606160925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=incDQDGrHNj3xaeM7y/KBDFeHlSErjQNzYbU8/gz35U=;
 b=dMDGsOfGC6kpQntqN48OOe3NQ4aNyFOIe4XbcoYMfu61/ENUwP7UMmmrQOxFemCycQbICF
 Llz/0gS1NgDhPO7c6f21QZsP3Qy0yBFtdM83cXOjYM+3x8OhkOGVeCZ320BHEWJiYaJ4xn
 cLKasoU6Ns4lcom/k8D61uFN5c/waTE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-8pdXxmkeMQ2ufsQSGt5yIA-1; Mon, 23 Nov 2020 14:48:42 -0500
X-MC-Unique: 8pdXxmkeMQ2ufsQSGt5yIA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABA7E801AE8
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 19:48:39 +0000 (UTC)
Received: from localhost (unknown [10.10.67.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2056E5C1BB;
 Mon, 23 Nov 2020 19:48:38 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/19] qlit: Use QNumValue to represent QNums
Date: Mon, 23 Nov 2020 14:48:06 -0500
Message-Id: <20201123194818.2773508-8-ehabkost@redhat.com>
In-Reply-To: <20201123194818.2773508-1-ehabkost@redhat.com>
References: <20201123194818.2773508-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace the existing int64_t field in QLitObject with QNumValue,
so we can get support for other QNum types for free.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
This is a new patch added in v3 of the series.  It includes
portions of a previous patch from v2:
"qlit: Support all types of QNums".
---
 include/qapi/qmp/qlit.h | 5 +++--
 qobject/qlit.c          | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/include/qapi/qmp/qlit.h b/include/qapi/qmp/qlit.h
index 2fc2db282e..a240cdd299 100644
--- a/include/qapi/qmp/qlit.h
+++ b/include/qapi/qmp/qlit.h
@@ -15,6 +15,7 @@
 #define QLIT_H
 
 #include "qobject.h"
+#include "qnum.h"
 
 typedef struct QLitDictEntry QLitDictEntry;
 typedef struct QLitObject QLitObject;
@@ -23,7 +24,7 @@ struct QLitObject {
     QType type;
     union {
         bool qbool;
-        int64_t qnum;
+        QNumValue qnum;
         const char *qstr;
         QLitDictEntry *qdict;
         QLitObject *qlist;
@@ -40,7 +41,7 @@ struct QLitDictEntry {
 #define QLIT_QBOOL(val) \
     { .type = QTYPE_QBOOL, .value.qbool = (val) }
 #define QLIT_QNUM_INT(val) \
-    { .type = QTYPE_QNUM, .value.qnum = (val) }
+    { .type = QTYPE_QNUM, .value.qnum = QNUM_VAL_INT(val) }
 #define QLIT_QSTR(val) \
     { .type = QTYPE_QSTRING, .value.qstr = (val) }
 #define QLIT_QDICT(val) \
diff --git a/qobject/qlit.c b/qobject/qlit.c
index 67126b25d5..b7af81cefb 100644
--- a/qobject/qlit.c
+++ b/qobject/qlit.c
@@ -71,7 +71,7 @@ bool qlit_equal_qobject(const QLitObject *lhs, const QObject *rhs)
     case QTYPE_QBOOL:
         return lhs->value.qbool == qbool_get_bool(qobject_to(QBool, rhs));
     case QTYPE_QNUM:
-        return qnum_value_is_equal(&(QNumValue)QNUM_VAL_INT(lhs->value.qnum),
+        return qnum_value_is_equal(&lhs->value.qnum,
                                    &qobject_to(QNum, rhs)->value);
     case QTYPE_QSTRING:
         return (strcmp(lhs->value.qstr,
@@ -95,7 +95,7 @@ QObject *qobject_from_qlit(const QLitObject *qlit)
     case QTYPE_QNULL:
         return QOBJECT(qnull());
     case QTYPE_QNUM:
-        return QOBJECT(qnum_from_int(qlit->value.qnum));
+        return QOBJECT(qnum_from_value(qlit->value.qnum));
     case QTYPE_QSTRING:
         return QOBJECT(qstring_from_str(qlit->value.qstr));
     case QTYPE_QDICT: {
-- 
2.28.0


