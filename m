Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E82314EF6F
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 16:19:31 +0100 (CET)
Received: from localhost ([::1]:54600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixY4w-0004nl-5m
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 10:19:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38966)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1ixXy6-0003tt-7w
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:12:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1ixXy3-0003d8-4l
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:12:25 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:46317
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1ixXy3-0003ca-1J
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:12:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580483542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mY1uuSxedRWD/rMTKc+TLX/3CqWaSjv6RVwLiEIe70o=;
 b=YpXTxvVeCIl95IsIXp3kW8kv0ERmvZyC1EIn4rh7t5j99KtYRNtvly7vlTrbcqNpj/zTYb
 7gI3735/FCA0RLEzWkX+AVpO+HjkUvmAbL3aRFA79EkJ8MbwJR+g3jt64Ikiye1S8o7h4Y
 CEQAc0tBCSyXqvnKf1v0epMHOC3DTnM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-osRGniNTPr-R0031nRuxgQ-1; Fri, 31 Jan 2020 10:12:20 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48C6413F5;
 Fri, 31 Jan 2020 15:12:19 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 742C787B06;
 Fri, 31 Jan 2020 15:12:18 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 06/80] vl.c: move -m parsing after memory backends has been
 processed
Date: Fri, 31 Jan 2020 16:08:36 +0100
Message-Id: <1580483390-131164-7-git-send-email-imammedo@redhat.com>
In-Reply-To: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
References: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: osRGniNTPr-R0031nRuxgQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: pasic@linux.ibm.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It will be possible for main RAM to come from memory-backend
and we should check that size specified in -m matches the size
of the backend and [MachineState::]ram_size also matches
backend's size.

However -m parsing (set_memory_options()) happens before backends
are intialized (object_create_delayed()) which complicates it.
Consolidate set_memory_options() and assigning parsed results to
current_machine after backends are initialized, so it would be
possible access the initialized backend instance to compare
sizes.

This patch only consolidates scattered places touching ram_size
within vl.c. And follow up patch will integrate backend handling
to set_memory_options().

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: pasic@linux.ibm.com
CC: pbonzini@redhat.com
---
 vl.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/vl.c b/vl.c
index 2ef9237..1c0314d 100644
--- a/vl.c
+++ b/vl.c
@@ -2689,6 +2689,14 @@ static void set_memory_options(uint64_t *ram_slots, =
ram_addr_t *maxram_size,
         exit(EXIT_FAILURE);
     }
=20
+    if (!xen_enabled()) {
+        /* On 32-bit hosts, QEMU is limited by virtual address space */
+        if (ram_size > (2047 << 20) && HOST_LONG_BITS =3D=3D 32) {
+            error_report("at most 2047 MB RAM can be simulated");
+            exit(1);
+        }
+    }
+
     loc_pop(&loc);
 }
=20
@@ -3850,8 +3858,6 @@ int main(int argc, char **argv, char **envp)
     machine_class =3D select_machine();
     object_set_machine_compat_props(machine_class->compat_props);
=20
-    set_memory_options(&ram_slots, &maxram_size, machine_class);
-
     os_daemonize();
     rcu_disable_atfork();
=20
@@ -4156,9 +4162,6 @@ int main(int argc, char **argv, char **envp)
     machine_opts =3D qemu_get_machine_opts();
     qemu_opt_foreach(machine_opts, machine_set_property, current_machine,
                      &error_fatal);
-    current_machine->ram_size =3D ram_size;
-    current_machine->maxram_size =3D maxram_size;
-    current_machine->ram_slots =3D ram_slots;
=20
     /*
      * Note: uses machine properties such as kernel-irqchip, must run
@@ -4269,14 +4272,6 @@ int main(int argc, char **argv, char **envp)
=20
     tpm_init();
=20
-    if (!xen_enabled()) {
-        /* On 32-bit hosts, QEMU is limited by virtual address space */
-        if (ram_size > (2047 << 20) && HOST_LONG_BITS =3D=3D 32) {
-            error_report("at most 2047 MB RAM can be simulated");
-            exit(1);
-        }
-    }
-
     blk_mig_init();
     ram_mig_init();
     dirty_bitmap_mig_init();
@@ -4321,6 +4316,12 @@ int main(int argc, char **argv, char **envp)
     if (cpu_option) {
         current_machine->cpu_type =3D parse_cpu_option(cpu_option);
     }
+
+    set_memory_options(&ram_slots, &maxram_size, machine_class);
+    current_machine->ram_size =3D ram_size;
+    current_machine->maxram_size =3D maxram_size;
+    current_machine->ram_slots =3D ram_slots;
+
     parse_numa_opts(current_machine);
=20
     if (machine_class->default_ram_id && current_machine->ram_size &&
--=20
2.7.4


