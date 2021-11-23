Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7435D459A33
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 03:47:26 +0100 (CET)
Received: from localhost ([::1]:46654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpLq9-0000C3-KD
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 21:47:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mpLhw-0006en-J8
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 21:38:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mpLhu-0006Ec-3w
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 21:38:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637635133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BmKhJlmTMFOh8oz4coCKQMEtDBnyVKL9nKTyCeC2BEA=;
 b=WybkWMOOAWrU0X2y05GLZbN1PXjsotMPJw5+JHuf27Om1XPTVPctcr069Y6+TbUwYIx7ev
 bz54KAoOGV4KabzmaQ/zVt5TXLToNweFL72t0vLj+psH7b1yQ6dMDYQC/L+FQ3fUzYfHXI
 h/AMyHN7j4CEz+iCUVUrxhS3jnNQHsw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-AIOv-_-JPLS1X6lffIwMyA-1; Mon, 22 Nov 2021 21:38:43 -0500
X-MC-Unique: AIOv-_-JPLS1X6lffIwMyA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25A891023F4D;
 Tue, 23 Nov 2021 02:38:42 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.32.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 46C5A64188;
 Tue, 23 Nov 2021 02:38:40 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 7/7] python/aqmp: fix send_fd_scm for python 3.6.x
Date: Mon, 22 Nov 2021 21:38:05 -0500
Message-Id: <20211123023805.2745382-8-jsnow@redhat.com>
In-Reply-To: <20211123023805.2745382-1-jsnow@redhat.com>
References: <20211123023805.2745382-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

3.6 doesn't play keepaway with the socket object, so we don't need to go
fishing for it on this version. In fact, so long as 'sendmsg' is still
available, it's probably preferable to just use that method and only go
fishing for forbidden details when we absolutely have to.

Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-id: 20211118204620.1897674-8-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/qmp_client.py | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/python/qemu/aqmp/qmp_client.py b/python/qemu/aqmp/qmp_client.py
index f987da02eb..8105e29fa8 100644
--- a/python/qemu/aqmp/qmp_client.py
+++ b/python/qemu/aqmp/qmp_client.py
@@ -639,9 +639,12 @@ def send_fd_scm(self, fd: int) -> None:
         if sock.family != socket.AF_UNIX:
             raise AQMPError("Sending file descriptors requires a UNIX socket.")
 
-        # Void the warranty sticker.
-        # Access to sendmsg in asyncio is scheduled for removal in Python 3.11.
-        sock = sock._sock  # pylint: disable=protected-access
+        if not hasattr(sock, 'sendmsg'):
+            # We need to void the warranty sticker.
+            # Access to sendmsg is scheduled for removal in Python 3.11.
+            # Find the real backing socket to use it anyway.
+            sock = sock._sock  # pylint: disable=protected-access
+
         sock.sendmsg(
             [b' '],
             [(socket.SOL_SOCKET, socket.SCM_RIGHTS, struct.pack('@i', fd))]
-- 
2.31.1


