Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBFA2AF882
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 19:48:29 +0100 (CET)
Received: from localhost ([::1]:53334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcvAS-0001iJ-MD
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 13:48:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kcv17-0000MN-BE
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 13:38:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kcv13-00083T-DT
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 13:38:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605119924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fZ6Z0/I3Uq9/7AEx6y6Wfw7R0lrw0v4sB/Zq1v+CEXY=;
 b=RLGD9T2XKQPG/gN0kwbppH6eYiIImBisBMvGe6KAa8zjSQ/3b45FRQ9L9PwEZuEpfu3wFu
 bhUM6x9OBz0YryY1dQXDWcrJa7cWgNNgkuZuvSGHP+U/jeulB6EK44okhcsk2odH17teC8
 bvuo4R5XsT8yBBoBzGpJh/UnJCaRz4M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-K9QwSEaPM2O1dkjgpGjaRg-1; Wed, 11 Nov 2020 13:38:42 -0500
X-MC-Unique: K9QwSEaPM2O1dkjgpGjaRg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40F6C186DD29;
 Wed, 11 Nov 2020 18:38:41 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2FC25B4D2;
 Wed, 11 Nov 2020 18:38:40 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/12] netfilter: Use class properties
Date: Wed, 11 Nov 2020 13:38:22 -0500
Message-Id: <20201111183823.283752-12-ehabkost@redhat.com>
In-Reply-To: <20201111183823.283752-1-ehabkost@redhat.com>
References: <20201111183823.283752-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

Instance properties make introspection hard and are not shown by
"-object ...,help".  Convert them to class properties.

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
 net/dump.c            | 10 +++++-----
 net/filter-buffer.c   | 12 ++++--------
 net/filter-mirror.c   | 28 ++++++++++++++--------------
 net/filter-rewriter.c |  7 ++++---
 net/filter.c          | 24 ++++++++++++------------
 5 files changed, 39 insertions(+), 42 deletions(-)

diff --git a/net/dump.c b/net/dump.c
index 7fd448d2e1..4d538d82a6 100644
--- a/net/dump.c
+++ b/net/dump.c
@@ -224,11 +224,6 @@ static void filter_dump_instance_init(Object *obj)
     NetFilterDumpState *nfds = FILTER_DUMP(obj);
 
     nfds->maxlen = 65536;
-
-    object_property_add(obj, "maxlen", "uint32", filter_dump_get_maxlen,
-                        filter_dump_set_maxlen, NULL, NULL);
-    object_property_add_str(obj, "file", file_dump_get_filename,
-                            file_dump_set_filename);
 }
 
 static void filter_dump_instance_finalize(Object *obj)
