Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A03EB12B4E8
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Dec 2019 14:43:34 +0100 (CET)
Received: from localhost ([::1]:35546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ikptt-00085l-IP
	for lists+qemu-devel@lfdr.de; Fri, 27 Dec 2019 08:43:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58848)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wainersm@redhat.com>) id 1ikprd-0006Ht-5u
 for qemu-devel@nongnu.org; Fri, 27 Dec 2019 08:41:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <wainersm@redhat.com>) id 1ikprb-00030X-JU
 for qemu-devel@nongnu.org; Fri, 27 Dec 2019 08:41:13 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:37503
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <wainersm@redhat.com>) id 1ikprb-000300-GA
 for qemu-devel@nongnu.org; Fri, 27 Dec 2019 08:41:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577454070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oOjUyDHbviUeWxs2MNUwGFkBbxmqmMuSESvGijd12zQ=;
 b=Ex4ATej+lcLDrZJDBmUnkIGoboFfSSofPaiEe/7nLTKrhrgHviZT/iPk8MolmeZuVYRFp3
 04BsEIyfmj7O4HW+qvP05walGiFyfQBPhv8b4fTBHqZKxzkfV84k8dAfp5F9VsYtFA/SDn
 zbXVA+ri8Fcx1JhK64FkPUJmT5Qp4bk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-vj7bqWw3M-2as7Coi2Z2tw-1; Fri, 27 Dec 2019 08:41:09 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94E341804193
 for <qemu-devel@nongnu.org>; Fri, 27 Dec 2019 13:41:08 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-24.gru2.redhat.com
 [10.97.116.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1921A81C10;
 Fri, 27 Dec 2019 13:41:06 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/5] python/qemu: Delint the qmp module
Date: Fri, 27 Dec 2019 10:40:58 -0300
Message-Id: <20191227134101.244496-3-wainersm@redhat.com>
In-Reply-To: <20191227134101.244496-1-wainersm@redhat.com>
References: <20191227134101.244496-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: vj7bqWw3M-2as7Coi2Z2tw-1
X-Mimecast-Spam-Score: 0
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
Cc: ehabkost@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This clean up the pylint-3 report on qmp:

************* Module qemu.qmp
python/qemu/qmp.py:1:0: C0111: Missing module docstring (missing-docstring)
python/qemu/qmp.py:17:0: C0111: Missing class docstring (missing-docstring)
python/qemu/qmp.py:21:0: C0111: Missing class docstring (missing-docstring)
python/qemu/qmp.py:25:0: C0111: Missing class docstring (missing-docstring)
python/qemu/qmp.py:29:0: C0111: Missing class docstring (missing-docstring)
python/qemu/qmp.py:33:0: C0111: Missing class docstring (missing-docstring)
python/qemu/qmp.py:33:0: R0205: Class 'QEMUMonitorProtocol' inherits from o=
bject, can be safely removed from bases in python3 (useless-object-inherita=
nce)
python/qemu/qmp.py:80:4: R1710: Either all return statements in a function =
should return an expression, or none of them should. (inconsistent-return-s=
tatements)
python/qemu/qmp.py:131:4: R1710: Either all return statements in a function=
 should return an expression, or none of them should. (inconsistent-return-=
statements)
python/qemu/qmp.py:159:4: R1710: Either all return statements in a function=
 should return an expression, or none of them should. (inconsistent-return-=
statements)
python/qemu/qmp.py:245:4: C0111: Missing method docstring (missing-docstrin=
g)
python/qemu/qmp.py:249:4: C0111: Missing method docstring (missing-docstrin=
g)
python/qemu/qmp.py:252:4: C0111: Missing method docstring (missing-docstrin=
g)
python/qemu/qmp.py:255:4: C0111: Missing method docstring (missing-docstrin=
g)

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
---
 python/qemu/qmp.py | 51 +++++++++++++++++++++++++++++++++++++---------
 1 file changed, 41 insertions(+), 10 deletions(-)

diff --git a/python/qemu/qmp.py b/python/qemu/qmp.py
index 8c6c9847d0..f4e04a6683 100644
--- a/python/qemu/qmp.py
+++ b/python/qemu/qmp.py
@@ -1,5 +1,4 @@
-# QEMU Monitor Protocol Python class
-#
+""" QEMU Monitor Protocol Python class """
 # Copyright (C) 2009, 2010 Red Hat Inc.
 #
 # Authors:
@@ -15,22 +14,34 @@ import logging
=20
=20
 class QMPError(Exception):
-    pass
+    """
+    QMP base exception
+    """
=20
=20
 class QMPConnectError(QMPError):
-    pass
+    """
+    QMP connection exception
+    """
=20
=20
 class QMPCapabilitiesError(QMPError):
-    pass
+    """
+    QMP negotiate capabilities exception
+    """
=20
=20
 class QMPTimeoutError(QMPError):
-    pass
+    """
+    QMP timeout exception
+    """
=20
=20
-class QEMUMonitorProtocol(object):
+class QEMUMonitorProtocol:
+    """
+    Provide an API to connect to QEMU via QEMU Monitor Protocol (QMP) and =
then
+    allow to handle commands and events.
+    """
=20
     #: Logger object for debugging messages
     logger =3D logging.getLogger('QMP')
@@ -81,7 +92,7 @@ class QEMUMonitorProtocol(object):
         while True:
             data =3D self.__sockfile.readline()
             if not data:
-                return
+                return None
             resp =3D json.loads(data)
             if 'event' in resp:
                 self.logger.debug("<<< %s", resp)
@@ -132,7 +143,7 @@ class QEMUMonitorProtocol(object):
         """
         Connect to the QMP Monitor and perform capabilities negotiation.
=20
-        @return QMP greeting dict
+        @return QMP greeting dict, or None if negotiate is false
         @raise OSError on socket connection errors
         @raise QMPConnectError if the greeting is not received
         @raise QMPCapabilitiesError if fails to negotiate capabilities
@@ -141,6 +152,7 @@ class QEMUMonitorProtocol(object):
         self.__sockfile =3D self.__sock.makefile()
         if negotiate:
             return self.__negotiate_capabilities()
+        return None
=20
     def accept(self):
         """
@@ -169,7 +181,7 @@ class QEMUMonitorProtocol(object):
             self.__sock.sendall(json.dumps(qmp_cmd).encode('utf-8'))
         except OSError as err:
             if err.errno =3D=3D errno.EPIPE:
-                return
+                return None
             raise err
         resp =3D self.__json_read()
         self.logger.debug("<<< %s", resp)
@@ -243,14 +255,33 @@ class QEMUMonitorProtocol(object):
         self.__events =3D []
=20
     def close(self):
+        """
+        Close the socket and socket file.
+        """
         self.__sock.close()
         self.__sockfile.close()
=20
     def settimeout(self, timeout):
+        """
+        Set the socket timeout.
+
+        @param timeout (float): timeout in seconds, or None.
+        @note This is a wrap around socket.settimeout
+        """
         self.__sock.settimeout(timeout)
=20
     def get_sock_fd(self):
+        """
+        Get the socket file descriptor.
+
+        @return The file descriptor number.
+        """
         return self.__sock.fileno()
=20
     def is_scm_available(self):
+        """
+        Check if the socket allows for SCM_RIGHTS.
+
+        @return True if SCM_RIGHTS is available, otherwise False.
+        """
         return self.__sock.family =3D=3D socket.AF_UNIX
--=20
2.23.0


