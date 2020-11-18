Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6A72B79E2
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 10:04:10 +0100 (CET)
Received: from localhost ([::1]:60248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfJNp-00050F-3F
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 04:04:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIyt-0002vx-62
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIyr-0005bw-C0
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605688700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/jGTDMTMDo6OHg04m4Nw1t8XiWyL716KsxIBNAYZE00=;
 b=KWItVvc62XTLylXAiNUUCCWAQJdxqZNmRyUXPadTnZA3Pv3OTlb/0b1iSaidoYV3Ponfex
 7jq+0Uqe0MvzfZ3eskLcUkDK74dgOV8e8NLke/odXaFKbmyDxSdDcMAImhhMBWCJ9BCW2A
 G95JlubUr/z5l/5jPVv4gn/BQp+2wn0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-ZWDSR1UKPl-osqUNYYupIw-1; Wed, 18 Nov 2020 03:38:19 -0500
X-MC-Unique: ZWDSR1UKPl-osqUNYYupIw-1
Received: by mail-wr1-f69.google.com with SMTP id w17so621265wrp.11
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 00:38:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/jGTDMTMDo6OHg04m4Nw1t8XiWyL716KsxIBNAYZE00=;
 b=kkGGZKT7xb5OkFUWb3mVvSBEXsTLOhc/7rmvX31axfRxCjSYJwBi6TNleAqyErGZzD
 TQu/fUClQy2V3rWhHj2lJfhSQZnqJm+xxKfLfvoTD4UUVFTgKCZKCqS5PqdKIJGaVYcL
 Z52N2PS9Nvmx4FXRc896khrLYtmREF+Hzp7BsUn74r/X4gYQBVXHCsGHQ0dwBcHaffNJ
 FzD4SXF0T/YvxLQ/+6KuZuJiX0gag67ErnMgoLAVfm2H7QSirxjb4zqcLljs8VjN6SVV
 iy2wJ61h81x48vy+PJ8O/+AhIEPOetoHCO6u8Hw7JslmcXlZndjwRn6LgOHiq6Msl9ku
 Du1g==
X-Gm-Message-State: AOAM531+GIrzu4IG7R6Cb0HlBjFwe86WzmWFASY6m2M2M2NU14pTK0yE
 ucwcjCXbi4WxTpYRb06qwSzbvWNGe9EWb8nFV1siLW0BdyoQPBLPE17YqTMzl/HVW02tQv+BPgc
 8d3zaz0J5cVZyIA0J+58dLHP5o/cLLhL51vq4+hjDG/yccYhG3EFkLld60mCZJElCf7w=
X-Received: by 2002:adf:f6cd:: with SMTP id y13mr3870470wrp.363.1605688697821; 
 Wed, 18 Nov 2020 00:38:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzMa78wnTOfqiVvDvaLmpBG0TV8SMTbNVSHnKtLVVCvG9XJir7YPMIvY3BquegrPFjtPN8n6A==
X-Received: by 2002:adf:f6cd:: with SMTP id y13mr3870455wrp.363.1605688697657; 
 Wed, 18 Nov 2020 00:38:17 -0800 (PST)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id b73sm9861465wmb.0.2020.11.18.00.38.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:38:17 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 18/27] failover: Rename to failover_find_primary_device()
Date: Wed, 18 Nov 2020 09:37:39 +0100
Message-Id: <20201118083748.1328-19-quintela@redhat.com>
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

This commit:
* Rename them to failover_find_primary_devices() so
  - it starts with failover_
  - it don't connect anything, just find the primary device
* Create documentation for the function

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 hw/net/virtio-net.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index c6200b924e..ff82f1017d 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -826,7 +826,13 @@ static int is_my_primary(void *opaque, QemuOpts *opts, Error **errp)
     return ret;
 }
 
-static DeviceState *virtio_net_find_primary(VirtIONet *n, Error **errp)
+/**
+ * Find the primary device for this failover virtio-net
+ *
+ * @n: VirtIONet device
+ * @errp: returns an error if this function fails
+ */
+static DeviceState *failover_find_primary_device(VirtIONet *n, Error **errp)
 {
     Error *err = NULL;
 
@@ -891,7 +897,7 @@ static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
         qatomic_set(&n->failover_primary_hidden, false);
         failover_add_primary(n, &err);
         if (err) {
-            n->primary_dev = virtio_net_find_primary(n, &err);
+            n->primary_dev = failover_find_primary_device(n, &err);
             if (err) {
                 goto out_err;
             }
@@ -3115,7 +3121,7 @@ static void virtio_net_handle_migration_primary(VirtIONet *n,
     should_be_hidden = qatomic_read(&n->failover_primary_hidden);
 
     if (!n->primary_dev) {
-        n->primary_dev = virtio_net_find_primary(n, &err);
+        n->primary_dev = failover_find_primary_device(n, &err);
         if (!n->primary_dev) {
             return;
         }
-- 
2.26.2


