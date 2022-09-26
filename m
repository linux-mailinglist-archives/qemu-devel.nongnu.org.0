Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB4B5EA8D0
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 16:44:27 +0200 (CEST)
Received: from localhost ([::1]:46616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocpLO-0003wx-3E
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 10:44:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1ocp2G-0003rB-91
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 10:24:40 -0400
Received: from madras.collabora.co.uk
 ([2a00:1098:0:82:1000:25:2eeb:e5ab]:33178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1ocp2D-00044Q-I1
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 10:24:38 -0400
Received: from dellino.fritz.box (host-79-27-165-192.retail.telecomitalia.it
 [79.27.165.192])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: fahien)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 338DB6602260;
 Mon, 26 Sep 2022 15:24:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1664202275;
 bh=S9ihd1+4Opupsb6uRLXElTS5VgsIkyJoMro+SmD6960=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TXWSDGLBYtk6xiN5cCXJPHhF0y9Ggog3vgc/YdPdRzypM+4zxVzur1jqLkznqo5+G
 uHsOatPed8XM7+F+DMcbYmdjwjtuEuyg0MNTAeKIshJwEViZ16P+w3t4HhNCgTLaAk
 LBDTujH2u86VKofpNDi2fTbYbE3fokVzo2a+RHSSASjOu4bz0JR3L3JCSoj1ge0n68
 h8y5AWLyWN9jf0uIbS3tpUXVNKXondBi/HfXZOQ6NkdbbsGWVEEEVq7Unho2JAirl2
 vDYh98swzY4WR+23zyTBA6C/EWbZcqaIEH5OqdH9N0VSkXoDiBsR5NQgscRNo6yz6F
 O6grg6R7a1Y0g==
From: Antonio Caggiano <antonio.caggiano@collabora.com>
To: qemu-devel@nongnu.org
Cc: gert.wollny@collabora.com, dmitry.osipenko@collabora.com,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v3 8/9] virtio-gpu: Initialize Venus
Date: Mon, 26 Sep 2022 16:24:21 +0200
Message-Id: <20220926142422.22325-9-antonio.caggiano@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926142422.22325-1-antonio.caggiano@collabora.com>
References: <20220926142422.22325-1-antonio.caggiano@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1098:0:82:1000:25:2eeb:e5ab;
 envelope-from=antonio.caggiano@collabora.com; helo=madras.collabora.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Request Venus when initializing VirGL.

Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
---
 hw/display/virtio-gpu-virgl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index 16f600adbb..0f17bdddd0 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -806,7 +806,7 @@ int virtio_gpu_virgl_init(VirtIOGPU *g)
 {
     int ret;
 
-    ret = virgl_renderer_init(g, 0, &virtio_gpu_3d_cbs);
+    ret = virgl_renderer_init(g, VIRGL_RENDERER_VENUS, &virtio_gpu_3d_cbs);
     if (ret != 0) {
         error_report("virgl could not be initialized: %d", ret);
         return ret;
-- 
2.34.1


