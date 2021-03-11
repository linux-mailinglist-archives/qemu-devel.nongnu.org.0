Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B52003378CE
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 17:09:04 +0100 (CET)
Received: from localhost ([::1]:36136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKNrz-0000zo-PS
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 11:09:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKMcz-00062u-Bx
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:49:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKMcn-0003KG-7p
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:49:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615474156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XdZjZYRgOSQ1Y9v3qSeD7VinfXsqZsDf2vIBHSlrWoE=;
 b=AHVxU+x6rbOz4Qi/iLZNL/fTeISg+8BjnBxsVMkro7LCVPly/5OkxLf3DF7PzocYd6XJKm
 CFeXQpuUnLJ8AX8+5S6Lh1q2LUj3T06AJ6l7Kck465QykxOv8P0F4lb80AE9PvtJOP9V5f
 wbd75bSWzoZMHRLV23gUQBiNTvwLYT0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-CquZve6VOeaoytkkMWr8qw-1; Thu, 11 Mar 2021 09:49:14 -0500
X-MC-Unique: CquZve6VOeaoytkkMWr8qw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6571618460E0;
 Thu, 11 Mar 2021 14:49:13 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-112.ams2.redhat.com [10.36.114.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 682525D9F2;
 Thu, 11 Mar 2021 14:49:12 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 38/38] qom: Add user_creatable_parse_str()
Date: Thu, 11 Mar 2021 15:48:11 +0100
Message-Id: <20210311144811.313451-39-kwolf@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

The system emulator has a more complicated way of handling command line
options in that it reorders options before it processes them. This means
that parsing object options and creating the object happen at two
different points. Split the parsing part into a separate function that
can be reused by the system emulator command line.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Acked-by: Peter Krempa <pkrempa@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
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
index 6dcab60f09..62d7db7629 100644
--- a/qom/object_interfaces.c
+++ b/qom/object_interfaces.c
@@ -292,7 +292,7 @@ static void user_creatable_print_help_from_qdict(QDict *args)
     }
 }
 
-bool user_creatable_add_from_str(const char *optarg, Error **errp)
+ObjectOptions *user_creatable_parse_str(const char *optarg, Error **errp)
 {
     ERRP_GUARD();
     QDict *args;
@@ -302,12 +302,12 @@ bool user_creatable_add_from_str(const char *optarg, Error **errp)
 
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
@@ -315,12 +315,20 @@ bool user_creatable_add_from_str(const char *optarg, Error **errp)
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


