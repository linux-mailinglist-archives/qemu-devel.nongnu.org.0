Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDC926222B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 23:54:32 +0200 (CEST)
Received: from localhost ([::1]:36636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFlZP-00068g-1S
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 17:54:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kFlXk-0004QK-Ej
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 17:52:48 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:36266
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kFlXi-0001Ey-G1
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 17:52:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599601965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7hrteQtPb4fP2DtxnJ0f5kT2tT98m3hNbWJovhD1H8g=;
 b=gmHGsFfoVD/NwcdI7qb7doA3kX+qvXHDvwTfsxsH/py53DdWrxievStYVXp2pVvj2Z6D1I
 VMInJ7Omx4PFbQANILMdWd/vP7EAaBn+lQtKb7rV7Q/sA5F+OCur9Zm1OMgHgPJzn/YdCR
 Ppf6aw8qMs6yUrhJ3iB+3uCBPy37iwM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-d-Wqe3y3PpWgiDDB0skCNg-1; Tue, 08 Sep 2020 17:52:43 -0400
X-MC-Unique: d-Wqe3y3PpWgiDDB0skCNg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8B2880EF8A;
 Tue,  8 Sep 2020 21:52:42 +0000 (UTC)
Received: from localhost (ovpn-66-226.rdu2.redhat.com [10.10.66.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A1BC5C221;
 Tue,  8 Sep 2020 21:52:42 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 02/34] qom: make object_ref/unref use a void * instead of
 Object *.
Date: Tue,  8 Sep 2020 17:52:07 -0400
Message-Id: <20200908215239.3519638-3-ehabkost@redhat.com>
In-Reply-To: <20200908215239.3519638-1-ehabkost@redhat.com>
References: <20200908215239.3519638-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 01:08:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

The object_ref/unref methods are intended for use with any subclass of
the base Object. Using "Object *" in the signature is not adding any
meaningful level of type safety, since callers simply use "OBJECT(ptr)"
and this expands to an unchecked cast "(Object *)".

By using "void *" we enable the object_unref() method to be used to
provide support for g_autoptr() with any subclass.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20200723181410.3145233-2-berrange@redhat.com>
Message-Id: <20200831210740.126168-2-ehabkost@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 include/qom/object.h | 4 ++--
 qom/object.c         | 6 ++++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index 0f3a60617c..1f8aa2d48e 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -1035,7 +1035,7 @@ GSList *object_class_get_list_sorted(const char *implements_type,
  * as its reference count is greater than zero.
  * Returns: @obj
  */
-Object *object_ref(Object *obj);
+Object *object_ref(void *obj);
 
 /**
  * object_unref:
@@ -1044,7 +1044,7 @@ Object *object_ref(Object *obj);
  * Decrease the reference count of a object.  A object cannot be freed as long
  * as its reference count is greater than zero.
  */
-void object_unref(Object *obj);
+void object_unref(void *obj);
 
 /**
  * object_property_try_add:
diff --git a/qom/object.c b/qom/object.c
index 00fdf89b3b..b1822a2ef4 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -1124,8 +1124,9 @@ GSList *object_class_get_list_sorted(const char *implements_type,
                         object_class_cmp);
 }
 
-Object *object_ref(Object *obj)
+Object *object_ref(void *objptr)
 {
+    Object *obj = OBJECT(objptr);
     if (!obj) {
         return NULL;
     }
@@ -1133,8 +1134,9 @@ Object *object_ref(Object *obj)
     return obj;
 }
 
-void object_unref(Object *obj)
+void object_unref(void *objptr)
 {
+    Object *obj = OBJECT(objptr);
     if (!obj) {
         return;
     }
-- 
2.26.2


