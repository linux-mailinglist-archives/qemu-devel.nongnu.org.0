Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A0391A21
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 00:57:43 +0200 (CEST)
Received: from localhost ([::1]:43399 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzU7J-0002dY-VS
	for lists+qemu-devel@lfdr.de; Sun, 18 Aug 2019 18:57:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48481)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1hzU4u-0000je-Dw
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 18:55:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hzU4t-0008BH-Ak
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 18:55:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34300)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hzU4t-00087M-5H
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 18:55:11 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 01DA631752BA;
 Sun, 18 Aug 2019 22:55:10 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-33.brq.redhat.com [10.40.204.33])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BFC21C1;
 Sun, 18 Aug 2019 22:54:55 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 00:54:04 +0200
Message-Id: <20190818225414.22590-6-philmd@redhat.com>
In-Reply-To: <20190818225414.22590-1-philmd@redhat.com>
References: <20190818225414.22590-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Sun, 18 Aug 2019 22:55:10 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v4 05/15] hw/i386/pc: Pass the boot_cpus value
 by argument
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
Cc: Yang Zhong <yang.zhong@intel.com>, Samuel Ortiz <sameo@linux.intel.com>,
 Rob Bradford <robert.bradford@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 kvm@vger.kernel.org, Christophe de Dinechin <dinechin@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The boot_cpus is used once. Pass it by argument, this will
allow us to remove the PCMachineState argument later.

Suggested-by: Samuel Ortiz <sameo@linux.intel.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/i386/pc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 6cb39883e8..4963551ee8 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -933,7 +933,8 @@ static void pc_build_smbios(PCMachineState *pcms)
     }
 }
=20
-static FWCfgState *fw_cfg_arch_create(PCMachineState *pcms)
+static FWCfgState *fw_cfg_arch_create(PCMachineState *pcms,
+                                      uint16_t boot_cpus)
 {
     FWCfgState *fw_cfg;
     uint64_t *numa_fw_cfg;
@@ -943,7 +944,7 @@ static FWCfgState *fw_cfg_arch_create(PCMachineState =
*pcms)
=20
     fw_cfg =3D fw_cfg_init_io_dma(FW_CFG_IO_BASE, FW_CFG_IO_BASE + 4,
                                 &address_space_memory);
-    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, pcms->boot_cpus);
+    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, boot_cpus);
=20
     /* FW_CFG_MAX_CPUS is a bit confusing/problematic on x86:
      *
@@ -1854,7 +1855,7 @@ void pc_memory_init(PCMachineState *pcms,
                                         option_rom_mr,
                                         1);
=20
-    fw_cfg =3D fw_cfg_arch_create(pcms);
+    fw_cfg =3D fw_cfg_arch_create(pcms, pcms->boot_cpus);
=20
     rom_set_fw(fw_cfg);
=20
--=20
2.20.1


