Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB988BC8A4
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Sep 2019 15:13:56 +0200 (CEST)
Received: from localhost ([::1]:45498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCkdf-0000ln-A6
	for lists+qemu-devel@lfdr.de; Tue, 24 Sep 2019 09:13:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51552)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iCk6a-00068o-3O
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 08:39:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iCk6Y-0001zY-OQ
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 08:39:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58918)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1iCk6W-0001vh-3U; Tue, 24 Sep 2019 08:39:40 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6274930B2502;
 Tue, 24 Sep 2019 12:39:39 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-249.phx2.redhat.com [10.3.116.249])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 979BD60BFB;
 Tue, 24 Sep 2019 12:39:36 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/4] nbd/server: attach client channel to the export's
 AioContext
Date: Tue, 24 Sep 2019 07:39:31 -0500
Message-Id: <20190924123933.10607-3-eblake@redhat.com>
In-Reply-To: <20190924123933.10607-1-eblake@redhat.com>
References: <20190924123933.10607-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Tue, 24 Sep 2019 12:39:39 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Cc: "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Sergio Lopez <slp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sergio Lopez <slp@redhat.com>

On creation, the export's AioContext is set to the same one as the
BlockBackend, while the AioContext in the client QIOChannel is left
untouched.

As a result, when using data-plane, nbd_client_receive_next_request()
schedules coroutines in the IOThread AioContext, while the client's
QIOChannel is serviced from the main_loop, potentially triggering the
assertion at qio_channel_restart_[read|write].

To fix this, as soon we have the export corresponding to the client,
we call qio_channel_attach_aio_context() to attach the QIOChannel
context to the export's AioContext. This matches with the logic at
blk_aio_attached().

RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=3D1748253
Signed-off-by: Sergio Lopez <slp@redhat.com>
Message-Id: <20190912110032.26395-1-slp@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 nbd/server.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/nbd/server.c b/nbd/server.c
index 28c3c8be854c..31d624e146cb 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -1297,6 +1297,11 @@ static coroutine_fn int nbd_negotiate(NBDClient *c=
lient, Error **errp)
         return ret;
     }

+    /* Attach the channel to the same AioContext as the export */
+    if (client->exp && client->exp->ctx) {
+        qio_channel_attach_aio_context(client->ioc, client->exp->ctx);
+    }
+
     assert(!client->optlen);
     trace_nbd_negotiate_success();

--=20
2.21.0


