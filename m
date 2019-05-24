Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4582915D
	for <lists+qemu-devel@lfdr.de>; Fri, 24 May 2019 08:56:42 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49984 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hU489-00011O-Sg
	for lists+qemu-devel@lfdr.de; Fri, 24 May 2019 02:56:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41056)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hU3qS-00043s-HY
	for qemu-devel@nongnu.org; Fri, 24 May 2019 02:38:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hU3qQ-0003xX-Hf
	for qemu-devel@nongnu.org; Fri, 24 May 2019 02:38:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43942)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hU3qQ-0003x8-C8
	for qemu-devel@nongnu.org; Fri, 24 May 2019 02:38:22 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A995F3079B60;
	Fri, 24 May 2019 06:38:21 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-235.brq.redhat.com [10.40.204.235])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3015A5B689;
	Fri, 24 May 2019 06:38:14 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 24 May 2019 08:35:52 +0200
Message-Id: <20190524063553.5339-20-philmd@redhat.com>
In-Reply-To: <20190524063553.5339-1-philmd@redhat.com>
References: <20190524063553.5339-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Fri, 24 May 2019 06:38:21 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 19/20] hw/i386/pc: Rename
 pc_build_feature_control() as generic fw_cfg_build_*
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

Now that the pc_build_feature_control_file() function has been
refactored to not depend of PC specific types, rename it to a
more generic name.

Suggested-by: Samuel Ortiz <sameo@linux.intel.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/i386/pc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 0ff2cea1ee..4d333aba82 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1515,8 +1515,8 @@ void pc_cpus_init(PCMachineState *pcms)
     }
 }
=20
-static void pc_build_feature_control_file(MachineState *ms,
-                                          FWCfgState *fw_cfg)
+static void fw_cfg_build_feature_control(MachineState *ms,
+                                         FWCfgState *fw_cfg)
 {
     X86CPU *cpu =3D X86_CPU(ms->possible_cpus->cpus[0].cpu);
     CPUX86State *env =3D &cpu->env;
@@ -1587,7 +1587,7 @@ void pc_machine_done(Notifier *notifier, void *data=
)
     acpi_setup();
     if (pcms->fw_cfg) {
         fw_cfg_build_smbios(MACHINE(pcms), pcms->fw_cfg);
-        pc_build_feature_control_file(MACHINE(pcms), pcms->fw_cfg);
+        fw_cfg_build_feature_control(MACHINE(pcms), pcms->fw_cfg);
         /* update FW_CFG_NB_CPUS to account for -device added CPUs */
         fw_cfg_modify_i16(pcms->fw_cfg, FW_CFG_NB_CPUS, pcms->boot_cpus)=
;
     }
--=20
2.20.1


