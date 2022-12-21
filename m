Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 462BC653165
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:11:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7yna-0005mL-FU; Wed, 21 Dec 2022 08:06:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ymu-0005gE-6o
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:05:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7yms-0004JJ-EU
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:05:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671627933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U5jnRO+CXmUqZycXMI7Tvaxwpt+pyPcYxwF7irG1lWg=;
 b=bDQ9LTHA/C5UJ8C971aSNZRf54cow3S+UcLYH640dehLF9nHHHhI9D6wp1PoGBcqgi8RGa
 UJIBfBFpm+3bX9bI76YnHRwj+AG7Z6POS6fsooo6jUy0IMePLEPwkfiBC/Y5uMXBSjZQ3O
 iSlRqPROshbVvr1lGwzgSsqvmLuG0O8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-608-8P8nPIkhPXSQdlhGx__LVw-1; Wed, 21 Dec 2022 08:05:32 -0500
X-MC-Unique: 8P8nPIkhPXSQdlhGx__LVw-1
Received: by mail-wm1-f69.google.com with SMTP id
 r129-20020a1c4487000000b003d153a83d27so7940234wma.0
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 05:05:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U5jnRO+CXmUqZycXMI7Tvaxwpt+pyPcYxwF7irG1lWg=;
 b=WgSOyvu2NDxKR/2U3HChkTunMHZRu5oovz0phEC2TTABaLKqE+co4pWK+HjO2tSLM/
 ORkFsW1B72KlMwlMFzCJepzkQZtKaKQJZ8hjbvDoDnZ1ceGCMmECD0hs/436Miwc0D/z
 XY1tqYToL0ydSN8Ql9mJ711DzTdpJH2iaaNuLpMnC/gGypH0WMeoS3JtMVcVXzTenLn1
 kNKi1lzUROaVURY+8i1BJXPxGodOoEScf/ROq24q8iY6ELmBhXFn/kBbu3k4XbuPZ6tg
 KUjgHk/pd0NbP3mPD3NBeNlhV4dLQe4YdHzymsQ0p19KFy/P7W0TpELS0XeBYNZEsF4Q
 upCA==
X-Gm-Message-State: AFqh2koTvmFoXXjm7APsG9Aryszyizv0f/56ExQ/b7O733oaSHVkLBjv
 qMGu912Q8QO4Nu9huR1HFv1S8wu/qcbUD91pbfUZy/jd8hZMZdflXwXXJZFCPFStRB0RDa8Xd6Q
 71yoDnYmwxqHrhV4gvy9ctwAiBrGD2pyfj4/0g4s5/s6BJ1XRhG+UTy0J7Whf
X-Received: by 2002:a5d:624f:0:b0:24d:12ce:2dca with SMTP id
 m15-20020a5d624f000000b0024d12ce2dcamr1201662wrv.53.1671627929110; 
 Wed, 21 Dec 2022 05:05:29 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsMxLbxzoDhv0DGBJX226yqexKMcYU02kP9cSf3YvcyKNSyyls7QJ1nkIILdEuj9PAso7/LMg==
X-Received: by 2002:a5d:624f:0:b0:24d:12ce:2dca with SMTP id
 m15-20020a5d624f000000b0024d12ce2dcamr1201648wrv.53.1671627928820; 
 Wed, 21 Dec 2022 05:05:28 -0800 (PST)
Received: from redhat.com ([2.52.8.61]) by smtp.gmail.com with ESMTPSA id
 bo28-20020a056000069c00b002415dd45320sm15572331wrb.112.2022.12.21.05.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 05:05:27 -0800 (PST)
Date: Wed, 21 Dec 2022 08:05:25 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 18/41] vdpa: move SVQ vring features check to net/
Message-ID: <20221221130339.1234592-19-mst@redhat.com>
References: <20221221130339.1234592-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221221130339.1234592-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Eugenio Pérez <eperezma@redhat.com>

The next patches will start control SVQ if possible. However, we don't
know if that will be possible at qemu boot anymore.

Since the moved checks will be already evaluated at net/ to know if it
is ok to shadow CVQ, move them.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20221215113144.322011-8-eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 32 ++------------------------------
 net/vhost-vdpa.c       |  3 ++-
 2 files changed, 4 insertions(+), 31 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 7f6bfd961c..dd5258919e 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -389,29 +389,9 @@ static int vhost_vdpa_get_dev_features(struct vhost_dev *dev,
     return ret;
 }
 
-static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
-                               Error **errp)
+static void vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v)
 {
     g_autoptr(GPtrArray) shadow_vqs = NULL;
-    uint64_t dev_features, svq_features;
-    int r;
-    bool ok;
-
-    if (!v->shadow_vqs_enabled) {
-        return 0;
-    }
-
-    r = vhost_vdpa_get_dev_features(hdev, &dev_features);
-    if (r != 0) {
-        error_setg_errno(errp, -r, "Can't get vdpa device features");
-        return r;
-    }
-
-    svq_features = dev_features;
-    ok = vhost_svq_valid_features(svq_features, errp);
-    if (unlikely(!ok)) {
-        return -1;
-    }
 
     shadow_vqs = g_ptr_array_new_full(hdev->nvqs, vhost_svq_free);
     for (unsigned n = 0; n < hdev->nvqs; ++n) {
@@ -422,7 +402,6 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
     }
 
     v->shadow_vqs = g_steal_pointer(&shadow_vqs);
-    return 0;
 }
 
 static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
@@ -447,10 +426,7 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
     dev->opaque =  opaque ;
     v->listener = vhost_vdpa_memory_listener;
     v->msg_type = VHOST_IOTLB_MSG_V2;
-    ret = vhost_vdpa_init_svq(dev, v, errp);
-    if (ret) {
-        goto err;
-    }
+    vhost_vdpa_init_svq(dev, v);
 
     if (!vhost_vdpa_first_dev(dev)) {
         return 0;
@@ -460,10 +436,6 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
                                VIRTIO_CONFIG_S_DRIVER);
 
     return 0;
-
-err:
-    ram_block_discard_disable(false);
-    return ret;
 }
 
 static void vhost_vdpa_host_notifier_uninit(struct vhost_dev *dev,
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index b6462f0192..e829ef1f43 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -118,9 +118,10 @@ static bool vhost_vdpa_net_valid_svq_features(uint64_t features, Error **errp)
     if (invalid_dev_features) {
         error_setg(errp, "vdpa svq does not work with features 0x%" PRIx64,
                    invalid_dev_features);
+        return false;
     }
 
-    return !invalid_dev_features;
+    return vhost_svq_valid_features(features, errp);
 }
 
 static int vhost_vdpa_net_check_device_id(struct vhost_net *net)
-- 
MST


