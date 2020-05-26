Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 512691A9030
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Apr 2020 03:13:54 +0200 (CEST)
Received: from localhost ([::1]:41008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOWcj-0001CV-BZ
	for lists+qemu-devel@lfdr.de; Tue, 14 Apr 2020 21:13:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58484)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alazar@bitdefender.com>) id 1jOWPA-0001L6-Cv
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 20:59:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alazar@bitdefender.com>) id 1jOWP8-0005C6-SX
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 20:59:52 -0400
Received: from mx01.bbu.dsd.mx.bitdefender.com ([91.199.104.161]:49104)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <alazar@bitdefender.com>)
 id 1jOWP8-00052R-JG
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 20:59:50 -0400
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 EBB1E30747D5; Wed, 15 Apr 2020 03:59:35 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id D6C48305B7A3;
 Wed, 15 Apr 2020 03:59:35 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v1 19/26] kvm: vmi: intercept force-reset
Date: Wed, 15 Apr 2020 03:59:31 +0300
Message-Id: <20200415005938.23895-20-alazar@bitdefender.com>
In-Reply-To: <20200415005938.23895-1-alazar@bitdefender.com>
References: <20200415005938.23895-1-alazar@bitdefender.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 91.199.104.161
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
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Marian Rotariu <marian.c.rotariu@gmail.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marian Rotariu <marian.c.rotariu@gmail.com>

On forced reset, KVM and the instrospection tool must clean-up the
introspection structures. An important thing that must by done by KVM
is to unlink the shared memory pages (the introspection tool
can map memory pages from the introspected VM in its own process/VM).

CC: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Marian Rotariu <marian.c.rotariu@gmail.com>
Signed-off-by: Adalbert Laz=C4=83r <alazar@bitdefender.com>
---
 accel/kvm/vmi.c                | 6 ++++++
 include/sysemu/vmi-intercept.h | 2 ++
 monitor/qmp-cmds.c             | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/accel/kvm/vmi.c b/accel/kvm/vmi.c
index e511558f3d..90906478b4 100644
--- a/accel/kvm/vmi.c
+++ b/accel/kvm/vmi.c
@@ -73,6 +73,7 @@ static const char *action_string[] =3D {
     "none",
     "suspend",
     "resume",
+    "force-reset",
 };
=20
 static bool suspend_pending;
@@ -677,6 +678,8 @@ static bool record_intercept_action(VMI_intercept_com=
mand action)
     case VMI_INTERCEPT_RESUME:
         suspend_pending =3D false;
         break;
+    case VMI_INTERCEPT_FORCE_RESET:
+        break;
     default:
         return false;
     }
@@ -693,6 +696,9 @@ static bool intercept_action(VMIntrospection *i,
     }
=20
     switch (action) {
+    case VMI_INTERCEPT_FORCE_RESET:
+        disconnect_and_unhook_kvmi(i);
+        return false;
     case VMI_INTERCEPT_RESUME:
         enable_socket_reconnect(i);
         return false;
diff --git a/include/sysemu/vmi-intercept.h b/include/sysemu/vmi-intercep=
t.h
index 06998ff18a..ef591b49e7 100644
--- a/include/sysemu/vmi-intercept.h
+++ b/include/sysemu/vmi-intercept.h
@@ -14,8 +14,10 @@ typedef enum {
     VMI_INTERCEPT_NONE =3D 0,
     VMI_INTERCEPT_SUSPEND,
     VMI_INTERCEPT_RESUME,
+    VMI_INTERCEPT_FORCE_RESET,
 } VMI_intercept_command;
=20
 bool vm_introspection_intercept(VMI_intercept_command ic, Error **errp);
+bool vm_introspection_qmp_delay(void *mon, QObject *id, bool resume);
=20
 #endif /* QEMU_VMI_INTERCEPT_H */
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index eabd20fca3..d164635b5f 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -98,6 +98,10 @@ void qmp_stop(Error **errp)
=20
 void qmp_system_reset(Error **errp)
 {
+    if (vm_introspection_intercept(VMI_INTERCEPT_FORCE_RESET, errp)) {
+        return;
+    }
+
     qemu_system_reset_request(SHUTDOWN_CAUSE_HOST_QMP_SYSTEM_RESET);
 }
=20

