Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A7D273580
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 00:13:38 +0200 (CEST)
Received: from localhost ([::1]:39638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKU41-0001A7-Ld
	for lists+qemu-devel@lfdr.de; Mon, 21 Sep 2020 18:13:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kKU1P-0007te-QK
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 18:10:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kKU1O-0001WD-77
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 18:10:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600726253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jTnW0jmo2VI56wFSPFzk1BP1JiamT5UX+hn7CumPlEg=;
 b=R87HNV3aSTmLY+6MpGKCJjE9SoJo8SMHFqlgxvStlR8/wSSPTZA4PzeewoMWeavgaZsjW1
 D0BQU348gNXRw0UpYMGSX+YuPMyEf/mhLptl4/VQeW9YrTjtTgTO4qba8aWlOIhDe6uTwS
 +XFo51j9aFU6U/H5ioGroGnn9PeFzLc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-r9j4ihfsP-axBpWDdNI49g-1; Mon, 21 Sep 2020 18:10:49 -0400
X-MC-Unique: r9j4ihfsP-axBpWDdNI49g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B48AF1868404;
 Mon, 21 Sep 2020 22:10:48 +0000 (UTC)
Received: from localhost (unknown [10.10.67.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 01B1D5D9CD;
 Mon, 21 Sep 2020 22:10:47 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/24] cryptodev-vhost-user: Register "chardev" as class
 property
Date: Mon, 21 Sep 2020 18:10:22 -0400
Message-Id: <20200921221045.699690-2-ehabkost@redhat.com>
In-Reply-To: <20200921221045.699690-1-ehabkost@redhat.com>
References: <20200921221045.699690-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/21 01:44:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
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
Cc: John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Class properties make QOM introspection simpler and easier, as
they don't require an object to be instantiated.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: "Gonglei (Arei)" <arei.gonglei@huawei.com>
Cc: qemu-devel@nongnu.org
---
 backends/cryptodev-vhost-user.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/backends/cryptodev-vhost-user.c b/backends/cryptodev-vhost-user.c
index 41089dede15..690738c6c95 100644
--- a/backends/cryptodev-vhost-user.c
+++ b/backends/cryptodev-vhost-user.c
@@ -336,13 +336,6 @@ cryptodev_vhost_user_get_chardev(Object *obj, Error **errp)
     return NULL;
 }
 
-static void cryptodev_vhost_user_instance_int(Object *obj)
-{
-    object_property_add_str(obj, "chardev",
-                            cryptodev_vhost_user_get_chardev,
-                            cryptodev_vhost_user_set_chardev);
-}
-
 static void cryptodev_vhost_user_finalize(Object *obj)
 {
     CryptoDevBackendVhostUser *s =
@@ -363,13 +356,17 @@ cryptodev_vhost_user_class_init(ObjectClass *oc, void *data)
     bc->create_session = cryptodev_vhost_user_sym_create_session;
     bc->close_session = cryptodev_vhost_user_sym_close_session;
     bc->do_sym_op = NULL;
+
+    object_class_property_add_str(oc, "chardev",
+                                  cryptodev_vhost_user_get_chardev,
+                                  cryptodev_vhost_user_set_chardev);
+
 }
 
 static const TypeInfo cryptodev_vhost_user_info = {
     .name = TYPE_CRYPTODEV_BACKEND_VHOST_USER,
     .parent = TYPE_CRYPTODEV_BACKEND,
     .class_init = cryptodev_vhost_user_class_init,
-    .instance_init = cryptodev_vhost_user_instance_int,
     .instance_finalize = cryptodev_vhost_user_finalize,
     .instance_size = sizeof(CryptoDevBackendVhostUser),
 };
-- 
2.26.2


