Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A613379D5
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 17:47:31 +0100 (CET)
Received: from localhost ([::1]:34060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKOTC-0005ex-9w
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 11:47:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKOOv-0002Z8-Uy
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 11:43:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKOOu-0003QJ-Ak
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 11:43:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615480983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pIdzck0FS4uIhQQ7gWjs6alQifPqEsLke6BaZPY6Qew=;
 b=E81lCUs57ULQ8CniQgqwlTb379VS9dFNq13nBywgHIA1Ca/TId/2PDOCs570mquZ3PxRq+
 HoRc+7ZS0pmjTIlH1GrYKD4pqYoLrQDBQfFN9jtpy9Y7ICqTrC2G4gCzCZ8GaFC23WKQ3D
 ymE11IYM1rVxn9ZjeO3vjdBQS0Q//V4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-76iI2DNKM9eBJvfR7aDRiQ-1; Thu, 11 Mar 2021 11:43:01 -0500
X-MC-Unique: 76iI2DNKM9eBJvfR7aDRiQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7FCD800D55
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 16:43:00 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-112.ams2.redhat.com [10.36.114.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B24DF5D9F0;
 Thu, 11 Mar 2021 16:42:59 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] char: Skip CLI aliases in query-chardev-backends
Date: Thu, 11 Mar 2021 17:42:51 +0100
Message-Id: <20210311164253.338723-2-kwolf@redhat.com>
In-Reply-To: <20210311164253.338723-1-kwolf@redhat.com>
References: <20210311164253.338723-1-kwolf@redhat.com>
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
Cc: kwolf@redhat.com, pbonzini@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The aliases "tty" and "parport" are only valid on the command line, QMP
commands like chardev-add don't know them. query-chardev-backends should
describe QMP and therefore not include them in the list of available
backends.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
---
 chardev/char.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/chardev/char.c b/chardev/char.c
index 97cafd6849..dd925cf9a4 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -547,7 +547,7 @@ static const struct ChardevAlias {
 };
 
 typedef struct ChadevClassFE {
-    void (*fn)(const char *name, void *opaque);
+    void (*fn)(const char *name, bool is_cli_alias, void *opaque);
     void *opaque;
 } ChadevClassFE;
 
@@ -561,11 +561,13 @@ chardev_class_foreach(ObjectClass *klass, void *opaque)
         return;
     }
 
-    fe->fn(object_class_get_name(klass) + 8, fe->opaque);
+    fe->fn(object_class_get_name(klass) + 8, false, fe->opaque);
 }
 
 static void
-chardev_name_foreach(void (*fn)(const char *name, void *opaque), void *opaque)
+chardev_name_foreach(void (*fn)(const char *name, bool is_cli_alias,
+                                void *opaque),
+                     void *opaque)
 {
     ChadevClassFE fe = { .fn = fn, .opaque = opaque };
     int i;
@@ -573,12 +575,12 @@ chardev_name_foreach(void (*fn)(const char *name, void *opaque), void *opaque)
     object_class_foreach(chardev_class_foreach, TYPE_CHARDEV, false, &fe);
 
     for (i = 0; i < (int)ARRAY_SIZE(chardev_alias_table); i++) {
-        fn(chardev_alias_table[i].alias, opaque);
+        fn(chardev_alias_table[i].alias, true, opaque);
     }
 }
 
 static void
-help_string_append(const char *name, void *opaque)
+help_string_append(const char *name, bool is_cli_alias, void *opaque)
 {
     GString *str = opaque;
 
@@ -798,11 +800,16 @@ ChardevInfoList *qmp_query_chardev(Error **errp)
 }
 
 static void
-qmp_prepend_backend(const char *name, void *opaque)
+qmp_prepend_backend(const char *name, bool is_cli_alias, void *opaque)
 {
     ChardevBackendInfoList **list = opaque;
-    ChardevBackendInfo *value = g_new0(ChardevBackendInfo, 1);
+    ChardevBackendInfo *value;
 
+    if (is_cli_alias) {
+        return;
+    }
+
+    value = g_new0(ChardevBackendInfo, 1);
     value->name = g_strdup(name);
     QAPI_LIST_PREPEND(*list, value);
 }
-- 
2.29.2


