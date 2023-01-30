Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A676681081
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 15:04:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMUkE-0002Kd-On; Mon, 30 Jan 2023 09:02:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUk3-0002J3-9O
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:02:40 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUk1-0006gp-NR
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:02:39 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 e10-20020a17090a630a00b0022bedd66e6dso15530545pjj.1
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 06:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=U1sxs2b9gsg+jkzUv1onLcvKq812qwoR1X54ZLz9htA=;
 b=cdkBWimROqxaE1KGR9gK+aLaSfJT2UQMOaG5mV+fs40xECMnrVyNO7S7uVOvtYAbkP
 NWvRT0JNeT8eMx/ub95Blc7U33BgrwPHJkbpble5Oq+731qkd/df55WIARf8/l/xFCKd
 aTV/rgGF3zPsZ1JpjfRDXffcCE6qF7sL45IkR8W/hwvkUK+MEWiSnpFyTr2T5AuoXZcv
 eF3v8+UGCnJTJhRCPJeUc44CjZN/QNbF10WXn8D7yXlVPKUJOpcQTSVUro2MxM2/gqgz
 GZR8Io9xHEMLEE1F0e6prDtJO6r0/VbaGR6VuDbE6AolyifO+QJLSvcJTkJzuX4oYUQo
 grXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U1sxs2b9gsg+jkzUv1onLcvKq812qwoR1X54ZLz9htA=;
 b=uYTo2bmgZpPOanCzQtEV7s9QT4reHm02uQthZtro14RN6aXNNamn7wGEstzWIB2oHZ
 uzEmdyB12X9vAaMbIG1Nnxv/2OZWhRYfaal+BBxH2//oQs0zM/U3qZ48sONtnz9r/Dsa
 MH5vGbk16Dk/1u4dLZ9TCYRQnLNq3VSMa/ebhygyeY+/QxOc938D8yddJucwNWvxczmt
 v5/V9248fe5pzrpZ6TCc06ps8fy2sJYnWjoHN07jJ7nKBgxTgeeh6O7OQ1Kjc4wTho4U
 5jRWdDgPWymwGlfJpaX8xrYKd77EgaJO1vled1PYknrIe15yaA8Afvb32WoOnQlfWSwJ
 /pQQ==
X-Gm-Message-State: AO0yUKVqac/NvSvd1bSldPeb3CWUHzo07X0syJDd6thTZ2l1uoqLp/ed
 EgU5h63xFIjbJ53Y7u5HnOtEJw==
X-Google-Smtp-Source: AK7set+gZ3VdMCG5jocMk8jvF5dO9bR3I6Z9WZPXidWRNXuoylXSfb+Rl9IynAAnMPQiEjeo9nsGWw==
X-Received: by 2002:a17:902:f152:b0:196:5f75:66f9 with SMTP id
 d18-20020a170902f15200b001965f7566f9mr8094575plb.63.1675087355437; 
 Mon, 30 Jan 2023 06:02:35 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a170902ed4400b00186c3afb49esm7877728plb.209.2023.01.30.06.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 06:02:34 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, virtio-fs@redhat.com,
 qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH] vhost-user-fs: Back up vqs before cleaning up vhost_dev
Date: Mon, 30 Jan 2023 23:02:25 +0900
Message-Id: <20230130140225.77964-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

vhost_dev_cleanup() clears vhost_dev so back up its vqs member to free
the memory pointed by the member.

Fixes: 98fc1ada4c ("virtio: add vhost-user-fs base device")
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/virtio/vhost-user-fs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index f5049735ac..83fc20e49e 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -273,6 +273,7 @@ static void vuf_device_unrealize(DeviceState *dev)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VHostUserFS *fs = VHOST_USER_FS(dev);
+    struct vhost_virtqueue *vhost_vqs = fs->vhost_dev.vqs;
     int i;
 
     /* This will stop vhost backend if appropriate. */
@@ -288,8 +289,7 @@ static void vuf_device_unrealize(DeviceState *dev)
     }
     g_free(fs->req_vqs);
     virtio_cleanup(vdev);
-    g_free(fs->vhost_dev.vqs);
-    fs->vhost_dev.vqs = NULL;
+    g_free(vhost_vqs);
 }
 
 static struct vhost_dev *vuf_get_vhost(VirtIODevice *vdev)
-- 
2.39.1


