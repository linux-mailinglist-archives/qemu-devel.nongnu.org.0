Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8A14D3F51
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 03:43:56 +0100 (CET)
Received: from localhost ([::1]:40746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nS8mR-0002wB-U9
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 21:43:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nS8i8-0003Gj-Tx
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 21:39:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nS8i5-0003yz-Kf
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 21:39:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646879965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UUNHod7JNAJsvRzdTi4PyrDg3lpRDro8zhfqqYajf/U=;
 b=CGeYVJdeeWfTluzWamURiD0SnDEQdGE6vuQ+GTAoEDPu2o3vt7Hq9jTQLZGi3YxEmHS2tM
 zzbn0cRxT9s62yzT7SiIbcftRAQhFz5aXgj4c3dPDiCSRMOu79DkuN1wFs/5j+TIaFUInW
 ybuKZiWVjTBVz4XFDjhXU8YpUQ9K+tY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-FdEHMlsNMeOceunwF07psw-1; Wed, 09 Mar 2022 21:39:23 -0500
X-MC-Unique: FdEHMlsNMeOceunwF07psw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BF761006AA5;
 Thu, 10 Mar 2022 02:39:22 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-194.pek2.redhat.com
 [10.72.13.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E7E5F100685F;
 Thu, 10 Mar 2022 02:39:14 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL V2 01/15] virtio-net: fix map leaking on error during receive
Date: Thu, 10 Mar 2022 10:38:53 +0800
Message-Id: <20220310023907.2443-2-jasowang@redhat.com>
In-Reply-To: <20220310023907.2443-1-jasowang@redhat.com>
References: <20220310023907.2443-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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


