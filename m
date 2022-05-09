Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5AC51FE5E
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 15:35:03 +0200 (CEST)
Received: from localhost ([::1]:37598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no3XS-0004Of-Dz
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 09:35:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1no2tX-0006bm-BG
 for qemu-devel@nongnu.org; Mon, 09 May 2022 08:53:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1no2tV-0002uA-6p
 for qemu-devel@nongnu.org; Mon, 09 May 2022 08:53:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652100824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3eDaNOQ/E/ZEZjlt53ZAb9KVw26AY2P9cQhmE/wVS9Y=;
 b=HE8Qs+i4N9k7YbjDk32CHznoOD4C1bQWv2dzLz8QzGNFLmHjWHrvphR2NOrdCHPZdlzQyU
 6/sxrLH9YK70218/3RzN+g5825hnRTNMTTrIFxnJQUzqZXLzCcQdGYx0MfyY0D8qdo5VEN
 gqB12Ow+qcf6qg0R+6i0xhLiX+kXvWw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-302-leeQH6__NY-kHTv98VmV5g-1; Mon, 09 May 2022 08:53:41 -0400
X-MC-Unique: leeQH6__NY-kHTv98VmV5g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD6D185A5A8;
 Mon,  9 May 2022 12:53:40 +0000 (UTC)
Received: from localhost (unknown [10.39.195.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4CC4214A56A8;
 Mon,  9 May 2022 12:53:40 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: <qemu-block@nongnu.org>, Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 7/9] virtio-scsi: clean up virtio_scsi_handle_ctrl_vq()
Date: Mon,  9 May 2022 13:53:13 +0100
Message-Id: <20220509125315.3746865-8-stefanha@redhat.com>
In-Reply-To: <20220509125315.3746865-1-stefanha@redhat.com>
References: <20220509125315.3746865-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

virtio_scsi_handle_ctrl_vq() is only called from hw/scsi/virtio-scsi.c
now and its return value is no longer used. Remove the function
prototype from virtio-scsi.h and drop the return value.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-id: 20220427143541.119567-5-stefanha@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/virtio/virtio-scsi.h | 1 -
 hw/scsi/virtio-scsi.c           | 5 +----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/include/hw/virtio/virtio-scsi.h b/include/hw/virtio/virtio-scsi.h
index 85e69d0368..ac99800ee2 100644
--- a/include/hw/virtio/virtio-scsi.h
+++ b/include/hw/virtio/virtio-scsi.h
@@ -150,7 +150,6 @@ void virtio_scsi_common_realize(DeviceState *dev,
 
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


