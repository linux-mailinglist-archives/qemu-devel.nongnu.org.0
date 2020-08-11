Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 590CF241D35
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Aug 2020 17:32:35 +0200 (CEST)
Received: from localhost ([::1]:54648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5WGP-0000ao-QD
	for lists+qemu-devel@lfdr.de; Tue, 11 Aug 2020 11:32:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1k5WEF-0007eT-3e
 for qemu-devel@nongnu.org; Tue, 11 Aug 2020 11:30:19 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:50405
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1k5WEC-0002Jl-2d
 for qemu-devel@nongnu.org; Tue, 11 Aug 2020 11:30:18 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-sU1a593qO6Cp_1SBqCErKg-1; Tue, 11 Aug 2020 11:30:10 -0400
X-MC-Unique: sU1a593qO6Cp_1SBqCErKg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E681319067E3;
 Tue, 11 Aug 2020 15:30:07 +0000 (UTC)
Received: from bahia.lan (ovpn-112-38.ams2.redhat.com [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4B9A069318;
 Tue, 11 Aug 2020 15:30:06 +0000 (UTC)
Subject: [PATCH 1/2] nvram: Add dry_run argument to
 chrp_nvram_create_system_partition()
From: Greg Kurz <groug@kaod.org>
To: Thomas Huth <thuth@redhat.com>
Date: Tue, 11 Aug 2020 17:30:05 +0200
Message-ID: <159715980541.1635409.14788051616570436860.stgit@bahia.lan>
In-Reply-To: <159715979684.1635409.14107632395902701971.stgit@bahia.lan>
References: <159715979684.1635409.14107632395902701971.stgit@bahia.lan>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.110.61; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/11 06:40:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit 55d9950aaa8e ("nvram: Introduce helper functions for CHRP
"system" and "free space" partitions") it is possible to pre-initialize
a "system" partition in the NVRAM with the data passed to all -prom-env
parameters on the QEMU command line.

Unfortunately, this doesn't take the total size of the data into account
and chrp_nvram_create_system_partition() may crash at some point if the
caller hasn't allocated enough space.

Add a dry_run argument that causes chrp_nvram_create_system_partition()
to only return the size of the partition without actually copying data
into it. This can be used by callers to allocate enough memory.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/nvram/chrp_nvram.c         |   35 +++++++++++++++++++++++------------
 hw/nvram/mac_nvram.c          |    2 +-
 hw/nvram/spapr_nvram.c        |    3 ++-
 hw/sparc/sun4m.c              |    2 +-
 hw/sparc64/sun4u.c            |    2 +-
 include/hw/nvram/chrp_nvram.h |    3 ++-
 6 files changed, 30 insertions(+), 17 deletions(-)

diff --git a/hw/nvram/chrp_nvram.c b/hw/nvram/chrp_nvram.c
index d969f267048e..548cb8b5c97a 100644
--- a/hw/nvram/chrp_nvram.c
+++ b/hw/nvram/chrp_nvram.c
@@ -24,37 +24,47 @@
 #include "hw/nvram/chrp_nvram.h"
 #include "sysemu/sysemu.h"
=20
-static int chrp_nvram_set_var(uint8_t *nvram, int addr, const char *str)
+static int chrp_nvram_set_var(uint8_t *nvram, int addr, const char *str,
+                              bool dry_run)
 {
     int len;
=20
     len =3D strlen(str) + 1;
-    memcpy(&nvram[addr], str, len);
-
+    if (!dry_run) {
+        memcpy(&nvram[addr], str, len);
+    }
     return addr + len;
 }
=20
 /**
  * Create a "system partition", used for the Open Firmware
- * environment variables.
+ * environment variables. If @dry_run is false, only returns
+ * the size of the partition but don't write the data.
  */
-int chrp_nvram_create_system_partition(uint8_t *data, int min_len)
+int chrp_nvram_create_system_partition(uint8_t *data, int min_len, bool dr=
y_run)
 {
     ChrpNvramPartHdr *part_header;
     unsigned int i;
     int end;
=20
-    part_header =3D (ChrpNvramPartHdr *)data;
-    part_header->signature =3D CHRP_NVPART_SYSTEM;
-    pstrcpy(part_header->name, sizeof(part_header->name), "system");
+    assert(data || dry_run);
+
+    if (!dry_run) {
+        part_header =3D (ChrpNvramPartHdr *)data;
+        part_header->signature =3D CHRP_NVPART_SYSTEM;
+        pstrcpy(part_header->name, sizeof(part_header->name), "system");
+    }
=20
     end =3D sizeof(ChrpNvramPartHdr);
     for (i =3D 0; i < nb_prom_envs; i++) {
-        end =3D chrp_nvram_set_var(data, end, prom_envs[i]);
+        end =3D chrp_nvram_set_var(data, end, prom_envs[i], dry_run);
     }
=20
     /* End marker */
-    data[end++] =3D '\0';
+    if (!dry_run) {
+        data[end] =3D '\0';
+    }
+    end++;
=20
     end =3D (end + 15) & ~15;
     /* XXX: OpenBIOS is not able to grow up a partition. Leave some space =
for
@@ -62,8 +72,9 @@ int chrp_nvram_create_system_partition(uint8_t *data, int=
 min_len)
     if (end < min_len) {
         end =3D min_len;
     }
-    chrp_nvram_finish_partition(part_header, end);
-
+    if (!dry_run) {
+        chrp_nvram_finish_partition(part_header, end);
+    }
     return end;
 }
=20
diff --git a/hw/nvram/mac_nvram.c b/hw/nvram/mac_nvram.c
index beec1c4e4d11..4396f893f14a 100644
--- a/hw/nvram/mac_nvram.c
+++ b/hw/nvram/mac_nvram.c
@@ -141,7 +141,7 @@ static void pmac_format_nvram_partition_of(MacIONVRAMSt=
ate *nvr, int off,
=20
     /* OpenBIOS nvram variables partition */
     sysp_end =3D chrp_nvram_create_system_partition(&nvr->data[off],
-                                                  DEF_SYSTEM_SIZE) + off;
+                                                  DEF_SYSTEM_SIZE, false) =
+ off;
=20
     /* Free space partition */
     chrp_nvram_create_free_partition(&nvr->data[sysp_end], len - sysp_end)=
;
diff --git a/hw/nvram/spapr_nvram.c b/hw/nvram/spapr_nvram.c
index 15d08281d411..992b818d34e7 100644
--- a/hw/nvram/spapr_nvram.c
+++ b/hw/nvram/spapr_nvram.c
@@ -188,7 +188,8 @@ static void spapr_nvram_realize(SpaprVioDevice *dev, Er=
ror **errp)
         }
     } else if (nb_prom_envs > 0) {
         /* Create a system partition to pass the -prom-env variables */
-        chrp_nvram_create_system_partition(nvram->buf, MIN_NVRAM_SIZE / 4)=
;
+        chrp_nvram_create_system_partition(nvram->buf, MIN_NVRAM_SIZE / 4,
+                                           false);
         chrp_nvram_create_free_partition(&nvram->buf[MIN_NVRAM_SIZE / 4],
                                          nvram->size - MIN_NVRAM_SIZE / 4)=
;
     }
diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 9be930415f8e..61804ccd4286 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -143,7 +143,7 @@ static void nvram_init(Nvram *nvram, uint8_t *macaddr,
     memset(image, '\0', sizeof(image));
=20
     /* OpenBIOS nvram variables partition */
-    sysp_end =3D chrp_nvram_create_system_partition(image, 0);
+    sysp_end =3D chrp_nvram_create_system_partition(image, 0, false);
=20
     /* Free space partition */
     chrp_nvram_create_free_partition(&image[sysp_end], 0x1fd0 - sysp_end);
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index 9e30203dcc44..2409e739e81b 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -136,7 +136,7 @@ static int sun4u_NVRAM_set_params(Nvram *nvram, uint16_=
t NVRAM_size,
     memset(image, '\0', sizeof(image));
=20
     /* OpenBIOS nvram variables partition */
-    sysp_end =3D chrp_nvram_create_system_partition(image, 0);
+    sysp_end =3D chrp_nvram_create_system_partition(image, 0, false);
=20
     /* Free space partition */
     chrp_nvram_create_free_partition(&image[sysp_end], 0x1fd0 - sysp_end);
diff --git a/include/hw/nvram/chrp_nvram.h b/include/hw/nvram/chrp_nvram.h
index 09941a9be454..1d32dbf61331 100644
--- a/include/hw/nvram/chrp_nvram.h
+++ b/include/hw/nvram/chrp_nvram.h
@@ -50,7 +50,8 @@ chrp_nvram_finish_partition(ChrpNvramPartHdr *header, uin=
t32_t size)
     header->checksum =3D sum & 0xff;
 }
=20
-int chrp_nvram_create_system_partition(uint8_t *data, int min_len);
+int chrp_nvram_create_system_partition(uint8_t *data, int min_len,
+                                       bool dry_run);
 int chrp_nvram_create_free_partition(uint8_t *data, int len);
=20
 #endif



