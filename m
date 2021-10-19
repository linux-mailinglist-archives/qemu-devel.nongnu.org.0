Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 119E04337EC
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 15:59:49 +0200 (CEST)
Received: from localhost ([::1]:54538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcped-0006c3-Ln
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 09:59:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mcpcn-0005AP-Pz
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 09:57:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mcpcj-0005yf-09
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 09:57:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634651867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UGbdcu40VRNH/qavI2ya5zzHiQCSucXl2dGZ6dj5B3Y=;
 b=Ac0+XSAgrfRaOjLuKdj9SFu6TFqM8DumXl2PGgYHuXigtZTC5wbR73ODZzRrlqu3vxqRlF
 ruJlHV8r06iMhD6rhdSwPUf4T/CYCdE1kTGSxRS6T8VAvT0+t3abXA492MJ3Fh8OtDmOhu
 ka1lC2sSu0EZcmvNtX3qJQnZJLwlEq0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49--PWaAmQ5OwOwvoVSthc9cw-1; Tue, 19 Oct 2021 09:57:42 -0400
X-MC-Unique: -PWaAmQ5OwOwvoVSthc9cw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6E67BD525;
 Tue, 19 Oct 2021 13:57:40 +0000 (UTC)
Received: from localhost (unknown [10.39.195.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B72761064;
 Tue, 19 Oct 2021 13:57:01 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] vhost-user-blk-test: pass vhost-user socket fds to QSD
Date: Tue, 19 Oct 2021 14:56:55 +0100
Message-Id: <20211019135655.83067-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Coiby Xu <coiby.xu@gmail.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu-storage-daemon is launched with the vhost-user listen socket path.
The path is first unlinked before opening the listen socket. This
prevents stale UNIX domain socket files from stopping socket
initialization.

This behavior is undesirable in vhost-user-blk-test and the cause of a
bug:

There is a race condition in vhost-user-blk-test when QEMU launches
before QSD. It connects to the old socket that QSD unlinks and the
vhost-user connection is never serviced, resulting in a hang.

Pass the listen socket fd to QSD to maintain listen socket continuity
and prevent the lost connection.

Fixes: 806952026df41939680abe92b329715b9b4e01cc ("test: new qTest case to test the vhost-user-blk-server")
Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Coiby Xu <coiby.xu@gmail.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tests/qtest/vhost-user-blk-test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user-blk-test.c
index 6f108a1b62..62e670f39b 100644
--- a/tests/qtest/vhost-user-blk-test.c
+++ b/tests/qtest/vhost-user-blk-test.c
@@ -906,9 +906,9 @@ static void start_vhost_user_blk(GString *cmd_line, int vus_instances,
         img_path = drive_create();
         g_string_append_printf(storage_daemon_command,
             "--blockdev driver=file,node-name=disk%d,filename=%s "
-            "--export type=vhost-user-blk,id=disk%d,addr.type=unix,addr.path=%s,"
+            "--export type=vhost-user-blk,id=disk%d,addr.type=fd,addr.str=%d,"
             "node-name=disk%i,writable=on,num-queues=%d ",
-            i, img_path, i, sock_path, i, num_queues);
+            i, img_path, i, fd, i, num_queues);
 
         g_string_append_printf(cmd_line, "-chardev socket,id=char%d,path=%s ",
                                i + 1, sock_path);
-- 
2.31.1


