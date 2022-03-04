Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 008004CD226
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 11:13:40 +0100 (CET)
Received: from localhost ([::1]:51586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ4wN-0006pZ-2Y
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 05:13:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1nQ4u7-00048M-Ix
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:11:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1nQ4u5-0007ou-P8
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:11:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646388677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ztDvj7fiM7xkapi0r03fC+oUdKdfsZD0L/E+xi9O+Iw=;
 b=cbgSqwWcxFPhc7N7nD49KRKOTPvrj5AMXcOfOlvj6SXDDAobEGzWi1Tjgtsn+upJ43e3am
 rCPjotMN6B9YRB0nqm0Y4XCCpHJEjAzcJkiolPpVbnJQsGlt0EvkG/uN8sqbCAqTLlZiDR
 5vnzKGslEMnueuXF0SSUDmPggidNuqc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-544-LTD4M1sSPUWJyQrxSp1IhQ-1; Fri, 04 Mar 2022 05:11:14 -0500
X-MC-Unique: LTD4M1sSPUWJyQrxSp1IhQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 258E851DF;
 Fri,  4 Mar 2022 10:11:12 +0000 (UTC)
Received: from toolbox.redhat.com (unknown [10.33.36.250])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 48B4C842BA;
 Fri,  4 Mar 2022 10:09:39 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/4] vhost: use wfd on functions setting vring call fd
Date: Fri,  4 Mar 2022 11:08:52 +0100
Message-Id: <20220304100854.14829-3-slp@redhat.com>
In-Reply-To: <20220304100854.14829-1-slp@redhat.com>
References: <20220304100854.14829-1-slp@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=170.10.133.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, John G Johnson <john.g.johnson@oracle.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 Eric Farman <farman@linux.ibm.com>, Jagannathan Raman <jag.raman@oracle.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, vgoyal@redhat.com,
 Thomas Huth <thuth@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When ioeventfd is emulated using qemu_pipe(), only EventNotifier's wfd
can be used for writing.

Use the recently introduced event_notifier_get_wfd() function to
obtain the fd that our peer must use to signal the vring.

Signed-off-by: Sergio Lopez <slp@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/virtio/vhost.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 7b03efccec..b643f42ea4 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1287,7 +1287,7 @@ static int vhost_virtqueue_init(struct vhost_dev *dev,
         return r;
     }
 
-    file.fd = event_notifier_get_fd(&vq->masked_notifier);
+    file.fd = event_notifier_get_wfd(&vq->masked_notifier);
     r = dev->vhost_ops->vhost_set_vring_call(dev, &file);
     if (r) {
         VHOST_OPS_DEBUG(r, "vhost_set_vring_call failed");
@@ -1542,9 +1542,9 @@ void vhost_virtqueue_mask(struct vhost_dev *hdev, VirtIODevice *vdev, int n,
 
     if (mask) {
         assert(vdev->use_guest_notifier_mask);
-        file.fd = event_notifier_get_fd(&hdev->vqs[index].masked_notifier);
+        file.fd = event_notifier_get_wfd(&hdev->vqs[index].masked_notifier);
     } else {
-        file.fd = event_notifier_get_fd(virtio_queue_get_guest_notifier(vvq));
+        file.fd = event_notifier_get_wfd(virtio_queue_get_guest_notifier(vvq));
     }
 
     file.index = hdev->vhost_ops->vhost_get_vq_index(hdev, n);
-- 
2.35.1


