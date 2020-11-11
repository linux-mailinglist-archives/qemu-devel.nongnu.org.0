Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7282AF889
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 19:50:10 +0100 (CET)
Received: from localhost ([::1]:58824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcvC5-00040f-Mu
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 13:50:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kcv17-0000MA-1R
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 13:38:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kcv13-00083O-4b
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 13:38:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605119923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z45gbVkVg837PGXGDvaAalAXkFpg8UQLIq6eLwTeuEQ=;
 b=Lit1lVuRntdn3sv72l4XJ0iCoWL7q3ZeS8LY6gqjhEJTzjWiCz/N7E3E1XFiZHaPGJTqNd
 ykphrS7L5KIzXMtGrtYD/a9fMrpxA7uRB560jE2/e50Xs0Gt2d6tuUMhkEBaV6li26ElEP
 U++8/sDrHM34eVGgPmv5LW01gwJBJj8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-F5ffE0N8Mb-lgI1EDw-JyQ-1; Wed, 11 Nov 2020 13:38:41 -0500
X-MC-Unique: F5ffE0N8Mb-lgI1EDw-JyQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43D055F9DA;
 Wed, 11 Nov 2020 18:38:40 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EEA6319C66;
 Wed, 11 Nov 2020 18:38:39 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/12] netfilter: Reorder functions
Date: Wed, 11 Nov 2020 13:38:21 -0500
Message-Id: <20201111183823.283752-11-ehabkost@redhat.com>
In-Reply-To: <20201111183823.283752-1-ehabkost@redhat.com>
References: <20201111183823.283752-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Jason Wang <jasowang@redhat.com>,
 Zhang Chen <chen.zhang@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Trivial code reordering in some filter backends, to make the next
changes easier to review.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
This was originally submitted as part of the series:
Subject: [PATCH 00/12] qom: Make all -object types use only class properties
Message-Id: <20201009160122.1662082-1-ehabkost@redhat.com>
https://lore.kernel.org/qemu-devel/20201009160122.1662082-1-ehabkost@redhat.com
---
Cc: Jason Wang <jasowang@redhat.com>
Cc: Zhang Chen <chen.zhang@intel.com>
Cc: Li Zhijian <lizhijian@cn.fujitsu.com>
Cc: qemu-devel@nongnu.org
---
 net/filter-buffer.c | 20 ++++++++++----------
 net/filter-mirror.c | 36 ++++++++++++++++++------------------
 2 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/net/filter-buffer.c b/net/filter-buffer.c
index d8392be53c..95e384865f 100644
--- a/net/filter-buffer.c
+++ b/net/filter-buffer.c
@@ -144,16 +144,6 @@ static void filter_buffer_status_changed(NetFilterState *nf, Error **errp)
     }
 }
 
-static void filter_buffer_class_init(ObjectClass *oc, void *data)
-{
-    NetFilterClass *nfc = NETFILTER_CLASS(oc);
-
-    nfc->setup = filter_buffer_setup;
-    nfc->cleanup = filter_buffer_cleanup;
-    nfc->receive_iov = filter_buffer_receive_iov;
-    nfc->status_changed = filter_buffer_status_changed;
-}
-
 static void filter_buffer_get_interval(Object *obj, Visitor *v,
                                        const char *name, void *opaque,
                                        Error **errp)
@@ -182,6 +172,16 @@ static void filter_buffer_set_interval(Object *obj, Visitor *v,
     s->interval = value;
 }
 
+static void filter_buffer_class_init(ObjectClass *oc, void *data)
+{
+    NetFilterClass *nfc = NETFILTER_CLASS(oc);
+
+    nfc->setup = filter_buffer_setup;
+    nfc->cleanup = filter_buffer_cleanup;
+    nfc->receive_iov = filter_buffer_receive_iov;
+    nfc->status_changed = filter_buffer_status_changed;
+}
+
 static void filter_buffer_init(Object *obj)
 {
     object_property_add(obj, "interval", "uint32",
diff --git a/net/filter-mirror.c b/net/filter-mirror.c
index 088d4dcace..26b783011a 100644
--- a/net/filter-mirror.c
+++ b/net/filter-mirror.c
@@ -284,24 +284,6 @@ static void filter_redirector_setup(NetFilterState *nf, Error **errp)
     }
 }
 
-static void filter_mirror_class_init(ObjectClass *oc, void *data)
-{
-    NetFilterClass *nfc = NETFILTER_CLASS(oc);
-
-    nfc->setup = filter_mirror_setup;
-    nfc->cleanup = filter_mirror_cleanup;
-    nfc->receive_iov = filter_mirror_receive_iov;
-}
-
-static void filter_redirector_class_init(ObjectClass *oc, void *data)
-{
-    NetFilterClass *nfc = NETFILTER_CLASS(oc);
-
-    nfc->setup = filter_redirector_setup;
-    nfc->cleanup = filter_redirector_cleanup;
-    nfc->receive_iov = filter_redirector_receive_iov;
-}
-
 static char *filter_redirector_get_indev(Object *obj, Error **errp)
 {
     MirrorState *s = FILTER_REDIRECTOR(obj);
@@ -388,6 +370,24 @@ static void filter_redirector_set_vnet_hdr(Object *obj,
     s->vnet_hdr = value;
 }
 
+static void filter_mirror_class_init(ObjectClass *oc, void *data)
+{
+    NetFilterClass *nfc = NETFILTER_CLASS(oc);
+
+    nfc->setup = filter_mirror_setup;
+    nfc->cleanup = filter_mirror_cleanup;
+    nfc->receive_iov = filter_mirror_receive_iov;
+}
+
+static void filter_redirector_class_init(ObjectClass *oc, void *data)
+{
+    NetFilterClass *nfc = NETFILTER_CLASS(oc);
+
+    nfc->setup = filter_redirector_setup;
+    nfc->cleanup = filter_redirector_cleanup;
+    nfc->receive_iov = filter_redirector_receive_iov;
+}
+
 static void filter_mirror_init(Object *obj)
 {
     MirrorState *s = FILTER_MIRROR(obj);
-- 
2.28.0


