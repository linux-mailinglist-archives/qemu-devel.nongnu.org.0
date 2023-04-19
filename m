Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D80936E7975
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 14:15:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pp6hN-00029e-W6; Wed, 19 Apr 2023 08:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yin31149@gmail.com>)
 id 1pp6KS-000540-Dz
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 07:50:28 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yin31149@gmail.com>)
 id 1pp6KK-0005yf-PY
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 07:50:28 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 fw22-20020a17090b129600b00247255b2f40so524763pjb.1
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 04:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681905019; x=1684497019;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3TCND2PEu+54Kzy/XrvfzrPulI3hsuCCyDLVI94fByY=;
 b=gOwvYgYamSL3ZtaH7oub6JR9zv7NDUvU6JJSK4YCcEDha+i5zF9gnrowWCNAorXYRW
 exky3IST+acn4Thllh1Gx4SX9t8eqPqJsMPfFW+sRlWaUA/5spYniaZvM34QcYMyv6gd
 deqRKajf+xJUsu5Mnn25VEYSXfmo/XPRoLSAFAc9WdcL7hCWv+QnE80bhKyiqo+sWDQd
 ofzlxulM/ETZjBFbHiGobhk5zH14CU7YuC0wPEP2DCfGch5xsQGOWoUIdliAcCJ1UJq4
 O+3vhlMnEBOiV9PsprHg/a/1sU7zwSkUDoUN8Dyyjh/6IxfttvR/Xr143sOt//j4PyE3
 BNpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681905019; x=1684497019;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3TCND2PEu+54Kzy/XrvfzrPulI3hsuCCyDLVI94fByY=;
 b=M7WM9MK3XRpQmepjUTzHPgCv6YpSRcv50miGPRH2XRJqQsdlD1uCRniKeANg7My2dl
 mKj8u6i+vHV3g0mCBWAelLwZFoVmvOiTJN4lzGI+8zxrEPoMy6H0kgmq8ebUkEwk6osQ
 Mj7qyAg/LxP5FeHUWWWKWzo2/1xfDKso5xWyFSebymH74hsinqc9x/LZs1Iq9uMRPsJ1
 WwmGFJ0v9PvJIQk8ICeYDrgtlLcqFMyyXOA+X2r/9oNG6c0Mvjl/9HVdnTHNF86RXCoC
 DUkI2fAE777ttxOf9qxgaNX0E/WsHezTTN9FV3fpeYZ6PJke5bIG/NB3p29Vy5DyPZTY
 Jxhg==
X-Gm-Message-State: AAQBX9dDBoz+J1znnnFYwiqM355eelgNp/8qyCWyjNwrMssJxC82EV3W
 3raCvrMp8VOea2ym5Lqpx+U=
X-Google-Smtp-Source: AKy350adNZUIJTJ336DS0dvf8uPjM5/C9asZ8wcYStJyVck05dUAS2EuWgA/3iX/UBTFw/M9ZV7I1A==
X-Received: by 2002:a05:6a20:3c8a:b0:d6:7b9b:f89 with SMTP id
 b10-20020a056a203c8a00b000d67b9b0f89mr4303951pzj.4.1681905019051; 
 Wed, 19 Apr 2023 04:50:19 -0700 (PDT)
Received: from localhost ([159.226.94.115]) by smtp.gmail.com with ESMTPSA id
 v11-20020a62a50b000000b0063afb08afeesm10932962pfm.67.2023.04.19.04.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 04:50:18 -0700 (PDT)
From: Hawkins Jiawei <yin31149@gmail.com>
To: eperezma@redhat.com,
	jasowang@redhat.com
Cc: yin31149@gmail.com,
	18801353760@163.com,
	qemu-devel@nongnu.org
Subject: [PATCH 1/2] vdpa: rename vhost_vdpa_net_cvq_add()
Date: Wed, 19 Apr 2023 19:49:52 +0800
Message-Id: <f4eedfd9d8b6a3807ed363ab80ab4ea2ed121f3a.1681732982.git.yin31149@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1681732982.git.yin31149@gmail.com>
References: <cover.1681732982.git.yin31149@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=yin31149@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 19 Apr 2023 08:14:05 -0400
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

We want to introduce a new version of vhost_vdpa_net_cvq_add() that
does not poll immediately after forwarding custom buffers
to the device, so that QEMU can send all the SVQ control commands
in parallel instead of serialized.

Signed-off-by: Hawkins Jiawei <yin31149@gmail.com>
---
 net/vhost-vdpa.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 99904a0da7..10804c7200 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -590,8 +590,14 @@ static void vhost_vdpa_net_cvq_stop(NetClientState *nc)
     vhost_vdpa_net_client_stop(nc);
 }
 
-static ssize_t vhost_vdpa_net_cvq_add(VhostVDPAState *s, size_t out_len,
-                                      size_t in_len)
+/**
+ * vhost_vdpa_net_cvq_add_and_wait() adds SVQ control commands to SVQ,
+ * kicks the device and polls the device used buffers.
+ *
+ * Return the length written by the device.
+ */
+static ssize_t vhost_vdpa_net_cvq_add_and_wait(VhostVDPAState *s,
+                                    size_t out_len, size_t in_len)
 {
     /* Buffers for the device */
     const struct iovec out = {
@@ -636,7 +642,7 @@ static ssize_t vhost_vdpa_net_load_cmd(VhostVDPAState *s, uint8_t class,
     memcpy(s->cvq_cmd_out_buffer, &ctrl, sizeof(ctrl));
     memcpy(s->cvq_cmd_out_buffer + sizeof(ctrl), data, data_size);
 
-    return vhost_vdpa_net_cvq_add(s, sizeof(ctrl) + data_size,
+    return vhost_vdpa_net_cvq_add_and_wait(s, sizeof(ctrl) + data_size,
                                   sizeof(virtio_net_ctrl_ack));
 }
 
@@ -753,7 +759,8 @@ static int vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *svq,
         dev_written = sizeof(status);
         *s->status = VIRTIO_NET_OK;
     } else {
-        dev_written = vhost_vdpa_net_cvq_add(s, out.iov_len, sizeof(status));
+        dev_written = vhost_vdpa_net_cvq_add_and_wait(s, out.iov_len,
+                                                      sizeof(status));
         if (unlikely(dev_written < 0)) {
             goto out;
         }
-- 
2.25.1


