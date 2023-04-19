Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 342ED6E8075
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 19:34:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppBbm-0003p4-Nn; Wed, 19 Apr 2023 13:28:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ppBbk-0003nd-Pe
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 13:28:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ppBbi-000256-Vh
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 13:28:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681925318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cpef4kT6gqf7n/rR0/ynntTmCBLqt8QRSEC7iM5/ics=;
 b=Gj6JkrpS82YHcn37K3ZEmocqzGqkD3zrNgIxXNj+0sB3sBh53Zp3l8EvES1VVrz3CY4IWV
 KvTOfpbRICb++cmuJfEIWLQ4csRiUVOktAjTo7MakOILzRRYGruIUXAKL2RCfrYHPdMm3O
 pshpmkeniLnTV34rAt204jArzf/n3TI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-178-QXXZW6VEOQuQZxBq_W3LMA-1; Wed, 19 Apr 2023 13:28:32 -0400
X-MC-Unique: QXXZW6VEOQuQZxBq_W3LMA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9D802823810;
 Wed, 19 Apr 2023 17:28:30 +0000 (UTC)
Received: from localhost (unknown [10.39.192.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5495F2166B33;
 Wed, 19 Apr 2023 17:28:30 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Paul Durrant <paul@xen.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Kevin Wolf <kwolf@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Lieven <pl@kamp.de>, eesposit@redhat.com,
 Aarushi Mehta <mehta.aaru20@gmail.com>, Stefan Weil <sw@weilnetz.de>,
 Xie Yongji <xieyongji@bytedance.com>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH v2 04/16] block/export: only acquire AioContext once for
 vhost_user_server_stop()
Date: Wed, 19 Apr 2023 13:28:05 -0400
Message-Id: <20230419172817.272758-5-stefanha@redhat.com>
In-Reply-To: <20230419172817.272758-1-stefanha@redhat.com>
References: <20230419172817.272758-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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


