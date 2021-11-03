Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA343444737
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 18:33:54 +0100 (CET)
Received: from localhost ([::1]:42408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miK93-0006Am-SO
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 13:33:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1miK5s-00016A-5h
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:30:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1miK5o-0001Pn-WF
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:30:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635960632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zQpXDjLe7F+y+n6siT8saKtxHP0CQFbjEa/vW15holU=;
 b=I5YlfrcmhifpqBn2qTGshhosNs7xwctzefZNQEMpzsaZK2PbfPCKPNkKsuaIM85c/wCVj1
 Yk7wC0EmhRT2Thj+0v+Hii33L+kL0Dqj7/mv/QugQlIvU/NmdIlZR9h6H0bxcXnBKf9++n
 SmLw/BjJRBTS20XZg1C3d4IQ9wJawKU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-b9VoA6SyMCOJzenTeWv22w-1; Wed, 03 Nov 2021 13:30:31 -0400
X-MC-Unique: b9VoA6SyMCOJzenTeWv22w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7636A18A0766
 for <qemu-devel@nongnu.org>; Wed,  3 Nov 2021 17:30:22 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 00BE05C1C5;
 Wed,  3 Nov 2021 17:30:20 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 05/12] rng-random: Implement .instance_config
Date: Wed,  3 Nov 2021 18:29:55 +0100
Message-Id: <20211103173002.209906-6-kwolf@redhat.com>
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

This adds an implementation for .instance_config to the rng-random
object. It is split into a function doing the actual configuration and
providing a native C interface and a marshalling function with a visitor
interface that we want to generate from the QAPI schema later.

rng-random objects are not created internally, so all callers use the
.instance_config interface, and setting the 'filename' property fails
after object creation, so the property setter for it can be removed now.

This commit demonstrates that you can have subclasses implementing
.instance_config while the parent class still uses properties for
initialisation.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 backends/rng-random.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/backends/rng-random.c b/backends/rng-random.c
index 7add272edd..b221308091 100644
--- a/backends/rng-random.c
+++ b/backends/rng-random.c
@@ -14,6 +14,7 @@
 #include "sysemu/rng-random.h"
 #include "sysemu/rng.h"
 #include "qapi/error.h"
+#include "qapi/visitor.h"
 #include "qapi/qmp/qerror.h"
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
@@ -89,19 +90,25 @@ static char *rng_random_get_filename(Object *obj, Error **errp)
     return g_strdup(s->filename);
 }
 
-static void rng_random_set_filename(Object *obj, const char *filename,
-                                 Error **errp)
+static bool rng_random_config(Object *obj, const char *filename, Error **errp)
 {
-    RngBackend *b = RNG_BACKEND(obj);
     RngRandom *s = RNG_RANDOM(obj);
 
-    if (b->opened) {
-        error_setg(errp, QERR_PERMISSION_DENIED);
-        return;
-    }
-
     g_free(s->filename);
     s->filename = g_strdup(filename);
+
+    return true;
+}
+
+static bool rng_random_marshal_config(Object *obj, Visitor *v, Error **errp)
+{
+    g_autofree char *filename = NULL;
+
+    if (!visit_type_str(v, "filename", &filename, errp)) {
+        return false;
+    }
+
+    return rng_random_config(obj, filename, errp);
 }
 
 static void rng_random_init(Object *obj)
@@ -131,8 +138,7 @@ static void rng_random_class_init(ObjectClass *klass, void *data)
     rbc->request_entropy = rng_random_request_entropy;
     rbc->opened = rng_random_opened;
     object_class_property_add_str(klass, "filename",
-                                  rng_random_get_filename,
-                                  rng_random_set_filename);
+                                  rng_random_get_filename, NULL);
 
 }
 
@@ -142,6 +148,7 @@ static const TypeInfo rng_random_info = {
     .instance_size = sizeof(RngRandom),
     .class_init = rng_random_class_init,
     .instance_init = rng_random_init,
+    .instance_config = rng_random_marshal_config,
     .instance_finalize = rng_random_finalize,
 };
 
-- 
2.31.1


