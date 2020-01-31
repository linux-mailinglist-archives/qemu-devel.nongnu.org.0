Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE4D14E651
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 01:06:09 +0100 (CET)
Received: from localhost ([::1]:41236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixJp2-0000wf-7e
	for lists+qemu-devel@lfdr.de; Thu, 30 Jan 2020 19:06:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58582)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1ixJnd-0007R3-1w
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 19:04:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1ixJnb-0002sS-5Y
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 19:04:40 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:51002 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1ixJna-0002r8-QD
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 19:04:39 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 5B61A1A1E86;
 Fri, 31 Jan 2020 01:03:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 2C2551A1E1C;
 Fri, 31 Jan 2020 01:03:37 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH rc4 07/29] target/avr: Add instruction helpers
Date: Fri, 31 Jan 2020 01:02:51 +0100
Message-Id: <1580428993-4767-8-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580428993-4767-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1580428993-4767-1-git-send-email-aleksandar.markovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 89.216.37.149
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Michael Rolnik <mrolnik@gmail.com>

Add helpers for instructions that need to interact with QEMU. Also,
add stubs for unimplemented instructions. Instructions SPM and WDR
are left unimplemented because they require emulation of complex
peripherals. The implementation of instruction SLEEP is very limited
due to the lack of peripherals to generate wake interrupts. Memory
access instructions are implemented here because some address ranges
actually refer to CPU registers.

Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
---
 target/avr/helper.c | 203 ++++++++++++++++++++++++++++++++++++++++++++++=
++++++
 target/avr/helper.h |  29 ++++++++
 2 files changed, 232 insertions(+)
 create mode 100644 target/avr/helper.h

diff --git a/target/avr/helper.c b/target/avr/helper.c
index 354def2..c582312 100644
--- a/target/avr/helper.c
+++ b/target/avr/helper.c
@@ -137,3 +137,206 @@ bool avr_cpu_tlb_fill(CPUState *cs, vaddr address, =
int size,
=20
     return true;
 }
