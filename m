Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 108E83378B5
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 17:04:02 +0100 (CET)
Received: from localhost ([::1]:49542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKNn6-0001yu-Ve
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 11:04:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKMcw-0005wv-3e
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:49:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKMcj-0003HP-5J
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:49:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615474152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t/eKFtK9whJ5tMDHRfeRLxASDOyaOPLoOuGYHXjPmeQ=;
 b=QLXGcXh1GaLvUP0dufHbY7kp2Hvx3rdCY/wIu6qGJFvRwCamL//dPcNTAug/cDe+DP3eRj
 5tkXieutPHTDEmJ002ZerPIyQrfxj7CCynGWrWD5Wg+7LujnnPavmb6RmY1xx801qAqVFk
 9X8ddIsHv1Hzkg5HGqiyjL0/sPkIy2Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-jEL1XnQyP1etFRo8TzVfjQ-1; Thu, 11 Mar 2021 09:49:10 -0500
X-MC-Unique: jEL1XnQyP1etFRo8TzVfjQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74A9F18460E1;
 Thu, 11 Mar 2021 14:49:09 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-112.ams2.redhat.com [10.36.114.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 046F75D9F2;
 Thu, 11 Mar 2021 14:49:07 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 35/38] qom: Add user_creatable_add_from_str()
Date: Thu, 11 Mar 2021 15:48:08 +0100
Message-Id: <20210311144811.313451-36-kwolf@redhat.com>
In-Reply-To: <20210311144811.313451-1-kwolf@redhat.com>
References: <20210311144811.313451-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a version of user_creatable_process_cmdline() with an Error
parameter that never calls exit() and is therefore usable in HMP.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Acked-by: Peter Krempa <pkrempa@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 include/qom/object_interfaces.h | 16 ++++++++++++++++
 qom/object_interfaces.c         | 29 ++++++++++++++++++++++++-----
 2 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/include/qom/object_interfaces.h b/include/qom/object_interfaces.h
index 1e6c51b541..07511e6cff 100644
--- a/include/qom/object_interfaces.h
+++ b/include/qom/object_interfaces.h
@@ -144,6 +144,22 @@ typedef bool (*user_creatable_add_opts_predicate)(const char *type);
 int user_creatable_add_opts_foreach(void *opaque,
                                     QemuOpts *opts, Error **errp);
 
+/**
+ * user_creatable_add_from_str:
+ * @optarg: the object definition string as passed on the command line
+ * @errp: if an error occurs, a pointer to an area to store the error
+ *
+ * Create an instance of the user creatable object by parsing optarg
+ * with a keyval parser and implicit key 'qom-type', converting the
+ * result to ObjectOptions and calling into qmp_object_add().
+ *
+ * If a help option is given, print help instead.
+ *
+ * Returns: true when an object was successfully created, false when an error
+ * occurred (*errp is set then) or help was printed (*errp is not set).
+ */
+bool user_creatable_add_from_str(const char *optarg, Error **errp);
+
 /**
  * user_creatable_process_cmdline:
  * @optarg: the object definition string as passed on the command line
diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
index 2eaf9971f5..bf9f8cd2c6 100644
--- a/qom/object_interfaces.c
+++ b/qom/object_interfaces.c
@@ -291,26 +291,45 @@ static void user_creatable_print_help_from_qdict(QDict *args)
     }
 }
 
-void user_creatable_process_cmdline(const char *optarg)
+bool user_creatable_add_from_str(const char *optarg, Error **errp)
 {
+    ERRP_GUARD();
     QDict *args;
     bool help;
     Visitor *v;
     ObjectOptions *options;
 
-    args = keyval_parse(optarg, "qom-type", &help, &error_fatal);
+    args = keyval_parse(optarg, "qom-type", &help, errp);
+    if (*errp) {
+        return false;
+    }
     if (help) {
         user_creatable_print_help_from_qdict(args);
-        exit(EXIT_SUCCESS);
+        qobject_unref(args);
+        return false;
     }
 
     v = qobject_input_visitor_new_keyval(QOBJECT(args));
-    visit_type_ObjectOptions(v, NULL, &options, &error_fatal);
+    visit_type_ObjectOptions(v, NULL, &options, errp);
     visit_free(v);
     qobject_unref(args);
 
-    user_creatable_add_qapi(options, &error_fatal);
+    if (*errp) {
+        goto out;
+    }
+
+    user_creatable_add_qapi(options, errp);
+out:
     qapi_free_ObjectOptions(options);
+    return !*errp;
+}
+
+void user_creatable_process_cmdline(const char *optarg)
+{
+    if (!user_creatable_add_from_str(optarg, &error_fatal)) {
+        /* Help was printed */
+        exit(EXIT_SUCCESS);
+    }
 }
 
 bool user_creatable_del(const char *id, Error **errp)
-- 
2.29.2


