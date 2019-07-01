Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC4024302
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 23:42:48 +0200 (CEST)
Received: from localhost ([127.0.0.1]:42304 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSq3T-0005tN-6m
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 17:42:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56403)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hSpyB-0001wx-MU
	for qemu-devel@nongnu.org; Mon, 20 May 2019 17:37:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hSpy9-0003o2-Sg
	for qemu-devel@nongnu.org; Mon, 20 May 2019 17:37:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57798)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hSpy9-0003n5-No
	for qemu-devel@nongnu.org; Mon, 20 May 2019 17:37:17 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DA79E30842A0;
	Mon, 20 May 2019 21:37:15 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-28.brq.redhat.com [10.40.204.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 81CEC46475;
	Mon, 20 May 2019 21:37:13 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 20 May 2019 23:36:55 +0200
Message-Id: <20190520213700.12620-3-philmd@redhat.com>
In-Reply-To: <20190520213700.12620-1-philmd@redhat.com>
References: <20190520213700.12620-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Mon, 20 May 2019 21:37:15 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 2/7] tests/libqos: Add pc_fw_cfg_uninit()
 and use it
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>, Li Qiang <liq3ea@163.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The pc_fw_cfg_init() function allocates an IO QFWCFG object.
Add the pc_fw_cfg_uninit() function to deallocate it (and use it).

Signed-off-by: Li Qiang <liq3ea@163.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20190424140643.62457-2-liq3ea@163.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
[PMD: Split patch, fill commit description, call uninit in malloc-pc.c]
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 tests/fw_cfg-test.c      | 1 +
 tests/libqos/fw_cfg.h    | 5 +++++
 tests/libqos/malloc-pc.c | 2 +-
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/fw_cfg-test.c b/tests/fw_cfg-test.c
index 1c5103fe1c5..a370ad56678 100644
--- a/tests/fw_cfg-test.c
+++ b/tests/fw_cfg-test.c
@@ -128,6 +128,7 @@ int main(int argc, char **argv)
=20
     ret =3D g_test_run();
=20
+    pc_fw_cfg_uninit(fw_cfg);
     qtest_quit(s);
=20
     return ret;
diff --git a/tests/libqos/fw_cfg.h b/tests/libqos/fw_cfg.h
index 391669031a3..60de81e8633 100644
--- a/tests/libqos/fw_cfg.h
+++ b/tests/libqos/fw_cfg.h
@@ -42,4 +42,9 @@ static inline QFWCFG *pc_fw_cfg_init(QTestState *qts)
     return io_fw_cfg_init(qts, 0x510);
 }
=20
+static inline void pc_fw_cfg_uninit(QFWCFG *fw_cfg)
+{
+    io_fw_cfg_uninit(fw_cfg);
+}
+
 #endif
diff --git a/tests/libqos/malloc-pc.c b/tests/libqos/malloc-pc.c
index 949a99361d1..6f92ce41350 100644
--- a/tests/libqos/malloc-pc.c
+++ b/tests/libqos/malloc-pc.c
@@ -29,5 +29,5 @@ void pc_alloc_init(QGuestAllocator *s, QTestState *qts,=
 QAllocOpts flags)
     alloc_init(s, flags, 1 << 20, MIN(ram_size, 0xE0000000), PAGE_SIZE);
=20
     /* clean-up */
-    g_free(fw_cfg);
+    pc_fw_cfg_uninit(fw_cfg);
 }
--=20
2.20.1


