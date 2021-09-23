Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2E74154DD
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 02:55:22 +0200 (CEST)
Received: from localhost ([::1]:54766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTD1F-0001zU-M8
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 20:55:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTCvy-00016p-W7
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 20:49:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTCvx-0006Kz-7J
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 20:49:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632358192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TazgFdhlYSvXSGIvNOm5tmBWwunpcLXO5GGIkemddgQ=;
 b=Hhf3PpUFpotMeiivjbSxb32ODHLAKP4zimNCRTkiupiXcWOwZ34YyV78s6Q9opCpmliOeQ
 0LxPIeG0knlbjIrGaYC9ftIxXQ+Kb9vedYVP1QLY/wRYD6Y2khISWGcGVLsLlyQ2s02CR6
 2A0mtlxdpk8IBeh+HWuP2OVHDlqG0Vo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-H6gQutErP3-ovo0-3aGMPQ-1; Wed, 22 Sep 2021 20:49:50 -0400
X-MC-Unique: H6gQutErP3-ovo0-3aGMPQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E83829126B;
 Thu, 23 Sep 2021 00:49:48 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 56AD260BF1;
 Thu, 23 Sep 2021 00:49:47 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/17] python/aqmp: add send_fd_scm
Date: Wed, 22 Sep 2021 20:49:25 -0400
Message-Id: <20210923004938.3999963-5-jsnow@redhat.com>
In-Reply-To: <20210923004938.3999963-1-jsnow@redhat.com>
References: <20210923004938.3999963-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The single space is indeed required to successfully transmit the file
descriptor to QEMU.

Python 3.11 removes support for calling sendmsg directly from a
transport's socket. There is no other interface for doing this, our use
case is, I suspect, "quite unique".

As far as I can tell, this is safe to do -- send_fd_scm is a synchronous
function and we can be guaranteed that the async coroutines will *not* be
running when it is invoked. In testing, it works correctly.

I investigated quite thoroughly the possibility of creating my own
asyncio Transport (The class that ultimately manages the raw socket
object) so that I could manage the socket myself, but this is so wildly
invasive and unportable I scrapped the idea. It would involve a lot of
copy-pasting of various python utilities and classes just to re-create
the same infrastructure, and for extremely little benefit. Nah.

Just boldly void the warranty instead, while I try to follow up on
https://bugs.python.org/issue43232

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/qmp_client.py | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/python/qemu/aqmp/qmp_client.py b/python/qemu/aqmp/qmp_client.py
index d2ad7459f9f..f987da02eb0 100644
--- a/python/qemu/aqmp/qmp_client.py
+++ b/python/qemu/aqmp/qmp_client.py
@@ -9,6 +9,8 @@
 
 import asyncio
 import logging
+import socket
+import struct
 from typing import (
     Dict,
     List,
@@ -624,3 +626,23 @@ async def execute(self, cmd: str,
         """
         msg = self.make_execute_msg(cmd, arguments, oob=oob)
         return await self.execute_msg(msg)
+
+    @upper_half
+    @require(Runstate.RUNNING)
+    def send_fd_scm(self, fd: int) -> None:
+        """
+        Send a file descriptor to the remote via SCM_RIGHTS.
+        """
+        assert self._writer is not None
+        sock = self._writer.transport.get_extra_info('socket')
+
+        if sock.family != socket.AF_UNIX:
+            raise AQMPError("Sending file descriptors requires a UNIX socket.")
+
+        # Void the warranty sticker.
+        # Access to sendmsg in asyncio is scheduled for removal in Python 3.11.
+        sock = sock._sock  # pylint: disable=protected-access
+        sock.sendmsg(
+            [b' '],
+            [(socket.SOL_SOCKET, socket.SCM_RIGHTS, struct.pack('@i', fd))]
+        )
-- 
2.31.1


