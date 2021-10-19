Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90853432F43
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 09:21:31 +0200 (CEST)
Received: from localhost ([::1]:33382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcjRA-0007w3-Bq
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 03:21:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mcjMG-0003EH-KA
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:16:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mcjMF-0005J6-13
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:16:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634627782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KUFoCN50rdSSVjE7HaqIY2uzdyARcugkhlW7pMfuSvk=;
 b=TlyWtkZ+d8kTiqcp3MBJLHgkUOvfgZqsjHAmxW//wDhhzI9iqEPJrztqOxD9d0z7x/qfqJ
 I/XRM7A/ZPPzNjBCVj+/J9xkyV1rhGSNQkU59gz4WJcRLShkP7RatqSxO4Yyv/pJM5o+Uu
 YKKd54kVsAuUw8rOBAKol8q4Mz/KLfw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-c34XGLrEMrWRNdToy72czQ-1; Tue, 19 Oct 2021 03:16:20 -0400
X-MC-Unique: c34XGLrEMrWRNdToy72czQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1383B18414A6
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 07:16:20 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.193.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 324D469203;
 Tue, 19 Oct 2021 07:16:00 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] failover: fix a regression introduced by JSON'ification
 of -device
Date: Tue, 19 Oct 2021 09:15:31 +0200
Message-Id: <20211019071532.682717-2-lvivier@redhat.com>
In-Reply-To: <20211019071532.682717-1-lvivier@redhat.com>
References: <20211019071532.682717-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The hide_device helper can be called several times for the same
devices as it shouldn't change any state and should only return an
information.

But not to rely anymore on QemuOpts we have introduced a new field
to store the parameters of the device and don't allow to update it
once it is done.

And as the function is called several times, we ends with:

  warning: Cannot attach more than one primary device to 'virtio0'

That is not only a warning as it prevents to hide the device and breaks
failover.

Fix that by checking the device id.

Now, we fail only if the virtio-net device is really used by two different
devices, for instance:

   -device virtio-net-pci,id=virtio0,failover=on,... \
   -device vfio-pci,id=hostdev0,failover_pair_id=virtio0,... \
   -device e1000e,id=e1000e0,failover_pair_id=virtio0,... \

will exit with:

  Cannot attach more than one primary device to 'virtio0': 'hostdev0' and 'e1000e0'

Fixes: 259a10dbcb4f ("virtio-net: Store failover primary opts pointer locally")
Cc: kwolf@redhat.com
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 hw/net/virtio-net.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 09e173a55854..83642c85b2e5 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3304,15 +3304,27 @@ static bool failover_hide_primary_device(DeviceListener *listener,
         return false;
     }
 
+    /*
+     * The hide helper can be called several times for a given device.
+     * Check there is only one primary for a virtio-net device but
+     * don't duplicate the qdict several times if it's called for the same
+     * device.
+     */
     if (n->primary_opts) {
-        error_setg(errp, "Cannot attach more than one primary device to '%s'",
-                   n->netclient_name);
-        return false;
+        const char *old, *new;
+        /* devices with failover_pair_id always have an id */
+        old = qdict_get_str(n->primary_opts, "id");
+        new = qdict_get_str(device_opts, "id");
+        if (strcmp(old, new) != 0) {
+            error_setg(errp, "Cannot attach more than one primary device to "
+                       "'%s': '%s' and '%s'", n->netclient_name, old, new);
+            return false;
+        }
+    } else {
+        n->primary_opts = qdict_clone_shallow(device_opts);
+        n->primary_opts_from_json = from_json;
     }
 
-    n->primary_opts = qdict_clone_shallow(device_opts);
-    n->primary_opts_from_json = from_json;
-
     /* failover_primary_hidden is set during feature negotiation */
     return qatomic_read(&n->failover_primary_hidden);
 }
-- 
2.31.1


