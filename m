Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C92102FA6EB
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 18:01:08 +0100 (CET)
Received: from localhost ([::1]:35458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Xtr-0002K9-Pk
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 12:01:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1XRN-0002NA-BG
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 11:31:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1XRF-0001US-7P
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 11:31:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610987492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uiS6KOmd7H1sPc3gbqBmKtrc6fLRgZnUjSZLjTWXsJk=;
 b=MAxPkgDBJVqO/11MYWa29YisWVe6Qm84xYQ1Q8NI2hf2tNRbi06c1pT6m7qeGf5lMKCEUu
 2poyfDIFw/8OMKDa2nTuCqmZuhB87JeBtE2H44ME3NVdU4vSIVSu6C1x3GEZAYTWfc4ZEJ
 wueTeMi2K1mx2jvJZL8N7hLujxxR67o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-k9fVbDcEPLyprG59gsv86g-1; Mon, 18 Jan 2021 11:31:29 -0500
X-MC-Unique: k9fVbDcEPLyprG59gsv86g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8543584A5E4
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 16:31:28 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC1B217B0B;
 Mon, 18 Jan 2021 16:31:22 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/25] tests: convert check-qom-proplist to keyval
Date: Mon, 18 Jan 2021 11:30:54 -0500
Message-Id: <20210118163113.780171-7-pbonzini@redhat.com>
In-Reply-To: <20210118163113.780171-1-pbonzini@redhat.com>
References: <20210118163113.780171-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, imammedo@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The command-line creation test is using QemuOpts.  Switch it to keyval,
since all the -object command line options will follow
qemu-storage-daemon and do the same.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/check-qom-proplist.c | 58 +++++++++++++++++++++++++-------------
 1 file changed, 38 insertions(+), 20 deletions(-)

diff --git a/tests/check-qom-proplist.c b/tests/check-qom-proplist.c
index 1b76581980..8dba26fb3c 100644
--- a/tests/check-qom-proplist.c
+++ b/tests/check-qom-proplist.c
@@ -21,6 +21,8 @@
 #include "qemu/osdep.h"
 
 #include "qapi/error.h"
+#include "qapi/qmp/qdict.h"
+#include "qapi/qmp/qobject.h"
 #include "qom/object.h"
 #include "qemu/module.h"
 #include "qemu/option.h"
@@ -400,42 +402,58 @@ static void test_dummy_createlist(void)
 
 static void test_dummy_createcmdl(void)
 {
-    QemuOpts *opts;
+    QDict *qdict;
     DummyObject *dobj;
     Error *err = NULL;
+    bool help;
     const char *params = TYPE_DUMMY \
                          ",id=dev0," \
                          "bv=yes,sv=Hiss hiss hiss,av=platypus";
 
-    qemu_add_opts(&qemu_object_opts);
-    opts = qemu_opts_parse(&qemu_object_opts, params, true, &err);
+    qdict = keyval_parse(params, "qom-type", &help, &err);
     g_assert(err == NULL);
-    g_assert(opts);
+    g_assert(qdict);
+    g_assert(!help);
 
-    dobj = DUMMY_OBJECT(user_creatable_add_opts(opts, &err));
+    g_assert(user_creatable_add_dict(qdict, true, &err));
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
+    g_assert(!user_creatable_add_dict(qdict, true, &err));
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
+    g_assert(user_creatable_add_dict(qdict, true, &err));
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



