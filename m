Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF5212B4E5
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Dec 2019 14:43:29 +0100 (CET)
Received: from localhost ([::1]:35542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ikptn-0007yf-D8
	for lists+qemu-devel@lfdr.de; Fri, 27 Dec 2019 08:43:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58868)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wainersm@redhat.com>) id 1ikpre-0006J0-Ic
 for qemu-devel@nongnu.org; Fri, 27 Dec 2019 08:41:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <wainersm@redhat.com>) id 1ikprd-00034p-HQ
 for qemu-devel@nongnu.org; Fri, 27 Dec 2019 08:41:14 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:49046
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <wainersm@redhat.com>) id 1ikprd-00032D-Dd
 for qemu-devel@nongnu.org; Fri, 27 Dec 2019 08:41:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577454072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UDuh+n+0bICDUrGAWdnvNOHlqbxC8cUgCjIl35Pk3/I=;
 b=J9LlYsWB9IbBIuePmbosoRw6sjX+81YYiDGhl+X25x7+L+RjCsLEd11Nx2D+wpkJ6NBiHS
 8AMolSQIup4fLy8Xr4AsLXyEsVuBLRVDwBz49KzEJzw8oj+JsuYTBoXVs+ZF1On4WBbH6C
 temYaMs3CPKMh7JaZUfddS1eXmGS22o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-Vaff-dqqNX6FxXurVtQLWQ-1; Fri, 27 Dec 2019 08:41:11 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA88D180418B
 for <qemu-devel@nongnu.org>; Fri, 27 Dec 2019 13:41:10 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-24.gru2.redhat.com
 [10.97.116.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 30AFC81C11;
 Fri, 27 Dec 2019 13:41:08 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] python/qemu: qmp: Make accept()'s timeout configurable
Date: Fri, 27 Dec 2019 10:40:59 -0300
Message-Id: <20191227134101.244496-4-wainersm@redhat.com>
In-Reply-To: <20191227134101.244496-1-wainersm@redhat.com>
References: <20191227134101.244496-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: Vaff-dqqNX6FxXurVtQLWQ-1
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

Currently the timeout of QEMUMonitorProtocol.accept() is
hard-coded to 15 seconds. This added the parameter `timeout`
so the value can be configured by the user.

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
---
 python/qemu/qmp.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/python/qemu/qmp.py b/python/qemu/qmp.py
index f4e04a6683..914b8c6774 100644
--- a/python/qemu/qmp.py
+++ b/python/qemu/qmp.py
@@ -154,16 +154,17 @@ class QEMUMonitorProtocol:
             return self.__negotiate_capabilities()
         return None
=20
-    def accept(self):
+    def accept(self, timeout=3D15):
         """
         Await connection from QMP Monitor and perform capabilities negotia=
tion.
=20
+        @param timeout (float): timeout in seconds. Default is 15.
         @return QMP greeting dict
         @raise OSError on socket connection errors
         @raise QMPConnectError if the greeting is not received
         @raise QMPCapabilitiesError if fails to negotiate capabilities
         """
-        self.__sock.settimeout(15)
+        self.__sock.settimeout(timeout)
         self.__sock, _ =3D self.__sock.accept()
         self.__sockfile =3D self.__sock.makefile()
         return self.__negotiate_capabilities()
--=20
2.23.0


