Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E564D947F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 07:18:06 +0100 (CET)
Received: from localhost ([::1]:52742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU0VR-0003DJ-B0
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 02:18:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nU0S2-0000Ga-Sc
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 02:14:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nU0S1-0004M1-9o
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 02:14:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647324872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UUNHod7JNAJsvRzdTi4PyrDg3lpRDro8zhfqqYajf/U=;
 b=T09IjfOSYpc7lIZWIwauepDfIGO6Dcdm0/i1nS8Pi9Ar5kvCVv4CAVkx/jCfGlVJx7jiQt
 NAd8glCbqF06cAYMQphd5bS29w4yc5q8Q/8vFQ23F3qYtjO6c9asw6WWKn/292UrH967Hw
 TgizhvxH8gXsZSRzdodeW3kJTyhTrIs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-Ic-evX6uNcCS30aRvH4Kgw-1; Tue, 15 Mar 2022 02:14:29 -0400
X-MC-Unique: Ic-evX6uNcCS30aRvH4Kgw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 546EA185A79C;
 Tue, 15 Mar 2022 06:14:29 +0000 (UTC)
Received: from localhost.localdomain (ovpn-14-38.pek2.redhat.com [10.72.14.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9CE4E400E43F;
 Tue, 15 Mar 2022 06:14:26 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL V3 01/15] virtio-net: fix map leaking on error during receive
Date: Tue, 15 Mar 2022 14:14:06 +0800
Message-Id: <20220315061420.31910-2-jasowang@redhat.com>
In-Reply-To: <20220315061420.31910-1-jasowang@redhat.com>
References: <20220315061420.31910-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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
Cc: Victor Tom <vv474172261@gmail.com>, Jason Wang <jasowang@redhat.com>,
 qemu-stable@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit bedd7e93d0196 ("virtio-net: fix use after unmap/free for sg")
tries to fix the use after free of the sg by caching the virtqueue
elements in an array and unmap them at once after receiving the
packets, But it forgot to unmap the cached elements on error which
will lead to leaking of mapping and other unexpected results.

Fixing this by detaching the cached elements on error. This addresses
CVE-2022-26353.

Reported-by: Victor Tom <vv474172261@gmail.com>
Cc: qemu-stable@nongnu.org
Fixes: CVE-2022-26353
Fixes: bedd7e93d0196 ("virtio-net: fix use after unmap/free for sg")
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/virtio-net.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index b02a063..2087516 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -1870,6 +1870,7 @@ static ssize_t virtio_net_receive_rcu(NetClientState *nc, const uint8_t *buf,
 
 err:
     for (j = 0; j < i; j++) {
+        virtqueue_detach_element(q->rx_vq, elems[j], lens[j]);
         g_free(elems[j]);
     }
 
-- 
2.7.4


