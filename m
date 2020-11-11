Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 865112AF1CE
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 14:14:58 +0100 (CET)
Received: from localhost ([::1]:34856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcpxh-0008Nf-K3
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 08:14:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kcprs-0002vc-Rx
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 08:08:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kcprp-0000v8-UF
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 08:08:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605100133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6/eCX0oXyaVES9ihI8iOisowUqp4YTPIk5nF5oAsOzk=;
 b=GdgDvlAB9PFjaJRmQ8thtcvkceFIzHmVZ7AuG3LLMlneGqB3bQxB/icBKSkP2Dt6XeYuLE
 dj2yd21C18GoNZrwhTKLqPyEx6IBfDU7n32LCP9TdzGNgD6qrdAAPQcK2NlBqwNChnSq2J
 2F24Ctn9RZHkY7B+juhKO4C6XyC0HKA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-gXbKJk_GOIOIQ6gYzBeOfQ-1; Wed, 11 Nov 2020 08:08:51 -0500
X-MC-Unique: gXbKJk_GOIOIQ6gYzBeOfQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3985CE649
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 13:08:50 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-124.ams2.redhat.com [10.36.114.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 827585C1C4;
 Wed, 11 Nov 2020 13:08:49 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] char: Skip CLI aliases in query-chardev-backends
Date: Wed, 11 Nov 2020 14:08:33 +0100
Message-Id: <20201111130834.33985-2-kwolf@redhat.com>
In-Reply-To: <20201111130834.33985-1-kwolf@redhat.com>
References: <20201111130834.33985-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, pbonzini@redhat.com, libvir-list@redhat.com,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The aliases "tty" and "parport" are only valid on the command line, QMP
commands like chardev-add don't know them. query-chardev-backends should
describe QMP and therefore not include them in the list of available
backends.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 chardev/char.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/chardev/char.c b/chardev/char.c
index aa4282164a..c406e61db6 100644
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
 
@@ -800,11 +802,16 @@ ChardevInfoList *qmp_query_chardev(Error **errp)
 }
 
 static void
-qmp_prepend_backend(const char *name, void *opaque)
+qmp_prepend_backend(const char *name, bool is_cli_alias, void *opaque)
 {
     ChardevBackendInfoList **list = opaque;
-    ChardevBackendInfoList *info = g_malloc0(sizeof(*info));
+    ChardevBackendInfoList *info;
 
+    if (is_cli_alias) {
+        return;
+    }
+
+    info = g_malloc0(sizeof(*info));
     info->value = g_malloc0(sizeof(*info->value));
     info->value->name = g_strdup(name);
     info->next = *list;
-- 
2.28.0


