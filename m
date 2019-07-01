Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EDB2914B
	for <lists+qemu-devel@lfdr.de>; Fri, 24 May 2019 08:51:18 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49911 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hU42v-0005qU-JY
	for lists+qemu-devel@lfdr.de; Fri, 24 May 2019 02:51:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40768)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hU3pT-0003H6-Lg
	for qemu-devel@nongnu.org; Fri, 24 May 2019 02:37:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hU3pS-0003Cd-Po
	for qemu-devel@nongnu.org; Fri, 24 May 2019 02:37:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34312)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hU3pS-0003CI-IX
	for qemu-devel@nongnu.org; Fri, 24 May 2019 02:37:22 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D614E3082E1E;
	Fri, 24 May 2019 06:37:21 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-235.brq.redhat.com [10.40.204.235])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 89BDE5B689;
	Fri, 24 May 2019 06:37:15 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 24 May 2019 08:35:43 +0200
Message-Id: <20190524063553.5339-11-philmd@redhat.com>
In-Reply-To: <20190524063553.5339-1-philmd@redhat.com>
References: <20190524063553.5339-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Fri, 24 May 2019 06:37:21 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 10/20] hw/i386/pc: Pass the boot_cpus value by
 argument
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
Cc: Yang Zhong <yang.zhong@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Rob Bradford <robert.bradford@intel.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Samuel Ortiz <sameo@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The boot_cpus is used once. Pass it by argument, this will
allow us to remove the PCMachineState argument later.

Suggested-by: Samuel Ortiz <sameo@linux.intel.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/i386/pc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 264074489b..01894b9875 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -928,7 +928,7 @@ static void pc_build_smbios(PCMachineState *pcms)
     }
 }
=20
-static FWCfgState *x86_create_fw_cfg(PCMachineState *pcms)
+static FWCfgState *x86_create_fw_cfg(PCMachineState *pcms, uint16_t boot=
_cpus)
 {
     FWCfgState *fw_cfg;
     uint64_t *numa_fw_cfg;
@@ -938,7 +938,7 @@ static FWCfgState *x86_create_fw_cfg(PCMachineState *=
pcms)
=20
     fw_cfg =3D fw_cfg_init_io_dma(FW_CFG_IO_BASE, FW_CFG_IO_BASE + 4,
                                 &address_space_memory);
-    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, pcms->boot_cpus);
+    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, boot_cpus);
=20
     /* FW_CFG_MAX_CPUS is a bit confusing/problematic on x86:
      *
@@ -1762,7 +1762,7 @@ void pc_memory_init(PCMachineState *pcms,
                                         option_rom_mr,
                                         1);
=20
-    fw_cfg =3D x86_create_fw_cfg(pcms);
+    fw_cfg =3D x86_create_fw_cfg(pcms, pcms->boot_cpus);
=20
     rom_set_fw(fw_cfg);
=20
--=20
2.20.1


