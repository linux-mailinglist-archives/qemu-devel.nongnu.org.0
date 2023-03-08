Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 180AA6AFC27
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:20:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiLO-0001Mi-NS; Tue, 07 Mar 2023 20:11:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiLL-0001B4-ST
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:11:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiLJ-0001Za-Fw
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:11:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678237905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jAuJ8Cc9JessIKgxqVQNv+vUmTknjcYl89umLK8p05M=;
 b=bp7i+vXpSSx8B0MG97TSa61KQOnX7yhuzQJnPfEVvtzXRIcpVVguflb9omsbjLiaET6q3C
 GRRRzgwbKr+d+gZnFNZ2bGVE8l3adky5vN6fFTqmQBG5Id1MqF85Oy7zCuiCZ9zx2F0ifr
 U+lybw8iPz6nea/b+0GelTevPIg5lRQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-445-k4wAfioMOf2gg7BJNrWVKA-1; Tue, 07 Mar 2023 20:11:43 -0500
X-MC-Unique: k4wAfioMOf2gg7BJNrWVKA-1
Received: by mail-ed1-f69.google.com with SMTP id
 y24-20020aa7ccd8000000b004be3955a42eso21651500edt.22
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:11:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678237902;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jAuJ8Cc9JessIKgxqVQNv+vUmTknjcYl89umLK8p05M=;
 b=5Kp3LPkvy360CaGEv/Ti1kdW92DtaGGgveuf3tKKB2odg7OAqUatEuv922ya6aNbRj
 UiaWZLpSdxusfkh88giCNQMUfEHv86wYPO/vg6h8ZCHIY6EY1VuYOUq4mECYlG6YmOOZ
 dp3jYbxp0xeqNCZlrvzQCftvH/m9IxETiPIrs/a9y7SVf1/1JEYQ5ybO254qiU/IxS4u
 jwlQMP0rkncD3s2sdovKEmMyhM3HnePEj11M7D7kNKiKLc2TPrOkNooBrI5qYIWnGfj6
 s1B3lgD8VH/8m2bakVqEpaZKlHPTTAdR45VO6Op8LaSDbmGmdwFmiWvqsu21NbtVbynS
 c3dQ==
X-Gm-Message-State: AO0yUKUCkpM8sjLbuwaBzNlKETTuo3fOc9KHyDB2yx7xYlEM8TCRudtb
 9PS621cpqF6LlzmND0LepWQBQAycbIkc6FPEwSNrp2ebypZvnCUGc4V/puSTRHZxmRFO/JuSCbn
 biD/71dqf1H0aRzbxxj0ZMZBnRgcDK4xoTNsDXR0NCIIQhjHU8pb+LBxew9rz9fe8Rbys
X-Received: by 2002:a17:907:a40b:b0:87b:d2b3:67ca with SMTP id
 sg11-20020a170907a40b00b0087bd2b367camr20507654ejc.75.1678237902271; 
 Tue, 07 Mar 2023 17:11:42 -0800 (PST)
X-Google-Smtp-Source: AK7set/2rNSpx30C2REoaSoM9I38lPqLJqey+XDL34YFYFfdLpO/WWRrqPt9Fmc5fLJ7xhKWcZ01nQ==
X-Received: by 2002:a17:907:a40b:b0:87b:d2b3:67ca with SMTP id
 sg11-20020a170907a40b00b0087bd2b367camr20507633ejc.75.1678237901944; 
 Tue, 07 Mar 2023 17:11:41 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 l26-20020a170906231a00b008b69aa62efcsm6775079eja.62.2023.03.07.17.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:11:41 -0800 (PST)
Date: Tue, 7 Mar 2023 20:11:38 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Lei Yang <leiyang@redhat.com>
Subject: [PULL 16/73] vdpa: rewind at get_base, not set_base
Message-ID: <4241e8bd728f1014ac977eb6756e41f549d93efd.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

At this moment it is only possible to migrate to a vdpa device running
with x-svq=on. As a protective measure, the rewind of the inflight
descriptors was done at the destination. That way if the source sent a
virtqueue with inuse descriptors they are always discarded.

Since this series allows to migrate also to passthrough devices with no
SVQ, the right thing to do is to rewind at the source so the base of
vrings are correct.

Support for inflight descriptors may be added in the future.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20230303172445.1089785-5-eperezma@redhat.com>
Tested-by: Lei Yang <leiyang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c |  8 ++++++--
 hw/virtio/vhost-vdpa.c             | 11 -----------
 2 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 515ccf870d..8361e70d1b 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -694,13 +694,17 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
         g_autofree VirtQueueElement *elem = NULL;
         elem = g_steal_pointer(&svq->desc_state[i].elem);
         if (elem) {
-            virtqueue_detach_element(svq->vq, elem, 0);
+            /*
+             * TODO: This is ok for networking, but other kinds of devices
+             * might have problems with just unpop these.
+             */
+            virtqueue_unpop(svq->vq, elem, 0);
         }
     }
 
     next_avail_elem = g_steal_pointer(&svq->next_guest_avail_elem);
     if (next_avail_elem) {
-        virtqueue_detach_element(svq->vq, next_avail_elem, 0);
+        virtqueue_unpop(svq->vq, next_avail_elem, 0);
     }
     svq->vq = NULL;
     g_free(svq->desc_next);
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 5cfa9d5d27..1550b1e26a 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -1170,18 +1170,7 @@ static int vhost_vdpa_set_vring_base(struct vhost_dev *dev,
                                        struct vhost_vring_state *ring)
 {
     struct vhost_vdpa *v = dev->opaque;
-    VirtQueue *vq = virtio_get_queue(dev->vdev, ring->index);
 
-    /*
-     * vhost-vdpa devices does not support in-flight requests. Set all of them
-     * as available.
-     *
-     * TODO: This is ok for networking, but other kinds of devices might
-     * have problems with these retransmissions.
-     */
-    while (virtqueue_rewind(vq, 1)) {
-        continue;
-    }
     if (v->shadow_vqs_enabled) {
         /*
          * Device vring base was set at device start. SVQ base is handled by
-- 
MST


