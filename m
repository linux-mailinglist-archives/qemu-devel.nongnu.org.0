Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6847E37235F
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 01:02:36 +0200 (CEST)
Received: from localhost ([::1]:55886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldhaF-00050q-Em
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 19:02:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgsA-0007An-RL
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:17:03 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:28402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgs3-0000ID-F1
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:17:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620080215; x=1651616215;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HhXS6Fd5kQIv7sJJfl/l66LLxPEJxvVRkO3qUYKWd2Q=;
 b=ZoIbN7M688fy2no3mV3GnY9UFIdoIYPnkyoFFFYIADoV9PghDpOfhkdV
 1yxRNVGc0TppoFg6lfj6O/ShG9lRpTdiCm/JtzEXwkzyoZix8omRPTx1d
 HwJgGBTHQ+FLO0MhDltMjIAHq/gKk/O1UfceMTxwGnoSYEel1WppSd1y7
 ODiioCEp/h3Eb4vooxdqkP361qn2tnXfeJPcURQiPz+Tdu28YsteF3945
 Bd3HcMzrDh2xmzWf8GM/CSX74Nki0vwDXWpxOi2keSNeVozbpkGviHon1
 l2FRAymZlr9NJY1geEdR9gW5GK6ZRWKxA+nK9E0OsRPTQ36ilXiMehSeU w==;
IronPort-SDR: TBssoAw3TKd+uIsdj3TWsto4magXE5Jv1/L05lekmLz/H7gxGbGPooQCftSzcVvW+i6tRqpHv3
 s+3SichqedUE0H8aHFjDhkNd1SOFjDtybV9z4il0Ds3oiEZGK9XE4sHr8+mFuxPvQGKx7xy5yW
 7IVI16UDQ+/FC2X00K4r2uGnCmjZo1aVocXl8kC5h/OZUM9QO1lL74uy0NJrTdE65at23TDQ3S
 tVbdRsXEbxDqyDmj9DE6ZZBZGchpV5KB1eboMx33J282L1ferLTYNX8H+SWEZ8ItW2kahylamA
 b08=
X-IronPort-AV: E=Sophos;i="5.82,271,1613404800"; d="scan'208";a="278114719"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 May 2021 06:15:55 +0800
IronPort-SDR: iI6YZrsdHUaIOFMY1ZaIfzTHVrAQ6QdEzZHEVs/paLFsN9RQAahGQMIfBrgj6i30u+zOzcMnss
 A/gSCpORK30eW7t+vgdsfI7MZqrwcWL0U9hjk7+1aOLGLfkEAUoWBqWxHcoUh/AF++6LgYAOcI
 XPH7bnvd6xnaRE7JGwARQ8aDcHO0HN3yQZ9wbjbleK2csFaaS3ZqlyJC+lm29IUBlK/OBgoOJt
 W8F1lpsl8sWCcA4+/H78EzyMwb0X2ij6PZgIFiV4sLo6OHG9ib4dFZtA3LQLVCpz3nnEV8/Iq5
 tGr9U2v1CNhnug1JgE8CdPJn
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 14:56:06 -0700
IronPort-SDR: sMjtuveRguAzm76zSwHQ9qX97+ywbLWf9a7FaY4akSmlTZEo9rj6JiVrqXxAB411j2q7XnOsPU
 Da1AmsNGvaarTNe76uS4/Q//ZRKX49hOhwGzK3fdFYXev6J6v6KI/1uJdcCDJt9Gl5deFCgyaf
 VxGZxfHh1PCYLPhg1faMQe7ymQW1OTNoNHXltVZqwqxKM+ehAeTZA1T+p5L13dGI4EArJRq4pJ
 Oq0LNj1nmtvvwACW9Zxsa8Wmj+CGxku6OjhDXhkK8n+jkG7GmV2uQDosRhYvcrNCjzA2TWHwZN
 FYg=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.45])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 May 2021 15:15:53 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 41/42] target/riscv: Consolidate RV32/64 16-bit instructions
Date: Tue,  4 May 2021 08:13:26 +1000
Message-Id: <20210503221327.3068768-42-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503221327.3068768-1-alistair.francis@wdc.com>
References: <20210503221327.3068768-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=750139ea6=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch removes the insn16-32.decode and insn16-64.decode decode
files and consolidates the instructions into the general RISC-V
insn16.decode decode tree.

