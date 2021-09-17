Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9139340F1C1
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 07:49:30 +0200 (CEST)
Received: from localhost ([::1]:45876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR6kb-0006cz-J9
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 01:49:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mR6cg-0004xh-Rp
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 01:41:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mR6cd-0003QN-DX
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 01:41:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631857274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yEsV1VUq4HOVguJg2jE61C1nimpfJvQ/LTC/oELGyzQ=;
 b=hPfnTgEi8c4hKSCzL0dw2mlzCWWrqZYsmBMM38S45kfVlO0lbTsqF6cGXdj9K3GiFlPb8L
 AiP1zcpV1U5nyfZTzSP5tJQbf9qguk4R8cyF6dUZlnc3EiIHNXNnhG4GtHrbHRsAMdjdfC
 FyAa7cP5hSepGXniunDsDRshJkhwsIU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-IJtIOiNpOzeF7_uhNx5B0Q-1; Fri, 17 Sep 2021 01:41:13 -0400
X-MC-Unique: IJtIOiNpOzeF7_uhNx5B0Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5FB7F1800D41;
 Fri, 17 Sep 2021 05:41:12 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED69960C25;
 Fri, 17 Sep 2021 05:41:10 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/15] python/aqmp: add send_fd_scm
Date: Fri, 17 Sep 2021 01:40:39 -0400
Message-Id: <20210917054047.2042843-8-jsnow@redhat.com>
In-Reply-To: <20210917054047.2042843-1-jsnow@redhat.com>
References: <20210917054047.2042843-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/qmp_client.py | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/python/qemu/aqmp/qmp_client.py b/python/qemu/aqmp/qmp_client.py
index d2ad7459f9..58f85990bc 100644
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
@@ -624,3 +626,18 @@ async def execute(self, cmd: str,
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
+        # Python 3.9+ adds socket.send_fds(...)
+        sock.sendmsg(
+            [b' '],
+            [(socket.SOL_SOCKET, socket.SCM_RIGHTS, struct.pack('@i', fd))]
+        )
-- 
2.31.1


