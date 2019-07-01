Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B511A440CD
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 18:10:53 +0200 (CEST)
Received: from localhost ([::1]:41266 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbSJQ-0002uM-T2
	for lists+qemu-devel@lfdr.de; Thu, 13 Jun 2019 12:10:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43016)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hbQqC-0001oM-IX
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 10:36:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hbQqA-0001yA-LJ
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 10:36:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50568)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hbQqA-0001wp-Da
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 10:36:34 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A4FBE86663;
 Thu, 13 Jun 2019 14:36:32 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AC79C1001E60;
 Thu, 13 Jun 2019 14:36:29 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 13 Jun 2019 16:34:39 +0200
Message-Id: <20190613143446.23937-14-philmd@redhat.com>
In-Reply-To: <20190613143446.23937-1-philmd@redhat.com>
References: <20190613143446.23937-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Thu, 13 Jun 2019 14:36:32 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 13/20] hw/i386/pc: Let fw_cfg_init() use the
 generic MachineState
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
Cc: Yang Zhong <yang.zhong@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Rob Bradford <robert.bradford@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Samuel Ortiz <sameo@linux.intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We removed the PCMachineState access, we can now let the fw_cfg_init()
function to take a generic MachineState object.

Suggested-by: Samuel Ortiz <sameo@linux.intel.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/i386/pc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 266cdf19b5..08df4f9895 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -932,7 +932,7 @@ static void pc_build_smbios(PCMachineState *pcms)
     }
 }
=20
-static FWCfgState *fw_cfg_arch_create(PCMachineState *pcms,
+static FWCfgState *fw_cfg_arch_create(MachineState *ms,
                                       const CPUArchIdList *cpus,
                                       uint16_t boot_cpus,
                                       uint16_t apic_id_limit)
@@ -1670,6 +1670,7 @@ void pc_memory_init(PCMachineState *pcms,
     MemoryRegion *ram_below_4g, *ram_above_4g;
     FWCfgState *fw_cfg;
     MachineState *machine =3D MACHINE(pcms);
+    MachineClass *mc =3D MACHINE_GET_CLASS(machine);
     PCMachineClass *pcmc =3D PC_MACHINE_GET_CLASS(pcms);
=20
     assert(machine->ram_size =3D=3D pcms->below_4g_mem_size +
@@ -1766,7 +1767,7 @@ void pc_memory_init(PCMachineState *pcms,
                                         option_rom_mr,
                                         1);
=20
-    fw_cfg =3D fw_cfg_arch_create(pcms, mc->possible_cpu_arch_ids(machin=
e),
+    fw_cfg =3D fw_cfg_arch_create(machine, mc->possible_cpu_arch_ids(mac=
hine),
                                 pcms->boot_cpus, pcms->apic_id_limit);
=20
     rom_set_fw(fw_cfg);
--=20
2.20.1