This means that all of the instructions are avaliable in both the 32-bit
and 64-bit builds. This also means that we run a check to ensure we are
running a 64-bit softmmu before we execute the 64-bit only instructions.
This allows us to include the 32-bit instructions in the 64-bit build,
while also ensuring that 32-bit only software can not execute the
instructions.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 01e2b0efeae311adc7ebf133c2cde6a7a37224d7.1619234854.git.alistair.francis@wdc.com
---
 target/riscv/insn16-32.decode           | 28 -------------------
 target/riscv/insn16-64.decode           | 36 -------------------------
 target/riscv/insn16.decode              | 30 +++++++++++++++++++++
 target/riscv/insn_trans/trans_rvi.c.inc |  6 +++++
 target/riscv/meson.build                | 11 +++-----
 5 files changed, 39 insertions(+), 72 deletions(-)
 delete mode 100644 target/riscv/insn16-32.decode
 delete mode 100644 target/riscv/insn16-64.decode

diff --git a/target/riscv/insn16-32.decode b/target/riscv/insn16-32.decode
deleted file mode 100644
index 0819b17028..0000000000
--- a/target/riscv/insn16-32.decode
+++ /dev/null
@@ -1,28 +0,0 @@
-#
-# RISC-V translation routines for the RVXI Base Integer Instruction Set.
-#
-# Copyright (c) 2018 Peer Adelt, peer.adelt@hni.uni-paderborn.de
-#                    Bastian Koppelmann, kbastian@mail.uni-paderborn.de
-#
-# This program is free software; you can redistribute it and/or modify it
-# under the terms and conditions of the GNU General Public License,
-# version 2 or later, as published by the Free Software Foundation.
-#
-# This program is distributed in the hope it will be useful, but WITHOUT
-# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-# more details.
-#
-# You should have received a copy of the GNU General Public License along with
-# this program.  If not, see <http://www.gnu.org/licenses/>.
-
-# *** RV32C Standard Extension (Quadrant 0) ***
-flw               011  ... ... .. ... 00 @cl_w
-fsw               111  ... ... .. ... 00 @cs_w
-
-# *** RV32C Standard Extension (Quadrant 1) ***
-jal               001     ........... 01 @cj    rd=1  # C.JAL
-
-# *** RV32C Standard Extension (Quadrant 2) ***
-flw               011 .  .....  ..... 10 @c_lwsp
-fsw               111 .  .....  ..... 10 @c_swsp
diff --git a/target/riscv/insn16-64.decode b/target/riscv/insn16-64.decode
deleted file mode 100644
index 672e1e916f..0000000000
--- a/target/riscv/insn16-64.decode
+++ /dev/null
@@ -1,36 +0,0 @@
-#
-# RISC-V translation routines for the RVXI Base Integer Instruction Set.
-#
-# Copyright (c) 2018 Peer Adelt, peer.adelt@hni.uni-paderborn.de
-#                    Bastian Koppelmann, kbastian@mail.uni-paderborn.de
-#
-# This program is free software; you can redistribute it and/or modify it
-# under the terms and conditions of the GNU General Public License,
-# version 2 or later, as published by the Free Software Foundation.
-#
-# This program is distributed in the hope it will be useful, but WITHOUT
-# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-# more details.
-#
-# You should have received a copy of the GNU General Public License along with
-# this program.  If not, see <http://www.gnu.org/licenses/>.
-
-# *** RV64C Standard Extension (Quadrant 0) ***
-ld                011  ... ... .. ... 00 @cl_d
-sd                111  ... ... .. ... 00 @cs_d
-
-# *** RV64C Standard Extension (Quadrant 1) ***
-{
-  illegal         001 -  00000  ----- 01 # c.addiw, RES rd=0
-  addiw           001 .  .....  ..... 01 @ci
-}
-subw              100 1 11 ... 00 ... 01 @cs_2
-addw              100 1 11 ... 01 ... 01 @cs_2
-
-# *** RV64C Standard Extension (Quadrant 2) ***
-{
-  illegal         011 -  00000  ----- 10 # c.ldsp, RES rd=0
-  ld              011 .  .....  ..... 10 @c_ldsp
-}
-sd                111 .  .....  ..... 10 @c_sdsp
diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
index 1cb93876fe..2e9212663c 100644
--- a/target/riscv/insn16.decode
+++ b/target/riscv/insn16.decode
@@ -92,6 +92,16 @@ lw                010  ... ... .. ... 00 @cl_w
 fsd               101  ... ... .. ... 00 @cs_d
 sw                110  ... ... .. ... 00 @cs_w
 
