Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D76C932F0FD
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:19:09 +0100 (CET)
Received: from localhost ([::1]:45172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIE6W-0000Zn-TT
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:19:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lIDkb-0007XC-2S
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:56:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lIDkB-0007Fw-CJ
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:56:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614963360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u+gTC2bXiytaJ9NOO0mGe1DEhNjbGqJQ8pY869RL0BU=;
 b=YizuBzSfJ3gsecPy7VnpjZ7lbf8QoUwrSWsAAjRndvE6tNSTOJJRojIFgyKR+On2ZfHj2o
 Nko/mVnh2U+hhGClmZsIr++hTz6dOExeSCM6ifI6UdQFdcSmhJMqzWE5XGBCkeJSrs/i+8
 0ZXHuzxNaEBrGiT220YZpSqB0dkVHDM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-e_pAniInN2ePI5TFZvoq9w-1; Fri, 05 Mar 2021 11:55:56 -0500
X-MC-Unique: e_pAniInN2ePI5TFZvoq9w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3DC5814401;
 Fri,  5 Mar 2021 16:55:23 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-112-36.phx2.redhat.com [10.3.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7D2F60BF3;
 Fri,  5 Mar 2021 16:55:22 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 12/31] vhost-user-blk: fix blkcfg->num_queues endianness
Date: Fri,  5 Mar 2021 17:54:35 +0100
Message-Id: <20210305165454.356840-13-kwolf@redhat.com>
In-Reply-To: <20210305165454.356840-1-kwolf@redhat.com>
References: <20210305165454.356840-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

From: Stefan Hajnoczi <stefanha@redhat.com>

Treat the num_queues field as virtio-endian. On big-endian hosts the
vhost-user-blk num_queues field was in the wrong endianness.

Move the blkcfg.num_queues store operation from realize to
vhost_user_blk_update_config() so feature negotiation has finished and
we know the endianness of the device. VIRTIO 1.0 devices are
little-endian, but in case someone wants to use legacy VIRTIO we support
all endianness cases.

Cc: qemu-stable@nongnu.org
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20210223144653.811468-2-stefanha@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 hw/block/vhost-user-blk.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index da4fbf9084..b870a50e6b 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -54,6 +54,9 @@ static void vhost_user_blk_update_config(VirtIODevice *vdev, uint8_t *config)
 {
     VHostUserBlk *s = VHOST_USER_BLK(vdev);
 
+    /* Our num_queues overrides the device backend */
+    virtio_stw_p(vdev, &s->blkcfg.num_queues, s->num_queues);
+
     memcpy(config, &s->blkcfg, sizeof(struct virtio_blk_config));
 }
 
@@ -491,10 +494,6 @@ reconnect:
         goto reconnect;
     }
 
-    if (s->blkcfg.num_queues != s->num_queues) {
-        s->blkcfg.num_queues = s->num_queues;
-    }
-
     return;
 
 virtio_err:
-- 
2.29.2


