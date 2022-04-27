Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 774FF5114A0
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 12:03:58 +0200 (CEST)
Received: from localhost ([::1]:37778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njeWb-0002qo-0e
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 06:03:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1njeUW-00025X-Ro
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 06:01:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1njeUU-0003FV-Fd
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 06:01:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651053704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=5dnPJtaX6LPcL1O1S/3I6jA2zI0zRbZBoEjTxSyCMsE=;
 b=gKhPJUfKnDhUiKAoGAo5a5QwJDS7FsyF6yrQAPczCosoClfbcFdVi16Ukzik3djgkhcW64
 oO7N0gnjsZ2OshL7CE6IVbN0wo4eZ0kiYFGORFBS7d0t9nED1oyR2q4/kcUNJqCFytRZ02
 fTkFpvtMipkUxoXopQQD42AhJ96vVX4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-XrWmTfJ3Pg-q_0POILS09g-1; Wed, 27 Apr 2022 06:01:37 -0400
X-MC-Unique: XrWmTfJ3Pg-q_0POILS09g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5C063C0CD48;
 Wed, 27 Apr 2022 10:01:35 +0000 (UTC)
Received: from localhost (unknown [10.39.195.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 85994C27E9F;
 Wed, 27 Apr 2022 10:01:35 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] vhost-user-scsi: avoid unlink(NULL) with fd passing
Date: Wed, 27 Apr 2022 11:01:16 +0100
Message-Id: <20220427100116.30453-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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
Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 747421e949fc1eb3ba66b5fcccdb7ba051918241 ("Implements Backend
Program conventions for vhost-user-scsi") introduced fd-passing support
as part of implementing the vhost-user backend program conventions.

When fd passing is used the UNIX domain socket path is NULL and we must
not call unlink(2).

Fixes: Coverity CID 1488353
Fixes: 747421e949fc1eb3ba66b5fcccdb7ba051918241 ("Implements Backend Program conventions for vhost-user-scsi")
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 contrib/vhost-user-scsi/vhost-user-scsi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/contrib/vhost-user-scsi/vhost-user-scsi.c b/contrib/vhost-user-scsi/vhost-user-scsi.c
index b2c0f98253..08335d4b2b 100644
--- a/contrib/vhost-user-scsi/vhost-user-scsi.c
+++ b/contrib/vhost-user-scsi/vhost-user-scsi.c
@@ -433,7 +433,9 @@ out:
     if (vdev_scsi) {
         g_main_loop_unref(vdev_scsi->loop);
         g_free(vdev_scsi);
-        unlink(opt_socket_path);
+        if (opt_socket_path) {
+            unlink(opt_socket_path);
+        }
     }
     if (csock >= 0) {
         close(csock);
-- 
2.35.1


