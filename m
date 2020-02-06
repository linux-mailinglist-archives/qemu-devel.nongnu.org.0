Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C41A4154139
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 10:34:01 +0100 (CET)
Received: from localhost ([::1]:34458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izdXs-0005vF-TA
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 04:34:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35700)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1izdWx-0005Is-0v
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 04:33:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1izdWv-0005Uh-TB
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 04:33:02 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:33562 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1izdWv-0005CL-I7; Thu, 06 Feb 2020 04:33:01 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 608105648C9A7514E7FC;
 Thu,  6 Feb 2020 17:32:56 +0800 (CST)
Received: from HGHY4C002233111.china.huawei.com (10.133.205.93) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.439.0; Thu, 6 Feb 2020 17:32:47 +0800
From: <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <alex.bennee@linaro.org>
Subject: [PATCH] tests/plugin: prevent uninitialized warning
Date: Thu, 6 Feb 2020 17:32:38 +0800
Message-ID: <20200206093238.203984-1-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.14.1.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [10.133.205.93]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
Cc: qemu-trivial@nongnu.org, Chen Qun <kuhn.chenqun@huawei.com>,
 richard.henderson@linaro.org, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Chen Qun <kuhn.chenqun@huawei.com>

According to the glibc function requirements, we need initialise
 the variable. Otherwise there will be compilation warnings:

glib-autocleanups.h:28:3: warning: =E2=80=98out=E2=80=99 may be
used uninitialized in this function [-Wmaybe-uninitialized]
   g_free (*pp);
   ^~~~~~~~~~~~

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
 tests/plugin/bb.c   | 2 +-
 tests/plugin/insn.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/plugin/bb.c b/tests/plugin/bb.c
index f30bea08dc..8b9da23a04 100644
--- a/tests/plugin/bb.c
+++ b/tests/plugin/bb.c
@@ -22,7 +22,7 @@ static bool do_inline;
=20
 static void plugin_exit(qemu_plugin_id_t id, void *p)
 {
-    g_autofree gchar *out;
+    g_autofree gchar *out =3D NULL;
     out =3D g_strdup_printf("bb's: %" PRIu64", insns: %" PRIu64 "\n",
                           bb_count, insn_count);
     qemu_plugin_outs(out);
diff --git a/tests/plugin/insn.c b/tests/plugin/insn.c
index 0a8f5a0000..c83b1c0157 100644
--- a/tests/plugin/insn.c
+++ b/tests/plugin/insn.c
@@ -44,7 +44,7 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct q=
emu_plugin_tb *tb)
=20
 static void plugin_exit(qemu_plugin_id_t id, void *p)
 {
-    g_autofree gchar *out;
+    g_autofree gchar *out =3D NULL;
     out =3D g_strdup_printf("insns: %" PRIu64 "\n", insn_count);
     qemu_plugin_outs(out);
 }
--=20
2.23.0



