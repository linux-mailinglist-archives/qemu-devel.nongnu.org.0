Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3284C337AD3
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 18:29:39 +0100 (CET)
Received: from localhost ([::1]:55560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKP7y-0006tE-6D
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 12:29:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKP3s-0003eA-D4
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 12:25:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKP3Z-0002DF-5n
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 12:25:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615483503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LEZwvbfHEtLnGI9bIkYjKinbrzcrh0VBOs7JP2Anc6k=;
 b=B2DivmMA1LE6FLanLDR6V5xIpd09uVUNWR1Lq286aWim5r63QQRStWOSRhtyof9oRfMB3R
 5Ip9ZbVxE4wHBDRVgHcO2W4eMOn80kqAIDloImOOf6Hdc9yiMpyJ5rYi4HqDhYtH8CYS9E
 ixBd8q0lwGTGy/ODYCmBU54QHabbv6M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-mHxzGtXaPbuumM7WKyY78Q-1; Thu, 11 Mar 2021 12:25:01 -0500
X-MC-Unique: mHxzGtXaPbuumM7WKyY78Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D45BD19067E6
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 17:25:00 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 63AD560615;
 Thu, 11 Mar 2021 17:25:00 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] tests: convert check-qom-proplist to keyval
Date: Thu, 11 Mar 2021 12:24:57 -0500
Message-Id: <20210311172459.990281-2-pbonzini@redhat.com>
In-Reply-To: <20210311172459.990281-1-pbonzini@redhat.com>
References: <20210311172459.990281-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: kwolf@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The command-line creation test is using QemuOpts.  Switch it to keyval,
since the emulator has some special needs and thus the last user of
user_creatable_add_opts will go away with the next patch.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/check-qom-proplist.c | 74 ++++++++++++++++++++++++++------------
 1 file changed, 52 insertions(+), 22 deletions(-)

diff --git a/tests/check-qom-proplist.c b/tests/check-qom-proplist.c
index 1b76581980..73472944a0 100644
--- a/tests/check-qom-proplist.c
+++ b/tests/check-qom-proplist.c
@@ -21,6 +21,9 @@
 #include "qemu/osdep.h"
 
 #include "qapi/error.h"
+#include "qapi/qobject-input-visitor.h"
+#include "qapi/qmp/qdict.h"
+#include "qapi/qmp/qobject.h"
 #include "qom/object.h"
 #include "qemu/module.h"
 #include "qemu/option.h"
@@ -398,44 +401,71 @@ static void test_dummy_createlist(void)
     object_unparent(OBJECT(dobj));
 }
 
+static bool test_create_obj(QDict *qdict, Error **errp)
+{
+    Visitor *v = qobject_input_visitor_new_keyval(QOBJECT(qdict));
+    Object *obj = user_creatable_add_type(TYPE_DUMMY, "dev0", qdict, v, errp);
+
+    visit_free(v);
+    object_unref(obj);
+    return !!obj;
+}
+
 static void test_dummy_createcmdl(void)
 {
-    QemuOpts *opts;
+    QDict *qdict;
     DummyObject *dobj;
     Error *err = NULL;
-    const char *params = TYPE_DUMMY \
-                         ",id=dev0," \
-                         "bv=yes,sv=Hiss hiss hiss,av=platypus";
+    bool help;
+    const char *params = "bv=yes,sv=Hiss hiss hiss,av=platypus";
 
+    /* Needed for user_creatable_del.  */
     qemu_add_opts(&qemu_object_opts);
-    opts = qemu_opts_parse(&qemu_object_opts, params, true, &err);
+
+    qdict = keyval_parse(params, "qom-type", &help, &err);
     g_assert(err == NULL);
-    g_assert(opts);
+    g_assert(qdict);
+    g_assert(!help);
 
-    dobj = DUMMY_OBJECT(user_creatable_add_opts(opts, &err));
+    g_assert(test_create_obj(qdict, &err));
     g_assert(err == NULL);
+    qobject_unref(qdict);
+
+    dobj = DUMMY_OBJECT(object_resolve_path_component(object_get_objects_root(),
+                                                      "dev0"));
     g_assert(dobj);
     g_assert_cmpstr(dobj->sv, ==, "Hiss hiss hiss");
     g_assert(dobj->bv == true);
     g_assert(dobj->av == DUMMY_PLATYPUS);
 
+    qdict = keyval_parse(params, "qom-type", &help, &err);
+    g_assert(!test_create_obj(qdict, &err));
+    g_assert(err);
+    g_assert(object_resolve_path_component(object_get_objects_root(), "dev0")
+             == OBJECT(dobj));
+    qobject_unref(qdict);
+    error_free(err);
+    err = NULL;
+
+    qdict = keyval_parse(params, "qom-type", &help, &err);
     user_creatable_del("dev0", &error_abort);
+    g_assert(object_resolve_path_component(object_get_objects_root(), "dev0")
+             == NULL);
 
-    object_unref(OBJECT(dobj));
-
-    /*
-     * cmdline-parsing via qemu_opts_parse() results in a QemuOpts entry
-     * corresponding to the Object's ID to be added to the QemuOptsList
-     * for objects. To avoid having this entry conflict with future
-     * Objects using the same ID (which can happen in cases where
-     * qemu_opts_parse() is used to parse the object params, such as
-     * with hmp_object_add() at the time of this comment), we need to
-     * check for this in user_creatable_del() and remove the QemuOpts if
-     * it is present.
-     *
-     * The below check ensures this works as expected.
-     */
-    g_assert_null(qemu_opts_find(&qemu_object_opts, "dev0"));
+    g_assert(test_create_obj(qdict, &err));
+    g_assert(err == NULL);
+    qobject_unref(qdict);
+
+    dobj = DUMMY_OBJECT(object_resolve_path_component(object_get_objects_root(),
+                                                      "dev0"));
+    g_assert(dobj);
+    g_assert_cmpstr(dobj->sv, ==, "Hiss hiss hiss");
+    g_assert(dobj->bv == true);
+    g_assert(dobj->av == DUMMY_PLATYPUS);
+    g_assert(object_resolve_path_component(object_get_objects_root(), "dev0")
+             == OBJECT(dobj));
+
+    object_unparent(OBJECT(dobj));
 }
 
 static void test_dummy_badenum(void)
-- 
2.26.2



