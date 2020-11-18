Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 204AF2B79B6
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 09:59:43 +0100 (CET)
Received: from localhost ([::1]:43268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfJJW-0006Mx-4q
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 03:59:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIz8-0003Yz-08
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIz6-0005hh-3F
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605688715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UpaUk+ACBC4f62mVNQkHaVFxtHEivSP3ZKjo3c+Mo1U=;
 b=UK3L4yHxo2+v7ZsDwCw9pGgcgW/dw1XdlI/zZwVAIFgckVeqbIz/aKcGntHTZ0BpBGcpip
 Pn5JYSKht2uyRpLmL+zZw+03ojC9IOmfRByp/CQH8A6P+E/rSFRp7ynvGbnTJONRDFncRX
 DT4BEd0RYeO6fs5Fb8JnhVV5JzbPdVc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-9iP9svn_PAKnRdi8ozTHTA-1; Wed, 18 Nov 2020 03:38:31 -0500
X-MC-Unique: 9iP9svn_PAKnRdi8ozTHTA-1
Received: by mail-wm1-f70.google.com with SMTP id k128so719725wme.7
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 00:38:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UpaUk+ACBC4f62mVNQkHaVFxtHEivSP3ZKjo3c+Mo1U=;
 b=V3kdBX8hlTzRqekUXt7nt8nIA1T0ZHAAgBXCNBf6SbpoS1qqpumLQVigC3JAcaBBzB
 MqxWmboAihAVFwXS0DC93dRWjO65LVE0kiYBZgvhOA8v/vlBoouS81liWjwIxnj0Jyd+
 D8XI7gLwZtmnaSzyEAzFuuYQOXA6YsybASIqHSq+3oSa4N3kQwaVLaquAAxZUQac61ZZ
 4QcvbLn6zt/IL7LQRIz1jMxhWOzKgK7PzTXp/mgWN9B6yhmMCG9TCHCDp5C6uH3zSUkk
 RxZQlGksWIQjSYXwhDCWNwssdgfyePUZH6OevqHJLUTEXryCYiOkZ+Y5WCFdr/D21lXS
 ewGA==
X-Gm-Message-State: AOAM532YJsx9uYxTFlc82x1iJXu1anDP3+PUOoTCmyJE3U8zhu4heUV1
 ZpL6VMwQnQTcdFcImRj+OkGmUDspZTVVAg2vwSK8ZiKKZfYeNZDHPEN21cZE2PZ5cPIcFWLXd/6
 LOeIAnpm0kXJQyiRGfNm2Ku4fSAfrkPclKTKBRMPxbJVWMrQPUPKWPeQYJAtt06L1Sa0=
X-Received: by 2002:adf:f005:: with SMTP id j5mr3518822wro.417.1605688710136; 
 Wed, 18 Nov 2020 00:38:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyIcEpMbmK5cM7k2jrzahbeWATa3QR7zbwOui3uF6UH9PqmQak7+sTMrVnQ3ycYHrhi1eBvsQ==
X-Received: by 2002:adf:f005:: with SMTP id j5mr3518794wro.417.1605688709913; 
 Wed, 18 Nov 2020 00:38:29 -0800 (PST)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id w21sm2361887wmi.29.2020.11.18.00.38.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:38:29 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 26/27] failover: simplify failover_unplug_primary
Date: Wed, 18 Nov 2020 09:37:47 +0100
Message-Id: <20201118083748.1328-27-quintela@redhat.com>
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

We can calculate device just once.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 hw/net/virtio-net.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index b37e9cd1d9..9203d81780 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3146,34 +3146,29 @@ out:
     return !err;
 }
 
-static void virtio_net_handle_migration_primary(VirtIONet *n,
-                                                MigrationState *s)
+static void virtio_net_handle_migration_primary(VirtIONet *n, MigrationState *s)
 {
     bool should_be_hidden;
     Error *err = NULL;
+    DeviceState *dev = failover_find_primary_device(n);
+
+    if (!dev) {
+        return;
+    }
 
     should_be_hidden = qatomic_read(&n->failover_primary_hidden);
 
-    if (!n->primary_dev) {
-        n->primary_dev = failover_find_primary_device(n);
-        if (!n->primary_dev) {
-            return;
-        }
-    }
-
     if (migration_in_setup(s) && !should_be_hidden) {
-        if (failover_unplug_primary(n, n->primary_dev)) {
-            vmstate_unregister(VMSTATE_IF(n->primary_dev),
-                               qdev_get_vmsd(n->primary_dev),
-                               n->primary_dev);
-            qapi_event_send_unplug_primary(n->primary_dev->id);
+        if (failover_unplug_primary(n, dev)) {
+            vmstate_unregister(VMSTATE_IF(dev), qdev_get_vmsd(dev), dev);
+            qapi_event_send_unplug_primary(dev->id);
             qatomic_set(&n->failover_primary_hidden, true);
         } else {
             warn_report("couldn't unplug primary device");
         }
     } else if (migration_has_failed(s)) {
         /* We already unplugged the device let's plug it back */
-        if (!failover_replug_primary(n, n->primary_dev, &err)) {
+        if (!failover_replug_primary(n, dev, &err)) {
             if (err) {
                 error_report_err(err);
             }
-- 
2.26.2


