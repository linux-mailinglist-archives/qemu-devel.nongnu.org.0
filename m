Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C437EAC19
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Oct 2019 10:03:28 +0100 (CET)
Received: from localhost ([::1]:47728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iQ6MY-0001lh-L1
	for lists+qemu-devel@lfdr.de; Thu, 31 Oct 2019 05:03:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59343)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1iQ6DE-00016N-Cx
 for qemu-devel@nongnu.org; Thu, 31 Oct 2019 04:53:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1iQ6DD-000214-Dj
 for qemu-devel@nongnu.org; Thu, 31 Oct 2019 04:53:48 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:51182
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1iQ6DD-000202-A2
 for qemu-devel@nongnu.org; Thu, 31 Oct 2019 04:53:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572512027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iyY/kiyOZkundYGSXspGQ1k9WbRnSKakswJmBR/D4tY=;
 b=GhqG9k7Eb3uaWMSnaAI8IH8vgCnNxLpMhSYo14PYR9GgOu7L/MrcYXVLRdAG/XeoLqhmnU
 NsnDCwMmTXHkiJSOYWD5gqlkj3ZzLgwRVJ83ISNk6vhP7oy59p+NyCXh7eP2gp0yOGMenB
 idSYTKfp3ieveX/LICurB7tmpETLvUc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-Gs_r0z_9NYq1VwqYoysc2Q-1; Thu, 31 Oct 2019 04:53:45 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8593107ACC0
 for <qemu-devel@nongnu.org>; Thu, 31 Oct 2019 08:53:44 +0000 (UTC)
Received: from lupin.home.kraxel.org (ovpn-116-222.ams2.redhat.com
 [10.36.116.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E36295DA2C;
 Thu, 31 Oct 2019 08:53:38 +0000 (UTC)
Received: by lupin.home.kraxel.org (Postfix, from userid 1000)
 id 7829C6114A3D; Thu, 31 Oct 2019 09:53:36 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 2/4] tests/vm: add console_consume helper
Date: Thu, 31 Oct 2019 09:53:04 +0100
Message-Id: <20191031085306.28888-3-kraxel@redhat.com>
In-Reply-To: <20191031085306.28888-1-kraxel@redhat.com>
References: <20191031085306.28888-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: Gs_r0z_9NYq1VwqYoysc2Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Helper function to read all console output.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 tests/vm/basevm.py | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
index 2929de23aa..086bfb2c66 100755
--- a/tests/vm/basevm.py
+++ b/tests/vm/basevm.py
@@ -242,6 +242,25 @@ class BaseVM(object):
             return False
         return True
=20
+    def console_consume(self):
+        vm =3D self._guest
+        output =3D ""
+        vm.console_socket.setblocking(0)
+        while True:
+            try:
+                chars =3D vm.console_socket.recv(1)
+            except:
+                break
+            output +=3D chars.decode("latin1")
+            if "\r" in output or "\n" in output:
+                lines =3D re.split("[\r\n]", output)
+                output =3D lines.pop()
+                if self.debug:
+                    self.console_log("\n".join(lines))
+        if self.debug:
+            self.console_log(output)
+        vm.console_socket.setblocking(1)
+
     def console_send(self, command):
         vm =3D self._guest
         if self.debug:
--=20
2.18.1


