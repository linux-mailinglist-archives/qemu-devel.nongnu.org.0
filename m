Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 995682D4980
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 19:53:09 +0100 (CET)
Received: from localhost ([::1]:56612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn4aK-0008FM-Ku
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 13:53:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3uW-0003iA-UT
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:09:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3uS-0008Up-0O
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:09:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QowV/giP343KnzfILfGamLCO9JCQa97xX2d65deKp4E=;
 b=F9Rp19SAMoXTNUm50xkFFFd2hRACdkLJP/rOZn+u/Aa8qyuatL8OEBa1jNaYLKaujERHv8
 FX34Ur4HS2YISuuF7jft9K49q3fKH4KLyzTI8uMLNdzDTZk8prGFfE2jP+SO/bu5+e8Xl0
 PWJpJHBVVKEtUrpyAUuWGmSuNcxtNZM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-UjOa8a6oMLaxDA2h_l9xDQ-1; Wed, 09 Dec 2020 13:09:48 -0500
X-MC-Unique: UjOa8a6oMLaxDA2h_l9xDQ-1
Received: by mail-wm1-f70.google.com with SMTP id k128so868236wme.7
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:09:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QowV/giP343KnzfILfGamLCO9JCQa97xX2d65deKp4E=;
 b=Uo0JwRncE3lB/40gvQiLS7ID9bje9iG1PvVqC9x7EakZ2IZrk/ccjrd2hQNL2blodq
 w6OW58Ab8uosvlvzJOtlaQ0wU8Hr5SGDK5bdab63Cy8/rKKkJhxKPBYPpCjEivqVTW90
 b67UWooRCSxrTvYrI1O5k1Rg6+0lhP0omeKal1yFPY+7MgdTyAxPAuykJZwAj0J/03x3
 Fi0zj5sdd3zTvi8zIdfuE6vunbS+O9+xnQS/OlsoHLxzHi4W18Wage/AZqNgaVTfANdi
 HJezKXYmTwr3XvW2R3IQqUV4lbQ8WGYlmWB9x+KPRIDbcarpHmfHpCG7K4pDp0G5f1o8
 NGNA==
X-Gm-Message-State: AOAM533oWIvoCrKbt4JNRMDfCUo+0Cf4K8y26gx6gcGJi363tRmBUGm1
 I7SrcS/k3gbfbu6oFEo2bagSBskkpYL+t522LTRCHX1q7IfuRQ4pwI2X+XPe3pqCQw9T0rOz1f5
 MuYkO/hJtioy+2sN0H+zpU9YBSks1nRDC3Q8CMvDQPXtycMBJK61DMCqfskty
X-Received: by 2002:adf:e5c7:: with SMTP id a7mr4088660wrn.300.1607537387105; 
 Wed, 09 Dec 2020 10:09:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxqaYTgjwcEMZwVWzGT7ufVqJH5LjcJ8oxX/NZABA6E+PWZPHhO4KJZ1hi5FTmDwcum7c9CHg==
X-Received: by 2002:adf:e5c7:: with SMTP id a7mr4088638wrn.300.1607537386888; 
 Wed, 09 Dec 2020 10:09:46 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id w12sm5681957wre.57.2020.12.09.10.09.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:09:46 -0800 (PST)
Date: Wed, 9 Dec 2020 13:09:44 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 41/65] failover: simplify failover_unplug_primary
Message-ID: <20201209180546.721296-42-mst@redhat.com>
References: <20201209180546.721296-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201209180546.721296-1-mst@redhat.com>
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
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

We can calculate device just once.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20201118083748.1328-27-quintela@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
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
MST


