Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E8237B0F2
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 23:44:29 +0200 (CEST)
Received: from localhost ([::1]:34942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgaB2-0002Ok-S4
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 17:44:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lga4h-0007OM-Qn
 for qemu-devel@nongnu.org; Tue, 11 May 2021 17:37:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lga4g-0005vl-CE
 for qemu-devel@nongnu.org; Tue, 11 May 2021 17:37:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620769073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2gpkrlfYhWbKua0KgA74KB0q/VqUvlO+CWSauL1U9nc=;
 b=NHvihcQcW84ofHEXWkI/VmfCFrvKjBgdA34gpzOh1c3swZKha42rlPiL7j0hnYINUMbwR6
 fAOUM4zqPVn1t5hs9+FexuZLddNtckOI6xBnSfIvrhzKVWQim8XRbcEVxF/jHvAlAlDQHg
 ay9aJixoBSUAOwoV1yjtxilb8hWNpEA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-B67vJGs3M36cO3uHU2p8YQ-1; Tue, 11 May 2021 17:37:52 -0400
X-MC-Unique: B67vJGs3M36cO3uHU2p8YQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 487446D5D6
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 21:37:51 +0000 (UTC)
Received: from horse.redhat.com (ovpn-115-221.rdu2.redhat.com [10.10.115.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F15F40AC;
 Tue, 11 May 2021 21:37:47 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 61FD6225FD3; Tue, 11 May 2021 17:37:43 -0400 (EDT)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH 7/7] virtiofsd: Set req->reply_sent right after sending reply
Date: Tue, 11 May 2021 17:37:36 -0400
Message-Id: <20210511213736.281016-8-vgoyal@redhat.com>
In-Reply-To: <20210511213736.281016-1-vgoyal@redhat.com>
References: <20210511213736.281016-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: dgilbert@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is no reason to set it in label "err". We should be able to set
it right after sending reply. It is easier to read.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 tools/virtiofsd/fuse_virtio.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index aa53808ef9..b1767dd5b9 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -446,12 +446,9 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
     vu_queue_notify(dev, q);
     pthread_mutex_unlock(&qi->vq_lock);
     vu_dispatch_unlock(qi->virtio_dev);
+    req->reply_sent = true;
 
 err:
-    if (ret == 0) {
-        req->reply_sent = true;
-    }
-
     return ret;
 }
 
-- 
2.25.4


