Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 954FECB223
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Oct 2019 01:06:36 +0200 (CEST)
Received: from localhost ([::1]:40766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGAB8-00009d-Kw
	for lists+qemu-devel@lfdr.de; Thu, 03 Oct 2019 19:06:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40915)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iGA0H-0003li-QL
 for qemu-devel@nongnu.org; Thu, 03 Oct 2019 18:55:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iGA0F-00085X-Fc
 for qemu-devel@nongnu.org; Thu, 03 Oct 2019 18:55:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43480)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iGA0D-00084X-E8
 for qemu-devel@nongnu.org; Thu, 03 Oct 2019 18:55:18 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E61D43086E23;
 Thu,  3 Oct 2019 22:55:15 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-21.brq.redhat.com [10.40.204.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E22A2600C4;
 Thu,  3 Oct 2019 22:55:01 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/7] tests/libqos/fw_cfg: Document pc_fw_cfg_init to drop
 pc_fw_cfg_uninit
Date: Fri,  4 Oct 2019 00:54:33 +0200
Message-Id: <20191003225437.16651-4-philmd@redhat.com>
In-Reply-To: <20191003225437.16651-1-philmd@redhat.com>
References: <20191003225437.16651-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Thu, 03 Oct 2019 22:55:15 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Document pc_fw_cfg_init() return value must be released
with g_free(). Directly calling g_free() we don't really
need pc_fw_cfg_uninit(): remove it.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 tests/fw_cfg-test.c      | 22 +++++++++++-----------
 tests/libqos/fw_cfg.h    | 14 +++++++++-----
 tests/libqos/malloc-pc.c |  2 +-
 3 files changed, 21 insertions(+), 17 deletions(-)

diff --git a/tests/fw_cfg-test.c b/tests/fw_cfg-test.c
index 1d3147f821..53ae82f7c8 100644
--- a/tests/fw_cfg-test.c
+++ b/tests/fw_cfg-test.c
@@ -36,7 +36,7 @@ static void test_fw_cfg_signature(void)
     buf[4] =3D 0;
=20
     g_assert_cmpstr(buf, =3D=3D, "QEMU");
-    pc_fw_cfg_uninit(fw_cfg);
+    g_free(fw_cfg);
     qtest_quit(s);
 }
=20
@@ -52,7 +52,7 @@ static void test_fw_cfg_id(void)
     id =3D qfw_cfg_get_u32(fw_cfg, FW_CFG_ID);
     g_assert((id =3D=3D 1) ||
              (id =3D=3D 3));
-    pc_fw_cfg_uninit(fw_cfg);
+    g_free(fw_cfg);
     qtest_quit(s);
 }
=20
@@ -73,7 +73,7 @@ static void test_fw_cfg_uuid(void)
     qfw_cfg_get(fw_cfg, FW_CFG_UUID, buf, 16);
     g_assert(memcmp(buf, uuid, sizeof(buf)) =3D=3D 0);
=20
-    pc_fw_cfg_uninit(fw_cfg);
+    g_free(fw_cfg);
     qtest_quit(s);
=20
 }
@@ -88,7 +88,7 @@ static void test_fw_cfg_ram_size(void)
=20
     g_assert_cmpint(qfw_cfg_get_u64(fw_cfg, FW_CFG_RAM_SIZE), =3D=3D, ra=
m_size);
=20
-    pc_fw_cfg_uninit(fw_cfg);
+    g_free(fw_cfg);
     qtest_quit(s);
 }
=20
@@ -102,7 +102,7 @@ static void test_fw_cfg_nographic(void)
=20
     g_assert_cmpint(qfw_cfg_get_u16(fw_cfg, FW_CFG_NOGRAPHIC), =3D=3D, 0=
);
=20
-    pc_fw_cfg_uninit(fw_cfg);
+    g_free(fw_cfg);
     qtest_quit(s);
 }
=20
@@ -116,7 +116,7 @@ static void test_fw_cfg_nb_cpus(void)
=20
     g_assert_cmpint(qfw_cfg_get_u16(fw_cfg, FW_CFG_NB_CPUS), =3D=3D, nb_=
cpus);
=20
-    pc_fw_cfg_uninit(fw_cfg);
+    g_free(fw_cfg);
     qtest_quit(s);
 }
