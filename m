Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 822DB37A58D
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 13:17:06 +0200 (CEST)
Received: from localhost ([::1]:48266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgQNt-0006tk-E8
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 07:17:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPY9-0004Zq-Kr
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:23:38 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:41098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPY7-0006V6-5n
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:23:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620728614; x=1652264614;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HhXS6Fd5kQIv7sJJfl/l66LLxPEJxvVRkO3qUYKWd2Q=;
 b=dCnkVQ9oBWFI5rxxMmDHOQU8RHRNYBC+APkqenxofTnHkJdSE+dpAtfq
 gnkxcxtZa5JZ4BJKhsX4jmBB9Sn2OSj9VwpBUEwteqskOsBIvDm/S6asY
 3vceN9ksRiKvviMsareCkUvWeHiVZLhaWxVh3t3QVkNywg4d6d4kyOut9
 YS6AqtYRSukMihcZFn1akTFRy06E8KsjtFHaqcgXkY160oW048DEGiCCV
 iUTU2dEr2m18DZKbr44QcOiZcGUiEMvfQFAuYPElYsyq2OGF4BCFeknqm
 NJsnsR2TeQjOfu8JcSHLDyyKJ6lvMYXRteajJAbB+BkafN4CLiN4iBHH+ w==;
IronPort-SDR: 6mLGUSuzrLKX8oeQqDRRLhyvh4m82Ti5FBa4nO93yL98m2RO2OwZmtCJhNHAw7jgD3wsVxfnH/
 R3OdPglP/CF5oxRx7NtwYtYutR+02lfzqDQWv4ovD5ZDibW7ZfC8IV+ab6tK/NzO+8Ra74/CcD
 HteyDP4Dbx5kcXIZAh42wEFv8TOdWoHE78bobewXEaIaCGoBCC44ooPnVRy9uYGfyF6wPTe7Rq
 HUBOyFbMkGKTnufrjKN3n/34RQPNEsVB9ZFAGZBQLjq7o0zo9D5ySj3P856A/vskE95lfU7AJP
 ccI=
X-IronPort-AV: E=Sophos;i="5.82,290,1613404800"; d="scan'208";a="167735522"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 May 2021 18:22:15 +0800
IronPort-SDR: DDvoQdtIWpWSsheCPzhrFQMo2cinm3Xo8NddllGog9SkYAiq8y+vOVYhMw7ocpJjSJVR6LCk8a
 wy5lr+JDrOvehSTBM9goAf+OyL4isfyINDqCE4CiP1to9EFYX6Gn5A8b6tMiYk0BcaL7BIeBOJ
 nXvvIgH55IY8Uj3YXTuCzbRSCVlvUXstLW2refp9zgEE79z3eb4LnJEXpn505m1/rfVG3ogX82
 ngIStUaYJC+QRTucp+R8uVWm4HqbD8nthXc30LVOQsVwhTQ/SNWEZYeUCNA1qGCddUxczwyhAG
 6FEFAnxr9J3Pb5bQRitn+jfE
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 03:02:15 -0700
IronPort-SDR: txN3JFAwqfpYShDNVsz53c/Uk48Dj9IqU7+9Id6K3hmQfqcRF74zb1KBcQ/WjuLhVCREXDNTuD
 8o0Cic1UedINxSIHD8wcKs98TbvuPxvyc2LvYICu4lxbpO+mAi4ZuKdfjk1KURFyDQG1mFEaLD
 lwD2uv/1pgmkZvtpUbUeqjIXLaFRkYCURTm3A1Hd1E3hQRXiK/nAVPRFXMeapiiH/KQ2GYgc/N
 iwGq3qV2qQen1cMxitsZmqq8j/6aFRkQ60BMrvGFvJUM0FhtW0ry1eUaBwzFSingtxjWAgLzsT
 kxI=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.48])
 by uls-op-cesaip01.wdc.com with ESMTP; 11 May 2021 03:22:14 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v3 41/42] target/riscv: Consolidate RV32/64 16-bit instructions
Date: Tue, 11 May 2021 20:19:50 +1000
Message-Id: <20210511101951.165287-42-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511101951.165287-1-alistair.francis@wdc.com>
References: <20210511101951.165287-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=7584e029c=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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


