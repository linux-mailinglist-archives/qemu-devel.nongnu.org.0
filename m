Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC0D132A5C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 16:46:49 +0100 (CET)
Received: from localhost ([::1]:51828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ior4C-00082m-Eo
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 10:46:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57749)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1ioqVR-0001Xo-5p
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 10:10:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1ioqVP-0006lo-R6
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 10:10:53 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:37714
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ioqVP-0006ka-DG
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 10:10:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578409849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=itN2B1dUGWlA9+XbspC50tVMkwPylcwF4oYhuobuPyE=;
 b=Q/bm+61o7nK4TsdfGxcri4TMNoREdYj8dD4pg3oSa3b7OA0KDVqGkQ1xYcj6gN9n3i7UeH
 8lsFOd15W4Oe+ORLSDqH7HA8COWKCLsooZPF11WLOzYmKHMOENvMh3jzImT9fslKGty/qG
 wYQ0M2gajCUG2Pg3g9Fu6PhZiYdAAnw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-1u5feQARNk-9WA3FztAT4g-1; Tue, 07 Jan 2020 10:10:48 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F236A477;
 Tue,  7 Jan 2020 15:10:46 +0000 (UTC)
Received: from localhost (ovpn-112-42.ams2.redhat.com [10.36.112.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 40B425C1BB;
 Tue,  7 Jan 2020 15:10:39 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 30/37] cris: improve passing PIC interrupt vector to the CPU
Date: Tue,  7 Jan 2020 19:04:35 +0400
Message-Id: <20200107150442.1727958-31-marcandre.lureau@redhat.com>
In-Reply-To: <20200107150442.1727958-1-marcandre.lureau@redhat.com>
References: <20200107150442.1727958-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: 1u5feQARNk-9WA3FztAT4g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of accessing cpu interrupt vector directly from PIC, send the
vector value over the qemu_irq.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/cris/cpu.h     |  1 +
 hw/cris/axis_dev88.c  |  4 ----
 hw/intc/etraxfs_pic.c | 26 +-------------------------
 target/cris/cpu.c     |  8 ++++++++
 4 files changed, 10 insertions(+), 29 deletions(-)

diff --git a/target/cris/cpu.h b/target/cris/cpu.h
index aba0a66474..a7c2a8e15b 100644
--- a/target/cris/cpu.h
+++ b/target/cris/cpu.h
@@ -34,6 +34,7 @@
 #define CPU_INTERRUPT_NMI       CPU_INTERRUPT_TGT_EXT_3
=20
 /* CRUS CPU device objects interrupt lines.  */
+/* PIC passes the vector for the IRQ as the value of it sends over qemu_ir=
q */
 #define CRIS_CPU_IRQ 0
 #define CRIS_CPU_NMI 1
=20
diff --git a/hw/cris/axis_dev88.c b/hw/cris/axis_dev88.c
index 940c7dd122..be7760476a 100644
--- a/hw/cris/axis_dev88.c
+++ b/hw/cris/axis_dev88.c
@@ -253,7 +253,6 @@ void axisdev88_init(MachineState *machine)
     const char *kernel_filename =3D machine->kernel_filename;
     const char *kernel_cmdline =3D machine->kernel_cmdline;
     CRISCPU *cpu;
-    CPUCRISState *env;
     DeviceState *dev;
     SysBusDevice *s;
     DriveInfo *nand;
@@ -267,7 +266,6 @@ void axisdev88_init(MachineState *machine)
=20
     /* init CPUs */
     cpu =3D CRIS_CPU(cpu_create(machine->cpu_type));
-    env =3D &cpu->env;
=20
     /* allocate RAM */
     memory_region_allocate_system_memory(phys_ram, NULL, "axisdev88.ram",
@@ -297,8 +295,6 @@ void axisdev88_init(MachineState *machine)
=20
=20
     dev =3D qdev_create(NULL, "etraxfs,pic");
-    /* FIXME: Is there a proper way to signal vectors to the CPU core?  */
-    qdev_prop_set_ptr(dev, "interrupt_vector", &env->interrupt_vector);
     qdev_init_nofail(dev);
     s =3D SYS_BUS_DEVICE(dev);
     sysbus_mmio_map(s, 0, 0x3001c000);
diff --git a/hw/intc/etraxfs_pic.c b/hw/intc/etraxfs_pic.c
index 77f652acec..12988c7aa9 100644
--- a/hw/intc/etraxfs_pic.c
+++ b/hw/intc/etraxfs_pic.c
@@ -27,8 +27,6 @@
 #include "qemu/module.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
-//#include "pc.h"
-//#include "etraxfs.h"
=20
 #define D(x)
=20
@@ -48,7 +46,6 @@ struct etrax_pic
     SysBusDevice parent_obj;
=20
     MemoryRegion mmio;
-    void *interrupt_vector;
     qemu_irq parent_irq;
     qemu_irq parent_nmi;
     uint32_t regs[R_MAX];
@@ -79,11 +76,7 @@ static void pic_update(struct etrax_pic *fs)
         }
     }
=20
-    if (fs->interrupt_vector) {
-        /* hack alert: ptr property */
-        *(uint32_t*)(fs->interrupt_vector) =3D vector;
-    }
-    qemu_set_irq(fs->parent_irq, !!vector);
+    qemu_set_irq(fs->parent_irq, vector);
 }
=20
 static uint64_t
@@ -163,28 +156,11 @@ static void etraxfs_pic_init(Object *obj)
     sysbus_init_mmio(sbd, &s->mmio);
 }
=20
-static Property etraxfs_pic_properties[] =3D {
-    DEFINE_PROP_PTR("interrupt_vector", struct etrax_pic, interrupt_vector=
),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
-static void etraxfs_pic_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc =3D DEVICE_CLASS(klass);
-
-    dc->props =3D etraxfs_pic_properties;
-    /*
-     * Note: pointer property "interrupt_vector" may remain null, thus
-     * no need for dc->user_creatable =3D false;
-     */
-}
-
 static const TypeInfo etraxfs_pic_info =3D {
     .name          =3D TYPE_ETRAX_FS_PIC,
     .parent        =3D TYPE_SYS_BUS_DEVICE,
     .instance_size =3D sizeof(struct etrax_pic),
     .instance_init =3D etraxfs_pic_init,
-    .class_init    =3D etraxfs_pic_class_init,
 };
=20
 static void etraxfs_pic_register_types(void)
diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index 7adfd6caf4..6a857f548d 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -147,6 +147,14 @@ static void cris_cpu_set_irq(void *opaque, int irq, in=
t level)
     CPUState *cs =3D CPU(cpu);
     int type =3D irq =3D=3D CRIS_CPU_IRQ ? CPU_INTERRUPT_HARD : CPU_INTERR=
UPT_NMI;
=20
+    if (irq =3D=3D CRIS_CPU_IRQ) {
+        /*
+         * The PIC passes us the vector for the IRQ as the value it sends
+         * over the qemu_irq line
+         */
+        cpu->env.interrupt_vector =3D level;
+    }
+
     if (level) {
         cpu_interrupt(cs, type);
     } else {
--=20
2.25.0.rc1.20.g2443f3f80d


