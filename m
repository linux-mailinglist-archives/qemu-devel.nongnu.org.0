Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA48A548505
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 13:57:52 +0200 (CEST)
Received: from localhost ([::1]:41854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0ihb-00030m-Lv
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 07:57:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o0iNj-0001Vf-2k
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 07:37:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o0iNh-0002Oc-Hp
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 07:37:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655120237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fjkT/ghvgIP+ASWCtRqN8cFZ3mDw+gAHZxFgoi4zHGM=;
 b=aLdXUcduXgPemz7lx/rElNE0F+Y3+9naYSJH8+1zmFKgj5a7q66iY3yTGB6BwErSxTtLCn
 u8DLAJu7aXuGPzHsldJIQsOwPG2utwrX5I4qMGuIkQCipC0CJHCrofvs2UZs0w14gmR1VC
 HaTiZsQTulyOhOvoJCcyRIykqnU7T+s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-546-czJqyPJ_Ov-1NAke0vpC9w-1; Mon, 13 Jun 2022 07:37:11 -0400
X-MC-Unique: czJqyPJ_Ov-1NAke0vpC9w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C54C833975;
 Mon, 13 Jun 2022 11:37:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 190C740C1247;
 Mon, 13 Jun 2022 11:37:10 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C60EF1800999; Mon, 13 Jun 2022 13:36:56 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, xen-devel@lists.xenproject.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 "Hongren (Zenithal) Zheng" <i@zenithal.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Canokeys.org" <contact@canokeys.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paul Durrant <paul@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PULL 15/16] virtio-gpu: Respect UI refresh rate for EDID
Date: Mon, 13 Jun 2022 13:36:54 +0200
Message-Id: <20220613113655.3693872-16-kraxel@redhat.com>
In-Reply-To: <20220613113655.3693872-1-kraxel@redhat.com>
References: <20220613113655.3693872-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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


