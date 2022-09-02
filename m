Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C655AA867
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 08:57:15 +0200 (CEST)
Received: from localhost ([::1]:58604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU0c6-0002Ls-PS
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 02:57:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oU0NV-0007Dx-Ru
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 02:42:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oU0NT-0004mM-RM
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 02:42:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662100927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=leLZWe3M4GBhmVFw5b/TzZU049vylqkNsjkHliu3Ttw=;
 b=a3wFbEfnoJQhOuuHVRJ+SWKnA2zdcoWjPiKgjJPPlxcyNR0BcTmfOtqRwibKO/RNslHVQ0
 cEvG4sOUhR+weCLq8YLJ6aU+/1QDz4IQffAfG50ryqaZoS3gsQNKYRUyA6BSTbLlBB8nlm
 rQMTntqTK3+V/DtktUZLImypVkVD8c8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-437-MY3mFJ1hPvWhFOvQP84s-g-1; Fri, 02 Sep 2022 02:42:03 -0400
X-MC-Unique: MY3mFJ1hPvWhFOvQP84s-g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91E35294EDFB;
 Fri,  2 Sep 2022 06:42:03 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-152.pek2.redhat.com
 [10.72.12.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2011A1410DD5;
 Fri,  2 Sep 2022 06:42:00 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 Lei Yang <leiyang@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 06/21] vhost: Always store new kick fd on
 vhost_svq_set_svq_kick_fd
Date: Fri,  2 Sep 2022 14:41:23 +0800
Message-Id: <20220902064138.56468-7-jasowang@redhat.com>
In-Reply-To: <20220902064138.56468-1-jasowang@redhat.com>
References: <20220902064138.56468-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eugenio Pérez <eperezma@redhat.com>

We can unbind twice a file descriptor if we call twice
vhost_svq_set_svq_kick_fd because of this. Since it comes from vhost and
not from SVQ, that file descriptor could be a different thing that
guest's vhost notifier.

Likewise, it can happens the same if a guest start and stop the device
multiple times.

Reported-by: Lei Yang <leiyang@redhat.com>
Fixes: dff4426fa6 ("vhost: Add Shadow VirtQueue kick forwarding capabilities")
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index e495672..82a784d 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -602,13 +602,13 @@ void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd)
         event_notifier_set_handler(svq_kick, NULL);
     }
 
+    event_notifier_init_fd(svq_kick, svq_kick_fd);
     /*
      * event_notifier_set_handler already checks for guest's notifications if
      * they arrive at the new file descriptor in the switch, so there is no
      * need to explicitly check for them.
      */
     if (poll_start) {
-        event_notifier_init_fd(svq_kick, svq_kick_fd);
         event_notifier_set(svq_kick);
         event_notifier_set_handler(svq_kick, vhost_handle_guest_kick_notifier);
     }
@@ -655,7 +655,7 @@ void vhost_svq_start(VhostShadowVirtqueue *svq, VirtIODevice *vdev,
  */
 void vhost_svq_stop(VhostShadowVirtqueue *svq)
 {
-    event_notifier_set_handler(&svq->svq_kick, NULL);
+    vhost_svq_set_svq_kick_fd(svq, VHOST_FILE_UNBIND);
     g_autofree VirtQueueElement *next_avail_elem = NULL;
 
     if (!svq->vq) {
-- 
2.7.4


