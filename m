Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5852B79B0
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 09:57:53 +0100 (CET)
Received: from localhost ([::1]:36128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfJHk-0003Sx-Hj
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 03:57:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIys-0002uz-OS
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIyq-0005bo-VI
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605688700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TKjA9dVcSC0JEo7h0l2QsV1O0jLd78r7tcrL0jEGH+0=;
 b=ST+hcccdbNu4lvsu1Uz1nq+JjyJd0i7w6utOlp9qqwS8FyCVTiqbZ7ZE/xm3QMwYrNDz5m
 TEiBgjX5zmYKPr9mn32+elTBsuNaIyOxAT2ew6WJ726fT4W8EETNrtS56HCpF8JdxZwQnW
 XNFZrormz/kCfncgs3nITWL+pzpgWFk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-ViXRwuRgNAi_shaNWq27zw-1; Wed, 18 Nov 2020 03:38:17 -0500
X-MC-Unique: ViXRwuRgNAi_shaNWq27zw-1
Received: by mail-wm1-f69.google.com with SMTP id a134so558335wmd.8
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 00:38:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TKjA9dVcSC0JEo7h0l2QsV1O0jLd78r7tcrL0jEGH+0=;
 b=LTdkOKcML4ibBCPZ6O5taB+ciq21ljAJWdeNB4ZK5MPcbtd5e5BK0YW5HtnLn7IGMl
 kUJDRb6dd6x4LJwD8W0jxjGniYyXlEtpAdwnROC1IoNPPWvrLXrfBU1ijGpo3Ph1l/xv
 k3tkOvOzpytSZXgzd4n9AWNvLKLX90SIZsf8s9xKFTvCiZyLv6AzB2xR5Aek+7HL75e+
 nzz7Whe4xWRvLtD/YR1ymLWFTpHImT9ecXAGpEL8oH4xx3/ZxyyHLO2Bp0LzlAk1mFTJ
 ojOY1VtbmVdyTdVUnXL/QWMQjEBBjj8mJ8rZq+toWYiPdRR6IDY3daU9cl6NmvYAsh4X
 U2eA==
X-Gm-Message-State: AOAM530jTLmw90B2xF4bY2FSmYQULysIDyokqn+BkRn2l3TgsePPFCFE
 aXs+ck9dJmLriiOFMcakMU5q37Y8yaDfmxdqC1NX1/0XuOdKA4eul7WVqMCk0xcVx2Ih+R+VrKw
 fgMEr/kUWB8TQ9NBHjq88mOm3Dw5E/idkXK+Hazmd9p0U8CpLYQSdt1xFAdFFHJSg93E=
X-Received: by 2002:a1c:f619:: with SMTP id w25mr2747714wmc.55.1605688696388; 
 Wed, 18 Nov 2020 00:38:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx2Z0hFfkJPnfbVKb/odaNN59PeojixyRUrhTUvaE68XwjYCtkthUqBl7jNVtdVu3hDbGrqug==
X-Received: by 2002:a1c:f619:: with SMTP id w25mr2747692wmc.55.1605688696177; 
 Wed, 18 Nov 2020 00:38:16 -0800 (PST)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id f16sm32438410wrp.66.2020.11.18.00.38.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:38:15 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/27] failover: virtio_net_connect_failover_devices() does
 nothing
Date: Wed, 18 Nov 2020 09:37:38 +0100
Message-Id: <20201118083748.1328-18-quintela@redhat.com>
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

It just calls virtio_net_find_primary(), so just update the callers.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 hw/net/virtio-net.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 747614ff2a..c6200b924e 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -836,19 +836,6 @@ static DeviceState *virtio_net_find_primary(VirtIONet *n, Error **errp)
     return qdev_find_recursive(sysbus_get_default(), n->primary_device_id);
 }
 
-static DeviceState *virtio_connect_failover_devices(VirtIONet *n, Error **errp)
-{
-    DeviceState *prim_dev = NULL;
-    Error *err = NULL;
-
-    prim_dev = virtio_net_find_primary(n, &err);
-    if (!prim_dev) {
-        error_propagate(errp, err);
-    }
-
-    return prim_dev;
-}
-
 static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
 {
     VirtIONet *n = VIRTIO_NET(vdev);
@@ -904,7 +891,7 @@ static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
         qatomic_set(&n->failover_primary_hidden, false);
         failover_add_primary(n, &err);
         if (err) {
-            n->primary_dev = virtio_connect_failover_devices(n, &err);
+            n->primary_dev = virtio_net_find_primary(n, &err);
             if (err) {
                 goto out_err;
             }
@@ -3128,7 +3115,7 @@ static void virtio_net_handle_migration_primary(VirtIONet *n,
     should_be_hidden = qatomic_read(&n->failover_primary_hidden);
 
     if (!n->primary_dev) {
-        n->primary_dev = virtio_connect_failover_devices(n, &err);
+        n->primary_dev = virtio_net_find_primary(n, &err);
         if (!n->primary_dev) {
             return;
         }
-- 
2.26.2


