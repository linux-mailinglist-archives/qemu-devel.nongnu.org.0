Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2784E456486
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 21:52:56 +0100 (CET)
Received: from localhost ([::1]:60020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnoOt-00050X-9j
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 15:52:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mnoIk-0001t0-0I
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 15:46:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mnoIi-0000P4-Gj
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 15:46:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637268391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DJy2EjSWQLAZm/tVfcEWnbYi3E9ud6fpWr0gyivyG/c=;
 b=EM+LFbOwP4c9xIg0m95Q4rLeRMABUTtn/RGQ1P9vGZ/qIHwevm7yNnKiBBMpDL2glXcD72
 dS6KmoFOs+X24GjHrUZMlTOsScfghxv/1KBji8bCKoIQs/8NsbeVLai3YXs8zkCPTrCTFu
 gwQBSB0pDDDbH5ycFffaq86RbPWZPgk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-465-V7a0XKELOiC2ci91ZProCA-1; Thu, 18 Nov 2021 15:46:29 -0500
X-MC-Unique: V7a0XKELOiC2ci91ZProCA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5477A804143
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 20:46:28 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.18.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D559604CC;
 Thu, 18 Nov 2021 20:46:27 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/7] python/aqmp: fix send_fd_scm for python 3.6.x
Date: Thu, 18 Nov 2021 15:46:20 -0500
Message-Id: <20211118204620.1897674-8-jsnow@redhat.com>
In-Reply-To: <20211118204620.1897674-1-jsnow@redhat.com>
References: <20211118204620.1897674-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

3.6 doesn't play keepaway with the socket object, so we don't need to go
fishing for it on this version. In fact, so long as 'sendmsg' is still
available, it's probably preferable to just use that method and only go
fishing for forbidden details when we absolutely have to.

Reported-by: Thomas Huth <thuth@redhat.com>
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


