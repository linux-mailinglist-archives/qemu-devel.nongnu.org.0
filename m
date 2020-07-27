Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CC122F25A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jul 2020 16:39:38 +0200 (CEST)
Received: from localhost ([::1]:54340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k04Hx-0004WU-M8
	for lists+qemu-devel@lfdr.de; Mon, 27 Jul 2020 10:39:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1k04Gi-0002sK-9r
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 10:38:20 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:55388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1k04Gg-0001x3-Ck
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 10:38:19 -0400
Received: by mail-wm1-x342.google.com with SMTP id 9so14370863wmj.5
 for <qemu-devel@nongnu.org>; Mon, 27 Jul 2020 07:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=g39FeyoIupGgElrKJmM+MApBcjb1uWaI5d1r2s5CAj0=;
 b=UFezKVSo9huaSjr6qO2OSIOxluPjcl7szcayrL6Ac4VJRA6N5otsf2cNtDmLU+KfX2
 GZLZncY9fn32Lwf8sHZFv+lebZ4l/Q4GrRhCfO9Lh60oMWt2TxQdWeY+uh55Hgvdi64f
 nPU+DTk0zSjVzWizRa+0zKHqzSBQQLzHIQ6TJdJQC84offbACxCZ4bsJgG4uzeFOwZTy
 Fr7n5+a1wdoCYZVal/Is3JX0aB+DSQAmaILBZx3bgpmOVlAQVO9g4nHg+9iElLokg05N
 LmhduWZn7QPER0h8wxfPVRBjNOwSOZgXyanRunIlOscD/A5fClHP8+Xf61Ka/E2c4Zjr
 5THA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=g39FeyoIupGgElrKJmM+MApBcjb1uWaI5d1r2s5CAj0=;
 b=sJNzxXOhPmEEhs1IsAu6p+jpYLoYkLtSrh7CLjNUnmWYpCxxjxgOpwuRapWWJMQSQq
 s2HDTK8s6vxrCj5/5WdZOeG4I1i/L3iReonvxTuOn7iLxHDNvuM0UktrUyWNKw54ywqX
 1Bn1mpFvYFS48jeQ3SaBKkYCCFEGy25lwN2nApVP8PM15U1iFoFcgBG/IAjAo0MJGzWd
 2TylCmaFhPQHUUhSWF+l/z94hXYPhihK6YM8Ovz5RVteIJW+0TeziybqqWp33NPQayOb
 5vdngtiz7/coOOZ/LZLqSYxIFJt8OvdUFYlS2MPRduC3ZU4Dr3FNgDrEvpygHf91YzzQ
 JF6g==
X-Gm-Message-State: AOAM530uAdkZEi2S4ZKAU0Zz7x5paiv5Hjj+WtjQpAMpaA03jKPz0grF
 eiVloGSp1v+SEhVQfVVDE82wlpL27Ws=
X-Google-Smtp-Source: ABdhPJzhDg+IKJCnquzd5xBra7UZsR2D8x4E5/2TlD0TcAtuatnnO3beQS4mvnR/MsP1YMYQ4pwFTQ==
X-Received: by 2002:a1c:e107:: with SMTP id y7mr12860044wmg.99.1595860695795; 
 Mon, 27 Jul 2020 07:38:15 -0700 (PDT)
Received: from f2.redhat.com (bzq-109-65-42-178.red.bezeqint.net.
 [109.65.42.178])
 by smtp.gmail.com with ESMTPSA id y189sm21875317wmd.27.2020.07.27.07.38.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 27 Jul 2020 07:38:15 -0700 (PDT)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
To: qemu-devel@nongnu.org,
	mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH] virtio-pci: fix wrong index in virtio_pci_queue_enabled
Date: Mon, 27 Jul 2020 17:38:07 +0300
Message-Id: <20200727143807.19230-1-yuri.benditovich@daynix.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: none client-ip=2a00:1450:4864:20::342;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: yan@daynix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

https://bugzilla.redhat.com/show_bug.cgi?id=1702608

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
---
 hw/virtio/virtio-pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index ada1101d07..2b1f9cc67b 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1113,7 +1113,7 @@ static bool virtio_pci_queue_enabled(DeviceState *d, int n)
     VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
 
     if (virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
-        return proxy->vqs[vdev->queue_sel].enabled;
+        return proxy->vqs[n].enabled;
     }
 
     return virtio_queue_enabled(vdev, n);
-- 
2.17.1