+
+/*
+ *  helpers
+ */
+
+void helper_sleep(CPUAVRState *env)
+{
+    CPUState *cs =3D env_cpu(env);
+
+    cs->exception_index =3D EXCP_HLT;
+    cpu_loop_exit(cs);
+}
+
+void helper_unsupported(CPUAVRState *env)
+{
+    CPUState *cs =3D env_cpu(env);
+
+    /*
+     *  I count not find what happens on the real platform, so
+     *  it's EXCP_DEBUG for meanwhile
+     */
+    cs->exception_index =3D EXCP_DEBUG;
+    if (qemu_loglevel_mask(LOG_UNIMP)) {
+        qemu_log("UNSUPPORTED\n");
+        cpu_dump_state(cs, stderr, 0);
+    }
+    cpu_loop_exit(cs);
+}
+
+void helper_debug(CPUAVRState *env)
+{
+    CPUState *cs =3D env_cpu(env);
+
+    cs->exception_index =3D EXCP_DEBUG;
+    cpu_loop_exit(cs);
+}
+
+void helper_break(CPUAVRState *env)
+{
+    CPUState *cs =3D env_cpu(env);
+
+    cs->exception_index =3D EXCP_DEBUG;
+    cpu_loop_exit(cs);
+}
+
+void helper_wdr(CPUAVRState *env)
+{
+    CPUState *cs =3D env_cpu(env);
+
+    /* WD is not implemented yet, placeholder */
+    cs->exception_index =3D EXCP_DEBUG;
+    cpu_loop_exit(cs);
+}
+
+/*
+ * This function implements IN instruction
+ *
+ * It does the following
+ * a.  if an IO register belongs to CPU, its value is read and returned
+ * b.  otherwise io address is translated to mem address and physical me=
mory
+ *     is read.
+ * c.  it caches the value for sake of SBI, SBIC, SBIS & CBI implementat=
ion
+ *
+ */
+target_ulong helper_inb(CPUAVRState *env, uint32_t port)
+{
+    target_ulong data =3D 0;
+
+    switch (port) {
+    case 0x38: /* RAMPD */
+        data =3D 0xff & (env->rampD >> 16);
+        break;
+    case 0x39: /* RAMPX */
+        data =3D 0xff & (env->rampX >> 16);
+        break;
+    case 0x3a: /* RAMPY */
+        data =3D 0xff & (env->rampY >> 16);
+        break;
+    case 0x3b: /* RAMPZ */
+        data =3D 0xff & (env->rampZ >> 16);
+        break;
+    case 0x3c: /* EIND */
+        data =3D 0xff & (env->eind >> 16);
+        break;
+    case 0x3d: /* SPL */
+        data =3D env->sp & 0x00ff;
+        break;
+    case 0x3e: /* SPH */
+        data =3D env->sp >> 8;
+        break;
+    case 0x3f: /* SREG */
+        data =3D cpu_get_sreg(env);
+        break;
+    default:
+        /* not a special register, pass to normal memory access */
+        cpu_physical_memory_read(OFFSET_IO_REGISTERS + port, &data, 1);
+    }
+
+    return data;
+}
+
+/*
+ *  This function implements OUT instruction
+ *
+ *  It does the following
+ *  a.  if an IO register belongs to CPU, its value is written into the =
register
+ *  b.  otherwise io address is translated to mem address and physical m=
emory
+ *      is written.
+ *  c.  it caches the value for sake of SBI, SBIC, SBIS & CBI implementa=
tion
+ *
+ */
+void helper_outb(CPUAVRState *env, uint32_t port, uint32_t data)
+{
+    data &=3D 0x000000ff;
+
+    switch (port) {
+    case 0x38: /* RAMPD */
+        if (avr_feature(env, AVR_FEATURE_RAMPD)) {
+            env->rampD =3D (data & 0xff) << 16;
+        }
+        break;
+    case 0x39: /* RAMPX */
+        if (avr_feature(env, AVR_FEATURE_RAMPX)) {
+            env->rampX =3D (data & 0xff) << 16;
+        }
+        break;
+    case 0x3a: /* RAMPY */
+        if (avr_feature(env, AVR_FEATURE_RAMPY)) {
+            env->rampY =3D (data & 0xff) << 16;
+        }
+        break;
+    case 0x3b: /* RAMPZ */
+        if (avr_feature(env, AVR_FEATURE_RAMPZ)) {
+            env->rampZ =3D (data & 0xff) << 16;
+        }
+        break;
+    case 0x3c: /* EIDN */
+        env->eind =3D (data & 0xff) << 16;
+        break;
+    case 0x3d: /* SPL */
+        env->sp =3D (env->sp & 0xff00) | (data);
+        break;
+    case 0x3e: /* SPH */
+        if (avr_feature(env, AVR_FEATURE_2_BYTE_SP)) {
+            env->sp =3D (env->sp & 0x00ff) | (data << 8);
+        }
+        break;
+    case 0x3f: /* SREG */
+        cpu_set_sreg(env, data);
+        break;
+    default:
+        /* not a special register, pass to normal memory access */
+        cpu_physical_memory_write(OFFSET_IO_REGISTERS + port, &data, 1);
+    }
+}
+
+/*
+ *  this function implements LD instruction when there is a posibility t=
o read
+ *  from a CPU register
+ */
+target_ulong helper_fullrd(CPUAVRState *env, uint32_t addr)
+{
+    uint8_t data;
+
+    env->fullacc =3D false;
+
+    if (addr < NUMBER_OF_CPU_REGISTERS) {
+        /* CPU registers */
+        data =3D env->r[addr];
+    } else if (addr < NUMBER_OF_CPU_REGISTERS + NUMBER_OF_IO_REGISTERS) =
{
+        /* IO registers */
+        data =3D helper_inb(env, addr - NUMBER_OF_CPU_REGISTERS);
+    } else {
+        /* memory */
+        cpu_physical_memory_read(OFFSET_DATA + addr, &data, 1);
+    }
+    return data;
+}
+
+/*
+ *  this function implements ST instruction when there is a posibility t=
o write
+ *  into a CPU register
+ */
+void helper_fullwr(CPUAVRState *env, uint32_t data, uint32_t addr)
+{
+    env->fullacc =3D false;
+
+    /* Following logic assumes this: */
+    assert(OFFSET_CPU_REGISTERS =3D=3D OFFSET_DATA);
+    assert(OFFSET_IO_REGISTERS =3D=3D OFFSET_CPU_REGISTERS +
+            NUMBER_OF_CPU_REGISTERS);
+
+    if (addr < NUMBER_OF_CPU_REGISTERS) {
+        /* CPU registers */
+        env->r[addr] =3D data;
+    } else if (addr < NUMBER_OF_CPU_REGISTERS + NUMBER_OF_IO_REGISTERS) =
{
+        /* IO registers */
+        helper_outb(env, addr - NUMBER_OF_CPU_REGISTERS, data);
+    } else {
+        /* memory */
+        cpu_physical_memory_write(OFFSET_DATA + addr, &data, 1);
+    }
+}
diff --git a/target/avr/helper.h b/target/avr/helper.h
new file mode 100644
index 0000000..bf08750
--- /dev/null
+++ b/target/avr/helper.h
@@ -0,0 +1,29 @@
+/*
+ * QEMU AVR CPU
+ *
+ * Copyright (c) 2019 Michael Rolnik
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see
+ * <http://www.gnu.org/licenses/lgpl-2.1.html>
+ */
+
+DEF_HELPER_1(wdr, void, env)
+DEF_HELPER_1(debug, void, env)
+DEF_HELPER_1(break, void, env)
+DEF_HELPER_1(sleep, void, env)
+DEF_HELPER_1(unsupported, void, env)
+DEF_HELPER_3(outb, void, env, i32, i32)
+DEF_HELPER_2(inb, tl, env, i32)
+DEF_HELPER_3(fullwr, void, env, i32, i32)
+DEF_HELPER_2(fullrd, tl, env, i32)
--=20
2.7.4


