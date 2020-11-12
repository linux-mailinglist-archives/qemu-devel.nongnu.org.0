Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A59BF2B0CE5
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 19:43:08 +0100 (CET)
Received: from localhost ([::1]:51746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdHYp-00079q-Lz
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 13:43:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kdHUI-0002ad-4c
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:38:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kdHUG-0006S6-BO
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:38:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605206303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J5Uru7LyvR0I1vk/rEPADBpvjbXgquFwOt7WjLL5UMg=;
 b=OLWHPQtb/R+RPIgX6wTTrr4o2Zadh9Cc+br9Wr0q5lGw+Wvk2NAqXwBMJBQggugkv/p9sB
 Cr8PKmjCPpgUgls+WTWp5xsGsDd1Yn+de/2txBAvWioUR1tWJLRASUxvanA6sV1RQHUd5x
 XM03WrrqRWARVqOmXJO5UJ477asX0x8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-180-nbJSEPFZPJqJJHV-UZkS8w-1; Thu, 12 Nov 2020 13:38:21 -0500
X-MC-Unique: nbJSEPFZPJqJJHV-UZkS8w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DC1618B9EC1;
 Thu, 12 Nov 2020 18:38:20 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-60.ams2.redhat.com
 [10.36.115.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C0CC85D9E4;
 Thu, 12 Nov 2020 18:38:15 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, kuhn.chenqun@huawei.com, zhengchuan@huawei.com,
 lihaotian9@huawei.com, longpeng2@huawei.com, liangpeng10@huawei.com,
 philmd@redhat.com, liuzhiqiang26@huawei.com
Subject: [PULL 03/11] migration/multifd: fix hangup with TLS-Multifd due to
 blocking handshake
Date: Thu, 12 Nov 2020 18:37:50 +0000
Message-Id: <20201112183758.203176-4-dgilbert@redhat.com>
In-Reply-To: <20201112183758.203176-1-dgilbert@redhat.com>
References: <20201112183758.203176-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 00:52:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: stefanha@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Chuan Zheng <zhengchuan@huawei.com>

The qemu main loop could hang up forever when we enable TLS+Multifd.
The Src multifd_send_0 invokes tls handshake, it sends hello to sever
and wait response.
However, the Dst main qemu loop has been waiting recvmsg() for multifd_recv_1.
Both of Src and Dst main qemu loop are blocking and waiting for reponse which
results in hanging up forever.

Src: (multifd_send_0)                                              Dst: (multifd_recv_1)
multifd_channel_connect                                            migration_channel_process_incoming
  multifd_tls_channel_connect                                        migration_tls_channel_process_incoming
    multifd_tls_channel_connect                                        qio_channel_tls_handshake_task
       qio_channel_tls_handshake                                         gnutls_handshake
          qio_channel_tls_handshake_task                                       ...
            qcrypto_tls_session_handshake                                      ...
              gnutls_handshake                                                 ...
                   ...                                                         ...
                recvmsg (Blocking I/O waiting for response)                recvmsg (Blocking I/O waiting for response)

Fix this by offloadinig handshake work to a background thread.

Reported-by: Yan Jin <jinyan12@huawei.com>
Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
Message-Id: <1604643893-8223-1-git-send-email-zhengchuan@huawei.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/multifd.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 68b171fb61..88486b90d6 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -739,6 +739,19 @@ static void multifd_tls_outgoing_handshake(QIOTask *task,
     multifd_channel_connect(p, ioc, err);
 }
 
+static void *multifd_tls_handshake_thread(void *opaque)
+{
+    MultiFDSendParams *p = opaque;
+    QIOChannelTLS *tioc = QIO_CHANNEL_TLS(p->c);
+
+    qio_channel_tls_handshake(tioc,
+                              multifd_tls_outgoing_handshake,
+                              p,
+                              NULL,
+                              NULL);
+    return NULL;
+}
+
 static void multifd_tls_channel_connect(MultiFDSendParams *p,
                                         QIOChannel *ioc,
                                         Error **errp)
@@ -754,12 +767,10 @@ static void multifd_tls_channel_connect(MultiFDSendParams *p,
 
     trace_multifd_tls_outgoing_handshake_start(ioc, tioc, hostname);
     qio_channel_set_name(QIO_CHANNEL(tioc), "multifd-tls-outgoing");
-    qio_channel_tls_handshake(tioc,
-                              multifd_tls_outgoing_handshake,
-                              p,
-                              NULL,
-                              NULL);
-
+    p->c = QIO_CHANNEL(tioc);
+    qemu_thread_create(&p->thread, "multifd-tls-handshake-worker",
+                       multifd_tls_handshake_thread, p,
+                       QEMU_THREAD_JOINABLE);
 }
 
 static bool multifd_channel_connect(MultiFDSendParams *p,
-- 
2.28.0


