Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7671FB46F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 16:31:23 +0200 (CEST)
Received: from localhost ([::1]:41606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlCcU-0006jH-7s
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 10:31:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <flukshun@gmail.com>)
 id 1jlCPW-0001vP-3L; Tue, 16 Jun 2020 10:17:58 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:39414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <flukshun@gmail.com>)
 id 1jlCPU-0006bN-9v; Tue, 16 Jun 2020 10:17:57 -0400
Received: by mail-oi1-x236.google.com with SMTP id d67so19349711oig.6;
 Tue, 16 Jun 2020 07:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Q95hS3J40RCSoOEE5dlvFtYnyG3elf6x2RtaTUYv91A=;
 b=hV+qhLYVCwxGxaUe+OPMnAAyjIuQ19Rc9GGTZj7um2ONSqRRZ3eOt4hZd2XjmoXBCW
 PyLw6f1Zqm6RgJvb3O1cMwZ4hoM0oYdNGweD30hsEoosRHpxZIBoXS29eO/xrO+1qCIW
 PK7waDd0GnhMGhJ6B1gca9tI+u9vu0aFtxt83mWM8C05KJ1bZHWPWfmOexdZgHULBP+S
 NbpeRpJT+U1UaN4LzdcuPYX63GqSxBAkCFnYJVBoqha5s/3n0brQNnnIyNx50XxNfJNI
 ObkKQshNz8+uDXEg962KwnM4KEtaa4darxkiTqMRDIzPNxPpy/ohnCeaOZhWinwVKX7z
 U0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=Q95hS3J40RCSoOEE5dlvFtYnyG3elf6x2RtaTUYv91A=;
 b=PiXY8Z9gRUkQeN8f5CpbN/nZE2liZjeSDjxIlLLMQPxeHqty2ysACGNY/Eciz6LXaN
 +/3r4Ll5GTUr7dRxbcSpn0mIT5Uf4qXnmwuokW7P3e/7C04oSlw6dPfqa2ifDJ0SpeVu
 fyGQ8iFXSPWMWmQKLqYEla4TE/Sx3KLaL1GGkePD1dfBxTz/sBJsJQDxT4Yc6j0KICxz
 rNoupncxMNEgEDnUeQVbQpZAuE3Db540PP7pmUg1ZxZpmfuBbSLAzCkMTLVaWCFjDrEj
 No/Zc4PEthQhsC313Sg4I0KcewmFcwJaXhLhKswN3K8R81LBfi8N2SzVu3BmSduNr5cJ
 MEGg==
X-Gm-Message-State: AOAM5321IcGNznS7MqxbxMhhxtyhPiUXAx1+fZObL+X++lykAsk/ZXlG
 JgaLESkeb9BKEbZeb41KRAceqs3b
X-Google-Smtp-Source: ABdhPJyN7T3b11wfLV+3qdP/dNuteuyTMH9TXoHEvXc4mgKL7zoWrgUUNsEVn9Ezq52NieeWicQpfw==
X-Received: by 2002:aca:df04:: with SMTP id w4mr3458946oig.27.1592317074303;
 Tue, 16 Jun 2020 07:17:54 -0700 (PDT)
Received: from localhost (76-251-165-188.lightspeed.austtx.sbcglobal.net.
 [76.251.165.188])
 by smtp.gmail.com with ESMTPSA id e188sm4349186oib.18.2020.06.16.07.17.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 16 Jun 2020 07:17:53 -0700 (PDT)
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 21/78] virtio: reset region cache when on queue deletion
Date: Tue, 16 Jun 2020 09:14:50 -0500
Message-Id: <20200616141547.24664-22-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200616141547.24664-1-mdroth@linux.vnet.ibm.com>
References: <20200616141547.24664-1-mdroth@linux.vnet.ibm.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=flukshun@gmail.com; helo=mail-oi1-x236.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Yuri Benditovich <yuri.benditovich@daynix.com>, qemu-stable@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yuri Benditovich <yuri.benditovich@daynix.com>

https://bugzilla.redhat.com/show_bug.cgi?id=1708480
Fix leak of region reference that prevents complete
device deletion on hot unplug.

Cc: qemu-stable@nongnu.org
Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
Message-Id: <20191226043649.14481-2-yuri.benditovich@daynix.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
(cherry picked from commit 421afd2fe8dd4603216cbf36081877c391f5a2a4)
Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 hw/virtio/virtio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 6de3cfdc2c..344d817644 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -2338,6 +2338,7 @@ void virtio_delete_queue(VirtQueue *vq)
     vq->handle_aio_output = NULL;
     g_free(vq->used_elems);
     vq->used_elems = NULL;
+    virtio_virtqueue_reset_region_cache(vq);
 }
 
 void virtio_del_queue(VirtIODevice *vdev, int n)
-- 
2.17.1


