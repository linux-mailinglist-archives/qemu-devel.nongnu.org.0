Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AD46AFBE8
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:14:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiLa-0002Gb-V4; Tue, 07 Mar 2023 20:12:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiLY-0002Di-VK
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:12:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiLX-0001bX-6N
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:12:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678237918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zunM/9fttTGR9NAQCUCFyN3JaEHGcb4VhaqCJlS6DMk=;
 b=Y5IoibWBR+N6r3vLUbYy/kuz5XVMCVadHI+HFlZ1dRKXXhwZcNDKIJ0TiArYrsxREgHEGF
 FhG8s9c/zTBziiFyw3WelhjaG+TQvRPkymUSx8FJH+Fwc2fx7Nv+hd/jQ74RGf9b3dvM0O
 9m8oJgK9zinvmrJyxojslXwjjOCBNJc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-428-YEd8a78vPLem8tH6B1mZXg-1; Tue, 07 Mar 2023 20:11:57 -0500
X-MC-Unique: YEd8a78vPLem8tH6B1mZXg-1
Received: by mail-ed1-f69.google.com with SMTP id
 fi8-20020a056402550800b004a26cc7f6cbso21406089edb.4
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:11:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678237916;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zunM/9fttTGR9NAQCUCFyN3JaEHGcb4VhaqCJlS6DMk=;
 b=mV/eosrPHllCFxesB+vxHDdZBqpUywPPkXVKQU9cwTrQisNV97/Dx7Z1eeCBvypbRF
 8p1lRh59zMuT+AGs7cYrg23U1gAfpn/thUW8ilDdtVjhOKG4HfJBj/qtPwNFhZqUv7a6
 tPKwwbthrfB9AdMCtEDpaFsin4BF2W02/84+kfpZgUFwSp/jCfFBh3W8Go2eiFu6quHm
 20WjgXvEwTRpenjyMVG5MFlammC81NyYGrrVEiDW03IrWzQxlcussM43RjQW4jd/AnBB
 kgyN0a2+5C3YHbGpPitscS5h1cDqc0XIxmioC8cs6ISORRa2cBk5ZX7kBziVnLx7hbzq
 i/0A==
X-Gm-Message-State: AO0yUKWWL8xO1MzGSlAoDEjTj0z9suXQndmfdjYG03UinUXXwhlApqp1
 mO1tqXgYynPViGQDpDduXFJVg5eZir8NOX0gQDpDijJKSfiVgYgoJB7OEZ23nLFbtUsggTFt4sq
 nRnBEHQWN9zuhalSJ9++GeaxOvJthxhxZJ/CdRHr/EmnRg3aqC+IzjnTEKdyi9PMPKgTD
X-Received: by 2002:a17:906:e08b:b0:8ea:825:a5d8 with SMTP id
 gh11-20020a170906e08b00b008ea0825a5d8mr17026704ejb.17.1678237915977; 
 Tue, 07 Mar 2023 17:11:55 -0800 (PST)
X-Google-Smtp-Source: AK7set+M/apB2ANplbSROLm/n1mn7zisOYJzoMUVL3ZN+Mf3oqzFrIMUXR/rIH+/gsJn2RrM9uev/A==
X-Received: by 2002:a17:906:e08b:b0:8ea:825:a5d8 with SMTP id
 gh11-20020a170906e08b00b008ea0825a5d8mr17026683ejb.17.1678237915596; 
 Tue, 07 Mar 2023 17:11:55 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 y27-20020a17090629db00b008f14cc5f2e4sm6798044eje.68.2023.03.07.17.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:11:55 -0800 (PST)
Date: Tue, 7 Mar 2023 20:11:53 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 Lei Yang <leiyang@redhat.com>
Subject: [PULL 21/73] vdpa: disable RAM block discard only for the first device
Message-ID: <a230c4712b9d4af202883b789e80780265b00de7.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
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

Although it does not make a big difference, its more correct and
simplifies the cleanup path in subsequent patches.

Move ram_block_discard_disable(false) call to the top of
vhost_vdpa_cleanup because:
* We cannot use vhost_vdpa_first_dev after dev->opaque = NULL
  assignment.
* Improve the stack order in cleanup: since it is the last action taken
  in init, it should be the first at cleanup.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Message-Id: <20230303172445.1089785-10-eperezma@redhat.com>
Tested-by: Lei Yang <leiyang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index c9a82ce5e0..49afa59261 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -431,16 +431,6 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
     trace_vhost_vdpa_init(dev, opaque);
     int ret;
 
-    /*
-     * Similar to VFIO, we end up pinning all guest memory and have to
-     * disable discarding of RAM.
-     */
-    ret = ram_block_discard_disable(true);
-    if (ret) {
-        error_report("Cannot set discarding of RAM broken");
-        return ret;
-    }
-
     v = opaque;
     v->dev = dev;
     dev->opaque =  opaque ;
@@ -452,6 +442,16 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
         return 0;
     }
 
+    /*
+     * Similar to VFIO, we end up pinning all guest memory and have to
+     * disable discarding of RAM.
+     */
+    ret = ram_block_discard_disable(true);
+    if (ret) {
+        error_report("Cannot set discarding of RAM broken");
+        return ret;
+    }
+
     vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
                                VIRTIO_CONFIG_S_DRIVER);
 
@@ -577,12 +577,15 @@ static int vhost_vdpa_cleanup(struct vhost_dev *dev)
     assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA);
     v = dev->opaque;
     trace_vhost_vdpa_cleanup(dev, v);
+    if (vhost_vdpa_first_dev(dev)) {
+        ram_block_discard_disable(false);
+    }
+
     vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
     memory_listener_unregister(&v->listener);
     vhost_vdpa_svq_cleanup(dev);
 
     dev->opaque = NULL;
-    ram_block_discard_disable(false);
 
     return 0;
 }
-- 
MST


