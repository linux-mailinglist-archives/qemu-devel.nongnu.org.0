Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 632CD1B46A6
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Apr 2020 15:52:49 +0200 (CEST)
Received: from localhost ([::1]:51138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRFo0-0005zC-ED
	for lists+qemu-devel@lfdr.de; Wed, 22 Apr 2020 09:52:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39492)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jRFjl-0000Ad-TU
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 09:48:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jRFjj-0008E1-O9
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 09:48:25 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:34390
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jRFjj-0008A7-7l
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 09:48:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587563302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d7TJzgKj/BU5th/onq2uYSXeTrVpdBFq0vVLEz28oKM=;
 b=EFWQgZCxk0sw7bAr13RuVlXVGiljdK3l4BmN2Y7NbOG3xnWqxy+lNWIo3aEBVT4+xU6Qt8
 vvBXPq7uBOAfbr5+2kLp3Yc4z0VIVMbYqxAtT3LJO8Rf/it/TH3lriBEfeOi/ubIQvmyT6
 2sYMgcuJlwu9wXb7bBdkB/OT/a8q2CI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-KN4QXt0PNSS4jyZaSiZDhQ-1; Wed, 22 Apr 2020 09:48:19 -0400
X-MC-Unique: KN4QXt0PNSS4jyZaSiZDhQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1C2D8017F3;
 Wed, 22 Apr 2020 13:48:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 59792272CC;
 Wed, 22 Apr 2020 13:48:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D4DA811358BE; Wed, 22 Apr 2020 15:48:15 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/4] smbus: Fix spd_data_generate() error API violation
Date: Wed, 22 Apr 2020 15:48:13 +0200
Message-Id: <20200422134815.1584-3-armbru@redhat.com>
In-Reply-To: <20200422134815.1584-1-armbru@redhat.com>
References: <20200422134815.1584-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/22 02:12:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: philmd@redhat.com, David Gibson <david@gibson.dropbear.id.au>,
 qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Error ** argument must be NULL, &error_abort, &error_fatal, or a
pointer to a variable containing NULL.  Passing an argument of the
latter kind twice without clearing it in between is wrong: if the
first call sets an error, it no longer points to NULL for the second
call.

spd_data_generate() can pass @errp to error_setg() more than once when
it adjusts both memory size and type.  Harmless, because no caller
passes anything that needs adjusting.  Until the previous commit,
sam460ex passed types that needed adjusting, but not sizes.

spd_data_generate()'s contract is rather awkward:

    If everything's fine, return non-null and don't set an error.

    Else, if memory size or type need adjusting, return non-null and
    set an error describing the adjustment.

    Else, return null and set an error reporting why no data can be
    generated.

Its callers treat the error as a warning even when null is returned.
They don't create the "smbus-eeprom" device then.  Suspicious.

Since the previous commit, only "everything's fine" can actually
happen.  Drop the unused code and simplify the callers.  This gets rid
of the error API violation.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/hw/i2c/smbus_eeprom.h |  2 +-
 hw/i2c/smbus_eeprom.c         | 30 ++++--------------------------
 hw/mips/mips_fulong2e.c       | 10 ++--------
 hw/ppc/sam460ex.c             | 12 +++---------
 4 files changed, 10 insertions(+), 44 deletions(-)

diff --git a/include/hw/i2c/smbus_eeprom.h b/include/hw/i2c/smbus_eeprom.h
index 15e2151b50..68b0063ab6 100644
--- a/include/hw/i2c/smbus_eeprom.h
+++ b/include/hw/i2c/smbus_eeprom.h
@@ -31,6 +31,6 @@ void smbus_eeprom_init(I2CBus *bus, int nb_eeprom,
                        const uint8_t *eeprom_spd, int size);
=20
 enum sdram_type { SDR =3D 0x4, DDR =3D 0x7, DDR2 =3D 0x8 };
-uint8_t *spd_data_generate(enum sdram_type type, ram_addr_t size, Error **=
errp);
+uint8_t *spd_data_generate(enum sdram_type type, ram_addr_t size);
=20
 #endif
diff --git a/hw/i2c/smbus_eeprom.c b/hw/i2c/smbus_eeprom.c
index 5adf3b15b5..07fbbf87f1 100644
--- a/hw/i2c/smbus_eeprom.c
+++ b/hw/i2c/smbus_eeprom.c
@@ -195,8 +195,7 @@ void smbus_eeprom_init(I2CBus *smbus, int nb_eeprom,
 }
=20
 /* Generate SDRAM SPD EEPROM data describing a module of type and size */
