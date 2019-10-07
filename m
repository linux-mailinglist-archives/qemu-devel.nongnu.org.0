Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B00CE74A
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Oct 2019 17:22:42 +0200 (CEST)
Received: from localhost ([::1]:45994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHUqO-00049P-K1
	for lists+qemu-devel@lfdr.de; Mon, 07 Oct 2019 11:22:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47282)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iHUnI-0002QE-2e
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 11:19:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iHUnG-0007th-Hm
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 11:19:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50376)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iHUnG-0007tE-BR
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 11:19:26 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 91C5E309DEF2;
 Mon,  7 Oct 2019 15:19:25 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D29C19D70;
 Mon,  7 Oct 2019 15:19:20 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/7] tests/libqos/fw_cfg: Document io_fw_cfg_init to drop
 io_fw_cfg_uninit
Date: Mon,  7 Oct 2019 17:18:59 +0200
Message-Id: <20191007151905.32766-2-philmd@redhat.com>
In-Reply-To: <20191007151905.32766-1-philmd@redhat.com>
References: <20191007151905.32766-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Mon, 07 Oct 2019 15:19:25 +0000 (UTC)
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
 Laszlo Ersek <lersek@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Document io_fw_cfg_init() return value must be released
with g_free(). Directly calling g_free() we don't really
need io_fw_cfg_uninit(): remove it.

This partly reverts commit 0729d833d6d6:
"tests/libqos: Add io_fw_cfg_uninit()"

Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 tests/libqos/fw_cfg.c |  5 -----
 tests/libqos/fw_cfg.h | 11 +++++++++--
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/tests/libqos/fw_cfg.c b/tests/libqos/fw_cfg.c
index 1f46258f96..37c3f2cf4d 100644
--- a/tests/libqos/fw_cfg.c
+++ b/tests/libqos/fw_cfg.c
@@ -157,8 +157,3 @@ QFWCFG *io_fw_cfg_init(QTestState *qts, uint16_t base=
)
=20
     return fw_cfg;
 }
-
-void io_fw_cfg_uninit(QFWCFG *fw_cfg)
-{
-    g_free(fw_cfg);
-}
diff --git a/tests/libqos/fw_cfg.h b/tests/libqos/fw_cfg.h
index 13325cc4ff..15604040bd 100644
--- a/tests/libqos/fw_cfg.h
+++ b/tests/libqos/fw_cfg.h
@@ -36,8 +36,15 @@ size_t qfw_cfg_get_file(QFWCFG *fw_cfg, const char *fi=
lename,
=20
 QFWCFG *mm_fw_cfg_init(QTestState *qts, uint64_t base);
 void mm_fw_cfg_uninit(QFWCFG *fw_cfg);
+/**
+ * io_fw_cfg_init():
+ * @qts: The #QTestState that will be referred to by the QFWCFG object.
+ * @base: The I/O address of the fw_cfg device in the guest.
+ *
+ * Returns a newly allocated QFWCFG object which must be released
+ * with a call to g_free() when no longer required.
+ */
 QFWCFG *io_fw_cfg_init(QTestState *qts, uint16_t base);
-void io_fw_cfg_uninit(QFWCFG *fw_cfg);
=20
 static inline QFWCFG *pc_fw_cfg_init(QTestState *qts)
 {
@@ -46,7 +53,7 @@ static inline QFWCFG *pc_fw_cfg_init(QTestState *qts)
=20
 static inline void pc_fw_cfg_uninit(QFWCFG *fw_cfg)
 {
-    io_fw_cfg_uninit(fw_cfg);
+    g_free(fw_cfg);
 }
=20
 #endif
--=20
2.21.0


