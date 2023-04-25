Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA286EE6AF
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 19:29:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prMSb-0007Dr-2X; Tue, 25 Apr 2023 13:28:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1prMSY-0007DY-7c
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 13:28:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1prMSV-0003Ew-Aq
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 13:28:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682443686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8sGNuhNmUwwRYy7CrP+NJgAMgjXbbyx47QaYmFQ/Pvo=;
 b=ijIgSKpIikQOBHGGtiCruQsEp0o/CEAoX2txob8y5yW90JZoI/9lXpsKnc+GPRf/FvqSpe
 s/pS0TVzjSiIuWdTy3aZWE3jOQB3BC8E8HrJIVjwph286thEQ0U3uNtisDMlT2O/k+7MCK
 Ye2GtUXFFGc1D9LyuVof8F+dCc2QO7g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-xunltWRNMdyqImzyKHy4uA-1; Tue, 25 Apr 2023 13:28:02 -0400
X-MC-Unique: xunltWRNMdyqImzyKHy4uA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 315EC185A791;
 Tue, 25 Apr 2023 17:28:01 +0000 (UTC)
Received: from localhost (unknown [10.39.193.242])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F13CC15BA0;
 Tue, 25 Apr 2023 17:28:00 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, xen-devel@lists.xenproject.org,
 eesposit@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Peter Lieven <pl@kamp.de>,
 Paul Durrant <paul@xen.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-block@nongnu.org,
 Stefano Garzarella <sgarzare@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Stefan Weil <sw@weilnetz.de>,
 Xie Yongji <xieyongji@bytedance.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Hanna Reitz <hreitz@redhat.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>
Subject: [PATCH v4 19/20] virtio: do not set is_external=true on host notifiers
Date: Tue, 25 Apr 2023 13:27:15 -0400
Message-Id: <20230425172716.1033562-20-stefanha@redhat.com>
In-Reply-To: <20230425172716.1033562-1-stefanha@redhat.com>
References: <20230425172716.1033562-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Host notifiers can now use is_external=false since virtio-blk and
virtio-scsi no longer rely on is_external=true for drained sections.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/virtio/virtio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 272d930721..9cdad7e550 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3491,7 +3491,7 @@ static void virtio_queue_host_notifier_aio_poll_end(EventNotifier *n)
 
 void virtio_queue_aio_attach_host_notifier(VirtQueue *vq, AioContext *ctx)
 {
-    aio_set_event_notifier(ctx, &vq->host_notifier, true,
+    aio_set_event_notifier(ctx, &vq->host_notifier, false,
                            virtio_queue_host_notifier_read,
                            virtio_queue_host_notifier_aio_poll,
                            virtio_queue_host_notifier_aio_poll_ready);
@@ -3508,14 +3508,14 @@ void virtio_queue_aio_attach_host_notifier(VirtQueue *vq, AioContext *ctx)
  */
 void virtio_queue_aio_attach_host_notifier_no_poll(VirtQueue *vq, AioContext *ctx)
 {
-    aio_set_event_notifier(ctx, &vq->host_notifier, true,
+    aio_set_event_notifier(ctx, &vq->host_notifier, false,
                            virtio_queue_host_notifier_read,
                            NULL, NULL);
 }
 
 void virtio_queue_aio_detach_host_notifier(VirtQueue *vq, AioContext *ctx)
 {
-    aio_set_event_notifier(ctx, &vq->host_notifier, true, NULL, NULL, NULL);
+    aio_set_event_notifier(ctx, &vq->host_notifier, false, NULL, NULL, NULL);
     /* Test and clear notifier before after disabling event,
      * in case poll callback didn't have time to run. */
     virtio_queue_host_notifier_read(&vq->host_notifier);
-- 
2.39.2


