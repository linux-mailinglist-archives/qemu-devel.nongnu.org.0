Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AEB380E77
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 18:54:21 +0200 (CEST)
Received: from localhost ([::1]:50966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhb4u-0004J2-H1
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 12:54:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lhajt-0000cM-Cx
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:32:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lhajd-0001G1-Rg
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:32:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621009935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=02lubwKbg7bbNlJ01WPRa9a/4dppcXxCL+uh2kocO0c=;
 b=Y9JOyKNJr0p9F6UvFzmVWXQhiKbzXlM0W6hFeyZYmKawbQrCF15OqNALYHzrloHhKXVZXd
 5sKJ2pZJst24f4/q17RsNBDTg0WLT8qg2ZDbtI84BxzkLIbtLyi4qRjugCvZpO0h5wzWM1
 THprwmKGn8aeC6b1qvX+/3nSozL8GIA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-zai3CFBBNs-YtBzTjf_cKA-1; Fri, 14 May 2021 12:32:12 -0400
X-MC-Unique: zai3CFBBNs-YtBzTjf_cKA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8534280ED8B;
 Fri, 14 May 2021 16:32:11 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-116.ams2.redhat.com [10.36.114.116])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9394519D9B;
 Fri, 14 May 2021 16:32:10 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 13/14] virtio: Fail if iommu_platform is requested,
 but unsupported
Date: Fri, 14 May 2021 18:31:23 +0200
Message-Id: <20210514163124.251741-14-kwolf@redhat.com>
In-Reply-To: <20210514163124.251741-1-kwolf@redhat.com>
References: <20210514163124.251741-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 2943b53f6 (' virtio: force VIRTIO_F_IOMMU_PLATFORM') made sure
that vhost can't just reject VIRTIO_F_IOMMU_PLATFORM when it was
requested. However, just adding it back to the negotiated flags isn't
right either because it promises support to the guest that the device
actually doesn't support. One example of a vhost-user device that
doesn't have support for the flag is the vhost-user-blk export of QEMU.

Instead of successfully creating a device that doesn't work, just fail
to plug the device when it doesn't support the feature, but it was
requested. This results in much clearer error messages.

Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1935019
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Message-Id: <20210429171316.162022-6-kwolf@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 hw/virtio/virtio-bus.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
index d6332d45c3..859978d248 100644
--- a/hw/virtio/virtio-bus.c
+++ b/hw/virtio/virtio-bus.c
@@ -69,6 +69,11 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
         return;
     }
 
+    if (has_iommu && !virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
+        error_setg(errp, "iommu_platform=true is not supported by the device");
+        return;
+    }
+
     if (klass->device_plugged != NULL) {
         klass->device_plugged(qbus->parent, &local_err);
     }
-- 
2.30.2


