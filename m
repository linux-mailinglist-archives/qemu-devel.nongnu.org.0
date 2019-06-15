Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 009F54711A
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Jun 2019 17:58:17 +0200 (CEST)
Received: from localhost ([::1]:32970 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcB4K-0007J1-7d
	for lists+qemu-devel@lfdr.de; Sat, 15 Jun 2019 11:58:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36057)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hcArH-0004OY-W2
 for qemu-devel@nongnu.org; Sat, 15 Jun 2019 11:44:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hcArG-0001c9-OL
 for qemu-devel@nongnu.org; Sat, 15 Jun 2019 11:44:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49090)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hcArE-0001RM-26; Sat, 15 Jun 2019 11:44:44 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 52B642F8BC6;
 Sat, 15 Jun 2019 15:44:43 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-41.brq.redhat.com [10.40.204.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DBC81001B05;
 Sat, 15 Jun 2019 15:44:41 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 15 Jun 2019 17:43:49 +0200
Message-Id: <20190615154352.26824-21-philmd@redhat.com>
In-Reply-To: <20190615154352.26824-1-philmd@redhat.com>
References: <20190615154352.26824-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Sat, 15 Jun 2019 15:44:43 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 20/23] target/arm: Define TCG dependent
 functions when TCG is enabled
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Samuel Ortiz <sameo@linux.intel.com>,
 Robert Bradford <robert.bradford@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Samuel Ortiz <sameo@linux.intel.com>

do_interrupt, do_unaligned_access, do_transaction_failed and debug_excp
are only relevant in the TCG context, so we should not define them
when TCG is disabled.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Robert Bradford <robert.bradford@intel.com>
[PMD: Rebased]
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/arm/cpu.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 2335659a85..3ffea857c4 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1557,7 +1557,7 @@ static void arm_v7m_class_init(ObjectClass *oc, voi=
d *data)
     CPUClass *cc =3D CPU_CLASS(oc);
=20
     acc->info =3D data;
-#ifndef CONFIG_USER_ONLY
+#if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
     cc->do_interrupt =3D arm_v7m_cpu_do_interrupt;
 #endif
=20
@@ -2172,22 +2172,24 @@ static void arm_cpu_class_init(ObjectClass *oc, v=
oid *data)
     cc->gdb_read_register =3D arm_cpu_gdb_read_register;
     cc->gdb_write_register =3D arm_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
+#ifdef CONFIG_TCG
     cc->do_interrupt =3D arm_cpu_do_interrupt;
     cc->do_unaligned_access =3D arm_cpu_do_unaligned_access;
     cc->do_transaction_failed =3D arm_cpu_do_transaction_failed;
+    cc->debug_excp_handler =3D arm_debug_excp_handler;
+#endif /* CONFIG_TCG */
     cc->get_phys_page_attrs_debug =3D arm_cpu_get_phys_page_attrs_debug;
     cc->asidx_from_attrs =3D arm_asidx_from_attrs;
     cc->vmsd =3D &vmstate_arm_cpu;
     cc->virtio_is_big_endian =3D arm_cpu_virtio_is_big_endian;
     cc->write_elf64_note =3D arm_cpu_write_elf64_note;
     cc->write_elf32_note =3D arm_cpu_write_elf32_note;
-#endif
+#endif /* CONFIG_USER_ONLY */
     cc->gdb_num_core_regs =3D 26;
     cc->gdb_core_xml_file =3D "arm-core.xml";
     cc->gdb_arch_name =3D arm_gdb_arch_name;
     cc->gdb_get_dynamic_xml =3D arm_gdb_get_dynamic_xml;
     cc->gdb_stop_before_watchpoint =3D true;
-    cc->debug_excp_handler =3D arm_debug_excp_handler;
     cc->debug_check_watchpoint =3D arm_debug_check_watchpoint;
 #if !defined(CONFIG_USER_ONLY)
     cc->adjust_watchpoint_address =3D arm_adjust_watchpoint_address;
--=20
2.20.1


