Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C2332F0B2
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:07:20 +0100 (CET)
Received: from localhost ([::1]:41810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIDv5-0002q8-Q8
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:07:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lIDkE-0006sl-Ro
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:56:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lIDk3-00079m-BR
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:56:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614963349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FBSGDxhR8kl8OetMS2DbHF1PkFiO0aTawaBn66KLBdY=;
 b=fDP3YYVDkf9nnYMyJxdB7wql7Nu6vjpKvv6EAkLScQF2PztANcPtfzxer8ykiL4uFYRvM2
 eItBFoEKd+JbTaoSLb/cX+TX8I+JiR51cyealm+4EFFoRDlaT+4mB9ORQXAhGveZzBYj4t
 sSTdt4LWlUBGS6WqRz78atzf9VkYRt4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-w3eR7KHtO6CEaIZQUCna-g-1; Fri, 05 Mar 2021 11:55:44 -0500
X-MC-Unique: w3eR7KHtO6CEaIZQUCna-g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 257711005D58;
 Fri,  5 Mar 2021 16:55:35 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-112-36.phx2.redhat.com [10.3.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1780260C43;
 Fri,  5 Mar 2021 16:55:33 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 20/31] block/export: fix vhost-user-blk export sector number
 calculation
Date: Fri,  5 Mar 2021 17:54:43 +0100
Message-Id: <20210305165454.356840-21-kwolf@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

From: Stefan Hajnoczi <stefanha@redhat.com>

The driver is supposed to honor the blk_size field but the protocol
still uses 512-byte sector numbers. It is incorrect to multiply
req->sector_num by blk_size.

VIRTIO 1.1 5.2.5 Device Initialization says:

  blk_size can be read to determine the optimal sector size for the
  driver to use. This does not affect the units used in the protocol
  (always 512 bytes), but awareness of the correct value can affect
  performance.

Fixes: 3578389bcf76c824a5d82e6586a6f0c71e56f2aa ("block/export: vhost-user block device backend server")
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20210223144653.811468-10-stefanha@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/export/vhost-user-blk-server.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-user-blk-server.c
index 2614a63791..f74796241c 100644
--- a/block/export/vhost-user-blk-server.c
+++ b/block/export/vhost-user-blk-server.c
@@ -144,7 +144,7 @@ static void coroutine_fn vu_blk_virtio_process_req(void *opaque)
             break;
         }
 
-        int64_t offset = req->sector_num * vexp->blk_size;
+        int64_t offset = req->sector_num << VIRTIO_BLK_SECTOR_BITS;
         QEMUIOVector qiov;
         if (is_write) {
             qemu_iovec_init_external(&qiov, out_iov, out_num);
-- 
2.29.2


