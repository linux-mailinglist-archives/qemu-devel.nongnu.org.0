Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90463142EAC
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 16:21:26 +0100 (CET)
Received: from localhost ([::1]:38584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itYrl-0001hE-L7
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 10:21:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48811)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1itYpw-0000YJ-Cp
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 10:19:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1itYpt-0002dw-SI
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 10:19:32 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:42346
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1itYpt-0002dp-Oj
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 10:19:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579533569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aqtedyLBefzKHaFVNFS+YqIyxoMfosQAGZwopz8z0EU=;
 b=Jd+6Fdxi/jd7Nv07rqMPFey+fqp60yGCY6w2LYINMpHCBWl+jFwdf3hGtni469OyDx4yIG
 Ljn0SVVJ8qhCgtc7sTWMyVPTHvNdT0WCCSn+bumt+RTRzjYZP3C+9R/aPh9kjFxwcLcsFz
 ihfLMy63xGbNAvEGre9bayu/cEopUso=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-PPzyLN8-O7mjhtSB_LBKUA-1; Mon, 20 Jan 2020 10:19:26 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBA9C14E5;
 Mon, 20 Jan 2020 15:19:24 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A6CF2860DA;
 Mon, 20 Jan 2020 15:19:23 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 65/84] ppc/{ppc440_bamboo, sam460ex}: use memdev for RAM
Date: Mon, 20 Jan 2020 16:17:04 +0100
Message-Id: <1579533424-177690-1-git-send-email-imammedo@redhat.com>
In-Reply-To: <alpine.BSF.2.21.99999.352.2001152233540.24151@zero.eik.bme.hu>
References: <alpine.BSF.2.21.99999.352.2001152233540.24151@zero.eik.bme.hu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: PPzyLN8-O7mjhtSB_LBKUA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
Cc: david@gibson.dropbear.id.au, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

memory_region_allocate_system_memory() API is going away, so
replace it with memdev allocated MemoryRegion. The later is
initialized by generic code, so board only needs to opt in
to memdev scheme by providing
  MachineClass::default_ram_id
and using MachineState::ram instead of manually initializing
RAM memory region.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
v3:
  * drop ram_size from comment above ppc4xx_sdram_banks
     (BALATON Zoltan <balaton@eik.bme.hu>)
  * move memory alias initialization into the same loop
    where RAM is split on banks.
     (BALATON Zoltan <balaton@eik.bme.hu>)

CC: balaton@eik.bme.hu
CC: david@gibson.dropbear.id.au
CC: qemu-ppc@nongnu.org
---
 include/hw/ppc/ppc4xx.h |  2 +-
 hw/ppc/ppc440_bamboo.c  |  3 ++-
 hw/ppc/ppc4xx_devs.c    | 26 ++++++++++----------------
 hw/ppc/sam460ex.c       |  3 ++-
 4 files changed, 15 insertions(+), 19 deletions(-)

diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
index b8c8f32..cc19c8d 100644
--- a/include/hw/ppc/ppc4xx.h
+++ b/include/hw/ppc/ppc4xx.h
@@ -42,7 +42,7 @@ enum {
 qemu_irq *ppcuic_init (CPUPPCState *env, qemu_irq *irqs,
                        uint32_t dcr_base, int has_ssr, int has_vr);
=20
-void ppc4xx_sdram_banks(ram_addr_t ram_size, int nr_banks,
+void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
                         MemoryRegion ram_memories[],
                         hwaddr ram_bases[], hwaddr ram_sizes[],
                         const ram_addr_t sdram_bank_sizes[]);
diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index 577f7c2..1d4a11d 100644
--- a/hw/ppc/ppc440_bamboo.c
+++ b/hw/ppc/ppc440_bamboo.c
@@ -202,7 +202,7 @@ static void bamboo_init(MachineState *machine)
     /* SDRAM controller */
     memset(ram_bases, 0, sizeof(ram_bases));
     memset(ram_sizes, 0, sizeof(ram_sizes));
-    ppc4xx_sdram_banks(ram_size, PPC440EP_SDRAM_NR_BANKS, ram_memories,
+    ppc4xx_sdram_banks(machine->ram, PPC440EP_SDRAM_NR_BANKS, ram_memories=
,
                        ram_bases, ram_sizes, ppc440ep_sdram_bank_sizes);
     /* XXX 440EP's ECC interrupts are on UIC1, but we've only created UIC0=
. */
     ppc4xx_sdram_init(env, pic[14], PPC440EP_SDRAM_NR_BANKS, ram_memories,
@@ -289,6 +289,7 @@ static void bamboo_machine_init(MachineClass *mc)
     mc->desc =3D "bamboo";
     mc->init =3D bamboo_init;
     mc->default_cpu_type =3D POWERPC_CPU_TYPE_NAME("440epb");
+    mc->default_ram_id =3D "ppc4xx.sdram";
 }
=20
 DEFINE_MACHINE("bamboo", bamboo_machine_init)
diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index de2c87b..c0ddaa2 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -666,23 +666,21 @@ void ppc4xx_sdram_init (CPUPPCState *env, qemu_irq ir=
q, int nbanks,
         sdram_map_bcr(sdram);
 }
=20
-/* Fill in consecutive SDRAM banks with 'ram_size' bytes of memory.
+/* Split RAM between SDRAM banks.
  *
  * sdram_bank_sizes[] must be 0-terminated.
  *
  * The 4xx SDRAM controller supports a small number of banks, and each ban=
k
  * must be one of a small set of sizes. The number of banks and the suppor=
ted
  * sizes varies by SoC. */
-void ppc4xx_sdram_banks(ram_addr_t ram_size, int nr_banks,
+void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
                         MemoryRegion ram_memories[],
                         hwaddr ram_bases[], hwaddr ram_sizes[],
                         const ram_addr_t sdram_bank_sizes[])
 {
-    MemoryRegion *ram =3D g_malloc0(sizeof(*ram));
-    ram_addr_t size_left =3D ram_size;
+    ram_addr_t size_left =3D memory_region_size(ram);
     ram_addr_t base =3D 0;
     ram_addr_t bank_size;
-    int last_bank =3D 0;
     int i;
     int j;
=20
@@ -690,11 +688,16 @@ void ppc4xx_sdram_banks(ram_addr_t ram_size, int nr_b=
anks,
         for (j =3D 0; sdram_bank_sizes[j] !=3D 0; j++) {
             bank_size =3D sdram_bank_sizes[j];
             if (bank_size <=3D size_left) {
+                char name[32];
+
                 ram_bases[i] =3D base;
                 ram_sizes[i] =3D bank_size;
                 base +=3D bank_size;
                 size_left -=3D bank_size;
-                last_bank =3D i;
+
+                snprintf(name, sizeof(name), "ppc4xx.sdram%d", i);
+                memory_region_init_alias(&ram_memories[i], NULL, name, ram=
,
+                                         ram_bases[i], ram_sizes[i]);
             }
         }
         if (!size_left) {
@@ -704,7 +707,7 @@ void ppc4xx_sdram_banks(ram_addr_t ram_size, int nr_ban=
ks,
     }
=20
     if (size_left) {
-        ram_addr_t used_size =3D ram_size - size_left;
+        ram_addr_t used_size =3D memory_region_size(ram) - size_left;
         GString *s =3D g_string_new(NULL);
=20
         for (i =3D 0; sdram_bank_sizes[i]; i++) {
@@ -720,15 +723,6 @@ void ppc4xx_sdram_banks(ram_addr_t ram_size, int nr_ba=
nks,
         g_string_free(s, true);
         exit(EXIT_FAILURE);
     }
-
-    memory_region_allocate_system_memory(ram, NULL, "ppc4xx.sdram", ram_si=
ze);
-
-    for (i =3D 0; i <=3D last_bank; i++) {
-        char name[32];
-        snprintf(name, sizeof(name), "ppc4xx.sdram%d", i);
-        memory_region_init_alias(&ram_memories[i], NULL, name, ram,
-                                 ram_bases[i], ram_sizes[i]);
-    }
 }
=20
 /*************************************************************************=
****/
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 949acba..b48aea5 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -324,7 +324,7 @@ static void sam460ex_init(MachineState *machine)
     /* SDRAM controller */
     /* put all RAM on first bank because board has one slot
      * and firmware only checks that */
-    ppc4xx_sdram_banks(machine->ram_size, 1, ram_memories, ram_bases, ram_=
sizes,
+    ppc4xx_sdram_banks(machine->ram, 1, ram_memories, ram_bases, ram_sizes=
,
                        ppc460ex_sdram_bank_sizes);
=20
     /* FIXME: does 460EX have ECC interrupts? */
@@ -483,6 +483,7 @@ static void sam460ex_machine_init(MachineClass *mc)
     mc->init =3D sam460ex_init;
     mc->default_cpu_type =3D POWERPC_CPU_TYPE_NAME("460exb");
     mc->default_ram_size =3D 512 * MiB;
+    mc->default_ram_id =3D "ppc4xx.sdram";
 }
=20
 DEFINE_MACHINE("sam460ex", sam460ex_machine_init)
--=20
2.7.4


