Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E6A2FA697
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 17:46:02 +0100 (CET)
Received: from localhost ([::1]:59664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1XfF-0004nn-64
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 11:46:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1XRS-0002P5-6q
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 11:31:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1XRL-0001Vr-7a
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 11:31:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610987497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/l66c/uMNUcein0za809TJUNXOq6gAF1uDOgM6Sx+dg=;
 b=KSjK7oq+ZRsT6YR4YXHk2wd+QGCOYXeYRr9V31/aOQa1Lql9Tub6WXVsYJONZLz3BzJmoX
 qcdlQxqHMqx883+a2sofDyjxk2NAiSO0sQxU4k+/Oo6s70EniH3eRFuIqytWBNy9pK04dK
 J8UAxh/o3DUNej3g5Y+sOga8/Uk6AgA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-1Tj6zroYNSWXpKtKt4JVfQ-1; Mon, 18 Jan 2021 11:31:35 -0500
X-MC-Unique: 1Tj6zroYNSWXpKtKt4JVfQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EF8A800D62
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 16:31:35 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D7B610023AE;
 Mon, 18 Jan 2021 16:31:34 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/25] qom: do not modify QDict argument in
 user_creatable_add_dict
Date: Mon, 18 Jan 2021 11:31:04 -0500
Message-Id: <20210118163113.780171-17-pbonzini@redhat.com>
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

-object will process its QDicts in two steps, first for the "early" objects and
then for the "late" objects.  If qom-type is removed by the "early" pass, the
late pass fails.  So just create a shallow copy of the QDict in
user_creatable_add_dict.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qom/object_interfaces.h |  2 +-
 qom/object_interfaces.c         | 11 +++++++----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/include/qom/object_interfaces.h b/include/qom/object_interfaces.h
index abb23eaea3..ed0d7d663b 100644
--- a/include/qom/object_interfaces.h
+++ b/include/qom/object_interfaces.h
@@ -102,7 +102,7 @@ Object *user_creatable_add_type(const char *type, const char *id,
  *
  * Returns: %true on success, %false on failure.
  */
-bool user_creatable_add_dict(QDict *qdict, bool keyval, Error **errp);
+bool user_creatable_add_dict(const QDict *qdict, bool keyval, Error **errp);
 
 /**
  * user_creatable_add_opts:
diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
index 97bf88908e..fbbf5e8ad3 100644
--- a/qom/object_interfaces.c
+++ b/qom/object_interfaces.c
@@ -105,24 +105,25 @@ out:
     return obj;
 }
 
-bool user_creatable_add_dict(QDict *qdict, bool keyval, Error **errp)
+bool user_creatable_add_dict(const QDict *dict, bool keyval, Error **errp)
 {
     Visitor *v;
-    Object *obj;
+    Object *obj = NULL;
+    QDict *qdict = qdict_clone_shallow(dict);
     g_autofree char *type = NULL;
     g_autofree char *id = NULL;
 
     type = g_strdup(qdict_get_try_str(qdict, "qom-type"));
     if (!type) {
         error_setg(errp, QERR_MISSING_PARAMETER, "qom-type");
-        return false;
+        goto out;
     }
     qdict_del(qdict, "qom-type");
 
     id = g_strdup(qdict_get_try_str(qdict, "id"));
     if (!id) {
         error_setg(errp, QERR_MISSING_PARAMETER, "id");
-        return false;
+        goto out;
     }
     qdict_del(qdict, "id");
 
@@ -134,6 +135,8 @@ bool user_creatable_add_dict(QDict *qdict, bool keyval, Error **errp)
     obj = user_creatable_add_type(type, id, qdict, v, errp);
     visit_free(v);
     object_unref(obj);
+out:
+    qobject_unref(qdict);
     return !!obj;
 }
 
-- 
2.26.2



