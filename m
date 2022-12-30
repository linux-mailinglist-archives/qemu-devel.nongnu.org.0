Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB120658AD8
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 10:20:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAp4R-0008IV-Ms; Thu, 29 Dec 2022 04:19:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pAp48-0008DO-Ra; Thu, 29 Dec 2022 04:19:23 -0500
Received: from bg4.exmail.qq.com ([43.154.221.58])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pAp45-0007JQ-W7; Thu, 29 Dec 2022 04:19:08 -0500
X-QQ-mid: bizesmtp73t1672305525tcylom69
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 29 Dec 2022 17:18:44 +0800 (CST)
X-QQ-SSF: 01200000000000C0C000000A0000000
X-QQ-FEAT: CEO3k+BsRkIUTIdrlAT6OPv1RgIyx58loMp3YkLNUviITnG+Ai43UJ0aLY3if
 8cut+qvcfVgH5uuRv6C3IImvxg4O5UAizXYhv3lP5f11AYw/FX65bAfBu7SmpNQArthxEG4
 kj3YTTVkle+ytaLWvSYpbYfkuI7I0q0sihWs9USRT96jT6tgDa7XG5cM2MVoguD+5CHmRxU
 BiCn1/t9ogUx5HMHbye6JlK5peM+BM1s4pZ5CnP8tPe83DbVfoXYj9TGjvxdbeOAQLqbOX/
 1j6dvAubLE+KQfgajjbaLCDnp7HqaSvFBatuvo8DOn8ZgSfMZ5RXUXTOSRzZORsbHKhFWat
 0cg45abqG9Cbuls67Y2v//NM2W9Em+vWW3IBkeN5gGVYxXTgmI=
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: Alistair Francis <Alistair.Francis@wdc.com>,
	qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v2 05/12] hw/char: riscv_htif: Move registers from
 CPUArchState to HTIFState
Date: Thu, 29 Dec 2022 17:18:21 +0800
Message-Id: <20221229091828.1945072-6-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221229091828.1945072-1-bmeng@tinylab.org>
References: <20221229091828.1945072-1-bmeng@tinylab.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
Received-SPF: pass client-ip=43.154.221.58; envelope-from=bmeng@tinylab.org;
 helo=bg4.exmail.qq.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

At present for some unknown reason the HTIF registers (fromhost &
tohost) are defined in the RISC-V CPUArchState. It should really
be put in the HTIFState struct as it is only meaningful to HTIF.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v1)

 include/hw/char/riscv_htif.h |  8 ++++----
 target/riscv/cpu.h           |  4 ----
 hw/char/riscv_htif.c         | 35 +++++++++++++++++------------------
 hw/riscv/spike.c             |  3 +--
 target/riscv/machine.c       |  6 ++----
 5 files changed, 24 insertions(+), 32 deletions(-)

diff --git a/include/hw/char/riscv_htif.h b/include/hw/char/riscv_htif.h
index 6d172ebd6d..55cc352331 100644
--- a/include/hw/char/riscv_htif.h
+++ b/include/hw/char/riscv_htif.h
@@ -23,7 +23,6 @@
 #include "chardev/char.h"
 #include "chardev/char-fe.h"
 #include "exec/memory.h"
-#include "target/riscv/cpu.h"
 
 #define TYPE_HTIF_UART "riscv.htif.uart"
 
@@ -31,11 +30,12 @@ typedef struct HTIFState {
     int allow_tohost;
     int fromhost_inprogress;
 
+    uint64_t tohost;
+    uint64_t fromhost;
     hwaddr tohost_offset;
     hwaddr fromhost_offset;
     MemoryRegion mmio;
 
-    CPURISCVState *env;
     CharBackend chr;
     uint64_t pending_read;
 } HTIFState;
@@ -51,7 +51,7 @@ void htif_symbol_callback(const char *st_name, int st_info, uint64_t st_value,
 bool htif_uses_elf_symbols(void);
 
 /* legacy pre qom */
-HTIFState *htif_mm_init(MemoryRegion *address_space, CPURISCVState *env,
-                        Chardev *chr, uint64_t nonelf_base);
+HTIFState *htif_mm_init(MemoryRegion *address_space, Chardev *chr,
+                        uint64_t nonelf_base);
 
 #endif
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 443d15a47c..6f04d853dd 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -309,10 +309,6 @@ struct CPUArchState {
     target_ulong sscratch;
     target_ulong mscratch;
 
-    /* temporary htif regs */
-    uint64_t mfromhost;
-    uint64_t mtohost;
-
     /* Sstc CSRs */
     uint64_t stimecmp;
 
diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
index f28976b110..3bb0a37a3e 100644
--- a/hw/char/riscv_htif.c
+++ b/hw/char/riscv_htif.c
@@ -100,7 +100,7 @@ static void htif_recv(void *opaque, const uint8_t *buf, int size)
     uint64_t val_written = s->pending_read;
     uint64_t resp = 0x100 | *buf;
 
-    s->env->mfromhost = (val_written >> 48 << 48) | (resp << 16 >> 16);
+    s->fromhost = (val_written >> 48 << 48) | (resp << 16 >> 16);
 }
 
 /*
@@ -175,7 +175,7 @@ static void htif_handle_tohost_write(HTIFState *s, uint64_t val_written)
         if (cmd == HTIF_CONSOLE_CMD_GETC) {
             /* this should be a queue, but not yet implemented as such */
             s->pending_read = val_written;
-            s->env->mtohost = 0; /* clear to indicate we read */
+            s->tohost = 0; /* clear to indicate we read */
             return;
         } else if (cmd == HTIF_CONSOLE_CMD_PUTC) {
             qemu_chr_fe_write(&s->chr, (uint8_t *)&payload, 1);
@@ -195,11 +195,11 @@ static void htif_handle_tohost_write(HTIFState *s, uint64_t val_written)
      * HTIF needs protocol documentation and a more complete state machine.
      *
      *  while (!s->fromhost_inprogress &&
-     *      s->env->mfromhost != 0x0) {
+     *      s->fromhost != 0x0) {
      *  }
      */
-    s->env->mfromhost = (val_written >> 48 << 48) | (resp << 16 >> 16);
-    s->env->mtohost = 0; /* clear to indicate we read */
+    s->fromhost = (val_written >> 48 << 48) | (resp << 16 >> 16);
+    s->tohost = 0; /* clear to indicate we read */
 }
 
 #define TOHOST_OFFSET1      (s->tohost_offset)
