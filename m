Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 357592153D0
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jul 2020 10:15:35 +0200 (CEST)
Received: from localhost ([::1]:41792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsMHm-000331-7O
	for lists+qemu-devel@lfdr.de; Mon, 06 Jul 2020 04:15:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jsMCU-0001i6-1C
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 04:10:06 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:33083
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jsMCN-0003CP-Ns
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 04:10:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594022998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RX9KpUqi+DRHMsEMRMZrviyEuy56377uUdBz0RHTTDM=;
 b=OpZk7BcdVQmr7/FoBf39NfBYo3zDMtHOUovFgFBDIOws/Ap2CdBZcfMGd38tUFmDE+GFiN
 YqGAo+1w2PZdvj1glbVV2lHUEERzkByV4J13ROnVMxz5w2I+yJcIfYxnbWWiqOkXPHLbLs
 +woqrLUgValuNI/LgWaiyXV03LjP6QE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-VodtojEyPEqyEYwr6oZgfg-1; Mon, 06 Jul 2020 04:09:57 -0400
X-MC-Unique: VodtojEyPEqyEYwr6oZgfg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05C93420FE;
 Mon,  6 Jul 2020 08:09:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ACDA5275E3A;
 Mon,  6 Jul 2020 08:09:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 25C6F1135223; Mon,  6 Jul 2020 10:09:51 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 24/44] qom: Use return values to check for error where
 that's simpler
Date: Mon,  6 Jul 2020 10:09:30 +0200
Message-Id: <20200706080950.403087-25-armbru@redhat.com>
In-Reply-To: <20200706080950.403087-1-armbru@redhat.com>
References: <20200706080950.403087-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/06 01:22:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, groug@kaod.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When using the Error object to check for error, we need to receive it
into a local variable, then propagate() it to @errp.

Using the return value permits allows receiving it straight to @errp.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 qom/object.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/qom/object.c b/qom/object.c
index 0808da2767..3a7c062f8e 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -549,8 +549,7 @@ void object_initialize_child_with_propsv(Object *parentobj,
     object_initialize(childobj, size, type);
     obj = OBJECT(childobj);
 
-    object_set_propv(obj, &local_err, vargs);
-    if (local_err) {
+    if (object_set_propv(obj, errp, vargs) < 0) {
         goto out;
     }
 
@@ -743,7 +742,7 @@ Object *object_new_with_propv(const char *typename,
     }
     obj = object_new_with_type(klass->type);
 
-    if (object_set_propv(obj, &local_err, vargs) < 0) {
+    if (object_set_propv(obj, errp, vargs) < 0) {
         goto error;
     }
 
@@ -1763,20 +1762,24 @@ static void object_set_link_property(Object *obj, Visitor *v,
     LinkProperty *prop = opaque;
     Object **targetp = object_link_get_targetp(obj, prop);
     Object *old_target = *targetp;
-    Object *new_target = NULL;
+    Object *new_target;
     char *path = NULL;
 
-    visit_type_str(v, name, &path, &local_err);
+    if (!visit_type_str(v, name, &path, errp)) {
+        return;
+    }
 
-    if (!local_err && strcmp(path, "") != 0) {
-        new_target = object_resolve_link(obj, name, path, &local_err);
+    if (*path) {
+        new_target = object_resolve_link(obj, name, path, errp);
+        if (!new_target) {
+            g_free(path);
+            return;
+        }
+    } else {
+        new_target = NULL;
     }
 
     g_free(path);
-    if (local_err) {
-        error_propagate(errp, local_err);
-        return;
-    }
 
     prop->check(obj, name, new_target, &local_err);
     if (local_err) {
-- 
2.26.2


