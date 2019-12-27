Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BF412B4EB
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Dec 2019 14:45:24 +0100 (CET)
Received: from localhost ([::1]:35562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ikpvf-0002Bc-Vh
	for lists+qemu-devel@lfdr.de; Fri, 27 Dec 2019 08:45:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58898)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wainersm@redhat.com>) id 1ikprh-0006OB-AF
 for qemu-devel@nongnu.org; Fri, 27 Dec 2019 08:41:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <wainersm@redhat.com>) id 1ikprg-00038d-79
 for qemu-devel@nongnu.org; Fri, 27 Dec 2019 08:41:17 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:39633
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <wainersm@redhat.com>) id 1ikprg-00037W-3o
 for qemu-devel@nongnu.org; Fri, 27 Dec 2019 08:41:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577454075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1l/tQ5+l+T1XzctYuN14RZwqLGUquGObj/tL5Pe29Ek=;
 b=Nly/MPxoma6KiJQ7nq2sVhPozUYK4QSVH1kimGlZeH4w0gS0g7RtLmnSF7AFtJRXXECl2+
 B5rZjzmpPOOjY7uQR/XBnDFeXqU3yY8T/niW0LOTAgQ05tvLW5Sm1tXWudX0qg9ryLO1Yn
 JYiz+Sp8UvwSuPamC9rEB4s4L1qShC8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-BTa-AUmoOjWvixkFlInXAw-1; Fri, 27 Dec 2019 08:41:14 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0F2D801E7A
 for <qemu-devel@nongnu.org>; Fri, 27 Dec 2019 13:41:12 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-24.gru2.redhat.com
 [10.97.116.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 561CA81C11;
 Fri, 27 Dec 2019 13:41:11 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] python/qemu: qmp: Make QEMUMonitorProtocol a context
 manager
Date: Fri, 27 Dec 2019 10:41:00 -0300
Message-Id: <20191227134101.244496-5-wainersm@redhat.com>
In-Reply-To: <20191227134101.244496-1-wainersm@redhat.com>
References: <20191227134101.244496-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: BTa-AUmoOjWvixkFlInXAw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: ehabkost@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This implement the __enter__ and __exit__ functions on
QEMUMonitorProtocol class so that it can be used on 'with'
statement and the resources will be free up on block end:

with QEMUMonitorProtocol(socket_path) as qmp:
    qmp.connect()
    qmp.command('query-status')

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
---
 python/qemu/qmp.py | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/python/qemu/qmp.py b/python/qemu/qmp.py
index 914b8c6774..6d55f53595 100644
--- a/python/qemu/qmp.py
+++ b/python/qemu/qmp.py
@@ -139,6 +139,15 @@ class QEMUMonitorProtocol:
                 raise QMPConnectError("Error while reading from socket")
             self.__sock.settimeout(None)
=20
+    def __enter__(self):
+        # Implement context manager enter function.
+        return self
+
+    def __exit__(self, exc_type, exc_value, exc_traceback):
+        # Implement context manager exit function.
+        self.close()
+        return False
+
     def connect(self, negotiate=3DTrue):
         """
         Connect to the QMP Monitor and perform capabilities negotiation.
@@ -259,8 +268,10 @@ class QEMUMonitorProtocol:
         """
         Close the socket and socket file.
         """
-        self.__sock.close()
-        self.__sockfile.close()
+        if self.__sock:
+            self.__sock.close()
+        if self.__sockfile:
+            self.__sockfile.close()
=20
     def settimeout(self, timeout):
         """
--=20
2.23.0


