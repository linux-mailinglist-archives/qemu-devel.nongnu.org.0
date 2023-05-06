Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D20D6F926D
	for <lists+qemu-devel@lfdr.de>; Sat,  6 May 2023 16:08:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvIZQ-00021N-Dv; Sat, 06 May 2023 10:07:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yin31149@gmail.com>)
 id 1pvIZP-00021D-0U
 for qemu-devel@nongnu.org; Sat, 06 May 2023 10:07:31 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yin31149@gmail.com>)
 id 1pvIZB-0005Wl-VS
 for qemu-devel@nongnu.org; Sat, 06 May 2023 10:07:30 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-643557840e4so3199927b3a.2
 for <qemu-devel@nongnu.org>; Sat, 06 May 2023 07:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683382036; x=1685974036;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3TCND2PEu+54Kzy/XrvfzrPulI3hsuCCyDLVI94fByY=;
 b=kpNpW1JbL9+c9XXxmCVEyTNvQIFmYQRPPLxlbbo47pyDQplKX9uDv15EkqfkCK7vsJ
 7RAC/s/SPnNoyCh4sr+Ik5jEKsbKZfm/MLIaeeM5/1w7vrA7uZDh9l9puGvgFPt+sHiH
 E8Electlk/Xvafl+uiIAcPFAtDjRbMx4ZRrJRs9873Ryo39UXHAw8OZMn9rRk6+W7B8H
 0Mu4En+2FURODDJrtvqclUFQLSw8PQWligLbiTkbaRhPs0hQMnfUY5h50HM8f7PT6aaz
 UpaQGuL/P7GbFHC3iUG5+5CjtFOPusRBFloNt159gYOqKiJq7aLQQ2HdEZRwXOmqwNOG
 p+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683382036; x=1685974036;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3TCND2PEu+54Kzy/XrvfzrPulI3hsuCCyDLVI94fByY=;
 b=D3VyI7aDMKVWbIc6hQqkt9wIUPPp5CSRy+pe/eeR3fy//x6PMMzPf8AEMKH8laCsGL
 YabORs+AAukzESepm7IDT46rSx9dx1pVGalUCBAbG0tTNWNNs9B7F/Trx0vYtN79ekNQ
 YcMu1pCgJSyMADvN1pCvCkBwz2YF4U89QsbUmse4NCfRURGzS7BLYPPcaM10D9OMMS6A
 Z1zgoUs7YsTILoRic3jEATobo8+EKDXtrK/W/DaExXWAHlEcypIBoQ9azSbSZ2gaF4A9
 gjPJrktC2yUtVtd2oh1saR0kLf4Im9pjHRaBCHay5B6wurCg2FFDp8yfOAt2tpvcLjTy
 4+FA==
X-Gm-Message-State: AC+VfDxsVeHVtg8CgzZgDwIU0Ju9GY78DBl+JMT5Q0eBi50oJRtwTzK0
 5ZfNSQpp8w6UGxgfHUU57Qg=
X-Google-Smtp-Source: ACHHUZ7rBX6xrhJZwWWQCCdFxxw3VY6xWntyvLNVNdyOSMqOHVrVQ5TmF5nj4ssvV5opXkwfE6a9IA==
X-Received: by 2002:a05:6a20:4293:b0:f2:64f8:b214 with SMTP id
 o19-20020a056a20429300b000f264f8b214mr6513398pzj.13.1683382036522; 
 Sat, 06 May 2023 07:07:16 -0700 (PDT)
Received: from localhost ([159.226.94.115]) by smtp.gmail.com with ESMTPSA id
 g9-20020a63fa49000000b0052863112065sm3303910pgk.35.2023.05.06.07.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 May 2023 07:07:16 -0700 (PDT)
From: Hawkins Jiawei <yin31149@gmail.com>
To: eperezma@redhat.com,
	jasowang@redhat.com
Cc: yin31149@gmail.com,
	18801353760@163.com,
	qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] vdpa: rename vhost_vdpa_net_cvq_add()
Date: Sat,  6 May 2023 22:06:12 +0800
Message-Id: <fbaa1630a3cf8d08c59c2e273d53f055da8292b3.1683371965.git.yin31149@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1683371965.git.yin31149@gmail.com>
References: <cover.1683371965.git.yin31149@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=yin31149@gmail.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


