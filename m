Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF9B2FA663
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 17:39:19 +0100 (CET)
Received: from localhost ([::1]:45818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1XYk-0006lr-EN
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 11:39:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1XRN-0002N3-92
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 11:31:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1XRG-0001Un-Pq
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 11:31:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610987493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7a51AIiGsbV1vzqxm2tJbIxu/iDyMDz6sfAiTAVaQXg=;
 b=QaGBKK6MgQ4WQasself83m/UkkvBu436s1jkSw4gtjq+m8WwGpMNJ8uOtfnWBJG2X1SIVV
 0btbQ5BRLElFvHqBalpfrMREql6R99g2Rmz88tmZffKPjCJ8rUPTHOxzvVoNmHgW3FQKeL
 GU5qD//XNgAliAgMyp6PVCN1lgTZcBk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-jDXCTsnmM8mifM5ruN8Dfg-1; Mon, 18 Jan 2021 11:31:32 -0500
X-MC-Unique: jDXCTsnmM8mifM5ruN8Dfg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59E7B190B2A2
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 16:31:31 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D703E10023AE;
 Mon, 18 Jan 2021 16:31:30 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/25] hmp: special case help options for object_add
Date: Mon, 18 Jan 2021 11:30:58 -0500
Message-Id: <20210118163113.780171-11-pbonzini@redhat.com>
In-Reply-To: <20210118163113.780171-1-pbonzini@redhat.com>
References: <20210118163113.780171-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
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
Cc: kwolf@redhat.com, imammedo@redhat.com, armbru@redhat.com
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
index fd4d77e246..90dd91c6f5 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1663,23 +1663,17 @@ void hmp_netdev_del(Monitor *mon, const QDict *qdict)
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
index 6c7bd025dd..97bf88908e 100644
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



