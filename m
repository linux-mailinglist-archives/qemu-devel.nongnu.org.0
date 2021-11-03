Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D096D4447C7
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 18:51:32 +0100 (CET)
Received: from localhost ([::1]:43228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miKQ7-0002Zo-VJ
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 13:51:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1miK6H-0001Qi-LA
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:31:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1miK6G-0001ZV-0x
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:31:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635960659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v0gRVdbdei3KvN7oEqfXcjaFn66/4qm3PHrC/OfMAE0=;
 b=Tce96AjsR7AjgpIyZriZ0CBoqEmdgt4x5pMlPDualOf42OOsL4zbxh/EArbPVsbyB7apkn
 nOHxva+e52h7JIPjP+Rsn/jeaCCr/EMtKKelNWTLxAq8w29MftPoYaVHitdiPlqtXjoNaC
 q9ArCu72L6J7A2cvJ+10KEtNyZPL2bo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-G3SnlGWWMWOh2CBOY8-yaw-1; Wed, 03 Nov 2021 13:30:58 -0400
X-MC-Unique: G3SnlGWWMWOh2CBOY8-yaw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8522EC1B5
 for <qemu-devel@nongnu.org>; Wed,  3 Nov 2021 17:30:34 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F2D15C1C5;
 Wed,  3 Nov 2021 17:30:33 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 12/12] qapi/qom: Add class definition for rng-egd
Date: Wed,  3 Nov 2021 18:30:02 +0100
Message-Id: <20211103173002.209906-13-kwolf@redhat.com>
In-Reply-To: <20211103173002.209906-1-kwolf@redhat.com>
References: <20211103173002.209906-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 armbru@redhat.com, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Switch object creation to .instance_config and remove the property
setter that would only return an error after creation anyway.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/qom.json      | 12 ++++++------
 backends/rng-egd.c | 18 +++++++-----------
 2 files changed, 13 insertions(+), 17 deletions(-)

diff --git a/qapi/qom.json b/qapi/qom.json
index 864c6a658b..fce24428f8 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -742,18 +742,18 @@
   'parent': 'rng-backend' }
 
 ##
-# @RngEgdProperties:
+# @rng-egd:
 #
-# Properties for rng-egd objects.
+# Random number generator backend connecting to an EGD-compatible daemon
 #
 # @chardev: the name of a character device backend that provides the connection
 #           to the RNG daemon
 #
 # Since: 1.3
 ##
-{ 'struct': 'RngEgdProperties',
-  'base': 'RngProperties',
-  'data': { 'chardev': 'str' } }
+{ 'class': 'rng-egd',
+  'parent': 'rng-backend',
+  'config': { 'chardev': 'str' } }
 
 ##
 # @rng-random:
@@ -908,7 +908,7 @@
                                       'if': 'CONFIG_LINUX' },
       'qtest':                      'QtestProperties',
       'rng-builtin':                'qom-config:rng-builtin',
-      'rng-egd':                    'RngEgdProperties',
+      'rng-egd':                    'qom-config:rng-egd',
       'rng-random':                 { 'type': 'qom-config:rng-random',
                                       'if': 'CONFIG_POSIX' },
       'secret':                     'SecretProperties',
diff --git a/backends/rng-egd.c b/backends/rng-egd.c
index 4de142b9dc..89255dc6fa 100644
--- a/backends/rng-egd.c
+++ b/backends/rng-egd.c
@@ -15,6 +15,7 @@
 #include "chardev/char-fe.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qerror.h"
+#include "qapi/qapi-qom-qom.h"
 #include "qemu/module.h"
 #include "qom/object.h"
 
@@ -110,17 +111,12 @@ static void rng_egd_opened(RngBackend *b, Error **errp)
                              rng_egd_chr_read, NULL, NULL, s, NULL, true);
 }
 
-static void rng_egd_set_chardev(Object *obj, const char *value, Error **errp)
+bool qom_rng_egd_config(Object *obj, const char *chardev, Error **errp)
 {
-    RngBackend *b = RNG_BACKEND(obj);
-    RngEgd *s = RNG_EGD(b);
+    RngEgd *s = RNG_EGD(obj);
 
-    if (b->opened) {
-        error_setg(errp, QERR_PERMISSION_DENIED);
-    } else {
-        g_free(s->chr_name);
-        s->chr_name = g_strdup(value);
-    }
+    s->chr_name = g_strdup(chardev);
+    return true;
 }
 
 static char *rng_egd_get_chardev(Object *obj, Error **errp)
@@ -149,8 +145,7 @@ static void rng_egd_class_init(ObjectClass *klass, void *data)
 
     rbc->request_entropy = rng_egd_request_entropy;
     rbc->opened = rng_egd_opened;
-    object_class_property_add_str(klass, "chardev",
-                                  rng_egd_get_chardev, rng_egd_set_chardev);
+    object_class_property_add_str(klass, "chardev", rng_egd_get_chardev, NULL);
 }
 
 static const TypeInfo rng_egd_info = {
@@ -158,6 +153,7 @@ static const TypeInfo rng_egd_info = {
     .parent = TYPE_RNG_BACKEND,
     .instance_size = sizeof(RngEgd),
     .class_init = rng_egd_class_init,
+    .instance_config = qom_rng_egd_marshal_config,
     .instance_finalize = rng_egd_finalize,
 };
 
-- 
2.31.1


