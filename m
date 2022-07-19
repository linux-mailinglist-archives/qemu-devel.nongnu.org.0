Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD7457A53F
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 19:28:31 +0200 (CEST)
Received: from localhost ([::1]:37916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDr1K-0000a9-MB
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 13:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oDqd1-0007GI-5G
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 13:03:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oDqcy-00031z-H6
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 13:03:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658250199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jT5SCI9yceEEWoJ6eZlL1Ya13QG2Pfnwc9vFeYp3jBA=;
 b=SnsiyTGVsL9GPg9aU0Fhds6KLrHKVpgNHbmDHo/bS6Oli697FDA3j5+sZQKTbAbpRttsUF
 MrujgwsgHxj7O/KyIc43H2A8vxJUlDfx+axGHZdYiOz1auZH3smXJnU2oJ5iK40dxWDoaM
 DFlHp4oRu6f9PwF01S8Ec22fL/4Vm7A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-yAdT5zA5Nsa6M-gSlxSyJg-1; Tue, 19 Jul 2022 13:03:06 -0400
X-MC-Unique: yAdT5zA5Nsa6M-gSlxSyJg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A2F3B3C10156;
 Tue, 19 Jul 2022 17:02:56 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ACD4440CF8E5;
 Tue, 19 Jul 2022 17:02:55 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, leobras@redhat.com, quintela@redhat.com,
 berrange@redhat.com, peterx@redhat.com, iii@linux.ibm.com,
 huangy81@chinatelecom.cn
Subject: [PULL 25/29] QIOChannelSocket: Fix zero-copy flush returning code 1
 when nothing sent
Date: Tue, 19 Jul 2022 18:02:17 +0100
Message-Id: <20220719170221.576190-26-dgilbert@redhat.com>
In-Reply-To: <20220719170221.576190-1-dgilbert@redhat.com>
References: <20220719170221.576190-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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

From: Leonardo Bras <leobras@redhat.com>

If flush is called when no buffer was sent with MSG_ZEROCOPY, it currently
returns 1. This return code should be used only when Linux fails to use
MSG_ZEROCOPY on a lot of sendmsg().

Fix this by returning early from flush if no sendmsg(...,MSG_ZEROCOPY)
was attempted.

Fixes: 2bc58ffc2926 ("QIOChannelSocket: Implement io_writev zero copy flag & io_flush for CONFIG_LINUX")
Signed-off-by: Leonardo Bras <leobras@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Acked-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Message-Id: <20220711211112.18951-2-leobras@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 io/channel-socket.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/io/channel-socket.c b/io/channel-socket.c
index 4466bb1cd4..74a936cc1f 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -716,12 +716,18 @@ static int qio_channel_socket_flush(QIOChannel *ioc,
     struct cmsghdr *cm;
     char control[CMSG_SPACE(sizeof(*serr))];
     int received;
-    int ret = 1;
+    int ret;
+
+    if (sioc->zero_copy_queued == sioc->zero_copy_sent) {
+        return 0;
+    }
 
     msg.msg_control = control;
     msg.msg_controllen = sizeof(control);
     memset(control, 0, sizeof(control));
 
+    ret = 1;
+
     while (sioc->zero_copy_sent < sioc->zero_copy_queued) {
         received = recvmsg(sioc->fd, &msg, MSG_ERRQUEUE);
         if (received < 0) {
-- 
2.36.1


