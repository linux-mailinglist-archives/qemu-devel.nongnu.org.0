Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7174B154DDB
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 22:23:46 +0100 (CET)
Received: from localhost ([::1]:46300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izoci-00041r-LD
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 16:23:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34330)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1izoZQ-0007BK-F6
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 16:20:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1izoZP-0001K3-87
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 16:20:20 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:50769
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1izoZP-0001IT-2o
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 16:20:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581024018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D28aVy1kxNSOevA4i86j2bevZglqlC5kapY1TlH07f4=;
 b=D+TfdOZhlh+DWnT/TffJILrtPX/qvmIa42Z8jZmPR7PLAOXmV668KrlxXAIq28ZnHgESZe
 FKyzMYDfqeSCkQ8M7Np7l8Z/QI4WfhOw1+dXKfSv4+uKqkKIY+g1DtMqKHadtMRj7QH2jl
 TqZzz6bJtXR07Rl5ePtiyL16adsV7y8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-CEWN4NRdOzyqusDfUo-RAA-1; Thu, 06 Feb 2020 16:20:12 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10AC31081FA4
 for <qemu-devel@nongnu.org>; Thu,  6 Feb 2020 21:20:12 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-120.brq.redhat.com [10.40.204.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E56060BEC;
 Thu,  6 Feb 2020 21:19:57 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/46] python/qemu: qmp: Make accept()'s timeout configurable
Date: Thu,  6 Feb 2020 22:18:53 +0100
Message-Id: <20200206211936.17098-4-philmd@redhat.com>
In-Reply-To: <20200206211936.17098-1-philmd@redhat.com>
References: <20200206211936.17098-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: CEWN4NRdOzyqusDfUo-RAA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wainer dos Santos Moschetta <wainersm@redhat.com>

Currently the timeout of QEMUMonitorProtocol.accept() is
hard-coded to 15.0 seconds. This added the parameter `timeout`
so the value can be configured by the user.

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Message-Id: <20200204141111.3207-4-wainersm@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 python/qemu/qmp.py | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/python/qemu/qmp.py b/python/qemu/qmp.py
index f4e04a6683..0e07d80e2a 100644
--- a/python/qemu/qmp.py
+++ b/python/qemu/qmp.py
@@ -154,16 +154,23 @@ class QEMUMonitorProtocol:
             return self.__negotiate_capabilities()
         return None
=20
-    def accept(self):
+    def accept(self, timeout=3D15.0):
         """
         Await connection from QMP Monitor and perform capabilities negotia=
tion.
=20
+        @param timeout: timeout in seconds (nonnegative float number, or
+                        None). The value passed will set the behavior of t=
he
+                        underneath QMP socket as described in [1]. Default=
 value
+                        is set to 15.0.
         @return QMP greeting dict
         @raise OSError on socket connection errors
         @raise QMPConnectError if the greeting is not received
         @raise QMPCapabilitiesError if fails to negotiate capabilities
+
+        [1]
+        https://docs.python.org/3/library/socket.html#socket.socket.settim=
eout
         """
-        self.__sock.settimeout(15)
+        self.__sock.settimeout(timeout)
         self.__sock, _ =3D self.__sock.accept()
         self.__sockfile =3D self.__sock.makefile()
         return self.__negotiate_capabilities()
--=20
2.21.1


