Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 167BA1CAD85
	for <lists+qemu-devel@lfdr.de>; Fri,  8 May 2020 15:04:37 +0200 (CEST)
Received: from localhost ([::1]:60372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jX2g7-00075l-UR
	for lists+qemu-devel@lfdr.de; Fri, 08 May 2020 09:04:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1jX2X0-0007Wu-Ei
 for qemu-devel@nongnu.org; Fri, 08 May 2020 08:55:10 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:33260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1jX2Wz-0003fs-Fz
 for qemu-devel@nongnu.org; Fri, 08 May 2020 08:55:10 -0400
Received: by mail-wr1-x442.google.com with SMTP id h9so1740750wrt.0
 for <qemu-devel@nongnu.org>; Fri, 08 May 2020 05:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=OHvBPJe5dvk8hPuFqDgGk/yn6yHcuCjG//Dr25P1Lus=;
 b=pt4fYbSiLbj5//HRxyJLdguuEKS7U/VGHx0WtHuEW1zRYt5oOq8YU2qqAE3r+a7ZJy
 s9I5LqxOYLHYXct06yyaXUD8/tK0JFVuDXFm+inERMtrcE7oEjMncV/hfZq4NbGch1Nt
 w3qp6bFdu4ehQKKmt6qeMeAN150JldsHHRsNVYKiE5ofmMYZBwwd+PugD10tqgZtbyZd
 EYW7zZkI59ygOkalNVw9/QeN4hNS+CkDTJsB7iEPx+HSJJTX3cCe57ZoIVmdyIFhvbVp
 C3eI9n++Rb1iVDI0LnEmMfHnx96MCgrnaIRE/0DvEKDyiX7Y9ZVmmb/id64XAj4J5suN
 XHyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=OHvBPJe5dvk8hPuFqDgGk/yn6yHcuCjG//Dr25P1Lus=;
 b=qhHqD5Pxr27swUF7i/fr8ejKNaO4FLeH92HvJUyoB8zIIzcXtcVxp6CiwALSvqOwx9
 +qbsXlZz1QZ/yAt+A3TeilN5P9rkEYsQIcvzcamsCJlsPSMsAeyr01TwGUXk1RCx8tAR
 XCLkd9CUC5iqYfaaKw8EjCnmrnq1we2PsJukpKxbuC1ZhaELKvGbcLzxjsX7fqGw9pMD
 ZvN4waYyvxFEm8DtWdBLYg9AnUCvaURGOY70RxM3AdXKozxb74OwM30Dc31Jasd2TTYG
 zbwVajgG5Ux+0JpZJzTix4KKQEZAWd3JfunPERo08q0fL23Id58ipXgNVKwbhPaNnFRe
 BMZA==
X-Gm-Message-State: AGi0PuZLjzmItgc6MjJXyJnQHW0nYLpkxfAqW4oiUc6FdRhbMkS9P2Wz
 lHrfvx+4hbi+FBFnD/lf1oWkcOFNgYUbnQ==
X-Google-Smtp-Source: APiQypJB04i6f97WTxW22k0X29rKHvWCqywCLZjCNFcfs/2echI29oq15621ULMKzQlRgpm5Fwa3LA==
X-Received: by 2002:adf:e5ce:: with SMTP id a14mr2782846wrn.82.1588942508058; 
 Fri, 08 May 2020 05:55:08 -0700 (PDT)
Received: from f2.redhat.com (bzq-79-183-19-16.red.bezeqint.net.
 [79.183.19.16])
 by smtp.gmail.com with ESMTPSA id a8sm2852375wrg.85.2020.05.08.05.55.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 08 May 2020 05:55:07 -0700 (PDT)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
To: qemu-devel@nongnu.org, mst@redhat.com, jasowang@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com
Subject: [PATCH 6/7] virtio-net: add migration support for RSS and hash report
Date: Fri,  8 May 2020 15:54:51 +0300
Message-Id: <20200508125452.7802-7-yuri.benditovich@daynix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200508125452.7802-1-yuri.benditovich@daynix.com>
References: <20200508125452.7802-1-yuri.benditovich@daynix.com>
Received-SPF: none client-ip=2a00:1450:4864:20::442;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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

Save and restore RSS/hash report configuration.

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
---
 hw/net/virtio-net.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 5facd333ce..c263b1511d 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -2777,6 +2777,13 @@ static int virtio_net_post_load_device(void *opaque, int version_id)
         }
     }
 
+    if (n->rss_data.enabled) {
+        trace_virtio_net_rss_enable(n->rss_data.hash_types,
+                                    n->rss_data.indirections_len,
+                                    sizeof(n->rss_data.key));
+    } else {
+        trace_virtio_net_rss_disable();
+    }
     return 0;
 }
 
@@ -2954,6 +2961,32 @@ static const VMStateDescription vmstate_virtio_net_has_vnet = {
     },
 };
 
+static bool virtio_net_rss_needed(void *opaque)
+{
+    return VIRTIO_NET(opaque)->rss_data.enabled;
+}
+
+static const VMStateDescription vmstate_virtio_net_rss = {
+    .name      = "virtio-net-device/rss",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = virtio_net_rss_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_BOOL(rss_data.enabled, VirtIONet),
+        VMSTATE_BOOL(rss_data.redirect, VirtIONet),
+        VMSTATE_BOOL(rss_data.populate_hash, VirtIONet),
+        VMSTATE_UINT32(rss_data.hash_types, VirtIONet),
+        VMSTATE_UINT16(rss_data.indirections_len, VirtIONet),
+        VMSTATE_UINT16(rss_data.default_queue, VirtIONet),
+        VMSTATE_UINT8_ARRAY(rss_data.key, VirtIONet,
+                            VIRTIO_NET_RSS_MAX_KEY_SIZE),
+        VMSTATE_VARRAY_UINT16_ALLOC(rss_data.indirections_table, VirtIONet,
+                                    rss_data.indirections_len, 0,
+                                    vmstate_info_uint16, uint16_t),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
 static const VMStateDescription vmstate_virtio_net_device = {
     .name = "virtio-net-device",
     .version_id = VIRTIO_NET_VM_VERSION,
@@ -3004,6 +3037,10 @@ static const VMStateDescription vmstate_virtio_net_device = {
                             has_ctrl_guest_offloads),
         VMSTATE_END_OF_LIST()
    },
+    .subsections = (const VMStateDescription * []) {
+        &vmstate_virtio_net_rss,
+        NULL
+    }
 };
 
 static NetClientInfo net_virtio_info = {
-- 
2.17.1


