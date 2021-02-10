Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A334316D65
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 18:55:51 +0100 (CET)
Received: from localhost ([::1]:36536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9tiQ-00062x-G4
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 12:55:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1l9tYo-0007fk-3j
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 12:45:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1l9tYa-00013P-CT
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 12:45:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612979138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BZxSqmlJG2Scv7NK7OxzylGd6LnBR15diGzo7UDhz9s=;
 b=Wup5szjUzTfekFneW5PzFDtJXo8Om3ZLwgziL5IHGO3hlRX4Q15P792dfbkYNmOXBzWCbO
 Sds5a/4z4LlMjkEPkzJgjFr1lrVuPDRIWZ7htM2hBMXEsbM8iVeMeMcDaQBniUd0GVrBYi
 TzbR4StB8TZhPtu7hfy+/EWIOwFPYcg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-5BphYwvMPtWGRPdH0tEewQ-1; Wed, 10 Feb 2021 12:45:36 -0500
X-MC-Unique: 5BphYwvMPtWGRPdH0tEewQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30517195D561;
 Wed, 10 Feb 2021 17:45:35 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-23.ams2.redhat.com [10.36.112.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1DEE719809;
 Wed, 10 Feb 2021 17:45:32 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] failover: really display a warning when the primary
 device is not found
Date: Wed, 10 Feb 2021 18:45:18 +0100
Message-Id: <20210210174518.2493928-4-lvivier@redhat.com>
In-Reply-To: <20210210174518.2493928-1-lvivier@redhat.com>
References: <20210210174518.2493928-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>, quintela@redhat.com,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 jfreimann@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In failover_add_primary(), we search the id of the failover device by
scanning the list of the devices in the opts list to find a device with
a failover_pair_id equals to the id of the virtio-net device.

If the failover_pair_id is not found, QEMU ignores the primary
device silently (which also means it will not be hidden and
it will be enabled directly at boot).

After that, we search the id in the opts list to do a qdev_device_add()
with it. The device will be always found as otherwise we had exited
before, and thus the warning is never displayed.

Fix that by moving the error report to the first exit condition.
Also add a g_assert() to be sure the compiler will not complain
about a possibly NULL pointer.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 hw/net/virtio-net.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 1c5af08dc556..439f823b190c 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -855,21 +855,19 @@ static void failover_add_primary(VirtIONet *n, Error **errp)
 
     id = failover_find_primary_device_id(n);
     if (!id) {
+        error_setg(errp, "Primary device not found");
+        error_append_hint(errp, "Virtio-net failover will not work. Make "
+                          "sure primary device has parameter"
+                          " failover_pair_id=%s\n", n->netclient_name);
         return;
     }
     opts = qemu_opts_find(qemu_find_opts("device"), id);
-    if (opts) {
-        dev = qdev_device_add(opts, &err);
-        if (err) {
-            qemu_opts_del(opts);
-        } else {
-            object_unref(OBJECT(dev));
-        }
+    g_assert(opts); /* cannot be NULL because id was found using opts list */
+    dev = qdev_device_add(opts, &err);
+    if (err) {
+        qemu_opts_del(opts);
     } else {
-        error_setg(errp, "Primary device not found");
-        error_append_hint(errp, "Virtio-net failover will not work. Make "
-                          "sure primary device has parameter"
-                          " failover_pair_id=<virtio-net-id>\n");
+        object_unref(OBJECT(dev));
     }
     error_propagate(errp, err);
 }
-- 
2.29.2