=20
@@ -129,7 +129,7 @@ static void test_fw_cfg_max_cpus(void)
     fw_cfg =3D pc_fw_cfg_init(s);
=20
     g_assert_cmpint(qfw_cfg_get_u16(fw_cfg, FW_CFG_MAX_CPUS), =3D=3D, ma=
x_cpus);
-    pc_fw_cfg_uninit(fw_cfg);
+    g_free(fw_cfg);
     qtest_quit(s);
 }
=20
@@ -158,7 +158,7 @@ static void test_fw_cfg_numa(void)
=20
     g_free(node_mask);
     g_free(cpu_mask);
-    pc_fw_cfg_uninit(fw_cfg);
+    g_free(fw_cfg);
     qtest_quit(s);
 }
=20
@@ -171,7 +171,7 @@ static void test_fw_cfg_boot_menu(void)
     fw_cfg =3D pc_fw_cfg_init(s);
=20
     g_assert_cmpint(qfw_cfg_get_u16(fw_cfg, FW_CFG_BOOT_MENU), =3D=3D, b=
oot_menu);
-    pc_fw_cfg_uninit(fw_cfg);
+    g_free(fw_cfg);
     qtest_quit(s);
 }
=20
@@ -190,7 +190,7 @@ static void test_fw_cfg_reboot_timeout(void)
     g_assert_cmpint(filesize, =3D=3D, sizeof(reboot_timeout));
     reboot_timeout =3D le32_to_cpu(reboot_timeout);
     g_assert_cmpint(reboot_timeout, =3D=3D, 15);
-    pc_fw_cfg_uninit(fw_cfg);
+    g_free(fw_cfg);
     qtest_quit(s);
 }
=20
@@ -209,7 +209,7 @@ static void test_fw_cfg_splash_time(void)
     g_assert_cmpint(filesize, =3D=3D, sizeof(splash_time));
     splash_time =3D le16_to_cpu(splash_time);
     g_assert_cmpint(splash_time, =3D=3D, 12);
-    pc_fw_cfg_uninit(fw_cfg);
+    g_free(fw_cfg);
     qtest_quit(s);
 }
=20
diff --git a/tests/libqos/fw_cfg.h b/tests/libqos/fw_cfg.h
index 3247fd4000..6316f4c354 100644
--- a/tests/libqos/fw_cfg.h
+++ b/tests/libqos/fw_cfg.h
@@ -54,14 +54,18 @@ QFWCFG *mm_fw_cfg_init(QTestState *qts, uint64_t base=
);
  */
 QFWCFG *io_fw_cfg_init(QTestState *qts, uint16_t base);
=20
+/**
+ * pc_fw_cfg_init():
+ * @qts: The #QTestState that will be referred to by the QFWCFG object.
+ *
+ * This function is specific to the PC machine (X86).
+ *
+ * Returns a newly allocated QFWCFG object which must be released
+ * with a call to g_free() when no longer required.
+ */
 static inline QFWCFG *pc_fw_cfg_init(QTestState *qts)
 {
     return io_fw_cfg_init(qts, 0x510);
 }
=20
-static inline void pc_fw_cfg_uninit(QFWCFG *fw_cfg)
-{
-    g_free(fw_cfg);
-}
-
 #endif
diff --git a/tests/libqos/malloc-pc.c b/tests/libqos/malloc-pc.c
index 6f92ce4135..949a99361d 100644
--- a/tests/libqos/malloc-pc.c
+++ b/tests/libqos/malloc-pc.c
@@ -29,5 +29,5 @@ void pc_alloc_init(QGuestAllocator *s, QTestState *qts,=
 QAllocOpts flags)
     alloc_init(s, flags, 1 << 20, MIN(ram_size, 0xE0000000), PAGE_SIZE);
=20
     /* clean-up */
-    pc_fw_cfg_uninit(fw_cfg);
+    g_free(fw_cfg);
 }
--=20
2.20.1


