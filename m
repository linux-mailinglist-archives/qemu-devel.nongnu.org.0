Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA66A2DAFFA
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 16:25:33 +0100 (CET)
Received: from localhost ([::1]:40666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpCCd-0004rp-P1
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 10:25:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpC8Z-00084c-Sc
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:21:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpC8W-0002M5-QC
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:21:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608045672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BkPWb2SKEsuKJZauPbcw2eQoXCC3kQDXVGNdB13vOSQ=;
 b=GQqOem0eqUUmAXcIHcSKU2zgvbwCJ3ii9owAqxznLMg/eAmw9ebjxNl9tGXptlzKMSHqOk
 sw0wCGk0DXrwbzSVM/Ruj3oD4xYzHxtWURacqc9oPuW6zjcMNqAuhiSgj0QJ5pIZcTGvBL
 43EMgl1DxlUff4HUdMKHXnHy9Im75wQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-Dv6dthvQPv6GLkYJPFu2iw-1; Tue, 15 Dec 2020 10:21:09 -0500
X-MC-Unique: Dv6dthvQPv6GLkYJPFu2iw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F22010A8A9E;
 Tue, 15 Dec 2020 15:19:55 +0000 (UTC)
Received: from localhost (ovpn-115-226.rdu2.redhat.com [10.10.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5835C60C0F;
 Tue, 15 Dec 2020 15:19:55 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 09/25] netfilter: Reorder functions
Date: Tue, 15 Dec 2020 10:19:26 -0500
Message-Id: <20201215151942.3125089-10-ehabkost@redhat.com>
In-Reply-To: <20201215151942.3125089-1-ehabkost@redhat.com>
References: <20201215151942.3125089-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Trivial code reordering in some filter backends, to make the next
changes easier to review.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20201111183823.283752-11-ehabkost@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
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


