Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E1041F528
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 20:46:16 +0200 (CEST)
Received: from localhost ([::1]:57996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWNXy-0002Iz-NX
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 14:46:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiang.wang@bytedance.com>)
 id 1mWNUh-0007iq-A0
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 14:42:51 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:33758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jiang.wang@bytedance.com>)
 id 1mWNUb-0004Ng-Nd
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 14:42:49 -0400
Received: by mail-pl1-x632.google.com with SMTP id t4so6907842plo.0
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 11:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Hd6K+SgOQkT3bEJ7q+uzVipVp/2FZApeUYJaVyBum0w=;
 b=KrC5jo7kOwjboHa7bE6VcU63Gkf9InE2DhZ0PlhRVMIeB8X6Hl1NtnsrloK/VJe/9x
 OP3mCldiZUijAEcSc1XOFB49erbl+FKGClJorkrPSfArIk0vMQNBtrLiwhJYOgOvguRE
 INvlml/Syfqh/ztKA4UVCTy1r0wlCR0JnuDubtuQheoG0JEDXJnneq8/TMmswfbBSrU9
 gEqbvMIMD+p+hG4kPgZCrpwxwUnhHp3yY3yG7z7I4fmEwJfIh2n7EZJFvAeKwMfuKtBP
 MZ09a3uSVWQT+r1rPFIiITvr/QODuPmZ4/YBITE4bmBSuqF3JqdDmV5KGDGZ8LUKs5AK
 +j4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Hd6K+SgOQkT3bEJ7q+uzVipVp/2FZApeUYJaVyBum0w=;
 b=afuviMq7WKoe1t4Jz7OXlTzxfLDA6mpRtWw9eY3DQsTheY1425Rd72Uj+7TCltj45S
 ZRSXjIUUAefLpSRBrZSR55MwVor3Ex2jqtH0Eph1NJy+XmmqIirF55e46E83mGZiR5TJ
 4McF1SxOU0dPldskAXc1Tu/wqWyBhrhG3JV2i1tgSgKvxbmDpBAjOXOx5U8Q4Ry7WngF
 bEFgADJPxyJgIoZ2O2xw3Goq+TiFwracQ2Vafikq1Va/i1Zvma2cJE/BRyGZqQC5MmZ0
 HnzFXpT9eqnAtLi1rt2xH6w6gst+x2yhqP3+dYN6bYCSr+8o+ooqwvwC7MYLApzx19Tj
 u5pg==
X-Gm-Message-State: AOAM532pJZ/tPvGUgTmeCI2E8gAtGqfe76auxtE2byhtDULf/WnO9jaU
 eNQSHaBgbDju9oHdN4tTeqz6XhJbWXNAxQ==
X-Google-Smtp-Source: ABdhPJxoZgHObc8DuOP+h7W8O4CkD8i7fOwx7rrHTBLGG7MdzaimByIHIjin0f4FJuIce1zR+X2LQA==
X-Received: by 2002:a17:90b:38cf:: with SMTP id
 nn15mr21666417pjb.81.1633113762299; 
 Fri, 01 Oct 2021 11:42:42 -0700 (PDT)
Received: from ip-10-124-121-13.byted.org
 (ec2-54-241-92-238.us-west-1.compute.amazonaws.com. [54.241.92.238])
 by smtp.gmail.com with ESMTPSA id u22sm3968904pje.10.2021.10.01.11.42.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 11:42:41 -0700 (PDT)
From: Jiang Wang <jiang.wang@bytedance.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1] vsock: don't send messages when vsock device is not started
Date: Fri,  1 Oct 2021 18:42:23 +0000
Message-Id: <20211001184223.3600083-1-jiang.wang@bytedance.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=jiang.wang@bytedance.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Added a check in vhost_vsock_common_send_transport_reset,
and only send messages on event queue when the vsock host
device is started.

Suggested-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Jiang Wang <jiang.wang@bytedance.com>
---
 hw/virtio/vhost-vsock-common.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
index 4ad6e234ad..64425719a2 100644
--- a/hw/virtio/vhost-vsock-common.c
+++ b/hw/virtio/vhost-vsock-common.c
@@ -138,8 +138,10 @@ static void vhost_vsock_common_send_transport_reset(VHostVSockCommon *vvc)
         goto out;
     }
 
-    virtqueue_push(vq, elem, sizeof(event));
-    virtio_notify(VIRTIO_DEVICE(vvc), vq);
+    if (vvc->vhost_dev.started) {
+        virtqueue_push(vq, elem, sizeof(event));
+        virtio_notify(VIRTIO_DEVICE(vvc), vq);
+    }
 
 out:
     g_free(elem);
-- 
2.20.1


