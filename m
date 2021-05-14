Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 726DC380E33
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 18:29:57 +0200 (CEST)
Received: from localhost ([::1]:47584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhahI-0004xw-HJ
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 12:29:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lhaJ3-00071V-Iq
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:04:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lhaJ1-0005Y3-Jm
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:04:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621008290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/VCUv0qZKb+E+ta3d7/YT9xaI00WSPedF5tOxAexego=;
 b=DPdPj3c0sLPI3IBTMCx3Mq9BWKLu3oYaibez/2zMV7NxVC6/7FX2GMX+obiWpx8C9zxtQA
 aezc3Wp3ZEfrM5ecknEuaEk/DmxXtymF1+gbtmYi8QV5Hhe4tBtuqGyEMC/zHMQstnOZ29
 PUeHz/5RTYWO7wB9KDFsstg5MC0lU5U=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-KwcMEaXLO12fPn2T46FvCg-1; Fri, 14 May 2021 12:04:48 -0400
X-MC-Unique: KwcMEaXLO12fPn2T46FvCg-1
Received: by mail-wm1-f71.google.com with SMTP id
 n127-20020a1c27850000b02901717a27c785so1234898wmn.9
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 09:04:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/VCUv0qZKb+E+ta3d7/YT9xaI00WSPedF5tOxAexego=;
 b=JOksOpTInlcOksvV9lDUOdTQPWaprQXIHj22YQtUmuDiQinaYnHQfzW1PrMdVTXv7Y
 sSWmURTvMr/3GOJS/CmNJV/hFyUf83iXC8d0mnomsZ2CoSm10UUtxl3UbhgfdcYFiKKT
 OUc6yU+GoJ6N+9lWmPK/5HC984ri8MKd0UxXMDWGnyE0mbym1ot76Y+4JwiaY/M23DUJ
 q1pYE45k4B5grjGzRmphUJiuTz7XCrX7QmOb4g9ZwCRMg0gecEz9ji1OjH5UkTYEYmRr
 DnWFiKajzgJvGVQGYKbkVLe4PdJeIWSRlrPbMPeA+lCAgumzX3TyC+963cgpWTbPYo5s
 S0gw==
X-Gm-Message-State: AOAM531TUlffytVbYcdpOM4T5zVa9NbL07t9Qsjx7l+ON7/Uf3ubQeWs
 Vyq4wCLBpJwoxlSilNU785AMbdZIXmf+Lzy0FG96GISrq7zgyt2UgLWQt7/Th/sGgphAUYkxPTy
 kJFZEkxEI6+M2hWZWG6v9eXBkdRo4GEF9ISFAxrh8hTWYdClifnUMkd5F9uw9
X-Received: by 2002:a5d:59a9:: with SMTP id p9mr58319712wrr.289.1621008285854; 
 Fri, 14 May 2021 09:04:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFe5fv45I1cuQo2HnWAXoAQDhZ2FzCFR+N4ARju4DU5JCMojFNnDKE6v4rB5qWvGvj/pVsEw==
X-Received: by 2002:a5d:59a9:: with SMTP id p9mr58318971wrr.289.1621008275852; 
 Fri, 14 May 2021 09:04:35 -0700 (PDT)
Received: from redhat.com ([2a10:800c:1fa6:0:3809:fe0c:bb87:250e])
 by smtp.gmail.com with ESMTPSA id i14sm11822512wmb.33.2021.05.14.09.04.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 09:04:35 -0700 (PDT)
Date: Fri, 14 May 2021 12:04:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/16] virtio-scsi: Configure all host notifiers in a single
 MR transaction
Message-ID: <20210514160245.91918-12-mst@redhat.com>
References: <20210514160245.91918-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210514160245.91918-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

This allows the virtio-scsi-pci device to batch the setup of all its
host notifiers. This significantly improves boot time of VMs with a
high number of vCPUs, e.g. from 6m5.563s down to 1m2.884s for a
pseries machine with 384 vCPUs.

Note that memory_region_transaction_commit() must be called before
virtio_bus_cleanup_host_notifier() because the latter might close
ioeventfds that the transaction still assumes to be around when it
commits.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20210407143501.244343-5-groug@kaod.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/scsi/virtio-scsi-dataplane.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/hw/scsi/virtio-scsi-dataplane.c b/hw/scsi/virtio-scsi-dataplane.c
index b2cb3d9dcc..28e003250a 100644
--- a/hw/scsi/virtio-scsi-dataplane.c
+++ b/hw/scsi/virtio-scsi-dataplane.c
@@ -152,6 +152,8 @@ int virtio_scsi_dataplane_start(VirtIODevice *vdev)
         goto fail_guest_notifiers;
     }
 
+    memory_region_transaction_begin();
+
     rc = virtio_scsi_set_host_notifier(s, vs->ctrl_vq, 0);
     if (rc != 0) {
         goto fail_host_notifiers;
@@ -173,6 +175,8 @@ int virtio_scsi_dataplane_start(VirtIODevice *vdev)
         vq_init_count++;
     }
 
+    memory_region_transaction_commit();
+
     aio_context_acquire(s->ctx);
     virtio_queue_aio_set_host_notifier_handler(vs->ctrl_vq, s->ctx,
                                             virtio_scsi_data_plane_handle_ctrl);
@@ -192,6 +196,11 @@ int virtio_scsi_dataplane_start(VirtIODevice *vdev)
 fail_host_notifiers:
     for (i = 0; i < vq_init_count; i++) {
         virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), i, false);
+    }
+
+    memory_region_transaction_commit();
+
+    for (i = 0; i < vq_init_count; i++) {
         virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), i);
     }
     k->set_guest_notifiers(qbus->parent, vs->conf.num_queues + 2, false);
@@ -229,8 +238,15 @@ void virtio_scsi_dataplane_stop(VirtIODevice *vdev)
 
     blk_drain_all(); /* ensure there are no in-flight requests */
 
+    memory_region_transaction_begin();
+
     for (i = 0; i < vs->conf.num_queues + 2; i++) {
         virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), i, false);
+    }
+
+    memory_region_transaction_commit();
+
+    for (i = 0; i < vs->conf.num_queues + 2; i++) {
         virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), i);
     }
 
-- 
MST