@@ -242,6 +237,11 @@ static void filter_dump_class_init(ObjectClass *oc, void *data)
 {
     NetFilterClass *nfc = NETFILTER_CLASS(oc);
 
+    object_class_property_add(oc, "maxlen", "uint32", filter_dump_get_maxlen,
+                              filter_dump_set_maxlen, NULL, NULL);
+    object_class_property_add_str(oc, "file", file_dump_get_filename,
+                                  file_dump_set_filename);
+
     nfc->setup = filter_dump_setup;
     nfc->cleanup = filter_dump_cleanup;
     nfc->receive_iov = filter_dump_receive_iov;
diff --git a/net/filter-buffer.c b/net/filter-buffer.c
index 95e384865f..283dc9cbe6 100644
--- a/net/filter-buffer.c
+++ b/net/filter-buffer.c
@@ -176,24 +176,20 @@ static void filter_buffer_class_init(ObjectClass *oc, void *data)
 {
     NetFilterClass *nfc = NETFILTER_CLASS(oc);
 
+    object_class_property_add(oc, "interval", "uint32",
+                              filter_buffer_get_interval,
+                              filter_buffer_set_interval, NULL, NULL);
+
     nfc->setup = filter_buffer_setup;
     nfc->cleanup = filter_buffer_cleanup;
     nfc->receive_iov = filter_buffer_receive_iov;
     nfc->status_changed = filter_buffer_status_changed;
 }
 
-static void filter_buffer_init(Object *obj)
-{
-    object_property_add(obj, "interval", "uint32",
-                        filter_buffer_get_interval,
-                        filter_buffer_set_interval, NULL, NULL);
-}
-
 static const TypeInfo filter_buffer_info = {
     .name = TYPE_FILTER_BUFFER,
     .parent = TYPE_NETFILTER,
     .class_init = filter_buffer_class_init,
-    .instance_init = filter_buffer_init,
     .instance_size = sizeof(FilterBufferState),
 };
 
diff --git a/net/filter-mirror.c b/net/filter-mirror.c
index 26b783011a..f8e65007c0 100644
--- a/net/filter-mirror.c
+++ b/net/filter-mirror.c
@@ -374,6 +374,12 @@ static void filter_mirror_class_init(ObjectClass *oc, void *data)
 {
     NetFilterClass *nfc = NETFILTER_CLASS(oc);
 
+    object_class_property_add_str(oc, "outdev", filter_mirror_get_outdev,
+                                  filter_mirror_set_outdev);
+    object_class_property_add_bool(oc, "vnet_hdr_support",
+                                   filter_mirror_get_vnet_hdr,
+                                   filter_mirror_set_vnet_hdr);
+
     nfc->setup = filter_mirror_setup;
     nfc->cleanup = filter_mirror_cleanup;
     nfc->receive_iov = filter_mirror_receive_iov;
@@ -383,6 +389,14 @@ static void filter_redirector_class_init(ObjectClass *oc, void *data)
 {
     NetFilterClass *nfc = NETFILTER_CLASS(oc);
 
+    object_class_property_add_str(oc, "indev", filter_redirector_get_indev,
+                                  filter_redirector_set_indev);
+    object_class_property_add_str(oc, "outdev", filter_redirector_get_outdev,
+                                  filter_redirector_set_outdev);
+    object_class_property_add_bool(oc, "vnet_hdr_support",
+                                   filter_redirector_get_vnet_hdr,
+                                   filter_redirector_set_vnet_hdr);
+
     nfc->setup = filter_redirector_setup;
     nfc->cleanup = filter_redirector_cleanup;
     nfc->receive_iov = filter_redirector_receive_iov;
@@ -392,28 +406,14 @@ static void filter_mirror_init(Object *obj)
 {
     MirrorState *s = FILTER_MIRROR(obj);
 
-    object_property_add_str(obj, "outdev", filter_mirror_get_outdev,
-                            filter_mirror_set_outdev);
-
     s->vnet_hdr = false;
-    object_property_add_bool(obj, "vnet_hdr_support",
-                             filter_mirror_get_vnet_hdr,
-                             filter_mirror_set_vnet_hdr);
 }
 
 static void filter_redirector_init(Object *obj)
 {
     MirrorState *s = FILTER_REDIRECTOR(obj);
 
-    object_property_add_str(obj, "indev", filter_redirector_get_indev,
-                            filter_redirector_set_indev);
-    object_property_add_str(obj, "outdev", filter_redirector_get_outdev,
-                            filter_redirector_set_outdev);
-
     s->vnet_hdr = false;
-    object_property_add_bool(obj, "vnet_hdr_support",
-                             filter_redirector_get_vnet_hdr,
-                             filter_redirector_set_vnet_hdr);
 }
 
 static void filter_mirror_fini(Object *obj)
diff --git a/net/filter-rewriter.c b/net/filter-rewriter.c
index dc3c27a489..ae358059d9 100644
--- a/net/filter-rewriter.c
+++ b/net/filter-rewriter.c
@@ -416,15 +416,16 @@ static void filter_rewriter_init(Object *obj)
 
     s->vnet_hdr = false;
     s->failover_mode = FAILOVER_MODE_OFF;
-    object_property_add_bool(obj, "vnet_hdr_support",
-                             filter_rewriter_get_vnet_hdr,
-                             filter_rewriter_set_vnet_hdr);
 }
 
 static void colo_rewriter_class_init(ObjectClass *oc, void *data)
 {
     NetFilterClass *nfc = NETFILTER_CLASS(oc);
 
+    object_class_property_add_bool(oc, "vnet_hdr_support",
+                                   filter_rewriter_get_vnet_hdr,
+                                   filter_rewriter_set_vnet_hdr);
+
     nfc->setup = colo_rewriter_setup;
     nfc->cleanup = colo_rewriter_cleanup;
     nfc->receive_iov = colo_rewriter_receive_iov;
diff --git a/net/filter.c b/net/filter.c
index eac8ba1e9c..3fe88fa43f 100644
--- a/net/filter.c
+++ b/net/filter.c
@@ -212,18 +212,6 @@ static void netfilter_init(Object *obj)
     nf->on = true;
     nf->insert_before_flag = false;
     nf->position = g_strdup("tail");
-
-    object_property_add_str(obj, "netdev",
-                            netfilter_get_netdev_id, netfilter_set_netdev_id);
-    object_property_add_enum(obj, "queue", "NetFilterDirection",
-                             &NetFilterDirection_lookup,
-                             netfilter_get_direction, netfilter_set_direction);
-    object_property_add_str(obj, "status",
-                            netfilter_get_status, netfilter_set_status);
-    object_property_add_str(obj, "position",
-                            netfilter_get_position, netfilter_set_position);
-    object_property_add_str(obj, "insert",
-                            netfilter_get_insert, netfilter_set_insert);
 }
 
 static void netfilter_complete(UserCreatable *uc, Error **errp)
@@ -350,6 +338,18 @@ static void netfilter_class_init(ObjectClass *oc, void *data)
     UserCreatableClass *ucc = USER_CREATABLE_CLASS(oc);
     NetFilterClass *nfc = NETFILTER_CLASS(oc);
 
+    object_class_property_add_str(oc, "netdev",
+                                  netfilter_get_netdev_id, netfilter_set_netdev_id);
+    object_class_property_add_enum(oc, "queue", "NetFilterDirection",
+                                   &NetFilterDirection_lookup,
+                                   netfilter_get_direction, netfilter_set_direction);
+    object_class_property_add_str(oc, "status",
+                                  netfilter_get_status, netfilter_set_status);
+    object_class_property_add_str(oc, "position",
+                                  netfilter_get_position, netfilter_set_position);
+    object_class_property_add_str(oc, "insert",
+                                  netfilter_get_insert, netfilter_set_insert);
+
     ucc->complete = netfilter_complete;
     nfc->handle_event = default_handle_event;
 }
-- 
2.28.0


