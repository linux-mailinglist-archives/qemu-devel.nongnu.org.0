Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B563242AF3E
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 23:46:58 +0200 (CEST)
Received: from localhost ([::1]:54856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maPbs-0000Ct-JU
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 17:46:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1maPYF-0005HE-Ma
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 17:43:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1maPYD-0000Al-2C
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 17:43:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634074988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X3cObBRMQphyn29U3tGO/4DWuh7E5gTFgokPzSEt9Ig=;
 b=FtOtHcMEzMCtkvd8UqNLxuA4BoMlXS57J+UlYxIS71btFVqc/UeGcRS8/RPvRVwigc/3Rm
 OQJdV2LA4JFjs1/3PvxsXfOvIXydMkVWDXuRrksVfKuORDchcoNR2rwpnAlXXIj27O7Kaz
 fckeNaMsjnT5tPAkF9JEyxzLQ0pB/PI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-5M0ka2H3M9ysUpgPLui2Tw-1; Tue, 12 Oct 2021 17:43:05 -0400
X-MC-Unique: 5M0ka2H3M9ysUpgPLui2Tw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48FE81006AA2;
 Tue, 12 Oct 2021 21:43:04 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 990695D6A8;
 Tue, 12 Oct 2021 21:43:02 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/10] python/aqmp: add send_fd_scm
Date: Tue, 12 Oct 2021 17:41:46 -0400
Message-Id: <20211012214152.802483-5-jsnow@redhat.com>
In-Reply-To: <20211012214152.802483-1-jsnow@redhat.com>
References: <20211012214152.802483-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add an implementation for send_fd_scm to the async QMP implementation.
Like socket_scm_helper mentions, a non-empty payload is required for
QEMU to process the ancillary data. A space is most useful because it
does not disturb the parsing of subsequent JSON objects.

A note on "voiding the warranty":

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
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-id: 20210923004938.3999963-5-jsnow@redhat.com
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


