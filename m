Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4649E579F99
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 15:26:48 +0200 (CEST)
Received: from localhost ([::1]:59312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDnFP-0007k4-CV
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 09:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oDn63-00079f-1U
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 09:17:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oDn61-0004og-J2
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 09:17:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658236623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2G4CfY7T1VZeOzHmVwzEz7gw1/UKh2ZTwHQxLW6ZvAw=;
 b=ZjpaobXgHYw+J0JG7SaC7IqTJz/spQxJujmKjBl8WM3euZY/2xH50FcKDz7gSroZx1jjCd
 h3+vRbcKGFsQcicupLQb8Ol6w9R7v8idmQOODPeAMHKxsQNn6h8rBQTg9YSq+WnGqBlotd
 LHLIjvzRzV+gafezUwUyFKxtVfa6R7o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-177-CpCpCsJONhC2YZ1kGcYNKg-1; Tue, 19 Jul 2022 09:17:02 -0400
X-MC-Unique: CpCpCsJONhC2YZ1kGcYNKg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0569138149A7;
 Tue, 19 Jul 2022 13:17:02 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-77.pek2.redhat.com [10.72.12.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 158DB40CFD0A;
 Tue, 19 Jul 2022 13:16:59 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 04/24] vdpa: Avoid compiler to squash reads to used idx
Date: Tue, 19 Jul 2022 21:16:17 +0800
Message-Id: <20220719131637.46131-5-jasowang@redhat.com>
In-Reply-To: <20220719131637.46131-1-jasowang@redhat.com>
References: <20220719131637.46131-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

In the next patch we will allow busypolling of this value. The compiler
have a running path where shadow_used_idx, last_used_idx, and vring used
idx are not modified within the same thread busypolling.

This was not an issue before since we always cleared device event
notifier before checking it, and that could act as memory barrier.
However, the busypoll needs something similar to kernel READ_ONCE.

Let's add it here, separated from the polling.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index e2184a4..560d07a 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -327,11 +327,12 @@ static void vhost_handle_guest_kick_notifier(EventNotifier *n)
 
 static bool vhost_svq_more_used(VhostShadowVirtqueue *svq)
 {
+    uint16_t *used_idx = &svq->vring.used->idx;
     if (svq->last_used_idx != svq->shadow_used_idx) {
         return true;
     }
 
-    svq->shadow_used_idx = cpu_to_le16(svq->vring.used->idx);
+    svq->shadow_used_idx = cpu_to_le16(*(volatile uint16_t *)used_idx);
 
     return svq->last_used_idx != svq->shadow_used_idx;
 }
-- 
2.7.4


