Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8ED34087F
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 16:12:18 +0100 (CET)
Received: from localhost ([::1]:45140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMuJt-0006qM-7U
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 11:12:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lMuGJ-0003nS-0P
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 11:08:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lMuGF-00026Q-Vd
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 11:08:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616080110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DoTMtvHsXaWwsDePl/YLR7Mqors7CbVVCrOmTIKBX14=;
 b=SM5ftHd4YIEERcxt1ot/Y8ihW67Lo+vF6grGaUBOums6XcrCUf9sD+eRhArCKoBylm2DtI
 EsVXZJ0pzlChIS1DqHzsBUcIQNdBePnTVPaMrPPDok3ZqUuehm56LvP5DdWTeSJlkB4Z4e
 Ia8hBAm/CkUNitc919beP0ngUp0KAWE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-i2bmerL7O5GrqrHCgW8O0w-1; Thu, 18 Mar 2021 11:08:24 -0400
X-MC-Unique: i2bmerL7O5GrqrHCgW8O0w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB76910866AC;
 Thu, 18 Mar 2021 15:08:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7ADAF5D9D0;
 Thu, 18 Mar 2021 15:08:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EE16111386A7; Thu, 18 Mar 2021 16:08:14 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v6 00/10] Configurable policy for handling deprecated
 interfaces
References: <20210312153210.2810514-1-armbru@redhat.com>
Date: Thu, 18 Mar 2021 16:08:14 +0100
In-Reply-To: <20210312153210.2810514-1-armbru@redhat.com> (Markus Armbruster's
 message of "Fri, 12 Mar 2021 16:32:00 +0100")
Message-ID: <878s6kh541.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?utf-8?B?THVrw6HFoQ==?= Doktor <ldoktor@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, libvir-list@redhat.com,
 mdroth@linux.vnet.ibm.com, marcandre.lureau@gmail.com, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series needs fixups to not break --disable-system --disable-tools
builds.  It's not much (see appended diff), but enough to make me respin
it as v7.  I'll respin the pull request, too.


diff --git a/include/qapi/compat-policy.h b/include/qapi/compat-policy.h
index b8c6638156..1083f95122 100644
--- a/include/qapi/compat-policy.h
+++ b/include/qapi/compat-policy.h
@@ -17,4 +17,22 @@
 
 extern CompatPolicy compat_policy;
 
+/*
+ * Create a QObject input visitor for @obj for use with QMP
+ *
+ * This is like qobject_input_visitor_new(), except it obeys the
+ * policy for handling deprecated management interfaces set with
+ * -compat.
+ */
+Visitor *qobject_input_visitor_new_qmp(QObject *obj);
+
+/*
+ * Create a QObject output visitor for @obj for use with QMP
+ *
+ * This is like qobject_output_visitor_new(), except it obeys the
+ * policy for handling deprecated management interfaces set with
+ * -compat.
+ */
+Visitor *qobject_output_visitor_new_qmp(QObject **result);
+
 #endif
diff --git a/include/qapi/qobject-input-visitor.h b/include/qapi/qobject-input-visitor.h
index cbc54de4ac..8d69388810 100644
--- a/include/qapi/qobject-input-visitor.h
+++ b/include/qapi/qobject-input-visitor.h
@@ -15,6 +15,7 @@
 #ifndef QOBJECT_INPUT_VISITOR_H
 #define QOBJECT_INPUT_VISITOR_H
 
+#include "qapi/qapi-types-compat.h"
 #include "qapi/visitor.h"
 
 typedef struct QObjectInputVisitor QObjectInputVisitor;
@@ -58,14 +59,8 @@ typedef struct QObjectInputVisitor QObjectInputVisitor;
  */
 Visitor *qobject_input_visitor_new(QObject *obj);
 
-/*
- * Create a QObject input visitor for @obj for use with QMP
- *
- * This is like qobject_input_visitor_new(), except it obeys the
- * policy for handling deprecated management interfaces set with
- * -compat.
- */
-Visitor *qobject_input_visitor_new_qmp(QObject *obj);
+void qobject_input_visitor_set_policy(Visitor *v,
+                                      CompatPolicyInput deprecated);
 
 /*
  * Create a QObject input visitor for @obj for use with keyval_parse()
diff --git a/include/qapi/qobject-output-visitor.h b/include/qapi/qobject-output-visitor.h
index 29f4ea6aad..f2a2f92a00 100644
--- a/include/qapi/qobject-output-visitor.h
+++ b/include/qapi/qobject-output-visitor.h
@@ -15,6 +15,7 @@
 #define QOBJECT_OUTPUT_VISITOR_H
 
 #include "qapi/visitor.h"
+#include "qapi/qapi-types-compat.h"
 
 typedef struct QObjectOutputVisitor QObjectOutputVisitor;
 
@@ -53,13 +54,7 @@ typedef struct QObjectOutputVisitor QObjectOutputVisitor;
  */
 Visitor *qobject_output_visitor_new(QObject **result);
 
