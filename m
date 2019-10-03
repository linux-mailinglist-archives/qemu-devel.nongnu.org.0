Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3ABCAF84
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Oct 2019 21:48:03 +0200 (CEST)
Received: from localhost ([::1]:39652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iG74z-00040w-Gb
	for lists+qemu-devel@lfdr.de; Thu, 03 Oct 2019 15:48:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51857)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1iG6qy-0005Xe-St
 for qemu-devel@nongnu.org; Thu, 03 Oct 2019 15:33:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1iG6qx-0004wc-HY
 for qemu-devel@nongnu.org; Thu, 03 Oct 2019 15:33:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49580)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>)
 id 1iG6qu-0004tj-LT; Thu, 03 Oct 2019 15:33:28 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D0FB3898112;
 Thu,  3 Oct 2019 19:33:27 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-165.bos.redhat.com [10.18.17.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E20E10018F8;
 Thu,  3 Oct 2019 19:33:25 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL v2 7/8] bootdevice: FW_CFG interface for LCHS values
Date: Thu,  3 Oct 2019 15:32:44 -0400
Message-Id: <20191003193245.8993-8-jsnow@redhat.com>
In-Reply-To: <20191003193245.8993-1-jsnow@redhat.com>
References: <20191003193245.8993-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Thu, 03 Oct 2019 19:33:27 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Arbel Moshe <arbel.moshe@oracle.com>, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Sam Eiderman <shmuel.eiderman@oracle.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Karl Heubaum <karl.heubaum@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sam Eiderman <shmuel.eiderman@oracle.com>

Using fw_cfg, supply logical CHS values directly from QEMU to the BIOS.

Non-standard logical geometries break under QEMU.

A virtual disk which contains an operating system which depends on
logical geometries (consistent values being reported from BIOS INT13
AH=3D08) will most likely break under QEMU/SeaBIOS if it has non-standard
logical geometries - for example 56 SPT (sectors per track).
No matter what QEMU will report - SeaBIOS, for large enough disks - will
use LBA translation, which will report 63 SPT instead.

In addition we cannot force SeaBIOS to rely on physical geometries at
all. A virtio-blk-pci virtual disk with 255 phyiscal heads cannot
report more than 16 physical heads when moved to an IDE controller,
since the ATA spec allows a maximum of 16 heads - this is an artifact of
virtualization.

By supplying the logical geometries directly we are able to support such
"exotic" disks.

We serialize this information in a similar way to the "bootorder"
interface.
The new fw_cfg entry is "bios-geometry".

Reviewed-by: Karl Heubaum <karl.heubaum@oracle.com>
Reviewed-by: Arbel Moshe <arbel.moshe@oracle.com>
Signed-off-by: Sam Eiderman <shmuel.eiderman@oracle.com>
Message-id: 20190925110639.100699-8-sameid@google.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 include/sysemu/sysemu.h |  1 +
 bootdevice.c            | 32 ++++++++++++++++++++++++++++++++
 hw/nvram/fw_cfg.c       | 14 +++++++++++---
 3 files changed, 44 insertions(+), 3 deletions(-)

diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 5bc5c79cbc..80c57fdc4e 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -106,6 +106,7 @@ void validate_bootdevices(const char *devices, Error =
**errp);
 void add_boot_device_lchs(DeviceState *dev, const char *suffix,
                           uint32_t lcyls, uint32_t lheads, uint32_t lsec=
s);
 void del_boot_device_lchs(DeviceState *dev, const char *suffix);
+char *get_boot_devices_lchs_list(size_t *size);
=20
 /* handler to set the boot_device order for a specific type of MachineCl=
ass */
 typedef void QEMUBootSetHandler(void *opaque, const char *boot_order,
diff --git a/bootdevice.c b/bootdevice.c
index 2b12fb85a4..b034ad7bdc 100644
--- a/bootdevice.c
+++ b/bootdevice.c
@@ -405,3 +405,35 @@ void del_boot_device_lchs(DeviceState *dev, const ch=
ar *suffix)
         }
     }
 }
+
+/* Serialized as: (device name\0 + lchs struct) x devices */
+char *get_boot_devices_lchs_list(size_t *size)
+{
+    FWLCHSEntry *i;
+    size_t total =3D 0;
+    char *list =3D NULL;
+
+    QTAILQ_FOREACH(i, &fw_lchs, link) {
+        char *bootpath;
+        char *chs_string;
+        size_t len;
+
+        bootpath =3D get_boot_device_path(i->dev, false, i->suffix);
+        chs_string =3D g_strdup_printf("%s %" PRIu32 " %" PRIu32 " %" PR=
Iu32,
+                                     bootpath, i->lcyls, i->lheads, i->l=
secs);
+
+        if (total) {
+            list[total - 1] =3D '\n';
+        }
+        len =3D strlen(chs_string) + 1;
+        list =3D g_realloc(list, total + len);
+        memcpy(&list[total], chs_string, len);
+        total +=3D len;
+        g_free(chs_string);
+        g_free(bootpath);
+    }
+
+    *size =3D total;
+
+    return list;
+}
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 7dc3ac378e..18aff658c0 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -920,13 +920,21 @@ void *fw_cfg_modify_file(FWCfgState *s, const char =
*filename,
=20
 static void fw_cfg_machine_reset(void *opaque)
 {
+    MachineClass *mc =3D MACHINE_GET_CLASS(qdev_get_machine());
+    FWCfgState *s =3D opaque;
     void *ptr;
     size_t len;
-    FWCfgState *s =3D opaque;
-    char *bootindex =3D get_boot_devices_list(&len);
+    char *buf;
=20
-    ptr =3D fw_cfg_modify_file(s, "bootorder", (uint8_t *)bootindex, len=
);
+    buf =3D get_boot_devices_list(&len);
+    ptr =3D fw_cfg_modify_file(s, "bootorder", (uint8_t *)buf, len);
     g_free(ptr);
+
+    if (!mc->legacy_fw_cfg_order) {
+        buf =3D get_boot_devices_lchs_list(&len);
+        ptr =3D fw_cfg_modify_file(s, "bios-geometry", (uint8_t *)buf, l=
en);
+        g_free(ptr);
+    }
 }
=20
 static void fw_cfg_machine_ready(struct Notifier *n, void *data)
--=20
2.21.0


