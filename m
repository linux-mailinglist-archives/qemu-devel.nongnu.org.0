Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A60E0316D54
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 18:52:27 +0100 (CET)
Received: from localhost ([::1]:56704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9tf8-0002G3-OT
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 12:52:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1l9tYk-0007eJ-RQ
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 12:45:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1l9tYW-00012F-AH
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 12:45:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612979135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jxwgS7NtE/BTP9v07BCS4F0vyWuLu7/Pkc6SRM5BxpU=;
 b=BKwfSlKfJ8kwajL1VD+N4pgQuOsDE6OrPPKm94rujGCGBA4gYnzB30E7VSyv7GYSe5QWy7
 9O7XsWe7RFHJqy/CrvK5/UQMeUSGFD0p1Kp5c2jZKVAlcX7pO+CHMMqXBqF6AMs3HUhEKJ
 Y0/AnIqnEbbtD62Jo127C47pmn4o1Ec=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-uAkOiyEpNtGogLNWYYWndg-1; Wed, 10 Feb 2021 12:45:34 -0500
X-MC-Unique: uAkOiyEpNtGogLNWYYWndg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC14A107ACE3;
 Wed, 10 Feb 2021 17:45:32 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-23.ams2.redhat.com [10.36.112.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD10219CAD;
 Wed, 10 Feb 2021 17:45:30 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] virtio-net: add missing object_unref()
Date: Wed, 10 Feb 2021 18:45:17 +0100
Message-Id: <20210210174518.2493928-3-lvivier@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>, quintela@redhat.com,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 jfreimann@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

failover_add_primary() calls qdev_device_add() and doesn't unref
the device. Because of that, when the device is unplugged a reference
is remaining and prevents the cleanup of the object.

This prevents to be able to plugin back the failover primary device,
with errors like:

  (qemu) device_add vfio-pci,host=0000:41:00.0,id=hostdev0,bus=root.3,failover_pair_id=net0
  (qemu) device_del hostdev0

We can check with "info qtree" and "info pci" that the device has been removed, and then:

  (qemu) device_add vfio-pci,host=0000:41:00.0,id=hostdev1,bus=root.3,failover_pair_id=net0
  Error: vfio 0000:41:00.0: device is already attached
  (qemu) device_add vfio-pci,host=0000:41:00.0,id=hostdev0,bus=root.3,failover_pair_id=net0
  qemu-kvm: Duplicate ID 'hostdev0' for device

Fixes: 21e8709b29cd ("failover: Remove primary_dev member")
Cc: quintela@redhat.com
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Jens Freimann <jfreimann@redhat.com>
---
 hw/net/virtio-net.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 5150f295e8c5..1c5af08dc556 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -862,6 +862,8 @@ static void failover_add_primary(VirtIONet *n, Error **errp)
         dev = qdev_device_add(opts, &err);
         if (err) {
             qemu_opts_del(opts);
+        } else {
+            object_unref(OBJECT(dev));
         }
     } else {
         error_setg(errp, "Primary device not found");
-- 
2.29.2


