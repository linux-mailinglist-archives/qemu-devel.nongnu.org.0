Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4144DCEFDB
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Oct 2019 02:18:17 +0200 (CEST)
Received: from localhost ([::1]:50240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHdCh-0004Mv-R1
	for lists+qemu-devel@lfdr.de; Mon, 07 Oct 2019 20:18:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37151)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounce+cf442f.9b4e76-qemu-devel=nongnu.org@fintelia.io>)
 id 1iHd92-0002Uv-5u
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 20:14:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounce+cf442f.9b4e76-qemu-devel=nongnu.org@fintelia.io>)
 id 1iHd91-0005LL-1N
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 20:14:28 -0400
Received: from rs224.mailgun.us ([209.61.151.224]:46215)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71)
 (envelope-from <bounce+cf442f.9b4e76-qemu-devel=nongnu.org@fintelia.io>)
 id 1iHd90-0005Jn-Ge
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 20:14:26 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=fintelia.io; q=dns/txt;
 s=pic; 
 t=1570493666; h=Content-Transfer-Encoding: MIME-Version: References:
 In-Reply-To: Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=gUUopECUHc7cg4bXJNiFx5+MQFSc9HWlEgYorCg8juM=;
 b=Lh8WarIsK7LNDa0ABiFNj9TPgclGttGYh1CiEJRaBTDkQo9RK6N4ESpudydvq1+TR/o/cHaR
 ZNVM8oWQ/docunS9N3ESvBFm7OUuPZmvOa1zHuM2u30tQ4gnf5eUHnVizruqj6mtRFAfJQc+
 5DYZMczNFfy3eQj/cDwVg2b/zhsY4MCL25HKSUCKldvcEdi3xCW0Erka5XoHsoNmD9kdD+OF
 NA6YmYV2YTm6jXimjcF3qHbUj4ZshfL8D7AgQTP9hqfmpG5iDOPW0d8AaOjs8+kmJ9PivwPH
 wSu8jWh38D+CWEl1laPNW3t/AILtSiO6QiFIRyiBMSqPBe0AR9Xc8w==
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyJlMGM5NSIsICJxZW11LWRldmVsQG5vbmdudS5vcmciLCAiOWI0ZTc2Il0=
Received: from jonathan-ThinkPad-X1-Carbon.pdos.lcs.mit.edu
 (26-5-211.dynamic.csail.mit.edu [18.26.5.211])
 by mxa.mailgun.org with ESMTP id 5d9bd4de.7f51c380ba28-smtp-out-n01;
 Tue, 08 Oct 2019 00:14:22 -0000 (UTC)
From: Jonathan Behrens <jonathan@fintelia.io>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v3 1/3] target/riscv: Tell gdbstub the correct number of CSRs
Date: Mon,  7 Oct 2019 20:13:16 -0400
Message-Id: <20191008001318.219367-2-jonathan@fintelia.io>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191008001318.219367-1-jonathan@fintelia.io>
References: <20191008001318.219367-1-jonathan@fintelia.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.61.151.224
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
Cc: Jonathan Behrens <jonathan@fintelia.io>, Palmer Dabbelt <palmer@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the number of registers reported to the gdbstub code does not match the
number in the associated XML file, then the register numbers used by the stub
may get out of sync with a remote GDB instance.

Signed-off-by: Jonathan Behrens <jonathan@fintelia.io>
---
 target/riscv/gdbstub.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index ded140e8d8..cb5bfd3d50 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -384,7 +384,7 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
     }
 
     gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
-                             4096, "riscv-32bit-csr.xml", 0);
+                             240, "riscv-32bit-csr.xml", 0);
 #elif defined(TARGET_RISCV64)
     if (env->misa & RVF) {
         gdb_register_coprocessor(cs, riscv_gdb_get_fpu, riscv_gdb_set_fpu,
@@ -392,6 +392,6 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
     }
 
     gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
-                             4096, "riscv-64bit-csr.xml", 0);
+                             240, "riscv-64bit-csr.xml", 0);
 #endif
 }
-- 
2.23.0

