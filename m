Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E69C2D32F4
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 21:04:59 +0100 (CET)
Received: from localhost ([::1]:44546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmjEI-0001Rs-Ev
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 15:04:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmimG-0006X0-IH
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:36:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmimE-0005Tr-Nw
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:36:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4y8ENnJ8kq53lYL0I8MfUcoNrhixD3RXbbagN88+yWw=;
 b=WxsflilMUxo9LxMOoLdmMwnuENpfKPqS/rf4J9Klm7tM1IcRWQicLd/riIIEf1wde4gA4u
 d6CFtvxabiHufQBfat+yh5xPwiwQNjOk4dDz3hsg46lP+HwTIUTqMu5AsU008deCew3lpc
 Xho2c2YtknjsfjFusEQhm7H0tCLUiVM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-MmPQJ3PjOr6QyrWbuZ6dgQ-1; Tue, 08 Dec 2020 14:35:53 -0500
X-MC-Unique: MmPQJ3PjOr6QyrWbuZ6dgQ-1
Received: by mail-wr1-f69.google.com with SMTP id d2so2246768wrr.5
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:35:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4y8ENnJ8kq53lYL0I8MfUcoNrhixD3RXbbagN88+yWw=;
 b=hRUy9DvFcI3bCwNTmYpyqc+o5B9qgossr4bMlAChl2H/V/iidR1KDTUG+BGFesbqvj
 P9+y1fm7WX/t4QvMdkCsBXJ0YG4bJTViTLNfqmGaEQ5r7XtDMolWXog2L6Vr/wBKpijT
 /9OcAk/Hy2XIz/HWtU/knaOEJTwNE9KLQDaGLWycy9dOLo4Idn/AbHsciqvUFKkFt7hP
 DnYGCPUDbfRbvGoBR+zXWcd8wrHbRJ21MqBeCH1zoWVW4yN2sbrDQfvw6wxv9CqClIe3
 r0YRtSca2eAh8ycn7CGNGaPQdkyi/U+mD+bekWrLNEP6JM4c8QstrWRynfxGKsxw8im9
 AHqg==
X-Gm-Message-State: AOAM532+IBnp0ftzXdaBJCfvXGkwscuig4GKOavyj14hcKjAM3ZBZPXs
 5bw3uwnt06PGNauJEvLXwf+m9SzIPnQiagm55O99Oa6D5ELf9czaKRsFS3FVJXACnvByub4F5uc
 forudvv2GnACOEYck5oDrkzEcbNtsIifs5RrWzl9TBL33U0Y9r4QvPkq+qaaN
X-Received: by 2002:adf:c648:: with SMTP id u8mr26797233wrg.215.1607456152186; 
 Tue, 08 Dec 2020 11:35:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+KqgvNidHXiuGndNUpb+XIXtefCnoJAc+/VTO6F/Y3wsa4oVEgxWiqqlGsIMU52/ABnwRAw==
X-Received: by 2002:adf:c648:: with SMTP id u8mr26797212wrg.215.1607456151880; 
 Tue, 08 Dec 2020 11:35:51 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id b9sm5404334wmd.32.2020.12.08.11.35.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:35:51 -0800 (PST)
Date: Tue, 8 Dec 2020 14:35:48 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 38/66] failover: split failover_find_primary_device_id()
Message-ID: <20201208193307.646726-39-mst@redhat.com>
References: <20201208193307.646726-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201208193307.646726-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Juan Quintela <quintela@redhat.com>

So we can calculate the device id when we need it.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20201118083748.1328-24-quintela@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/virtio-net.c | 63 +++++++++++++++++++++++++++++++++------------
 1 file changed, 47 insertions(+), 16 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index b994796734..2c502c13fd 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -788,6 +788,49 @@ static inline uint64_t virtio_net_supported_guest_offloads(VirtIONet *n)
     return virtio_net_guest_offloads_by_features(vdev->guest_features);
 }
 
+typedef struct {
+    VirtIONet *n;
+    char *id;
+} FailoverId;
+
+/**
+ * Set the id of the failover primary device
+ *
+ * @opaque: FailoverId to setup
+ * @opts: opts for device we are handling
+ * @errp: returns an error if this function fails
+ */
+static int failover_set_primary(void *opaque, QemuOpts *opts, Error **errp)
+{
+    FailoverId *fid = opaque;
+    const char *standby_id = qemu_opt_get(opts, "failover_pair_id");
+
+    if (g_strcmp0(standby_id, fid->n->netclient_name) == 0) {
+        fid->id = g_strdup(opts->id);
+        return 1;
+    }
+
+    return 0;
+}
+
+/**
+ * Find the primary device id for this failover virtio-net
+ *
+ * @n: VirtIONet device
+ * @errp: returns an error if this function fails
+ */
+static char *failover_find_primary_device_id(VirtIONet *n)
+{
+    Error *err = NULL;
+    FailoverId fid;
+
+    if (!qemu_opts_foreach(qemu_find_opts("device"),
+                           failover_set_primary, &fid, &err)) {
+        return NULL;
+    }
+    return fid.id;
+}
+
 static void failover_add_primary(VirtIONet *n, Error **errp)
 {
     Error *err = NULL;
@@ -812,20 +855,6 @@ static void failover_add_primary(VirtIONet *n, Error **errp)
     error_propagate(errp, err);
 }
 
-static int is_my_primary(void *opaque, QemuOpts *opts, Error **errp)
-{
-    VirtIONet *n = opaque;
-    int ret = 0;
-    const char *standby_id = qemu_opt_get(opts, "failover_pair_id");
-
-    if (g_strcmp0(standby_id, n->netclient_name) == 0) {
-        n->primary_device_id = g_strdup(opts->id);
-        ret = 1;
-    }
-
-    return ret;
-}
-
 /**
  * Find the primary device for this failover virtio-net
  *
@@ -834,11 +863,13 @@ static int is_my_primary(void *opaque, QemuOpts *opts, Error **errp)
  */
 static DeviceState *failover_find_primary_device(VirtIONet *n)
 {
-    Error *err = NULL;
+    char *id = failover_find_primary_device_id(n);
 
-    if (!qemu_opts_foreach(qemu_find_opts("device"), is_my_primary, n, &err)) {
+    if (!id) {
         return NULL;
     }
+    n->primary_device_id = g_strdup(id);
+
     return qdev_find_recursive(sysbus_get_default(), n->primary_device_id);
 }
 
-- 
MST


