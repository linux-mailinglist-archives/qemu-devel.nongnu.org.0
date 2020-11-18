Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA572B7989
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 09:54:09 +0100 (CET)
Received: from localhost ([::1]:52138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfJE8-0006pG-Q1
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 03:54:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIz0-0003GA-Uw
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIyy-0005ed-U8
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605688708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PScUSnzo5GHMizm0nLJO+Mk51/VpAqVCKTwHPYtrlhM=;
 b=SAhReeBKfRhK9snDfAl8miz1/zb+9QUuRH3EXJMENN5GeRTAxba1C3FNQIoQUfB/2GFk3W
 tybwOPApRhcG28VeGJVYpV5l7w2evpeNz7lBxOkxvpc3pVIri/2EP3n0c3fHVRjYVy6TlV
 IpmEpP/5vkWAISbXO7X9j1KXEOie0/8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-tRRPd2SxMOS8BJiL7oDOoQ-1; Wed, 18 Nov 2020 03:38:26 -0500
X-MC-Unique: tRRPd2SxMOS8BJiL7oDOoQ-1
Received: by mail-wm1-f70.google.com with SMTP id o203so567003wmo.3
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 00:38:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PScUSnzo5GHMizm0nLJO+Mk51/VpAqVCKTwHPYtrlhM=;
 b=l+uFlW4Imb1kQyoE5OFNCo8/QHc7Dol0pm29bzlBuMewcwQyvI0Dj1/GI9QByAExWr
 VZeVjd7rVXxjDa/oRX/UmRkMDulEX1USAizYwPvhA5yualCb/HAUGs7SIsHSFNZXWlg3
 D8SMYm6nsdDuAhMqt7UgLF/C1i+BRFU5bcv14dTHYjgyj7G3M1G+LJ9+m+6kvkcohCl5
 B+4u2HvBI7dxkXAAbsWwcG1rUuy9+iBkmwVEu9ag7+SRjpLHy1PB/R8d3yf7ZatOYWgE
 wepA04BtKNQhf547CgBlP2TTUunFZOnrFrLJeFkjTMc1UUIrG6TgqmzD9ZJB3HVdHiZp
 I/Kw==
X-Gm-Message-State: AOAM5310gXS4Qke1mfJ7EQE7n97P6SWb67creK1FeVuvcsQaSx/t8Ghf
 iZhpNjrASxupmKtHT6whq0bz75ZB23Ndq/mkJfRuU8UOjCiSLPpbsEZCQgvaS1QOkgZwnjiCg0z
 wN/D/FXRyrT7kH8O5ie2QUUXgXFKikcnMfMn8wBdEHDm8b+EZ4MrJ6QOCHAl2e29rInc=
X-Received: by 2002:a05:6000:1150:: with SMTP id
 d16mr3463534wrx.320.1605688705472; 
 Wed, 18 Nov 2020 00:38:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzWQi82sBlUDPOaTQrW8s3wcBz0VVNfaF+pwR16P+Ju6sZI5A0kJO7O678SPsi4FbBJMn+k3A==
X-Received: by 2002:a05:6000:1150:: with SMTP id
 d16mr3463514wrx.320.1605688705296; 
 Wed, 18 Nov 2020 00:38:25 -0800 (PST)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id q16sm32028418wrn.13.2020.11.18.00.38.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:38:24 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 23/27] failover: split failover_find_primary_device_id()
Date: Wed, 18 Nov 2020 09:37:44 +0100
Message-Id: <20201118083748.1328-24-quintela@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201118083748.1328-1-quintela@redhat.com>
References: <20201118083748.1328-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 00:38:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

So we can calculate the device id when we need it.

Signed-off-by: Juan Quintela <quintela@redhat.com>
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
2.26.2


