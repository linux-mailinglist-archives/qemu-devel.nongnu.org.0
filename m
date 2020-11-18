Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E102B798C
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 09:55:02 +0100 (CET)
Received: from localhost ([::1]:55974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfJEz-0008OT-0s
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 03:55:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIyh-0002Sk-KQ
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIyf-0005Xr-Kr
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605688688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Zs9QCYAUuykjnvuko8MIrrIrOFsDvt5vyAiRoVxnno=;
 b=HePSqY/S0uxIi+m8N0JpBQg6We5muBlC5gaD13xcZi0NfioHKX8YeEsWwdqXGD1f7AIJbm
 WrNPqjvnj9V8WunIZJvYx7BQRdyG7/VEB1aEy35QrAy+RagY61kpQKHQwLPHxFCu4UXsM1
 irMBwK2gL30KnCW5v7lKOXlbm+ULGSM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-mPwZL6TlN6uHNXFt4X9B1g-1; Wed, 18 Nov 2020 03:38:07 -0500
X-MC-Unique: mPwZL6TlN6uHNXFt4X9B1g-1
Received: by mail-wr1-f69.google.com with SMTP id 91so615444wrk.17
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 00:38:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3Zs9QCYAUuykjnvuko8MIrrIrOFsDvt5vyAiRoVxnno=;
 b=lNyDaAJpphzu0OciwlSel/Rpk3NQMtq5IgrXmFWJSRY4Xk6D40qPStjzdDHabi4Meg
 EKw9srEZcHA25jWfHqJoS+ukvZciHnq1pn7crm0C75/+xMtY/MEJaOgvT5BCkl7H/mGV
 zYI0+2RwrOCNokdOt5R4sudoDD7MPbA965NSwORorytonJKUEv81Q6Lp5+B1JxsvA5Kq
 nBwB8pWPSb7f0/PlspGKUI5QZD6oozSFIanhaxUfUmm+hw8d7YLjMcXuCC+h4Nmsmoa7
 kc4qyA3Ne7LHqnJqedhUvG89/bftRqrP3cSCm+LAXDohKqNvh7J0autzr70xJShQqOou
 C3LQ==
X-Gm-Message-State: AOAM532OU4Ou57qiUAOXR4Y0UTiRTv68oJJ4mIUwLUXwTXmeuvGCJ5i1
 hH/Z7iJd7TYU+BJ2y+ZEu/GGFQLd9POkm0TRixAp003kjHBeQrYzEk0GFmfEp67E9oCZrT1rinY
 sRQDqGvAWxU3UjJWPe+MiXYESP2NcIdwh660MkoPrFTbiUXYubNMbWMlkzH7LgqBc61k=
X-Received: by 2002:adf:8284:: with SMTP id 4mr3719802wrc.386.1605688685954;
 Wed, 18 Nov 2020 00:38:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxXokDvITtCK9TN/q66TK+7Ij1fty9nfH6vKNG0V2pu+AOtvXt6bnGJUCwnWSDzkuQPbbjlgA==
X-Received: by 2002:adf:8284:: with SMTP id 4mr3719781wrc.386.1605688685768;
 Wed, 18 Nov 2020 00:38:05 -0800 (PST)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id h17sm26727027wrp.54.2020.11.18.00.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:38:05 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/27] failover: Remove primary_device_opts
Date: Wed, 18 Nov 2020 09:37:31 +0100
Message-Id: <20201118083748.1328-11-quintela@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It was really only used once, in failover_add_primary().  Just search
for it on global opts when it is needed.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 include/hw/virtio/virtio-net.h |  1 -
 hw/net/virtio-net.c            | 21 +++++----------------
 2 files changed, 5 insertions(+), 17 deletions(-)

diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
index ca68be759f..7159e6c0a0 100644
--- a/include/hw/virtio/virtio-net.h
+++ b/include/hw/virtio/virtio-net.h
@@ -202,7 +202,6 @@ struct VirtIONet {
     AnnounceTimer announce_timer;
     bool needs_vnet_hdr_swap;
     bool mtu_bypass_backend;
-    QemuOpts *primary_device_opts;
     QDict *primary_device_dict;
     DeviceState *primary_dev;
     char *primary_device_id;
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index e334f05352..2a99b0e0f6 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -791,17 +791,17 @@ static inline uint64_t virtio_net_supported_guest_offloads(VirtIONet *n)
 static void failover_add_primary(VirtIONet *n, Error **errp)
 {
     Error *err = NULL;
+    QemuOpts *opts;
 
     if (n->primary_dev) {
         return;
     }
 
-    n->primary_device_opts = qemu_opts_find(qemu_find_opts("device"),
-                                            n->primary_device_id);
-    if (n->primary_device_opts) {
-        n->primary_dev = qdev_device_add(n->primary_device_opts, &err);
+    opts = qemu_opts_find(qemu_find_opts("device"), n->primary_device_id);
+    if (opts) {
+        n->primary_dev = qdev_device_add(opts, &err);
         if (err) {
-            qemu_opts_del(n->primary_device_opts);
+            qemu_opts_del(opts);
         }
     } else {
         error_setg(errp, "Primary device not found");
@@ -856,7 +856,6 @@ static DeviceState *virtio_connect_failover_devices(VirtIONet *n, Error **errp)
     prim_dev = virtio_net_find_primary(n, &err);
     if (prim_dev) {
         n->primary_device_id = g_strdup(prim_dev->id);
-        n->primary_device_opts = prim_dev->opts;
     } else {
         error_propagate(errp, err);
     }
@@ -3113,14 +3112,6 @@ static bool failover_replug_primary(VirtIONet *n, Error **errp)
     if (!pdev->partially_hotplugged) {
         return true;
     }
-    if (!n->primary_device_opts) {
-        n->primary_device_opts = qemu_opts_from_qdict(qemu_find_opts("device"),
-                                                      n->primary_device_dict,
-                                                      errp);
-        if (!n->primary_device_opts) {
-            return false;
-        }
-    }
     primary_bus = n->primary_dev->parent_bus;
     if (!primary_bus) {
         error_setg(errp, "virtio_net: couldn't find primary bus");
@@ -3211,8 +3202,6 @@ static int virtio_net_primary_should_be_hidden(DeviceListener *listener,
         goto out;
     }
 
-    n->primary_device_opts = device_opts;
-
     /* failover_primary_hidden is set during feature negotiation */
     hide = qatomic_read(&n->failover_primary_hidden);
 
-- 
2.26.2