-/*
- * Create a QObject output visitor for @obj for use with QMP
- *
- * This is like qobject_output_visitor_new(), except it obeys the
- * policy for handling deprecated management interfaces set with
- * -compat.
- */
-Visitor *qobject_output_visitor_new_qmp(QObject **result);
+void qobject_output_visitor_set_policy(Visitor *v,
+                                       CompatPolicyOutput deprecated);
 
 #endif
diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
index 12657d635e..0f7e2e48fa 100644
--- a/qapi/qmp-dispatch.c
+++ b/qapi/qmp-dispatch.c
@@ -19,6 +19,8 @@
 #include "qapi/qmp/dispatch.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qjson.h"
+#include "qapi/qobject-input-visitor.h"
+#include "qapi/qobject-output-visitor.h"
 #include "sysemu/runstate.h"
 #include "qapi/qmp/qbool.h"
 #include "qemu/coroutine.h"
@@ -26,6 +28,22 @@
 
 CompatPolicy compat_policy;
 
+Visitor *qobject_input_visitor_new_qmp(QObject *obj)
+{
+    Visitor *v = qobject_input_visitor_new(obj);
+
+    qobject_input_visitor_set_policy(v, compat_policy.deprecated_input);
+    return v;
+}
+
+Visitor *qobject_output_visitor_new_qmp(QObject **result)
+{
+    Visitor *v = qobject_output_visitor_new(result);
+
+    qobject_output_visitor_set_policy(v, compat_policy.deprecated_output);
+    return v;
+}
+
 static QDict *qmp_dispatch_check_obj(QDict *dict, bool allow_oob,
                                      Error **errp)
 {
diff --git a/qapi/qobject-input-visitor.c b/qapi/qobject-input-visitor.c
index baad0dcd3c..04b790412e 100644
--- a/qapi/qobject-input-visitor.c
+++ b/qapi/qobject-input-visitor.c
@@ -739,12 +739,12 @@ Visitor *qobject_input_visitor_new(QObject *obj)
     return &v->visitor;
 }
 
-Visitor *qobject_input_visitor_new_qmp(QObject *obj)
+void qobject_input_visitor_set_policy(Visitor *v,
+                                       CompatPolicyInput deprecated)
 {
-    QObjectInputVisitor *v = to_qiv(qobject_input_visitor_new(obj));
+    QObjectInputVisitor *qiv = to_qiv(v);
 
-    v->deprecated_policy = compat_policy.deprecated_input;
-    return &v->visitor;
+    qiv->deprecated_policy = deprecated;
 }
 
 Visitor *qobject_input_visitor_new_keyval(QObject *obj)
diff --git a/qapi/qobject-output-visitor.c b/qapi/qobject-output-visitor.c
index 5c4aa0f64d..e4873308d4 100644
--- a/qapi/qobject-output-visitor.c
+++ b/qapi/qobject-output-visitor.c
@@ -276,10 +276,10 @@ Visitor *qobject_output_visitor_new(QObject **result)
     return &v->visitor;
 }
 
-Visitor *qobject_output_visitor_new_qmp(QObject **result)
+void qobject_output_visitor_set_policy(Visitor *v,
+                                       CompatPolicyOutput deprecated)
 {
-    QObjectOutputVisitor *v = to_qov(qobject_output_visitor_new(result));
+    QObjectOutputVisitor *qov = to_qov(v);
 
-    v->deprecated_policy = compat_policy.deprecated_output;
-    return &v->visitor;
+    qov->deprecated_policy = deprecated;
 }
diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index 8ccd1d9224..0e13d51054 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -255,10 +255,9 @@ def _begin_user_module(self, name: str) -> None:
         visit = self._module_basename('qapi-visit', name)
         self._genc.add(mcgen('''
 #include "qemu/osdep.h"
+#include "qapi/compat-policy.h"
 #include "qapi/visitor.h"
 #include "qapi/qmp/qdict.h"
-#include "qapi/qobject-output-visitor.h"
-#include "qapi/qobject-input-visitor.h"
 #include "qapi/dealloc-visitor.h"
 #include "qapi/error.h"
 #include "%(visit)s.h"
diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
index 8335c2bdfc..fee8c671e7 100644
--- a/scripts/qapi/events.py
+++ b/scripts/qapi/events.py
@@ -192,7 +192,6 @@ def _begin_user_module(self, name: str) -> None:
 #include "qapi/compat-policy.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qdict.h"
-#include "qapi/qobject-output-visitor.h"
 #include "qapi/qmp-event.h"
 
 ''',


