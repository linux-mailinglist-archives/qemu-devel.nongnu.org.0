Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67504528BD5
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 19:21:54 +0200 (CEST)
Received: from localhost ([::1]:58720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqePp-00058s-Gu
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 13:21:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nqd5p-0003Ih-4P
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:57:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nqd5n-0003TO-IL
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:57:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652716626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=VPFd4/3+j0n5eO2jGcw7CH3r3KNkiZeErwPHNYtRMfc=;
 b=PmDm7lt30+8NhF4DC0BBFP3aCez50ihMmLmdHBUUiBfLY5E4RErvOlV+Bg83OZTIp9DAKN
 8VnjIeeGArJCd/LQbeyTRU8oNW1oWdLT2eUE4StrPgRGhgpVwWg87kl7eDsdIG2QDHW8PF
 RvOlf0mtCjQeu4H4pP82sb3tBakQmqE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-MZMLfXzXNGylTA0t-eRAOQ-1; Mon, 16 May 2022 11:57:03 -0400
X-MC-Unique: MZMLfXzXNGylTA0t-eRAOQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2DE243831C59;
 Mon, 16 May 2022 15:57:03 +0000 (UTC)
Received: from localhost (unknown [10.39.192.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D3837C15E71;
 Mon, 16 May 2022 15:57:02 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH v2] vhost-user-scsi: avoid unlink(NULL) with fd passing
Date: Mon, 16 May 2022 16:57:01 +0100
Message-Id: <20220516155701.1789638-1-stefanha@redhat.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 747421e949fc1eb3ba66b5fcccdb7ba051918241 ("Implements Backend
Program conventions for vhost-user-scsi") introduced fd-passing support
as part of implementing the vhost-user backend program conventions.

When fd passing is used the UNIX domain socket path is NULL and we must
not call unlink(2).

The unlink(2) call is necessary when the listen socket, lsock, was
created successfully since that means the UNIX domain socket is visible
in the file system.

Fixes: Coverity CID 1488353
Fixes: 747421e949fc1eb3ba66b5fcccdb7ba051918241 ("Implements Backend Program conventions for vhost-user-scsi")
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 contrib/vhost-user-scsi/vhost-user-scsi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/contrib/vhost-user-scsi/vhost-user-scsi.c b/contrib/vhost-user-scsi/vhost-user-scsi.c
index b2c0f98253..9ef61cf5a7 100644
--- a/contrib/vhost-user-scsi/vhost-user-scsi.c
+++ b/contrib/vhost-user-scsi/vhost-user-scsi.c
@@ -433,13 +433,16 @@ out:
     if (vdev_scsi) {
         g_main_loop_unref(vdev_scsi->loop);
         g_free(vdev_scsi);
-        unlink(opt_socket_path);
     }
     if (csock >= 0) {
         close(csock);
     }
     if (lsock >= 0) {
         close(lsock);
+
+        if (opt_socket_path) {
+            unlink(opt_socket_path);
+        }
     }
     g_free(opt_socket_path);
     g_free(iscsi_uri);
-- 
2.36.1


