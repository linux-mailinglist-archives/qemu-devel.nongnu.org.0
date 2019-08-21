Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E01B973C7
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 09:45:25 +0200 (CEST)
Received: from localhost ([::1]:44592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0LJ5-0001U6-Ha
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 03:45:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42574)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1i0L0p-0005BY-8X
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 03:26:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1i0L0o-0008Rl-6p
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 03:26:31 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:44673)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1i0L0n-00086s-0S; Wed, 21 Aug 2019 03:26:30 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46CzjD49d6z9sR7; Wed, 21 Aug 2019 17:25:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1566372352;
 bh=djbVlC8N25YL//fyM3PhmQf5jm2n/3eUfbuieIBOl9o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qQowfhqOTbcnlBwz5AOmRwL4l2heczzKI2Htz8slsYmJWeF9NqOJhOXOXUs58JJZt
 iVM7dOYyaDEEdooO/i6UxLWMJ5Tg2kjufFPPTRfzqvHBHVMiL3lEoAw5VyzSeGrHz/
 jeGCc4qSpNhjh0Ubub/ZhfF9OIPosX/5O0G4rAvw=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Wed, 21 Aug 2019 17:25:29 +1000
Message-Id: <20190821072542.23090-30-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190821072542.23090-1-david@gibson.dropbear.id.au>
References: <20190821072542.23090-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
Subject: [Qemu-devel] [PULL 29/42] machine: Add wakeup method to MachineClass
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
Cc: lvivier@redhat.com, aik@ozlabs.ru, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, groug@kaod.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Nicholas Piggin <npiggin@gmail.com>

Waking from suspend is not logically a machine reset on all machines,
particularly in the paravirtualized case rather than hardware
emulated. The ppc spapr machine for example just invokes hypervisor
to suspend, and expects that call to return with the machine in the
same state (modulo some possible migration and reconfiguration
details).

Implement a machine ->wakeup method and use that if it exists.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Message-Id: <20190722053215.20808-2-npiggin@gmail.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 include/hw/boards.h |  1 +
 vl.c                | 18 +++++++++++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index aa35955f7f..60d69217b4 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -180,6 +180,7 @@ struct MachineClass {
=20
     void (*init)(MachineState *state);
     void (*reset)(MachineState *state);
+    void (*wakeup)(MachineState *state);
     void (*hot_add_cpu)(MachineState *state, const int64_t id, Error **e=
rrp);
     int (*kvm_type)(MachineState *machine, const char *arg);
     void (*smp_parse)(MachineState *ms, QemuOpts *opts);
diff --git a/vl.c b/vl.c
index edd5390110..09aa18cb35 100644
--- a/vl.c
+++ b/vl.c
@@ -1557,6 +1557,22 @@ void qemu_system_reset(ShutdownCause reason)
     cpu_synchronize_all_post_reset();
 }
=20
+/*
+ * Wake the VM after suspend.
+ */
+static void qemu_system_wakeup(void)
+{
+    MachineClass *mc;
+
+    mc =3D current_machine ? MACHINE_GET_CLASS(current_machine) : NULL;
+
+    if (mc && mc->wakeup) {
+        mc->wakeup(current_machine);
+    } else {
+        qemu_system_reset(SHUTDOWN_CAUSE_NONE);
+    }
+}
+
 void qemu_system_guest_panicked(GuestPanicInformation *info)
 {
     qemu_log_mask(LOG_GUEST_ERROR, "Guest crashed");
@@ -1765,7 +1781,7 @@ static bool main_loop_should_exit(void)
     }
     if (qemu_wakeup_requested()) {
         pause_all_vcpus();
-        qemu_system_reset(SHUTDOWN_CAUSE_NONE);
+        qemu_system_wakeup();
         notifier_list_notify(&wakeup_notifiers, &wakeup_reason);
         wakeup_reason =3D QEMU_WAKEUP_REASON_NONE;
         resume_all_vcpus();
--=20
2.21.0


