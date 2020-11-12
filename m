Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A4E2B1101
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 23:06:44 +0100 (CET)
Received: from localhost ([::1]:57712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdKjr-0006oW-Rq
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 17:06:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdKQE-0007Kd-KA
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:46:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdKQC-0003d9-PY
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:46:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605217584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aKfie8HDs4Bj5KUMmmQqgBylUh0kwLqLFFOC3bbKRvM=;
 b=fRAnxD3Ub6pzjv29yKVh2dosIb7WTTT8zVqZP20sEqS3gvWu5RdAp+t0SLorOaxX5lZSOE
 ZszxAYOOrnYVy5dzFrzciU3MadsRu7AAAnUJp69JkImGeukzwkpZEpD+Vg0SAkwyyojotC
 2L417rgqRtTXzhSKguvXBysUb6pam2Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-dAkDbgt9PIazjzmsM9gTzg-1; Thu, 12 Nov 2020 16:46:22 -0500
X-MC-Unique: dAkDbgt9PIazjzmsM9gTzg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66A915F9D1;
 Thu, 12 Nov 2020 21:46:21 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE15060C13;
 Thu, 12 Nov 2020 21:46:17 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 31/53] qdev: Avoid unnecessary DeviceState* variable at
 set_prop_arraylen()
Date: Thu, 12 Nov 2020 16:43:28 -0500
Message-Id: <20201112214350.872250-32-ehabkost@redhat.com>
In-Reply-To: <20201112214350.872250-1-ehabkost@redhat.com>
References: <20201112214350.872250-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 16:09:27
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're just doing pointer math with the device pointer, we can
simply use obj instead.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org
---
 hw/core/qdev-properties.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 3d648b088d..9d25b49fc1 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -559,10 +559,9 @@ static void set_prop_arraylen(Object *obj, Visitor *v, const char *name,
      * array-length field in the device struct, we have to create the
      * array itself and dynamically add the corresponding properties.
      */
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     uint32_t *alenptr = object_field_prop_ptr(obj, prop);
-    void **arrayptr = (void *)dev + prop->arrayoffset;
+    void **arrayptr = (void *)obj + prop->arrayoffset;
     void *eltptr;
     const char *arrayname;
     int i;
@@ -602,7 +601,7 @@ static void set_prop_arraylen(Object *obj, Visitor *v, const char *name,
          * they get the right answer despite the array element not actually
          * being inside the device struct.
          */
-        arrayprop->prop.offset = eltptr - (void *)dev;
+        arrayprop->prop.offset = eltptr - (void *)obj;
         assert(object_field_prop_ptr(obj, &arrayprop->prop) == eltptr);
         object_property_add(obj, propname,
                             arrayprop->prop.info->name,
-- 
2.28.0


