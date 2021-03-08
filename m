Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E41333149C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 18:23:16 +0100 (CET)
Received: from localhost ([::1]:35920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJJb9-0000OW-LP
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 12:23:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJJCk-0005bA-V9
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:58:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJJCf-0000St-1D
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:58:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615222676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dd3Td0Xq/JcVavqBuvBYoBEy3ShLuRiPsgZQe5TP5vU=;
 b=JnqsP5/jUZmHKzHhn0bHWQDdP7X1gOD+KNwLY1+pUyQKQdqueUit7RXfD7a3FYM3dyepkc
 luWoBaYL6M3B9YSruX9vJMish5PuV98/U/dDWe4f4ld5+Snt55v9OobURsGxiy+AErt+pM
 pqzbukSHK+StPpJsQDsgC0jGt724XFM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-sTyTU49QPPCAjASIt_Ys1A-1; Mon, 08 Mar 2021 11:57:54 -0500
X-MC-Unique: sTyTU49QPPCAjASIt_Ys1A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67E0C1084D95;
 Mon,  8 Mar 2021 16:57:53 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-100.ams2.redhat.com [10.36.112.100])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 68CFF5D9DB;
 Mon,  8 Mar 2021 16:57:20 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 27/30] hmp: QAPIfy object_add
Date: Mon,  8 Mar 2021 17:54:37 +0100
Message-Id: <20210308165440.386489-28-kwolf@redhat.com>
In-Reply-To: <20210308165440.386489-1-kwolf@redhat.com>
References: <20210308165440.386489-1-kwolf@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: kwolf@redhat.com, lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, armbru@redhat.com,
 mreitz@redhat.com, kraxel@redhat.com, pbonzini@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This switches the HMP command object_add from a QemuOpts-based parser to
user_creatable_add_from_str() which uses a keyval parser and enforces
the QAPI schema.

Apart from being a cleanup, this makes non-scalar properties and help
accessible. In order for help to be printed to the monitor instead of
stdout, the printf() calls in the help functions are changed to
qemu_printf().

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Acked-by: Peter Krempa <pkrempa@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 monitor/hmp-cmds.c      | 17 ++---------------
 qom/object_interfaces.c | 11 ++++++-----
 hmp-commands.hx         |  2 +-
 3 files changed, 9 insertions(+), 21 deletions(-)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 3c88a4faef..652cf9ff21 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1670,24 +1670,11 @@ void hmp_netdev_del(Monitor *mon, const QDict *qdict)
 
 void hmp_object_add(Monitor *mon, const QDict *qdict)
 {
+    const char *options = qdict_get_str(qdict, "object");
     Error *err = NULL;
-    QemuOpts *opts;
-    Object *obj = NULL;
-
-    opts = qemu_opts_from_qdict(qemu_find_opts("object"), qdict, &err);
-    if (err) {
-        goto end;
-    }
 
-    obj = user_creatable_add_opts(opts, &err);
-    qemu_opts_del(opts);
-
-end:
+    user_creatable_add_from_str(options, &err);
     hmp_handle_error(mon, err);
-
-    if (obj) {
-        object_unref(obj);
-    }
 }
 
 void hmp_getfd(Monitor *mon, const QDict *qdict)
diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
index bf9f8cd2c6..6dcab60f09 100644
--- a/qom/object_interfaces.c
+++ b/qom/object_interfaces.c
@@ -14,6 +14,7 @@
 #include "qemu/id.h"
 #include "qemu/module.h"
 #include "qemu/option.h"
+#include "qemu/qemu-print.h"
 #include "qapi/opts-visitor.h"
 #include "qemu/config-file.h"
 
@@ -221,11 +222,11 @@ static void user_creatable_print_types(void)
 {
     GSList *l, *list;
 
-    printf("List of user creatable objects:\n");
+    qemu_printf("List of user creatable objects:\n");
     list = object_class_get_list_sorted(TYPE_USER_CREATABLE, false);
     for (l = list; l != NULL; l = l->next) {
         ObjectClass *oc = OBJECT_CLASS(l->data);
-        printf("  %s\n", object_class_get_name(oc));
+        qemu_printf("  %s\n", object_class_get_name(oc));
     }
     g_slist_free(list);
 }
@@ -256,12 +257,12 @@ static bool user_creatable_print_type_properites(const char *type)
     }
     g_ptr_array_sort(array, (GCompareFunc)qemu_pstrcmp0);
     if (array->len > 0) {
-        printf("%s options:\n", type);
+        qemu_printf("%s options:\n", type);
     } else {
-        printf("There are no options for %s.\n", type);
+        qemu_printf("There are no options for %s.\n", type);
     }
     for (i = 0; i < array->len; i++) {
-        printf("%s\n", (char *)array->pdata[i]);
+        qemu_printf("%s\n", (char *)array->pdata[i]);
     }
     g_ptr_array_set_free_func(array, g_free);
     g_ptr_array_free(array, true);
diff --git a/hmp-commands.hx b/hmp-commands.hx
index d4001f9c5d..6f5d9ce2fb 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1337,7 +1337,7 @@ ERST
 
     {
         .name       = "object_add",
-        .args_type  = "object:O",
+        .args_type  = "object:S",
         .params     = "[qom-type=]type,id=str[,prop=value][,...]",
         .help       = "create QOM object",
         .cmd        = hmp_object_add,
-- 
2.29.2


