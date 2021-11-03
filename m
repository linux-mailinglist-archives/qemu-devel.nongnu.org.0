Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD1D44475A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 18:38:52 +0100 (CET)
Received: from localhost ([::1]:56260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miKDq-0008Tv-Ns
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 13:38:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1miK60-0001DZ-S1
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:30:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1miK5u-0001RI-2X
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:30:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635960637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vBUO77zANQCc4UOMKHc/W6RQA0bIXLxZoVHcgvcpk28=;
 b=gHIXB/apMo6oxHE8EG7zlSMRfLa8K6y8q/NGYOpdkcYY8nG+oKzCpQQ5cgaKixQpK9GvTR
 aiS3Z3S/N9mbq5Plfb5llp8ZCnmUMeocb2aEqIpaCU1nzEAPD+3e44ss+Kzn9etbXUnMba
 HczuG6vbZ0IvxEpIKNiFbcWZDzQ4SfI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-WMihyNmNOXaAYFs8XxZM7A-1; Wed, 03 Nov 2021 13:30:35 -0400
X-MC-Unique: WMihyNmNOXaAYFs8XxZM7A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36930112B8EC
 for <qemu-devel@nongnu.org>; Wed,  3 Nov 2021 17:30:24 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA4535C1D5;
 Wed,  3 Nov 2021 17:30:22 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 06/12] rng-backend: Implement .instance_config
Date: Wed,  3 Nov 2021 18:29:56 +0100
Message-Id: <20211103173002.209906-7-kwolf@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This commit really only serves as an illustration because the only
property in rng-backend is 'opened', which is useless and deprecated.

Implement .instance_config in order to show that .instance_config is
working both when parent class and subclass implement it (rng-random)
and when only the parent class implements it (rng-egd).

'opened' cannot be set after creation any more with this change. This is
an incompatible change, but its deprecation period is up anyway.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 backends/rng.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/backends/rng.c b/backends/rng.c
index 3757b04485..840daf0392 100644
--- a/backends/rng.c
+++ b/backends/rng.c
@@ -46,11 +46,6 @@ static bool rng_backend_prop_get_opened(Object *obj, Error **errp)
     return s->opened;
 }
 
-static void rng_backend_complete(UserCreatable *uc, Error **errp)
-{
-    object_property_set_bool(OBJECT(uc), "opened", true, errp);
-}
-
 static void rng_backend_prop_set_opened(Object *obj, bool value, Error **errp)
 {
     RngBackend *s = RNG_BACKEND(obj);
@@ -77,6 +72,29 @@ static void rng_backend_prop_set_opened(Object *obj, bool value, Error **errp)
     s->opened = true;
 }
 
+static void rng_backend_complete(UserCreatable *uc, Error **errp)
+{
+    rng_backend_prop_set_opened(OBJECT(uc), true, errp);
+}
+
+static bool rng_backend_config(Object *obj, bool opened, Error **errp)
+{
+    ERRP_GUARD();
+    rng_backend_prop_set_opened(obj, opened, errp);
+    return *errp == NULL;
+}
+
+static bool rng_backend_marshal_config(Object *obj, Visitor *v, Error **errp)
+{
+    bool opened;
+
+    if (!visit_type_bool(v, "opened", &opened, errp)) {
+        return false;
+    }
+
+    return rng_backend_config(obj, opened, errp);
+}
+
 static void rng_backend_free_request(RngRequest *req)
 {
     g_free(req->data);
@@ -122,7 +140,7 @@ static void rng_backend_class_init(ObjectClass *oc, void *data)
 
     object_class_property_add_bool(oc, "opened",
                                    rng_backend_prop_get_opened,
-                                   rng_backend_prop_set_opened);
+                                   NULL);
 }
 
 static const TypeInfo rng_backend_info = {
@@ -130,6 +148,7 @@ static const TypeInfo rng_backend_info = {
     .parent = TYPE_OBJECT,
     .instance_size = sizeof(RngBackend),
     .instance_init = rng_backend_init,
+    .instance_config = rng_backend_marshal_config,
     .instance_finalize = rng_backend_finalize,
     .class_size = sizeof(RngBackendClass),
     .class_init = rng_backend_class_init,
-- 
2.31.1


