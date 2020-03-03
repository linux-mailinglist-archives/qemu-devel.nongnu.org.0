Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6026D176962
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Mar 2020 01:43:32 +0100 (CET)
Received: from localhost ([::1]:40222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8vel-0007Oh-1C
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 19:43:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44190)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jiaxun.yang@flygoat.com>) id 1j8vdr-0006xU-F9
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 19:42:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jiaxun.yang@flygoat.com>) id 1j8vdq-0002dQ-9T
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 19:42:35 -0500
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17994)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1j8vdp-0002Zr-Hu
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 19:42:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1583196117; 
 s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
 h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
 bh=ip62UxsLoBVBHDGOYwMikMPn9kC1/8udU8YlQmWN06Y=;
 b=a9dUN8cIVHJr93jwpvRPcnrQ9cGXVEwlfXY6VfviBvYPxEyR9EzOqw6VhBQwtoM1
 BNJyWC8ocuhwrNFSKLvf8XbR4u5BLjVwJr+HLcDQg6Isx8DOi86ghyUJhdldDZsFFv1
 QGgB2WA9t91tcKLDuVyvaibMXdKAqKAO7O5nz0x4=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by
 mx.zoho.com.cn with SMTPS id 1583196112368648.408430311324;
 Tue, 3 Mar 2020 08:41:52 +0800 (CST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Message-ID: <20200303004137.1099502-1-jiaxun.yang@flygoat.com>
Subject: [PATCH v1] mips/mips_malta: Allow more than 2G RAM
Date: Tue,  3 Mar 2020 08:41:37 +0800
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200228032613.1049955-1-jiaxun.yang@flygoat.com>
References: <20200228032613.1049955-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Content-Type: text/plain; charset=utf8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 124.251.121.243
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
Cc: imammedo@redhat.com, philmd@redhat.com,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, amarkovic@wavecomp.com,
 Yunqiang Su <ysu@wavecomp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When malta is coupled with MIPS64 cpu which have 64bit
address space, it is possible to have more than 2G RAM.

So we removed ram_size check and overwrite memory
layout for these targets.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Suggested-by: Yunqiang Su <ysu@wavecomp.com>
--
v1: Do not overwrite cmdline when we don't have highmem.
---
 hw/mips/mips_malta.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
index 6e7ba9235d..4267958f35 100644
--- a/hw/mips/mips_malta.c
+++ b/hw/mips/mips_malta.c
@@ -98,7 +98,8 @@ typedef struct {
 } MaltaState;
=20
 static struct _loaderparams {
-    int ram_size, ram_low_size;
+    unsigned int ram_low_size;
+    ram_addr_t ram_size;
     const char *kernel_filename;
     const char *kernel_cmdline;
     const char *initrd_filename;
@@ -1023,6 +1024,7 @@ static int64_t load_kernel(void)
 {
     int64_t kernel_entry, kernel_high, initrd_size;
     long kernel_size;
+    char mem_cmdline[128];
     ram_addr_t initrd_offset;
     int big_endian;
     uint32_t *prom_buf;
@@ -1099,20 +1101,33 @@ static int64_t load_kernel(void)
     prom_buf =3D g_malloc(prom_size);
=20
     prom_set(prom_buf, prom_index++, "%s", loaderparams.kernel_filename);
+
+    memset(&mem_cmdline[0], 0, sizeof(mem_cmdline));
+    if (loaderparams.ram_size > 0x10000000) {
+        /*
+         * Always use cmdline to overwrite mem layout
+         * as kernel may reject large emesize.
+         */
+        sprintf(&mem_cmdline[0],
+                "mem=3D0x10000000@0x00000000 mem=3D0x%" PRIx64 "@0x9000000=
0",
+                loaderparams.ram_size - 0x10000000);
+    }
+
     if (initrd_size > 0) {
         prom_set(prom_buf, prom_index++,
-                 "rd_start=3D0x%" PRIx64 " rd_size=3D%" PRId64 " %s",
-                 xlate_to_kseg0(NULL, initrd_offset),
+                 "%s rd_start=3D0x%" PRIx64 " rd_size=3D%" PRId64 " %s",
+                 &mem_cmdline[0], xlate_to_kseg0(NULL, initrd_offset),
                  initrd_size, loaderparams.kernel_cmdline);
     } else {
-        prom_set(prom_buf, prom_index++, "%s", loaderparams.kernel_cmdline=
);
+        prom_set(prom_buf, prom_index++, "%s %s", &mem_cmdline[0],
+                 loaderparams.kernel_cmdline);
     }
=20
     prom_set(prom_buf, prom_index++, "memsize");
     prom_set(prom_buf, prom_index++, "%u", loaderparams.ram_low_size);
=20
     prom_set(prom_buf, prom_index++, "ememsize");
-    prom_set(prom_buf, prom_index++, "%u", loaderparams.ram_size);
+    prom_set(prom_buf, prom_index++, "%lu", loaderparams.ram_size);
=20
     prom_set(prom_buf, prom_index++, "modetty0");
     prom_set(prom_buf, prom_index++, "38400n8r");
@@ -1253,12 +1268,14 @@ void mips_malta_init(MachineState *machine)
     /* create CPU */
     mips_create_cpu(machine, s, &cbus_irq, &i8259_irq);
=20
-    /* allocate RAM */
+#ifdef TARGET_MIPS32
+    /* MIPS32 won't accept more than 2GiB RAM due to limited address space=
 */
     if (ram_size > 2 * GiB) {
         error_report("Too much memory for this machine: %" PRId64 "MB,"
                      " maximum 2048MB", ram_size / MiB);
         exit(1);
     }
+#endif
=20
     /* register RAM at high address where it is undisturbed by IO */
     memory_region_add_subregion(system_memory, 0x80000000, machine->ram);
--=20
2.25.1



