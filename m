Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 833301833D5
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Mar 2020 15:54:56 +0100 (CET)
Received: from localhost ([::1]:42800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCPEd-0001UI-Kr
	for lists+qemu-devel@lfdr.de; Thu, 12 Mar 2020 10:54:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39593)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ovoshcha@redhat.com>) id 1jCPDc-0000WQ-Id
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 10:53:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ovoshcha@redhat.com>) id 1jCPDb-0001gu-6l
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 10:53:52 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:43447
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ovoshcha@redhat.com>) id 1jCPDb-0001fv-3F
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 10:53:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584024830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WwQghGT/cYwrF6nY1qiQGoODCILutS6KG+Gno1jjCmg=;
 b=NY1hDkSL53fWeMiu8pmpVMltguk1yBtUZAsNKjqgXZGZV+C/NUvOXzmEKB4xLtmFcIx3QK
 RjSLxUIppJ66lvRTFprUfU5H9X2a/QeuQM0jJ0RMHCcwDkdAs2xJNZ5WuTCzfunaocbrgS
 Rze3iLTqiGqhxE8iML+Tr81rC4Dhd9Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-5TmrU2YrP6arLsHVwLRjvw-1; Thu, 12 Mar 2020 10:53:47 -0400
X-MC-Unique: 5TmrU2YrP6arLsHVwLRjvw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BFBC800D53
 for <qemu-devel@nongnu.org>; Thu, 12 Mar 2020 14:53:46 +0000 (UTC)
Received: from kh066.redhat.com (ovpn-117-246.ams2.redhat.com [10.36.117.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BFC9F9A6A;
 Thu, 12 Mar 2020 14:53:41 +0000 (UTC)
From: Oksana Vohchana <ovoshcha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] python/qemu/qmp.py: QMP debug with VM label
Date: Thu, 12 Mar 2020 16:53:40 +0200
Message-Id: <20200312145340.23555-1-ovoshcha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: ovoshcha@redhat.com, jsnow@redhat.com, ehabkost@redhat.com,
 wainersm@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMUMachine writes some messages to the default logger.
But it sometimes hard to read the output if we have requests to
more than one VM.
This patch adds a label to the logger in the debug mode.

Signed-off-by: Oksana Vohchana <ovoshcha@redhat.com>
---
v2:
 - Instead of shown the label in the message it provides the label
   only in the debug logger information
v3:
 - Fixes coding style problems
---
 python/qemu/machine.py | 3 ++-
 python/qemu/qmp.py     | 5 ++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/python/qemu/machine.py b/python/qemu/machine.py
index 183d8f3d38..f53abfa492 100644
--- a/python/qemu/machine.py
+++ b/python/qemu/machine.py
@@ -270,7 +270,8 @@ class QEMUMachine(object):
                 self._vm_monitor =3D os.path.join(self._sock_dir,
                                                 self._name + "-monitor.soc=
k")
                 self._remove_files.append(self._vm_monitor)
-            self._qmp =3D qmp.QEMUMonitorProtocol(self._vm_monitor, server=
=3DTrue)
+            self._qmp =3D qmp.QEMUMonitorProtocol(self._vm_monitor, server=
=3DTrue,
+                                                nickname=3Dself._name)
=20
     def _post_launch(self):
         if self._qmp:
diff --git a/python/qemu/qmp.py b/python/qemu/qmp.py
index f40586eedd..d58b18c304 100644
--- a/python/qemu/qmp.py
+++ b/python/qemu/qmp.py
@@ -46,7 +46,7 @@ class QEMUMonitorProtocol:
     #: Logger object for debugging messages
     logger =3D logging.getLogger('QMP')
=20
-    def __init__(self, address, server=3DFalse):
+    def __init__(self, address, server=3DFalse, nickname=3DNone):
         """
         Create a QEMUMonitorProtocol class.
=20
@@ -62,6 +62,7 @@ class QEMUMonitorProtocol:
         self.__address =3D address
         self.__sock =3D self.__get_sock()
         self.__sockfile =3D None
+        self._nickname =3D nickname
         if server:
             self.__sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR,=
 1)
             self.__sock.bind(self.__address)
@@ -188,6 +189,8 @@ class QEMUMonitorProtocol:
         @return QMP response as a Python dict or None if the connection ha=
s
                 been closed
         """
+        if self._nickname:
+            self.logger.name =3D 'QMP.{}'.format(self._nickname)
         self.logger.debug(">>> %s", qmp_cmd)
         try:
             self.__sock.sendall(json.dumps(qmp_cmd).encode('utf-8'))
--=20
2.21.1


