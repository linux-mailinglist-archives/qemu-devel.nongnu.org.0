Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F08165E7BC
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:26:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDMMl-0003jq-18; Thu, 05 Jan 2023 04:16:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMMd-0003Z2-L1
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:16:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMMb-0007dm-FP
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:16:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672910200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7MKwmvr8s6aJ5ApbCXF6c9zrRH+PpORtzNSI8FfuQZA=;
 b=ejdIdquaIA1/JwLRni3I0l3qxSQvvzUJ66feS3e6rd82MOKre5rrfbRUS5gnStMld17pRX
 IsoZQ3YwsR9Wi9/cpzCJUp/YjwSbIjz5RvXIoQuu33UgnLOcoVDSz32+2z6MgiMjY1Twhq
 BhIPwCp/KucL6ilrYHhBN0sR7YQvwIA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-260-QwVPWg70NKWFvwcRRHtDYQ-1; Thu, 05 Jan 2023 04:16:39 -0500
X-MC-Unique: QwVPWg70NKWFvwcRRHtDYQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 f20-20020a7bc8d4000000b003d1cda5bd6fso261508wml.9
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:16:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7MKwmvr8s6aJ5ApbCXF6c9zrRH+PpORtzNSI8FfuQZA=;
 b=Woy85ZqKZlRJ6sSFMTrlcGwKRcJwY2ockeD5LbBrh6mU87GP9RY3S8efvaNa0Mhhbm
 7LDIga7dOun7boG2tP+NILEMjH2Bsm4Awk+sDAHRJpypdZw0ZuaH4SLQKzL+VTqInsg9
 NmC8/HFsADgg4EFt00REQsxj1c74JIIrP5S1AsOe5MpwjYgTFK+saaM4zB+Jlh65tD2B
 b8AWxidmglnsWEns+gc9TfYpYSo33AE/MIQiRxSVx/zKYwzj/WjzwaGtoqswJ+xp5s2u
 4plcUc35wEh+DAfZ6Mfyg/lCwqeJo4GKD/V9xLP7+3v2/5MCBUIhXDc8D/3DSzKCEitc
 o4iw==
X-Gm-Message-State: AFqh2krhIjJ2QKG15/jlw1VnsMz+xFLQtjqPy6UBSNf4yEzAV3JGb477
 YnkCIhrg/aRgPgNLoLPjiL6gUE2YZShoZvAN4ZnLe6qTq8dOGd/iy85LHUEfNYdeH8X1G+458RM
 IgyoqxZFbPkhjg/TcFA0hsEXWmrrJ4iRxKQizpS1nkIEfNelE62QITaRjQ3WQ
X-Received: by 2002:a05:600c:4b0f:b0:3d2:2651:64bd with SMTP id
 i15-20020a05600c4b0f00b003d2265164bdmr35757770wmp.10.1672910197369; 
 Thu, 05 Jan 2023 01:16:37 -0800 (PST)
X-Google-Smtp-Source: AMrXdXth58H8czbO03pn6kwXRNwi3abBYFulPomPGo0ZBodF0WlDB4atkvUdnSS7d/DKkC6ga1ggyQ==
X-Received: by 2002:a05:600c:4b0f:b0:3d2:2651:64bd with SMTP id
 i15-20020a05600c4b0f00b003d2265164bdmr35757758wmp.10.1672910197074; 
 Thu, 05 Jan 2023 01:16:37 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 r126-20020a1c2b84000000b003d35c845cbbsm1638574wmr.21.2023.01.05.01.16.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:16:36 -0800 (PST)
Date: Thu, 5 Jan 2023 04:16:34 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Longpeng <longpeng2@huawei.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 41/51] vhost: configure all host notifiers in a single MR
 transaction
Message-ID: <20230105091310.263867-42-mst@redhat.com>
References: <20230105091310.263867-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230105091310.263867-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Longpeng <longpeng2@huawei.com>

This allows the vhost device to batch the setup of all its host notifiers.
This significantly reduces the device starting time, e.g. the time spend
on enabling notifiers reduce from 376ms to 9.1ms for a VM with 64 vCPUs
and 3 vhost-vDPA generic devices (vdpa_sim_blk, 64vq per device)

Signed-off-by: Longpeng <longpeng2@huawei.com>
Message-Id: <20221227072015.3134-3-longpeng2@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/virtio/vhost.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 87c49fa679..eb8c4c378c 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1562,16 +1562,25 @@ int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev)
         return r;
     }
 
+    /*
+     * Batch all the host notifiers in a single transaction to avoid
+     * quadratic time complexity in address_space_update_ioeventfds().
+     */
+    memory_region_transaction_begin();
+
     for (i = 0; i < hdev->nvqs; ++i) {
         r = virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), hdev->vq_index + i,
                                          true);
         if (r < 0) {
             error_report("vhost VQ %d notifier binding failed: %d", i, -r);
+            memory_region_transaction_commit();
             vhost_dev_disable_notifiers(hdev, vdev);
             return r;
         }
     }
 
+    memory_region_transaction_commit();
+
     return 0;
 }
 
@@ -1585,6 +1594,12 @@ void vhost_dev_disable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev)
     BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
     int i, r;
 
+    /*
+     * Batch all the host notifiers in a single transaction to avoid
+     * quadratic time complexity in address_space_update_ioeventfds().
+     */
+    memory_region_transaction_begin();
+
     for (i = 0; i < hdev->nvqs; ++i) {
         r = virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), hdev->vq_index + i,
                                          false);
@@ -1592,6 +1607,15 @@ void vhost_dev_disable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev)
             error_report("vhost VQ %d notifier cleanup failed: %d", i, -r);
         }
         assert (r >= 0);
+    }
+
+    /*
+     * The transaction expects the ioeventfds to be open when it
+     * commits. Do it now, before the cleanup loop.
+     */
+    memory_region_transaction_commit();
+
+    for (i = 0; i < hdev->nvqs; ++i) {
         virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), hdev->vq_index + i);
     }
     virtio_device_release_ioeventfd(vdev);
-- 
MST


