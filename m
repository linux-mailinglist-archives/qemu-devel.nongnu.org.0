Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8265118E0
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 16:43:25 +0200 (CEST)
Received: from localhost ([::1]:34450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njit1-0005cv-VY
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 10:43:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1njilk-0000Qm-Ji
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 10:35:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1njilj-0000hV-4c
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 10:35:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651070150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IRO4+PdsxK6PDuWJMEd52IHWLIHjs1Qwwm786P8EMSI=;
 b=WdJcfCP3dnIkSee5o62dneL6cW0RxSKsP2e9sNNOWddNWxVue9iUz7aQtyonXAxiEZhjvV
 lIIe8A9RYX8D30XpxT8MjXIdIkBlOcdIfPQCN8QOB5VQV60zDhPqpLJaIZREo9v4sFkUtC
 w4O8+5d+DgQ8YpDnabTYrRvH4X+bhcQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-56-JHzxYGLoNkyDvjasvkMhgw-1; Wed, 27 Apr 2022 10:35:49 -0400
X-MC-Unique: JHzxYGLoNkyDvjasvkMhgw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E12DC3C23FA2;
 Wed, 27 Apr 2022 14:35:48 +0000 (UTC)
Received: from localhost (unknown [10.39.195.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 800D2C53360;
 Wed, 27 Apr 2022 14:35:48 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/6] virtio-scsi: clean up virtio_scsi_handle_ctrl_vq()
Date: Wed, 27 Apr 2022 15:35:39 +0100
Message-Id: <20220427143541.119567-5-stefanha@redhat.com>
In-Reply-To: <20220427143541.119567-1-stefanha@redhat.com>
References: <20220427143541.119567-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Nir Soffer <nsoffer@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-stable@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

virtio_scsi_handle_ctrl_vq() is only called from hw/scsi/virtio-scsi.c
now and its return value is no longer used. Remove the function
prototype from virtio-scsi.h and drop the return value.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/virtio/virtio-scsi.h | 1 -
 hw/scsi/virtio-scsi.c           | 5 +----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/include/hw/virtio/virtio-scsi.h b/include/hw/virtio/virtio-scsi.h
index 5957597825..44dc3b81ec 100644
--- a/include/hw/virtio/virtio-scsi.h
+++ b/include/hw/virtio/virtio-scsi.h
@@ -152,7 +152,6 @@ void virtio_scsi_common_realize(DeviceState *dev,
 
 void virtio_scsi_common_unrealize(DeviceState *dev);
 bool virtio_scsi_handle_cmd_vq(VirtIOSCSI *s, VirtQueue *vq);
-bool virtio_scsi_handle_ctrl_vq(VirtIOSCSI *s, VirtQueue *vq);
 void virtio_scsi_init_req(VirtIOSCSI *s, VirtQueue *vq, VirtIOSCSIReq *req);
 void virtio_scsi_free_req(VirtIOSCSIReq *req);
 void virtio_scsi_push_event(VirtIOSCSI *s, SCSIDevice *dev,
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index aa03a713d8..eefda16e4b 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -460,16 +460,13 @@ static void virtio_scsi_handle_ctrl_req(VirtIOSCSI *s, VirtIOSCSIReq *req)
     }
 }
 
-bool virtio_scsi_handle_ctrl_vq(VirtIOSCSI *s, VirtQueue *vq)
+static void virtio_scsi_handle_ctrl_vq(VirtIOSCSI *s, VirtQueue *vq)
 {
     VirtIOSCSIReq *req;
-    bool progress = false;
 
     while ((req = virtio_scsi_pop_req(s, vq))) {
-        progress = true;
         virtio_scsi_handle_ctrl_req(s, req);
     }
-    return progress;
 }
 
 /*
-- 
2.35.1


