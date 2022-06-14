Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4170954B08F
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 14:29:05 +0200 (CEST)
Received: from localhost ([::1]:37288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o15fM-0005c5-Bu
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 08:29:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o15TE-0006Xi-8h
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 08:16:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o15TA-0007ll-2Z
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 08:16:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655208986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fjkT/ghvgIP+ASWCtRqN8cFZ3mDw+gAHZxFgoi4zHGM=;
 b=VgxUziE8uhLC+rQ0gEU5G9yqj1A8dNwFl4K/3PynYs4kaW2OCp8aV4XjFUNKHTY6uEMYsr
 fAP+U0U5nwu6aBES20zOKJ1h1R8tHVLMoy2WZ3JnlNlPznFWCb9nE59LqUEZ8Mb8U7lFm3
 d/g7dIlu7FlYxru1ina1FXhhYSDP35M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-253-9-V6lrRoPN-wePOBAR4HAQ-1; Tue, 14 Jun 2022 08:16:25 -0400
X-MC-Unique: 9-V6lrRoPN-wePOBAR4HAQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4430B185A7B2;
 Tue, 14 Jun 2022 12:16:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 009C72166B26;
 Tue, 14 Jun 2022 12:16:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D094A180079D; Tue, 14 Jun 2022 14:16:11 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Hongren (Zenithal) Zheng" <i@zenithal.me>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Canokeys.org" <contact@canokeys.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PULL 15/15] virtio-gpu: Respect UI refresh rate for EDID
Date: Tue, 14 Jun 2022 14:16:10 +0200
Message-Id: <20220614121610.508356-16-kraxel@redhat.com>
In-Reply-To: <20220614121610.508356-1-kraxel@redhat.com>
References: <20220614121610.508356-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Akihiko Odaki <akihiko.odaki@gmail.com>

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <20220226115516.59830-4-akihiko.odaki@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/virtio/virtio-gpu.h | 1 +
 hw/display/virtio-gpu-base.c   | 1 +
 hw/display/virtio-gpu.c        | 1 +
 3 files changed, 3 insertions(+)

diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index afff9e158e31..2e28507efe21 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -80,6 +80,7 @@ struct virtio_gpu_scanout {
 struct virtio_gpu_requested_state {
     uint16_t width_mm, height_mm;
     uint32_t width, height;
+    uint32_t refresh_rate;
     int x, y;
 };
 
diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index b21d6e5b0be8..a29f191aa82e 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -79,6 +79,7 @@ static void virtio_gpu_ui_info(void *opaque, uint32_t idx, QemuUIInfo *info)
 
     g->req_state[idx].x = info->xoff;
     g->req_state[idx].y = info->yoff;
+    g->req_state[idx].refresh_rate = info->refresh_rate;
     g->req_state[idx].width = info->width;
     g->req_state[idx].height = info->height;
     g->req_state[idx].width_mm = info->width_mm;
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 55c6dd576318..20cc703dcc6e 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -217,6 +217,7 @@ virtio_gpu_generate_edid(VirtIOGPU *g, int scanout,
         .height_mm = b->req_state[scanout].height_mm,
         .prefx = b->req_state[scanout].width,
         .prefy = b->req_state[scanout].height,
+        .refresh_rate = b->req_state[scanout].refresh_rate,
     };
 
     edid->size = cpu_to_le32(sizeof(edid->edid));
-- 
2.36.1


