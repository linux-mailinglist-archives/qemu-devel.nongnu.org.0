Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA133323F58
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 16:03:29 +0100 (CET)
Received: from localhost ([::1]:49868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEvhI-0006JT-VD
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 10:03:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lEvRG-00036A-6S
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 09:46:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lEvRE-0003tO-BH
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 09:46:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614178011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JWt5y93RVZ4A9pZUMPGGSlmewnIoDraYpgmd3tt4XmU=;
 b=MyBwdVkWmsxVzGh7n+S5cBDYjlj0bzstL4hH/SNa2cs3FtRtc6buEFfgCPpgIB1OoPoyJ/
 ZbdFK3cLW8v8J8wOeFd4d0oJ2xAnO5N7E6MAHTwCzq+X2CeBNaag66BQ8x54D5eZ8oCC0e
 0uBokXsER8SsBRiOjCrUvElcVCD93Ro=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-Q0BHBj_dP3GowV0Bpa8qLQ-1; Wed, 24 Feb 2021 09:46:49 -0500
X-MC-Unique: Q0BHBj_dP3GowV0Bpa8qLQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AC2CA6921;
 Wed, 24 Feb 2021 13:56:38 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-142.ams2.redhat.com [10.36.114.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A10E5D6AD;
 Wed, 24 Feb 2021 13:56:32 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 29/31] qom: Add user_creatable_parse_str()
Date: Wed, 24 Feb 2021 14:52:53 +0100
Message-Id: <20210224135255.253837-30-kwolf@redhat.com>
In-Reply-To: <20210224135255.253837-1-kwolf@redhat.com>
References: <20210224135255.253837-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kwolf@redhat.com, lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, armbru@redhat.com,
 mreitz@redhat.com, kraxel@redhat.com, pbonzini@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The system emulator has a more complicated way of handling command line
options in that it reorders options before it processes them. This means
that parsing object options and creating the object happen at two
different points. Split the parsing part into a separate function that
can be reused by the system emulator command line.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/qom/object_interfaces.h | 15 +++++++++++++++
 qom/object_interfaces.c         | 20 ++++++++++++++------
 2 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/include/qom/object_interfaces.h b/include/qom/object_interfaces.h
index 07511e6cff..fb32330901 100644
--- a/include/qom/object_interfaces.h
+++ b/include/qom/object_interfaces.h
@@ -144,6 +144,21 @@ typedef bool (*user_creatable_add_opts_predicate)(const char *type);
 int user_creatable_add_opts_foreach(void *opaque,
                                     QemuOpts *opts, Error **errp);
 
+/**
+ * user_creatable_parse_str:
+ * @optarg: the object definition string as passed on the command line
+ * @errp: if an error occurs, a pointer to an area to store the error
+ *
+ * Parses the option for the user creatable object with a keyval parser and
+ * implicit key 'qom-type', converting the result to ObjectOptions.
+ *
+ * If a help option is given, print help instead.
+ *
+ * Returns: ObjectOptions on success, NULL when an error occurred (*errp is set
+ * then) or help was printed (*errp is not set).
+ */
+ObjectOptions *user_creatable_parse_str(const char *optarg, Error **errp);
+
 /**
  * user_creatable_add_from_str:
  * @optarg: the object definition string as passed on the command line
diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
index c4982dd7a0..1c29f45b41 100644
--- a/qom/object_interfaces.c
+++ b/qom/object_interfaces.c
@@ -283,7 +283,7 @@ static void user_creatable_print_help_from_qdict(QDict *args)
     }
 }
 
-bool user_creatable_add_from_str(const char *optarg, Error **errp)
+ObjectOptions *user_creatable_parse_str(const char *optarg, Error **errp)
 {
     ERRP_GUARD();
     QDict *args;
@@ -293,12 +293,12 @@ bool user_creatable_add_from_str(const char *optarg, Error **errp)
 
     args = keyval_parse(optarg, "qom-type", &help, errp);
     if (*errp) {
-        return false;
+        return NULL;
     }
     if (help) {
         user_creatable_print_help_from_qdict(args);
         qobject_unref(args);
-        return false;
+        return NULL;
     }
 
     v = qobject_input_visitor_new_keyval(QOBJECT(args));
@@ -306,12 +306,20 @@ bool user_creatable_add_from_str(const char *optarg, Error **errp)
     visit_free(v);
     qobject_unref(args);
 
-    if (*errp) {
-        goto out;
+    return options;
+}
+
+bool user_creatable_add_from_str(const char *optarg, Error **errp)
+{
+    ERRP_GUARD();
+    ObjectOptions *options;
+
+    options = user_creatable_parse_str(optarg, errp);
+    if (!options) {
+        return false;
     }
 
     user_creatable_add_qapi(options, errp);
-out:
     qapi_free_ObjectOptions(options);
     return !*errp;
 }
-- 
2.29.2


