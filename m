Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA7D18EC5E
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Mar 2020 22:03:14 +0100 (CET)
Received: from localhost ([::1]:49788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jG7kX-0005Tp-FR
	for lists+qemu-devel@lfdr.de; Sun, 22 Mar 2020 17:03:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41433)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <volker.ruemelin@t-online.de>) id 1jG7jb-0004eW-Qv
 for qemu-devel@nongnu.org; Sun, 22 Mar 2020 17:02:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <volker.ruemelin@t-online.de>) id 1jG7ja-0003rM-Qw
 for qemu-devel@nongnu.org; Sun, 22 Mar 2020 17:02:15 -0400
Received: from mailout08.t-online.de ([194.25.134.20]:34968)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <volker.ruemelin@t-online.de>)
 id 1jG7ja-0003qt-Kt
 for qemu-devel@nongnu.org; Sun, 22 Mar 2020 17:02:14 -0400
Received: from fwd15.aul.t-online.de (fwd15.aul.t-online.de [172.20.27.63])
 by mailout08.t-online.de (Postfix) with SMTP id 74AE941A68D6;
 Sun, 22 Mar 2020 22:02:12 +0100 (CET)
Received: from linpower.localnet
 (ZBnKXaZlohtCjFE4z5ob8x-LI+CRz6QncVCrDsm5BWTE3RbVZg35qJjPi4Sl6GEQtN@[93.236.151.78])
 by fwd15.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1jG7jY-1sZ5No0; Sun, 22 Mar 2020 22:02:12 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 994DF21157A; Sun, 22 Mar 2020 22:02:11 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Colin Xu <colin.xu@intel.com>
Subject: [PATCH] hax: Windows doesn't like posix device names
Date: Sun, 22 Mar 2020 22:02:11 +0100
Message-Id: <20200322210211.29603-1-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.16.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-ID: ZBnKXaZlohtCjFE4z5ob8x-LI+CRz6QncVCrDsm5BWTE3RbVZg35qJjPi4Sl6GEQtN
X-TOI-MSGID: 845b038a-dce3-434c-a724-22cfde7aa1da
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 194.25.134.20
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
Cc: Julio Faracco <jcfaracco@gmail.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Patch acb9f95a7c "i386: Fix GCC warning with snprintf when HAX
is enabled" replaced Windows device names with posix device
names. Revert this.

Fixes: acb9f95a7c "i386: Fix GCC warning with snprintf when HAX is enable=
d"

Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
---
 target/i386/hax-windows.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/hax-windows.c b/target/i386/hax-windows.c
index 0ba488c468..863c2bcc19 100644
--- a/target/i386/hax-windows.c
+++ b/target/i386/hax-windows.c
@@ -185,12 +185,12 @@ int hax_mod_version(struct hax_state *hax, struct h=
ax_module_version *version)
=20
 static char *hax_vm_devfs_string(int vm_id)
 {
-    return g_strdup_printf("/dev/hax_vm/vm%02d", vm_id);
+    return g_strdup_printf("\\\\.\\hax_vm%02d", vm_id);
 }
=20
 static char *hax_vcpu_devfs_string(int vm_id, int vcpu_id)
 {
-    return g_strdup_printf("/dev/hax_vm%02d/vcpu%02d", vm_id, vcpu_id);
+    return g_strdup_printf("\\\\.\\hax_vm%02d_vcpu%02d", vm_id, vcpu_id)=
;
 }
=20
 int hax_host_create_vm(struct hax_state *hax, int *vmid)
--=20
2.16.4


