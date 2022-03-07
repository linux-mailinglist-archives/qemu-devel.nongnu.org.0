Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC2B4CF9A8
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:11:41 +0100 (CET)
Received: from localhost ([::1]:45298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRAL6-0008IG-5T
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:11:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRABg-0000Jc-99
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:01:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRABe-0002cP-JC
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:01:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646647314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tZpSULKN+Xln7Ddi4XAIsi4Ma9E+7GOx9U1W/EkBGEQ=;
 b=jSdg67DdEXCMdi/Ia+uRBca6UoOIZ+BrxHIf1Q1VkkNgtqX/Z4KVgm2gSLFz9EL58cZxNH
 BibBt+dV+h4z1PqeG56IV0B7uryx8WUNQYk1ht2ozeB6sC6UaSMjRxj8GcYVE6JMzXm++m
 BZJNZmLRFUW9qQUGgXolNW9lLYSgKL8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-176-EJfIXZ9FPWia2M_xDamzAA-1; Mon, 07 Mar 2022 05:01:53 -0500
X-MC-Unique: EJfIXZ9FPWia2M_xDamzAA-1
Received: by mail-ed1-f71.google.com with SMTP id
 n11-20020aa7c68b000000b0041641550e11so1945812edq.8
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:01:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tZpSULKN+Xln7Ddi4XAIsi4Ma9E+7GOx9U1W/EkBGEQ=;
 b=A9GYw9rorAde7A0YNajZum/0E0vifzqH0lybzR/xJRqN7aMm7Guap5futmZS0n6ZHs
 EHAQN1etrVwPOXp+wZwkqAoZrdIDcwWS1brlRF3Iv3kGrXW1g7pybCqyL4npAHTS/3Sl
 6TU5HH9vFz+XbIcHtlPZwAa2HUahAM1Xh2+ervpIvl+yLE6AUJOat0C8/Zoz5Pw6qFEc
 R25ra3mceybANEexUzs1ca9TgHZvEuApIVKpDqRHgggbmAECmuxvGfwEDpmXRHrrVE+m
 +rahExEeV+qXOO26Ds8+HkvFsYwf1W1c/1Apx6GIhB8SmKGsgDtWfEtwe3qigN0lcbNB
 6HUQ==
X-Gm-Message-State: AOAM532Wc8BcyG3O2MRrUuvNuEgsPTHhDWYinLyWxBeYfYCkc1r8HFbU
 6grYpl2NotxVzSdyBbUgmbmuytGk/sL3HhbaBBaQ9lFQbZhpaNjRE4k4ERyOnj1IKEO58elrzVl
 6isJuSFrDpX0HNGY52I0Sc0rGFfB1CgjNgyzvYzkUy0m33fQubb7PUCssE8Ao
X-Received: by 2002:a17:907:3e18:b0:6da:7ac5:4ad4 with SMTP id
 hp24-20020a1709073e1800b006da7ac54ad4mr8615303ejc.212.1646647311558; 
 Mon, 07 Mar 2022 02:01:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJynOShM+dr+Vgk2lUAfefIcA0Fo2SO1kqhnA5d7d1dKatbwPAFdpFO66HGUpXx/jbdpAVwPNQ==
X-Received: by 2002:a17:907:3e18:b0:6da:7ac5:4ad4 with SMTP id
 hp24-20020a1709073e1800b006da7ac54ad4mr8615286ejc.212.1646647311257; 
 Mon, 07 Mar 2022 02:01:51 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 fs6-20020a170907600600b006da8ec6e4a6sm4538663ejc.26.2022.03.07.02.01.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 02:01:50 -0800 (PST)
Date: Mon, 7 Mar 2022 05:01:48 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 09/47] vhost-user: remove VirtQ notifier restore
Message-ID: <20220307100058.449628-10-mst@redhat.com>
References: <20220307100058.449628-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307100058.449628-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-stable@nongnu.org,
 Xueming Li <xuemingl@nvidia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xueming Li <xuemingl@nvidia.com>

Notifier set when vhost-user backend asks qemu to mmap an FD and
offset. When vhost-user backend restart or getting killed, VQ notifier
FD and mmap addresses become invalid. After backend restart, MR contains
the invalid address will be restored and fail on notifier access.

On the other hand, qemu should munmap the notifier, release underlying
hardware resources to enable backend restart and allocate hardware
notifier resources correctly.

Qemu shouldn't reference and use resources of disconnected backend.

This patch removes VQ notifier restore, uses the default vhost-user
notifier to avoid invalid address access.

After backend restart, the backend should ask qemu to install a hardware
notifier if needed.

Fixes: 44866521bd6e ("vhost-user: support registering external host notifiers")
Cc: qemu-stable@nongnu.org
Signed-off-by: Xueming Li <xuemingl@nvidia.com>
Message-Id: <20220207071929.527149-2-xuemingl@nvidia.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vhost-user.h |  1 -
 hw/virtio/vhost-user.c         | 19 +------------------
 2 files changed, 1 insertion(+), 19 deletions(-)

diff --git a/include/hw/virtio/vhost-user.h b/include/hw/virtio/vhost-user.h
index a9abca3288..f6012b2078 100644
--- a/include/hw/virtio/vhost-user.h
+++ b/include/hw/virtio/vhost-user.h
@@ -14,7 +14,6 @@
 typedef struct VhostUserHostNotifier {
     MemoryRegion mr;
     void *addr;
-    bool set;
 } VhostUserHostNotifier;
 
 typedef struct VhostUserState {
diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 662853513e..ebe9bd58d0 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1162,19 +1162,6 @@ static int vhost_user_set_vring_num(struct vhost_dev *dev,
     return vhost_set_vring(dev, VHOST_USER_SET_VRING_NUM, ring);
 }
 
-static void vhost_user_host_notifier_restore(struct vhost_dev *dev,
-                                             int queue_idx)
-{
-    struct vhost_user *u = dev->opaque;
-    VhostUserHostNotifier *n = &u->user->notifier[queue_idx];
-    VirtIODevice *vdev = dev->vdev;
-
-    if (n->addr && !n->set) {
-        virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, true);
-        n->set = true;
-    }
-}
-
 static void vhost_user_host_notifier_remove(struct vhost_dev *dev,
                                             int queue_idx)
 {
@@ -1182,17 +1169,14 @@ static void vhost_user_host_notifier_remove(struct vhost_dev *dev,
     VhostUserHostNotifier *n = &u->user->notifier[queue_idx];
     VirtIODevice *vdev = dev->vdev;
 
-    if (n->addr && n->set) {
+    if (n->addr) {
         virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, false);
-        n->set = false;
     }
 }
 
 static int vhost_user_set_vring_base(struct vhost_dev *dev,
                                      struct vhost_vring_state *ring)
 {
-    vhost_user_host_notifier_restore(dev, ring->index);
-
     return vhost_set_vring(dev, VHOST_USER_SET_VRING_BASE, ring);
 }
 
@@ -1558,7 +1542,6 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
     }
 
     n->addr = addr;
-    n->set = true;
 
     return 0;
 }
-- 
MST


