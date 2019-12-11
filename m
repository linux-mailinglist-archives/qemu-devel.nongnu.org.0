Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E7811B7DA
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Dec 2019 17:10:46 +0100 (CET)
Received: from localhost ([::1]:45214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1if4ZZ-0005zL-Nf
	for lists+qemu-devel@lfdr.de; Wed, 11 Dec 2019 11:10:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42491)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.com>) id 1if4UQ-0002wV-He
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 11:05:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1if4UP-0003wX-8u
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 11:05:26 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:49364)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1if4UO-0003uk-Nq
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 11:05:25 -0500
Received: from crumble.bar.greensocs.com (crumble.bar.greensocs.com
 [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPS id 8239096F50;
 Wed, 11 Dec 2019 16:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1576080323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7sPz7oVBNzeMeWcyKT2i75rgmDRiD8IxeGkrlkSUefk=;
 b=tO6TuIoqsuJcG0Qc4C8CRMlBenX1SW8Auq7TFTlGz2DfpQSVKkq6oPpEkaWssh5nlUfbf2
 PgTUCAb/FHa7O8+s5meRXLEFVoV0E2RZnSNHB8TixrW5MPb0V/GaQyerOmEqN30RC2p8rz
 MgMXetSJWilzMxoxUXXkgh1BKIKgavU=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] gdbstub: do not split gdb_monitor_write payload
Date: Wed, 11 Dec 2019 17:05:14 +0100
Message-Id: <20191211160514.58373-3-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191211160514.58373-1-damien.hedde@greensocs.com>
References: <20191211160514.58373-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1576080323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7sPz7oVBNzeMeWcyKT2i75rgmDRiD8IxeGkrlkSUefk=;
 b=nmZ3hG3qqt7z5vFCxYkXsa/goAF3gscl1bdHWnrvElG1mKrOaxiXe9dcPCp5RTIl0x254V
 RhP9u/QXtag5fiVYRZTLYfO1sLZM4E5udmUr5x0CCw1uMfJmUZB17AjWwLRos8HXp/pXMk
 yYI5H+HCMfcwA7cy1AeZY9AtCj6JJ88=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1576080323; a=rsa-sha256; cv=none;
 b=oUiOrjgLa0JI0Gol9epSdIW9Fb/jdE3T/Ruy6vGj5Get1tPvdkDBCCyb83RIAEx9LhLFdp
 VCZQkOp/IlKy3HgCmZ3cF4hbl2v3JcOiRnHsXtXaf3UdrIWJvp57tFJJ7lgW0iGVt4VMRr
 tLdXmcrIWk+Ur+MuIjfVXPoSgBwnI2Y=
ARC-Authentication-Results: i=1;
	beetle.greensocs.com;
	none
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 5.135.226.135
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, philmd@redhat.com,
 alex.bennee@linaro.org, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since we can now send packets of arbitrary length:
simplify gdb_monitor_write() and send the whole payload
in one packet.

Suggested-by: Luc Michel <luc.michel@greensocs.com>
Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 gdbstub.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 93b26f1b86..ef999abee2 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -3200,28 +3200,11 @@ static void gdb_chr_event(void *opaque, int event=
)
     }
 }
=20
-static void gdb_monitor_output(GDBState *s, const char *msg, int len)
-{
-    g_autoptr(GString) buf =3D g_string_new("O");
-    memtohex(buf, (uint8_t *)msg, len);
-    put_packet(buf->str);
-}
-
 static int gdb_monitor_write(Chardev *chr, const uint8_t *buf, int len)
 {
-    const char *p =3D (const char *)buf;
-    int max_sz;
-
-    max_sz =3D (MAX_PACKET_LENGTH / 2) + 1;
-    for (;;) {
-        if (len <=3D max_sz) {
-            gdb_monitor_output(&gdbserver_state, p, len);
-            break;
-        }
-        gdb_monitor_output(&gdbserver_state, p, max_sz);
-        p +=3D max_sz;
-        len -=3D max_sz;
-    }
+    g_autoptr(GString) hex_buf =3D g_string_new("O");
+    memtohex(hex_buf, buf, len);
+    put_packet(hex_buf->str);
     return len;
 }
=20
--=20
2.24.0


