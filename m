Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE7F482C11
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Jan 2022 17:26:10 +0100 (CET)
Received: from localhost ([::1]:34454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n43gO-0004Y3-H7
	for lists+qemu-devel@lfdr.de; Sun, 02 Jan 2022 11:26:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad.schwarz@siemens.com>)
 id 1n43PM-00070M-R3
 for qemu-devel@nongnu.org; Sun, 02 Jan 2022 11:08:32 -0500
Received: from thoth.sbs.de ([192.35.17.2]:49056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad.schwarz@siemens.com>)
 id 1n43PK-0004Dq-Md
 for qemu-devel@nongnu.org; Sun, 02 Jan 2022 11:08:32 -0500
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
 by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 202G8Sct013940
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 2 Jan 2022 17:08:28 +0100
Received: from fedora.vmnet8.md1wgtfc ([144.145.220.57])
 by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 202G82UX030977;
 Sun, 2 Jan 2022 17:08:28 +0100
From: Konrad Schwarz <konrad.schwarz@siemens.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 5/5] RISC-V: Add `v' (virtualization mode) bit to the
 `priv' virtual debug register
Date: Sun,  2 Jan 2022 17:06:12 +0100
Message-Id: <77b569e2920dc9b6aeeb9df9d81023cd86027206.1641137349.git.konrad.schwarz@siemens.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1641137349.git.konrad.schwarz@siemens.com>
References: <cover.1641137349.git.konrad.schwarz@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.35.17.2;
 envelope-from=konrad.schwarz@siemens.com; helo=thoth.sbs.de
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 02 Jan 2022 11:21:56 -0500
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Konrad Schwarz <konrad.schwarz@siemens.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The RISC-V Debug Support specification suggests debuggers provide
"virtual debug registers" to show state not directly visible in the ISA,
and defines one such register, `priv', which encodes the processor's
current operating mode in the two least significant bits.

GDB represents virtual debug registers in the `org.gnu.gdb.riscv.virtual'
feature of RISC-V target descriptions.

This patch adds the `v' (hypervisor virtualization mode) bit
to `priv' as specified by section 4.9.1 of version 1.0 of the
RISC-V Debug Support specification.

Signed-off-by: Konrad Schwarz <konrad.schwarz@siemens.com>
---
 gdb-xml/riscv-32bit-virtual.xml | 30 ++++++++++++++++++++++++++++--
 gdb-xml/riscv-64bit-virtual.xml | 30 ++++++++++++++++++++++++++++--
 target/riscv/gdbstub.c          |  5 ++++-
 3 files changed, 60 insertions(+), 5 deletions(-)

diff --git a/gdb-xml/riscv-32bit-virtual.xml b/gdb-xml/riscv-32bit-virtual.xml
index 905f1c555d..7dad42cd67 100644
--- a/gdb-xml/riscv-32bit-virtual.xml
+++ b/gdb-xml/riscv-32bit-virtual.xml
@@ -5,7 +5,33 @@
      are permitted in any medium without royalty provided the copyright
      notice and this notice are preserved.  -->
 
+<!-- Copyright (c) 2021 Siemens AG, konrad.schwarz@siemens.com -->
+
 <!DOCTYPE feature SYSTEM "gdb-target.dtd">
-<feature name="org.gnu.gdb.riscv.virtual">
-  <reg name="priv" bitsize="32"/>
+
+<feature	name="org.gnu.gdb.riscv.virtual" >
+
+<enum id="priv-current_priv-type" size="4" >
+	<evalue	name="user"	value="0" />
+	<evalue	name="supervisor"	value="1" />
+	<evalue	name="machine"	value="3" />
+</enum>
+
+
+<flags id="priv-fields"	size="4" >
+	<field	name="current_priv"	start="0"	end="1"
+		type="priv-current_priv-type" />
+	<field	name="v"	start="2"	end="2" />
+</flags>
+
+
+<reg	name="priv"
+		bitsize="32"
+		regnum="69"
+		save-restore="no"
+		type="priv-fields"
+		group="gdb-virtual"
+/>
+
+
 </feature>
diff --git a/gdb-xml/riscv-64bit-virtual.xml b/gdb-xml/riscv-64bit-virtual.xml
index 62d86c237b..02c234670d 100644
--- a/gdb-xml/riscv-64bit-virtual.xml
+++ b/gdb-xml/riscv-64bit-virtual.xml
@@ -5,7 +5,33 @@
      are permitted in any medium without royalty provided the copyright
      notice and this notice are preserved.  -->
 
+<!-- Copyright (c) 2021 Siemens AG, konrad.schwarz@siemens.com -->
+
 <!DOCTYPE feature SYSTEM "gdb-target.dtd">
-<feature name="org.gnu.gdb.riscv.virtual">
-  <reg name="priv" bitsize="64"/>
+
+<feature	name="org.gnu.gdb.riscv.virtual" >
+
+<enum id="priv-current_priv-type" size="8" >
+	<evalue	name="user"	value="0" />
+	<evalue	name="supervisor"	value="1" />
+	<evalue	name="machine"	value="3" />
+</enum>
+
+
+<flags id="priv-fields"	size="8" >
+	<field	name="current_priv"	start="0"	end="1"
+		type="priv-current_priv-type" />
+	<field	name="v"	start="2"	end="2" />
+</flags>
+
+
+<reg	name="priv"
+		bitsize="64"
+		regnum="69"
+		save-restore="no"
+		type="priv-fields"
+		group="gdb-virtual"
+/>
+
+
 </feature>
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 9c3f68eeaf..b3fa9f864e 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -136,7 +136,10 @@ static int riscv_gdb_get_virtual(CPURISCVState *cs, GByteArray *buf, int n)
 #ifdef CONFIG_USER_ONLY
         return gdb_get_regl(buf, 0);
 #else
-        return gdb_get_regl(buf, cs->priv);
+	RISCVCPU *const cpu = RISCV_CPU(cs);
+	CPURISCVState *const env = &cpu->env;
+        return gdb_get_regl(buf, riscv_cpu_virt_enabled(env) << 2 | cs->priv);
+		/* per RISCV Debug Spec 1.0, 4.9.1 */
 #endif
     }
     return 0;
-- 
Konrad Schwarz


