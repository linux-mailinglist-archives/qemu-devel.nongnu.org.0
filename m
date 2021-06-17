Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB2E3AB2BF
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 13:36:57 +0200 (CEST)
Received: from localhost ([::1]:47894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltqKO-0005fQ-BT
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 07:36:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1ltqJ4-0004rP-O2
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 07:35:34 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:47077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1ltqJ2-0002cJ-PW
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 07:35:34 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 o10-20020a17090aac0ab029016e92770073so3655917pjq.5
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 04:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HGJFN0Z3uC0oyCfiQhfYyLLSv5q0LsdDI7fXGlJib70=;
 b=VWHBtN+DH+eMcCMr8+3BFZwpW8soZ7eplOGO4JR1n6E61/2PZrfKgQjuA4lfdCEeZj
 eoFrRfestFT8ghlRmWZP0ajkvi2a0wnK83PB1zfPJWHWNJR08+pVALixAVCzAuBhQhBU
 84PvhYr8K+p3e5L0NxZXcxVVheVNeDB0lJOT+ouQkvVn1sYf6uDJgEOpiGyhB+Gd0TDA
 fUoDvsmLeAFy/Yite/dkIMTVXLj/yo8JOf8U/LLCMzvCkSQCpVE35FEDaGJZKbrOV7Su
 3TPmSaVTo+y6kWP+GP3IVn3jQt2B6c6B7YCZYIArTnIUx5h2BTHftRLQeAm++HKxaBut
 IMug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HGJFN0Z3uC0oyCfiQhfYyLLSv5q0LsdDI7fXGlJib70=;
 b=n2INIIlSn3YazklULQ6NpqepfTjFeAO0uOIoRQxtic1kZP6scu+3zF60ondldq7HAo
 6CTc8E6QywNkbw6g7Z923sStu9/uDyJ/3Qz4rFp4ZP0dkpmEP/bkLKW0zc39Kg1sXR3o
 tlM7EACHkGy5/kYaHH891SJQ+1nGJn/R//h9d5Wqtfl6yqrLg+2KDz6+bWmi8e6tfVeF
 YJqFfFbXjc1dFWsLVK64Gg4p6Mkq2xRoF+1DcTxu0ByH3lWvNhe5CUT75jUyqNMYYPxC
 f75fpKRi8BbcCbktAnB+jxhmnKOcPLwHAHWy2xHnoDjpkl72jaSj8+lk/sCokAtqRXwC
 m0vw==
X-Gm-Message-State: AOAM532UuqL0sVxzrVnnqBVpRmKsDjogTsJd+X79FP5vJbyxrsIX/kCh
 CROYFLxuwqFlErqgco/o0LpMAtQ7hjrVjg==
X-Google-Smtp-Source: ABdhPJyXpNg9ogHmehwf/UyOisUeXEsX8y/E6sepJ71bNLj0qthJNVvYfjv1mKvTOZxvtKRu8KQybA==
X-Received: by 2002:a17:90b:3696:: with SMTP id
 mj22mr16748979pjb.124.1623929730871; 
 Thu, 17 Jun 2021 04:35:30 -0700 (PDT)
Received: from localhost.localdomain ([2400:4050:c360:8200:c6b:ce89:81f5:958c])
 by smtp.gmail.com with ESMTPSA id fu21sm7621635pjb.38.2021.06.17.04.35.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Jun 2021 04:35:30 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] virtio-gpu: Call Virgl only in the main thread
Date: Thu, 17 Jun 2021 20:35:20 +0900
Message-Id: <20210617113520.25973-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Virgl relies on callbacks provided by the OpenGL display, and such a
display may rely on eglMakeCurrent. eglMakeCurrent will fail if the
given context is current to some other thread. The easiest way to avoid
such a failure is to call the OpenGL display in a single thread. As all
operations except virtio_gpu_virgl_reset happens in the main thread,
this change makes virtio_gpu_virgl_reset happen only in the main thread.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 hw/display/virtio-gpu-gl.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/hw/display/virtio-gpu-gl.c b/hw/display/virtio-gpu-gl.c
index d971b480806..57d6537120f 100644
--- a/hw/display/virtio-gpu-gl.c
+++ b/hw/display/virtio-gpu-gl.c
@@ -90,17 +90,12 @@ static void virtio_gpu_gl_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
 
 static void virtio_gpu_gl_reset(VirtIODevice *vdev)
 {
-    VirtIOGPU *g = VIRTIO_GPU(vdev);
     VirtIOGPUGL *gl = VIRTIO_GPU_GL(vdev);
 
     virtio_gpu_reset(vdev);
 
     if (gl->renderer_inited) {
-        if (g->parent_obj.renderer_blocked) {
-            gl->renderer_reset = true;
-        } else {
-            virtio_gpu_virgl_reset(g);
-        }
+        gl->renderer_reset = true;
     }
 }
 
-- 
2.30.1 (Apple Git-130)


