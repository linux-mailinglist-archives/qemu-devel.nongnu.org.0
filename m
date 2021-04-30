Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DB736F9A5
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:54:37 +0200 (CEST)
Received: from localhost ([::1]:58622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcRjA-0000zM-3c
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:54:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQmB-0005jf-4l
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:53:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQm4-00035C-Bf
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:53:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619780011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xJXTnYgm5ycSHl9jxDYLbMKAb6J0Zi1xO0AE44jiTz0=;
 b=hZGIqGmq3wkLBCNpvXfn00zbchccqRbH8UH43YOqlSkla6XP/cB1VD7/EpHp41VWqCynrZ
 +syCGIATsTg8uTy3N2vSPYSU0hRT3OQ1wZ2T7CNztZ5wrHgCpbYaUBSQSWiP8tkgcvC46z
 leelsPsj35TpUcBwHNz3Crk279rGF5Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-MTLYE1mzM7y8OziVYZ317Q-1; Fri, 30 Apr 2021 06:53:29 -0400
X-MC-Unique: MTLYE1mzM7y8OziVYZ317Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 691FC106BB2A;
 Fri, 30 Apr 2021 10:53:28 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 79FEF5F707;
 Fri, 30 Apr 2021 10:53:27 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 39/39] vhost-user-blk: Fail gracefully on too large queue size
Date: Fri, 30 Apr 2021 12:51:47 +0200
Message-Id: <20210430105147.125840-40-kwolf@redhat.com>
In-Reply-To: <20210430105147.125840-1-kwolf@redhat.com>
References: <20210430105147.125840-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

virtio_add_queue() aborts when queue_size > VIRTQUEUE_MAX_SIZE, so
vhost_user_blk_device_realize() should check this before calling it.

Simple reproducer:

qemu-system-x86_64 \
    -chardev null,id=foo \
    -device vhost-user-blk-pci,queue-size=4096,chardev=foo

Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1935014
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210413165654.50810-1-kwolf@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 hw/block/vhost-user-blk.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index 0b5b9d44cd..f5e9682703 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -467,6 +467,11 @@ static void vhost_user_blk_device_realize(DeviceState *dev, Error **errp)
         error_setg(errp, "vhost-user-blk: queue size must be non-zero");
         return;
     }
+    if (s->queue_size > VIRTQUEUE_MAX_SIZE) {
+        error_setg(errp, "vhost-user-blk: queue size must not exceed %d",
+                   VIRTQUEUE_MAX_SIZE);
+        return;
+    }
 
     if (!vhost_user_init(&s->vhost_user, &s->chardev, errp)) {
         return;
-- 
2.30.2