+# *** RV32C and RV64C specific Standard Extension (Quadrant 0) ***
+{
+  ld              011  ... ... .. ... 00 @cl_d
+  flw             011  ... ... .. ... 00 @cl_w
+}
+{
+  sd              111  ... ... .. ... 00 @cs_d
+  fsw             111  ... ... .. ... 00 @cs_w
+}
+
 # *** RV32/64C Standard Extension (Quadrant 1) ***
 addi              000 .  .....  ..... 01 @ci
 addi              010 .  .....  ..... 01 @c_li
@@ -111,6 +121,15 @@ jal               101     ........... 01 @cj    rd=0  # C.J
 beq               110  ... ...  ..... 01 @cb_z
 bne               111  ... ...  ..... 01 @cb_z
 
+# *** RV64C and RV32C specific Standard Extension (Quadrant 1) ***
+{
+  c64_illegal     001 -  00000  ----- 01 # c.addiw, RES rd=0
+  addiw           001 .  .....  ..... 01 @ci
+  jal             001     ........... 01 @cj    rd=1  # C.JAL
+}
+subw              100 1 11 ... 00 ... 01 @cs_2
+addw              100 1 11 ... 01 ... 01 @cs_2
+
 # *** RV32/64C Standard Extension (Quadrant 2) ***
 slli              000 .  .....  ..... 10 @c_shift2
 fld               001 .  .....  ..... 10 @c_ldsp
@@ -130,3 +149,14 @@ fld               001 .  .....  ..... 10 @c_ldsp
 }
 fsd               101   ......  ..... 10 @c_sdsp
 sw                110 .  .....  ..... 10 @c_swsp
+
+# *** RV32C and RV64C specific Standard Extension (Quadrant 2) ***
+{
+  c64_illegal     011 -  00000  ----- 10 # c.ldsp, RES rd=0
+  ld              011 .  .....  ..... 10 @c_ldsp
+  flw             011 .  .....  ..... 10 @c_lwsp
+}
+{
+  sd              111 .  .....  ..... 10 @c_sdsp
+  fsw             111 .  .....  ..... 10 @c_swsp
+}
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index 1340676209..bd93f634cf 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -24,6 +24,12 @@ static bool trans_illegal(DisasContext *ctx, arg_empty *a)
     return true;
 }
 
+static bool trans_c64_illegal(DisasContext *ctx, arg_empty *a)
+{
+     REQUIRE_64BIT(ctx);
+     return trans_illegal(ctx, a);
+}
+
 static bool trans_lui(DisasContext *ctx, arg_lui *a)
 {
     if (a->rd != 0) {
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index 24bf049164..af6c3416b7 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -1,18 +1,13 @@
 # FIXME extra_args should accept files()
 dir = meson.current_source_dir()
-gen32 = [
-  decodetree.process('insn16.decode', extra_args: [dir / 'insn16-32.decode', '--static-decode=decode_insn16', '--insnwidth=16']),
-  decodetree.process('insn32.decode', extra_args: '--static-decode=decode_insn32'),
-]
 
-gen64 = [
-  decodetree.process('insn16.decode', extra_args: [dir / 'insn16-64.decode', '--static-decode=decode_insn16', '--insnwidth=16']),
+gen = [
+  decodetree.process('insn16.decode', extra_args: ['--static-decode=decode_insn16', '--insnwidth=16']),
   decodetree.process('insn32.decode', extra_args: '--static-decode=decode_insn32'),
 ]
 
 riscv_ss = ss.source_set()
-riscv_ss.add(when: 'TARGET_RISCV32', if_true: gen32)
-riscv_ss.add(when: 'TARGET_RISCV64', if_true: gen64)
+riscv_ss.add(gen)
 riscv_ss.add(files(
   'cpu.c',
   'cpu_helper.c',
-- 
2.31.1


