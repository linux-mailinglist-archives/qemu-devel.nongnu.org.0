Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3534D0FA8
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 06:57:58 +0100 (CET)
Received: from localhost ([::1]:51212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRSr7-00065b-1t
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 00:57:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nRSq9-0005Dj-Gb
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 00:56:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nRSq6-00023F-IU
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 00:56:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646719013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WQIEAE1AGR3D+IKQhRX/3HO9Q+p7GxnjkStt3cBnU7o=;
 b=MA9TWC4AappFyvrB4+nzMWu+H/57REsZua4N9iHplBR5tc6fhmVRb42Z5qnRsRYGJaitOa
 7lpu2GG48SPWJWh0xS9Yx2HUYpKD727xwdR/vVpquXzHlgCYGtU2s8FSwx4OzXt9Ip08yZ
 NmSrHuBSwr7EzOiFUyvQGj3UfgOc+g8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-n6wn-UsuPZ2ZDvpCrNdB3Q-1; Tue, 08 Mar 2022 00:56:50 -0500
X-MC-Unique: n6wn-UsuPZ2ZDvpCrNdB3Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A008B1800D50;
 Tue,  8 Mar 2022 05:56:49 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-77.pek2.redhat.com [10.72.13.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC02C5DB9C;
 Tue,  8 Mar 2022 05:56:44 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com
Subject: [PATCH] virtio-net: fix map leaking on error during receive
Date: Tue,  8 Mar 2022 13:56:42 +0800
Message-Id: <20220308055642.20961-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: Victor Tom <vv474172261@gmail.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org
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
Fixes: bedd7e93d0196 ("virtio-net: fix use after unmap/free for sg")
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/virtio-net.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index cf8ab0f8af..65b61c836c 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -1867,6 +1867,7 @@ static ssize_t virtio_net_receive_rcu(NetClientState *nc, const uint8_t *buf,
 
 err:
     for (j = 0; j < i; j++) {
+        virtqueue_detach_element(q->rx_vq, elems[j], lens[j]);
         g_free(elems[j]);
     }
 
-- 
2.25.1


