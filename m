Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C8C2CBA20
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 11:06:55 +0100 (CET)
Received: from localhost ([::1]:56360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkP2E-0001H1-VB
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 05:06:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkO45-0003y5-GK
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:04:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkO3l-0004iC-Dp
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:04:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606899864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TAP/HF9F66LTUeTlSryBoA6ja8DnM0PX+A9pe06+0kE=;
 b=GZS/l4sCsuIwTKZALxONYL2bXO8wvYWvylAIUlEZfR5260H19pKR3wbq0SWZ/k/A47sBP7
 S4RdLTN+PI8bBoSPRspg29nGpWVoghWiebOhXW98gm5/Wvo5puw7EYhS4oNbd2P+3OaeTM
 RlC+15TFfKTJQLoI/y9axVTs8mRM+wE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-e5oyeLlUO3SBVHtQcNwNEw-1; Wed, 02 Dec 2020 04:04:20 -0500
X-MC-Unique: e5oyeLlUO3SBVHtQcNwNEw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5632C73C5;
 Wed,  2 Dec 2020 09:03:44 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 65C9C6085A;
 Wed,  2 Dec 2020 09:03:44 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/28] hmp: special case help options for object_add
Date: Wed,  2 Dec 2020 04:02:49 -0500
Message-Id: <20201202090305.4129317-13-pbonzini@redhat.com>
In-Reply-To: <20201202090305.4129317-1-pbonzini@redhat.com>
References: <20201202090305.4129317-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, imammedo@redhat.com, armbru@redhat.com,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix "object_add help" and "object_add TYPE,help".

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qom/object_interfaces.h |  9 ++++++++-
 monitor/hmp-cmds.c              | 22 ++++++++--------------
 qom/object_interfaces.c         |  2 +-
 3 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/include/qom/object_interfaces.h b/include/qom/object_interfaces.h
index 07d5cc8832..abb23eaea3 100644
--- a/include/qom/object_interfaces.h
+++ b/include/qom/object_interfaces.h
@@ -149,6 +149,13 @@ typedef bool (*user_creatable_add_opts_predicate)(const char *type);
 int user_creatable_add_opts_foreach(void *opaque,
                                     QemuOpts *opts, Error **errp);
 
+/**
+ * user_creatable_print_types:
+ *
+ * Prints a list of user-creatable objects to stdout or the monitor.
+ */
+void user_creatable_print_types(void);
+
 /**
  * user_creatable_print_help:
  * @type: the QOM type to be added
@@ -174,7 +181,7 @@ bool user_creatable_print_help(const char *type, QemuOpts *opts);
  * no help was requested. It should only be called if we know that help is
  * requested and it will always print some help.
  */
-void user_creatable_print_help_from_qdict(QDict *args);
+void user_creatable_print_help_from_qdict(const QDict *args);
 
 /**
  * user_creatable_del:
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 65d8ff4849..153ece8176 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1664,23 +1664,17 @@ void hmp_netdev_del(Monitor *mon, const QDict *qdict)
 void hmp_object_add(Monitor *mon, const QDict *qdict)
 {
     Error *err = NULL;
-    QemuOpts *opts;
-    Object *obj = NULL;
 
-    opts = qemu_opts_from_qdict(qemu_find_opts("object"), qdict, &err);
-    if (err) {
-        goto end;
+    if (is_help_option(qdict_get_str(qdict, "qom-type"))) {
+        user_creatable_print_types();
+        return;
     }
-
-    obj = user_creatable_add_opts(opts, &err);
-    qemu_opts_del(opts);
-
-end:
-    hmp_handle_error(mon, err);
-
-    if (obj) {
-        object_unref(obj);
+    if (qdict_haskey(qdict, "help")) {
+        user_creatable_print_help_from_qdict(qdict);
+        return;
     }
+    user_creatable_add_dict((QDict *)qdict, true, &err);
+    hmp_handle_error(mon, err);
 }
 
 void hmp_getfd(Monitor *mon, const QDict *qdict)
diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
index 34edc3d1d8..f7dcdf18e2 100644
--- a/qom/object_interfaces.c
+++ b/qom/object_interfaces.c
@@ -280,7 +280,7 @@ bool user_creatable_print_help(const char *type, QemuOpts *opts)
     return false;
 }
 
-void user_creatable_print_help_from_qdict(QDict *args)
+void user_creatable_print_help_from_qdict(const QDict *args)
 {
     const char *type = qdict_get_try_str(args, "qom-type");
 
-- 
2.26.2



