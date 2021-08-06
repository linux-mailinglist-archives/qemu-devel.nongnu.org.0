Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C153E30BC
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 23:13:29 +0200 (CEST)
Received: from localhost ([::1]:59288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC79k-0001Cw-51
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 17:13:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mC788-0007D6-IJ
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 17:11:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mC787-0003lq-25
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 17:11:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628284306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YUVnLRv52nU4oY8b0A1e7hxAgqmXrfJo8KDTnv9IuFo=;
 b=J1AsyEudF8a8kMKBByQoOoGV5H7DymaK5qbOubwIsdJun2PfMkWw/SZZ4IWRUTO67eLw6z
 c0ZCh5odvuWUTGmfgsqbRd4iKr+VZWvxr/pmOF6Y113xjNhByefRb8lVZhFg9AUtd0ckZ4
 gezR+D0JrzzqZEDeV23Oe/ya/IFJbsM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-cuMe1L4wNa-7oawjHNEdPw-1; Fri, 06 Aug 2021 17:11:45 -0400
X-MC-Unique: cuMe1L4wNa-7oawjHNEdPw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 792101084F54;
 Fri,  6 Aug 2021 21:11:44 +0000 (UTC)
Received: from localhost (unknown [10.22.11.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 098475D6AD;
 Fri,  6 Aug 2021 21:11:36 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 02/12] qom: Use DEVICE_*CLASS instead of OBJECT_*CLASS
Date: Fri,  6 Aug 2021 17:11:17 -0400
Message-Id: <20210806211127.646908-3-ehabkost@redhat.com>
In-Reply-To: <20210806211127.646908-1-ehabkost@redhat.com>
References: <20210806211127.646908-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Juan Quintela <quintela@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are multiple functions where OBJECT_GET_CLASS or
OBJECT_CLASS_CHECK are being used directly for
DeviceClass/TYPE_DEVICE, instead of the DEVICE_GET_CLASS or
DEVICE_CLASS wrappers.  There's no reason to not use the
wrappers, so use them.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org
---
 hw/pci/pci.c           | 3 +--
 hw/usb/hcd-ehci-pci.c  | 2 +-
 migration/savevm.c     | 3 +--
 monitor/misc.c         | 3 +--
 softmmu/qdev-monitor.c | 3 +--
 5 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 23d2ae2ab23..9af32ef4cb8 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1915,8 +1915,7 @@ PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
     list = object_class_get_list_sorted(TYPE_PCI_DEVICE, false);
     pci_nic_models = g_ptr_array_new();
     while (list) {
-        DeviceClass *dc = OBJECT_CLASS_CHECK(DeviceClass, list->data,
-                                             TYPE_DEVICE);
+        DeviceClass *dc = DEVICE_CLASS(list->data);
         GSList *next;
         if (test_bit(DEVICE_CATEGORY_NETWORK, dc->categories) &&
             dc->user_creatable) {
diff --git a/hw/usb/hcd-ehci-pci.c b/hw/usb/hcd-ehci-pci.c
index 4c37c8e2271..345444a5739 100644
--- a/hw/usb/hcd-ehci-pci.c
+++ b/hw/usb/hcd-ehci-pci.c
@@ -74,7 +74,7 @@ static void usb_ehci_pci_realize(PCIDevice *dev, Error **errp)
 
 static void usb_ehci_pci_init(Object *obj)
 {
-    DeviceClass *dc = OBJECT_GET_CLASS(DeviceClass, obj, TYPE_DEVICE);
+    DeviceClass *dc = DEVICE_GET_CLASS(obj);
     EHCIPCIState *i = PCI_EHCI(obj);
     EHCIState *s = &i->ehci;
 
diff --git a/migration/savevm.c b/migration/savevm.c
index 7b7b64bd13e..23cc55b8533 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -663,8 +663,7 @@ void dump_vmstate_json_to_file(FILE *out_file)
     first = true;
     list = object_class_get_list(TYPE_DEVICE, true);
     for (elt = list; elt; elt = elt->next) {
-        DeviceClass *dc = OBJECT_CLASS_CHECK(DeviceClass, elt->data,
-                                             TYPE_DEVICE);
+        DeviceClass *dc = DEVICE_CLASS(elt->data);
         const char *name;
         int indent = 2;
 
diff --git a/monitor/misc.c b/monitor/misc.c
index ffe79668706..98202d12e7f 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -1549,8 +1549,7 @@ void device_add_completion(ReadLineState *rs, int nb_args, const char *str)
     list = elt = object_class_get_list(TYPE_DEVICE, false);
     while (elt) {
         const char *name;
-        DeviceClass *dc = OBJECT_CLASS_CHECK(DeviceClass, elt->data,
-                                             TYPE_DEVICE);
+        DeviceClass *dc = DEVICE_CLASS(elt->data);
         name = object_class_get_name(OBJECT_CLASS(dc));
 
         if (dc->user_creatable
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 721dec2d820..82d164c6539 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -165,8 +165,7 @@ static void qdev_print_devinfos(bool show_no_user)
     for (i = 0; i <= DEVICE_CATEGORY_MAX; i++) {
         cat_printed = false;
         for (elt = list; elt; elt = elt->next) {
-            DeviceClass *dc = OBJECT_CLASS_CHECK(DeviceClass, elt->data,
-                                                 TYPE_DEVICE);
+            DeviceClass *dc = DEVICE_CLASS(elt->data);
             if ((i < DEVICE_CATEGORY_MAX
                  ? !test_bit(i, dc->categories)
                  : !bitmap_empty(dc->categories, DEVICE_CATEGORY_MAX))
-- 
2.31.1


