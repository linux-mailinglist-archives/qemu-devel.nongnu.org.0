Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 931412BB4C3
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 20:05:43 +0100 (CET)
Received: from localhost ([::1]:59626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgBj4-00082O-LU
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 14:05:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kgBVo-000478-D4
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 13:52:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kgBVk-0006vi-Vk
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 13:52:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605898310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hB04k6BmQFwa3NAoUh0c6SZfxRFuR9AWa1v2aVbfxk4=;
 b=PwIRLYwrvqHT4UyXpKM8/TF5+veSWLwJUFRKifbdWDurUZQJ079MvHlYSUhvxknQANYIpx
 n8ByMmt5LXYNX6psf25QvY7+OTIilLtQSLwJDfWbJsIwW6p2oQgGEf5919VSH/nARVIIuw
 tzWSiorBEwXXy7CxTJNughv07hRz3Ko=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-ZCnzaR28NEuQleuWtg2vfQ-1; Fri, 20 Nov 2020 13:51:46 -0500
X-MC-Unique: ZCnzaR28NEuQleuWtg2vfQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 671DD1842159;
 Fri, 20 Nov 2020 18:51:43 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-112-88.ams2.redhat.com [10.36.112.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 26B075C1D5;
 Fri, 20 Nov 2020 18:51:30 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 02/27] vhost: Add device callback in vhost_migration_log
Date: Fri, 20 Nov 2020 19:50:40 +0100
Message-Id: <20201120185105.279030-3-eperezma@redhat.com>
In-Reply-To: <20201120185105.279030-1-eperezma@redhat.com>
References: <20201120185105.279030-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Daniel Daly <dandaly0@gmail.com>,
 virtualization@lists.linux-foundation.org, Liran Alon <liralon@gmail.com>,
 Eli Cohen <eli@mellanox.com>, Nitin Shrivastav <nitin.shrivastav@broadcom.com>,
 Alex Barba <alex.barba@broadcom.com>,
 Christophe Fontaine <cfontain@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Lee Ballard <ballle98@gmail.com>, Lars Ganrot <lars.ganrot@gmail.com>,
 Rob Miller <rob.miller@broadcom.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Howard Cai <howard.cai@gmail.com>, Parav Pandit <parav@mellanox.com>,
 vm <vmireyno@marvell.com>, Salil Mehta <mehta.salil.lnk@gmail.com>,
 Stephen Finucane <stephenfin@redhat.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Sean Mooney <smooney@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Jim Harford <jim.harford@broadcom.com>,
 Dmytro Kazantsev <dmytro.kazantsev@gmail.com>, Siwei Liu <loseweigh@gmail.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Michael Lilja <ml@napatech.com>,
 Max Gurtovoy <maxgu14@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This allows code to reuse the logic to not to re-enable or re-disable
migration mechanisms. Code works the same way as before.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 2bd8cdf893..2adb2718c1 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -862,7 +862,9 @@ err_features:
     return r;
 }
 
-static int vhost_migration_log(MemoryListener *listener, bool enable)
+static int vhost_migration_log(MemoryListener *listener,
+                               bool enable,
+                               int (*device_cb)(struct vhost_dev *, bool))
 {
     struct vhost_dev *dev = container_of(listener, struct vhost_dev,
                                          memory_listener);
@@ -877,14 +879,14 @@ static int vhost_migration_log(MemoryListener *listener, bool enable)
 
     r = 0;
     if (!enable) {
-        r = vhost_dev_set_log(dev, false);
+        r = device_cb(dev, false);
         if (r < 0) {
             goto check_dev_state;
         }
         vhost_log_put(dev, false);
     } else {
         vhost_dev_log_resize(dev, vhost_get_log_size(dev));
-        r = vhost_dev_set_log(dev, true);
+        r = device_cb(dev, true);
         if (r < 0) {
             goto check_dev_state;
         }
@@ -916,7 +918,7 @@ static void vhost_log_global_start(MemoryListener *listener)
 {
     int r;
 
-    r = vhost_migration_log(listener, true);
+    r = vhost_migration_log(listener, true, vhost_dev_set_log);
     if (r < 0) {
         abort();
     }
@@ -926,7 +928,7 @@ static void vhost_log_global_stop(MemoryListener *listener)
 {
     int r;
 
-    r = vhost_migration_log(listener, false);
+    r = vhost_migration_log(listener, false, vhost_dev_set_log);
     if (r < 0) {
         abort();
     }
-- 
2.18.4


