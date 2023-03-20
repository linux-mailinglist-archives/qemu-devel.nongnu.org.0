Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAA36C0FD2
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 11:55:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peD9e-0001mD-7o; Mon, 20 Mar 2023 06:54:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1peD9c-0001m1-0H
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 06:54:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1peD9a-0004aK-E5
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 06:54:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679309652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rGbkc4kQMzffOjMY9IESGRuQG00UxKWAneK/ddQQNcE=;
 b=E5EjuM10mUR2Gy3aGATBHM9x3Ey/GYwXOeNKuGS5tYhzgrCRr9J8pSPz2lMKCu3/X1gH31
 1tX8P0KEoSaMwL6PaUF86EvjMeRPAG1TP2JGC/ay8g08cUwikn9tzjHitRItOpyr81N0iR
 mRqpU9OLEfNWZdkZh19wKr+qmrtgJrI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-hvDmxrV-MDeco6ASAiCXgg-1; Mon, 20 Mar 2023 06:54:08 -0400
X-MC-Unique: hvDmxrV-MDeco6ASAiCXgg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 38515101A531;
 Mon, 20 Mar 2023 10:54:08 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 75A01C15BA0;
 Mon, 20 Mar 2023 10:54:06 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Cleber Rosa <crosa@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH] python: honour message limit when using pre-opened socket
Date: Mon, 20 Mar 2023 10:54:04 +0000
Message-Id: <20230320105404.637661-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The default message recv limit in asyncio is smaller than our needs, so
when opening connections we override it. This was done when opening a
connection using a socket address, but was missed when using a
pre-opened socket file descriptor.

This latent bug was exposed when the QEMUMachine class was enhanced to
use socketpair() when no socket address was passed by:

  commit bd4c0ef409140bd1be393407c04005ac077d4574
  Author: Marc-André Lureau <marcandre.lureau@redhat.com>
  Date:   Wed Jan 11 12:01:01 2023 +0400

    python/qemu/machine: use socketpair() for QMP by default

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 python/qemu/qmp/protocol.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/python/qemu/qmp/protocol.py b/python/qemu/qmp/protocol.py
index 22e60298d2..2bd341a93e 100644
--- a/python/qemu/qmp/protocol.py
+++ b/python/qemu/qmp/protocol.py
@@ -307,7 +307,10 @@ async def open_with_socket(self, sock: socket.socket) -> None:
 
         :raise StateError: When the `Runstate` is not `IDLE`.
         """
-        self._reader, self._writer = await asyncio.open_connection(sock=sock)
+        self._reader, self._writer = await asyncio.open_connection(
+            sock=sock,
+            limit=self._limit,
+        )
         self._set_state(Runstate.CONNECTING)
 
     @upper_half
-- 
2.39.2


