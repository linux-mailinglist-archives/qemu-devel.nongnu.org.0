Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9892D26D3A4
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Sep 2020 08:27:41 +0200 (CEST)
Received: from localhost ([::1]:34926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kInOO-0001Cg-LR
	for lists+qemu-devel@lfdr.de; Thu, 17 Sep 2020 02:27:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kInKi-0005Rx-6P
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 02:23:52 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:22093
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kInKe-0002rk-UM
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 02:23:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600323827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j2TRHnVVMkouhrkx5NbVUNJa5rmPpVSeoCJNf7SbbdU=;
 b=JtrW4afi/m8oDDtfAftG0KDxcipoBumHRplkkOKnVXlW4bVhyJDLLAE8shVSq+WzDXj9gM
 qrysllr7YaNPQ53Bv7zTzr6BKhxELJSlvKquPrbobYsNCkOro6rn0aRR+0IEbhxj8MnshU
 ge0gse4rsU8C384NBstsnGRDYyUlgy0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-jqV-5sPZPu6GnOnMJ9nPZA-1; Thu, 17 Sep 2020 02:23:45 -0400
X-MC-Unique: jqV-5sPZPu6GnOnMJ9nPZA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 954AE186DD27
 for <qemu-devel@nongnu.org>; Thu, 17 Sep 2020 06:23:44 +0000 (UTC)
Received: from localhost (unknown [10.36.110.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E213010002A6;
 Thu, 17 Sep 2020 06:23:37 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] virtio-gpu: set physical dimensions for EDID
Date: Thu, 17 Sep 2020 10:22:42 +0400
Message-Id: <20200917062242.1877925-6-marcandre.lureau@redhat.com>
In-Reply-To: <20200917062242.1877925-1-marcandre.lureau@redhat.com>
References: <20200917062242.1877925-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/17 02:23:38
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 hw/display/virtio-gpu-base.c   | 2 ++
 hw/display/virtio-gpu.c        | 2 ++
 include/hw/virtio/virtio-gpu.h | 1 +
 3 files changed, 5 insertions(+)

diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index aeb8723542..40ccd00f94 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -82,6 +82,8 @@ static int virtio_gpu_ui_info(void *opaque, uint32_t idx, QemuUIInfo *info)
     g->req_state[idx].y = info->yoff;
     g->req_state[idx].width = info->width;
     g->req_state[idx].height = info->height;
+    g->req_state[idx].width_mm = info->width_mm;
+    g->req_state[idx].height_mm = info->height_mm;
 
     if (info->width && info->height) {
         g->enabled_output_bitmask |= (1 << idx);
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 90be4e3ed7..f3b71fa9c7 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -212,6 +212,8 @@ virtio_gpu_generate_edid(VirtIOGPU *g, int scanout,
 {
     VirtIOGPUBase *b = VIRTIO_GPU_BASE(g);
     qemu_edid_info info = {
+        .width_mm = b->req_state[scanout].width_mm,
+        .height_mm = b->req_state[scanout].height_mm,
         .prefx = b->req_state[scanout].width,
         .prefy = b->req_state[scanout].height,
     };
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 6b45b4799a..525e4fac4f 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -66,6 +66,7 @@ struct virtio_gpu_scanout {
 };
 
 struct virtio_gpu_requested_state {
+    uint16_t width_mm, height_mm;
     uint32_t width, height;
     int x, y;
 };
-- 
2.26.2


