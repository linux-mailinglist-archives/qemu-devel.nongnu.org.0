Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1521C4CDFC
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jun 2019 14:49:10 +0200 (CEST)
Received: from localhost ([::1]:47430 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdwV3-00075D-Ac
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 08:49:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34998)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hdw54-0004It-38
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 08:22:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hdw4z-0007cP-Kz
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 08:22:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48924)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hdw4i-0007AQ-Nm; Thu, 20 Jun 2019 08:21:58 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 551777FDF4;
 Thu, 20 Jun 2019 12:21:48 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-106.brq.redhat.com [10.40.204.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 62FB35D9C6;
 Thu, 20 Jun 2019 12:21:45 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Laszlo Ersek <lersek@redhat.com>
Date: Thu, 20 Jun 2019 14:21:31 +0200
Message-Id: <20190620122132.10075-3-philmd@redhat.com>
In-Reply-To: <20190620122132.10075-1-philmd@redhat.com>
References: <20190620122132.10075-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Thu, 20 Jun 2019 12:21:48 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v5 2/3] hw/i386: Use
 edk2_add_host_crypto_policy()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Enable the EDK2 Crypto Policy features on the PC machine.

Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/i386/pc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 2c5446b095..fe99ebfe3d 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -39,6 +39,7 @@
 #include "hw/nvram/fw_cfg.h"
 #include "hw/timer/hpet.h"
 #include "hw/firmware/smbios.h"
+#include "hw/firmware/uefi_edk2.h"
 #include "hw/loader.h"
 #include "elf.h"
 #include "multiboot.h"
@@ -1049,6 +1050,11 @@ static FWCfgState *bochs_bios_init(AddressSpace *a=
s, PCMachineState *pcms)
     return fw_cfg;
 }
=20
+static void pc_uefi_setup(PCMachineState *pcms)
+{
+    edk2_add_host_crypto_policy(pcms->fw_cfg);
+}
+
 static long get_file_size(FILE *f)
 {
     long where, size;
@@ -1653,6 +1659,7 @@ void pc_machine_done(Notifier *notifier, void *data=
)
     if (pcms->fw_cfg) {
         pc_build_smbios(pcms);
         pc_build_feature_control_file(pcms);
+        pc_uefi_setup(pcms);
         /* update FW_CFG_NB_CPUS to account for -device added CPUs */
         fw_cfg_modify_i16(pcms->fw_cfg, FW_CFG_NB_CPUS, pcms->boot_cpus)=
;
     }
--=20
2.20.1