-uint8_t *spd_data_generate(enum sdram_type type, ram_addr_t ram_size,
-                           Error **errp)
+uint8_t *spd_data_generate(enum sdram_type type, ram_addr_t ram_size)
 {
     uint8_t *spd;
     uint8_t nbanks;
@@ -222,29 +221,10 @@ uint8_t *spd_data_generate(enum sdram_type type, ram_=
addr_t ram_size,
         g_assert_not_reached();
     }
     size =3D ram_size >> 20; /* work in terms of megabytes */
-    if (size < 4) {
-        error_setg(errp, "SDRAM size is too small");
-        return NULL;
-    }
     sz_log2 =3D 31 - clz32(size);
     size =3D 1U << sz_log2;
-    if (ram_size > size * MiB) {
-        error_setg(errp, "SDRAM size 0x"RAM_ADDR_FMT" is not a power of 2,=
 "
-                   "truncating to %u MB", ram_size, size);
-    }
-    if (sz_log2 < min_log2) {
-        error_setg(errp,
-                   "Memory size is too small for SDRAM type, adjusting typ=
e");
-        if (size >=3D 32) {
-            type =3D DDR;
-            min_log2 =3D 5;
-            max_log2 =3D 12;
-        } else {
-            type =3D SDR;
-            min_log2 =3D 2;
-            max_log2 =3D 9;
-        }
-    }
+    assert(ram_size =3D=3D size * MiB);
+    assert(sz_log2 >=3D min_log2);
=20
     nbanks =3D 1;
     while (sz_log2 > max_log2 && nbanks < 8) {
@@ -252,9 +232,7 @@ uint8_t *spd_data_generate(enum sdram_type type, ram_ad=
dr_t ram_size,
         nbanks++;
     }
=20
-    if (size > (1ULL << sz_log2) * nbanks) {
-        error_setg(errp, "Memory size is too big for SDRAM, truncating");
-    }
+    assert(size =3D=3D (1ULL << sz_log2) * nbanks);
=20
     /* split to 2 banks if possible to avoid a bug in MIPS Malta firmware =
*/
     if (nbanks =3D=3D 1 && sz_log2 > min_log2) {
diff --git a/hw/mips/mips_fulong2e.c b/hw/mips/mips_fulong2e.c
index 5040afd581..ef02d54b33 100644
--- a/hw/mips/mips_fulong2e.c
+++ b/hw/mips/mips_fulong2e.c
@@ -297,7 +297,6 @@ static void mips_fulong2e_init(MachineState *machine)
     MemoryRegion *bios =3D g_new(MemoryRegion, 1);
     long bios_size;
     uint8_t *spd_data;
-    Error *err =3D NULL;
     int64_t kernel_entry;
     PCIBus *pci_bus;
     ISABus *isa_bus;
@@ -377,13 +376,8 @@ static void mips_fulong2e_init(MachineState *machine)
     }
=20
     /* Populate SPD eeprom data */
-    spd_data =3D spd_data_generate(DDR, machine->ram_size, &err);
-    if (err) {
-        warn_report_err(err);
-    }
-    if (spd_data) {
-        smbus_eeprom_init_one(smbus, 0x50, spd_data);
-    }
+    spd_data =3D spd_data_generate(DDR, machine->ram_size);
+    smbus_eeprom_init_one(smbus, 0x50, spd_data);
=20
     mc146818_rtc_init(isa_bus, 2000, NULL);
=20
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 1e3eaac0db..42a8c9fb7f 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -292,7 +292,6 @@ static void sam460ex_init(MachineState *machine)
     SysBusDevice *sbdev;
     struct boot_info *boot_info;
     uint8_t *spd_data;
-    Error *err =3D NULL;
     int success;
=20
     cpu =3D POWERPC_CPU(cpu_create(machine->cpu_type));
@@ -336,14 +335,9 @@ static void sam460ex_init(MachineState *machine)
     i2c =3D PPC4xx_I2C(dev)->bus;
     /* SPD EEPROM on RAM module */
     spd_data =3D spd_data_generate(ram_sizes[0] < 128 * MiB ? DDR : DDR2,
-                                 ram_sizes[0], &err);
-    if (err) {
-        warn_report_err(err);
-    }
-    if (spd_data) {
-        spd_data[20] =3D 4; /* SO-DIMM module */
-        smbus_eeprom_init_one(i2c, 0x50, spd_data);
-    }
+                                 ram_sizes[0]);
+    spd_data[20] =3D 4; /* SO-DIMM module */
+    smbus_eeprom_init_one(i2c, 0x50, spd_data);
     /* RTC */
     i2c_create_slave(i2c, "m41t80", 0x68);
=20
--=20
2.21.1


