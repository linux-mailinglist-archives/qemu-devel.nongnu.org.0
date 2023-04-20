Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E7E6E9324
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 13:42:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppSfs-0002sa-Tq; Thu, 20 Apr 2023 07:42:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ppScx-0007ro-TU
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 07:39:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ppScl-0001ae-S3
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 07:38:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681990705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cpef4kT6gqf7n/rR0/ynntTmCBLqt8QRSEC7iM5/ics=;
 b=eOmbB+3yUhdg9oorT/1vAAd57bhWFWK7paPGeGUuTcTiJCtBvGnijTzov5RtQTRsH7kyLL
 HH6TYO2BS0eMMOCbjapPrdHQCEU+gPKJw5j86AlFZNUkr4onj45Lu/zi6lYo+2JC8nuPF+
 RSLTzUmJnNg/lRF5rB86G/OMpmT/fkE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-ZfmDbr5BPEGcI-TkGJ9ftw-1; Thu, 20 Apr 2023 07:38:23 -0400
X-MC-Unique: ZfmDbr5BPEGcI-TkGJ9ftw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC1A43C106AD;
 Thu, 20 Apr 2023 11:38:22 +0000 (UTC)
Received: from localhost (unknown [10.39.193.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3653640BC798;
 Thu, 20 Apr 2023 11:38:21 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Lieven <pl@kamp.de>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Xie Yongji <xieyongji@bytedance.com>, Juan Quintela <quintela@redhat.com>,
 qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>, Stefan Weil <sw@weilnetz.de>,
 Fam Zheng <fam@euphon.net>, Julia Suvorova <jusual@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, xen-devel@lists.xenproject.org,
 Hanna Reitz <hreitz@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, eesposit@redhat.com,
 Kevin Wolf <kwolf@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v3 04/20] block/export: only acquire AioContext once for
 vhost_user_server_stop()
Date: Thu, 20 Apr 2023 07:37:16 -0400
Message-Id: <20230420113732.336620-5-stefanha@redhat.com>
In-Reply-To: <20230420113732.336620-1-stefanha@redhat.com>
References: <20230420113732.336620-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

vhost_user_server_stop() uses AIO_WAIT_WHILE(). AIO_WAIT_WHILE()
requires that AioContext is only acquired once.

Since blk_exp_request_shutdown() already acquires the AioContext it
shouldn't be acquired again in vhost_user_server_stop().

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 util/vhost-user-server.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/util/vhost-user-server.c b/util/vhost-user-server.c
index 40f36ea214..5b6216069c 100644
--- a/util/vhost-user-server.c
+++ b/util/vhost-user-server.c
@@ -346,10 +346,9 @@ static void vu_accept(QIONetListener *listener, QIOChannelSocket *sioc,
     aio_context_release(server->ctx);
 }
 
+/* server->ctx acquired by caller */
 void vhost_user_server_stop(VuServer *server)
 {
-    aio_context_acquire(server->ctx);
-
     qemu_bh_delete(server->restart_listener_bh);
     server->restart_listener_bh = NULL;
 
@@ -366,8 +365,6 @@ void vhost_user_server_stop(VuServer *server)
         AIO_WAIT_WHILE(server->ctx, server->co_trip);
     }
 
-    aio_context_release(server->ctx);
-
     if (server->listener) {
         qio_net_listener_disconnect(server->listener);
         object_unref(OBJECT(server->listener));
-- 
2.39.2