@@ -212,13 +212,13 @@ static uint64_t htif_mm_read(void *opaque, hwaddr addr, unsigned size)
 {
     HTIFState *s = opaque;
     if (addr == TOHOST_OFFSET1) {
-        return s->env->mtohost & 0xFFFFFFFF;
+        return s->tohost & 0xFFFFFFFF;
     } else if (addr == TOHOST_OFFSET2) {
-        return (s->env->mtohost >> 32) & 0xFFFFFFFF;
+        return (s->tohost >> 32) & 0xFFFFFFFF;
     } else if (addr == FROMHOST_OFFSET1) {
-        return s->env->mfromhost & 0xFFFFFFFF;
+        return s->fromhost & 0xFFFFFFFF;
     } else if (addr == FROMHOST_OFFSET2) {
-        return (s->env->mfromhost >> 32) & 0xFFFFFFFF;
+        return (s->fromhost >> 32) & 0xFFFFFFFF;
     } else {
         qemu_log("Invalid htif read: address %016" PRIx64 "\n",
             (uint64_t)addr);
@@ -232,22 +232,22 @@ static void htif_mm_write(void *opaque, hwaddr addr,
 {
     HTIFState *s = opaque;
     if (addr == TOHOST_OFFSET1) {
-        if (s->env->mtohost == 0x0) {
+        if (s->tohost == 0x0) {
             s->allow_tohost = 1;
-            s->env->mtohost = value & 0xFFFFFFFF;
+            s->tohost = value & 0xFFFFFFFF;
         } else {
             s->allow_tohost = 0;
         }
     } else if (addr == TOHOST_OFFSET2) {
         if (s->allow_tohost) {
-            s->env->mtohost |= value << 32;
-            htif_handle_tohost_write(s, s->env->mtohost);
+            s->tohost |= value << 32;
+            htif_handle_tohost_write(s, s->tohost);
         }
     } else if (addr == FROMHOST_OFFSET1) {
         s->fromhost_inprogress = 1;
-        s->env->mfromhost = value & 0xFFFFFFFF;
+        s->fromhost = value & 0xFFFFFFFF;
     } else if (addr == FROMHOST_OFFSET2) {
-        s->env->mfromhost |= value << 32;
+        s->fromhost |= value << 32;
         s->fromhost_inprogress = 0;
     } else {
         qemu_log("Invalid htif write: address %016" PRIx64 "\n",
@@ -265,8 +265,8 @@ bool htif_uses_elf_symbols(void)
     return (address_symbol_set == 3) ? true : false;
 }
 
-HTIFState *htif_mm_init(MemoryRegion *address_space, CPURISCVState *env,
-                        Chardev *chr, uint64_t nonelf_base)
+HTIFState *htif_mm_init(MemoryRegion *address_space, Chardev *chr,
+                        uint64_t nonelf_base)
 {
     uint64_t base, size, tohost_offset, fromhost_offset;
 
@@ -281,7 +281,6 @@ HTIFState *htif_mm_init(MemoryRegion *address_space, CPURISCVState *env,
     fromhost_offset = fromhost_addr - base;
 
     HTIFState *s = g_new0(HTIFState, 1);
-    s->env = env;
     s->tohost_offset = tohost_offset;
     s->fromhost_offset = fromhost_offset;
     s->pending_read = 0;
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 82cf41ac27..8606331f61 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -317,8 +317,7 @@ static void spike_board_init(MachineState *machine)
                               fdt_load_addr);
 
     /* initialize HTIF using symbols found in load_kernel */
-    htif_mm_init(system_memory, &s->soc[0].harts[0].env,
-                 serial_hd(0), memmap[SPIKE_HTIF].base);
+    htif_mm_init(system_memory, serial_hd(0), memmap[SPIKE_HTIF].base);
 }
 
 static void spike_machine_instance_init(Object *obj)
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index c2a94a82b3..2e8beef06e 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -298,8 +298,8 @@ static const VMStateDescription vmstate_pmu_ctr_state = {
 
 const VMStateDescription vmstate_riscv_cpu = {
     .name = "cpu",
-    .version_id = 5,
-    .minimum_version_id = 5,
+    .version_id = 6,
+    .minimum_version_id = 6,
     .post_load = riscv_cpu_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
@@ -349,8 +349,6 @@ const VMStateDescription vmstate_riscv_cpu = {
         VMSTATE_UINTTL_ARRAY(env.mhpmeventh_val, RISCVCPU, RV_MAX_MHPMEVENTS),
         VMSTATE_UINTTL(env.sscratch, RISCVCPU),
         VMSTATE_UINTTL(env.mscratch, RISCVCPU),
-        VMSTATE_UINT64(env.mfromhost, RISCVCPU),
-        VMSTATE_UINT64(env.mtohost, RISCVCPU),
         VMSTATE_UINT64(env.stimecmp, RISCVCPU),
 
         VMSTATE_END_OF_LIST()
-- 
2.34.1


