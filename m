Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7637519C713
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Apr 2020 18:30:59 +0200 (CEST)
Received: from localhost ([::1]:44422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jK2k5-0008FF-Q0
	for lists+qemu-devel@lfdr.de; Thu, 02 Apr 2020 12:30:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36761)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <me@xcancerberox.com.ar>) id 1jK2iX-0007kv-HH
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 12:29:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <me@xcancerberox.com.ar>) id 1jK2iV-0005hU-S1
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 12:29:20 -0400
Received: from [51.158.76.159] (port=58386 helo=mail.xcancerberox.com.ar)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <me@xcancerberox.com.ar>) id 1jK2iU-0005Vf-Us
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 12:29:19 -0400
From: Joaquin de Andres <me@xcancerberox.com.ar>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xcancerberox.com.ar;
 s=mail; t=1585844953;
 bh=+pwhFxnVpTJ5kADnjD+lsCpxb2LcOQT5Dvcd8QzrzoQ=;
 h=From:To:Cc:Subject;
 b=nm/YKDgNb3c0lCsWGRIaeO9o6MvdUlmkth+qWZEShCsfm0ColkyadqVZbOTlPh9/L
 lFN01upcAwU+f1t9fD6jojxB26JX6VSyOB2mZUCTR3Q0A+P2ZzjjnZq12X/wQGVd7Y
 9vyx9DnFKO6IVUQwQwo2OyI0m2rALgW1oMO0hC8UT2ls6mjo4mdO9cP5XuPvkE+RsQ
 kOpuVu6P5ljlq1Hv51YPbXEhWfdrGTDZT2/lGz1+FeNr/dJc02YVLE13YHygUG5txS
 LmAObxH3OfLUDkzDME0LDrME79aqVHesUrTqro9QblYy+i3CmPE/1cwF9NNIc4WMGu
 WY2PFQIGtmgcw==
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.1 v2] hw/core/register: Add register_init_block8 helper.
Date: Thu,  2 Apr 2020 18:28:39 +0200
Message-Id: <20200402162839.76636-1-me@xcancerberox.com.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 51.158.76.159
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
Cc: Joaquin de Andres <me@xcancerberox.com.ar>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There was no support for 8 bits block registers. Changed
register_init_block32 to be generic and static, adding register
size in bits as parameter. Created one helper for each size.

Signed-off-by: Joaquin de Andres <me@xcancerberox.com.ar>
---
This patch is small and I could see that there is not much movement with
the release, so, I let my self send this. Also this is my first patch :)
Reviews are welcome.
---
 hw/core/register.c    | 46 +++++++++++++++++++++++++++++++++----------
 include/hw/register.h |  8 ++++++++
 2 files changed, 44 insertions(+), 10 deletions(-)

diff --git a/hw/core/register.c b/hw/core/register.c
index 3c77396587..ddf91eb445 100644
--- a/hw/core/register.c
+++ b/hw/core/register.c
@@ -246,16 +246,18 @@ uint64_t register_read_memory(void *opaque, hwaddr =
addr,
     return extract64(read_val, 0, size * 8);
 }
=20
-RegisterInfoArray *register_init_block32(DeviceState *owner,
-                                         const RegisterAccessInfo *rae,
-                                         int num, RegisterInfo *ri,
-                                         uint32_t *data,
-                                         const MemoryRegionOps *ops,
-                                         bool debug_enabled,
-                                         uint64_t memory_size)
+static RegisterInfoArray *register_init_block(DeviceState *owner,
+                                              const RegisterAccessInfo *=
rae,
+                                              int num, RegisterInfo *ri,
+                                              void *data,
+                                              const MemoryRegionOps *ops=
,
+                                              bool debug_enabled,
+                                              uint64_t memory_size,
+                                              size_t data_size_bits)
 {
     const char *device_prefix =3D object_get_typename(OBJECT(owner));
     RegisterInfoArray *r_array =3D g_new0(RegisterInfoArray, 1);
+    int data_size =3D data_size_bits >> 3;
     int i;
=20
     r_array->r =3D g_new0(RegisterInfo *, num);
@@ -264,12 +266,12 @@ RegisterInfoArray *register_init_block32(DeviceStat=
e *owner,
     r_array->prefix =3D device_prefix;
=20
     for (i =3D 0; i < num; i++) {
-        int index =3D rae[i].addr / 4;
+        int index =3D rae[i].addr / data_size;
         RegisterInfo *r =3D &ri[index];
=20
         *r =3D (RegisterInfo) {
-            .data =3D &data[index],
-            .data_size =3D sizeof(uint32_t),
+            .data =3D data + data_size * index,
+            .data_size =3D data_size,
             .access =3D &rae[i],
             .opaque =3D owner,
         };
@@ -284,6 +286,30 @@ RegisterInfoArray *register_init_block32(DeviceState=
 *owner,
     return r_array;
 }
=20
+RegisterInfoArray *register_init_block8(DeviceState *owner,
+                                        const RegisterAccessInfo *rae,
+                                        int num, RegisterInfo *ri,
+                                        uint8_t *data,
+                                        const MemoryRegionOps *ops,
+                                        bool debug_enabled,
+                                        uint64_t memory_size)
+{
+    return register_init_block(owner, rae, num, ri, (void *)
+                               data, ops, debug_enabled, memory_size, 8)=
;
+}
+
+RegisterInfoArray *register_init_block32(DeviceState *owner,
+                                         const RegisterAccessInfo *rae,
+                                         int num, RegisterInfo *ri,
+                                         uint32_t *data,
+                                         const MemoryRegionOps *ops,
+                                         bool debug_enabled,
+                                         uint64_t memory_size)
+{
+    return register_init_block(owner, rae, num, ri, (void *)
+                               data, ops, debug_enabled, memory_size, 32=
);
+}
+
 void register_finalize_block(RegisterInfoArray *r_array)
 {
     object_unparent(OBJECT(&r_array->mem));
diff --git a/include/hw/register.h b/include/hw/register.h
index 5796584588..5d2c565ae0 100644
--- a/include/hw/register.h
+++ b/include/hw/register.h
@@ -185,6 +185,14 @@ uint64_t register_read_memory(void *opaque, hwaddr a=
ddr, unsigned size);
  *          memory region (r_array->mem) the caller should add to a cont=
ainer.
  */
=20
+RegisterInfoArray *register_init_block8(DeviceState *owner,
+                                        const RegisterAccessInfo *rae,
+                                        int num, RegisterInfo *ri,
+                                        uint8_t *data,
+                                        const MemoryRegionOps *ops,
+                                        bool debug_enabled,
+                                        uint64_t memory_size);
+
 RegisterInfoArray *register_init_block32(DeviceState *owner,
                                          const RegisterAccessInfo *rae,
                                          int num, RegisterInfo *ri,
--=20
2.26.0


