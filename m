Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5162D12D92E
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Dec 2019 14:44:36 +0100 (CET)
Received: from localhost ([::1]:42688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1imHp4-0006VK-14
	for lists+qemu-devel@lfdr.de; Tue, 31 Dec 2019 08:44:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56716)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1imHCW-0005ra-VE
 for qemu-devel@nongnu.org; Tue, 31 Dec 2019 08:04:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1imHCT-0004KY-0y
 for qemu-devel@nongnu.org; Tue, 31 Dec 2019 08:04:44 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:28344
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1imHCS-0004Hw-LV
 for qemu-devel@nongnu.org; Tue, 31 Dec 2019 08:04:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577797480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jF8uPId+5fqxcR5sLbjqM5UR26DFj2imdkGk9o4x/9c=;
 b=L8B6FhpeO8gEAkPHVzq1JZtnnwntAtTNlAV8qmreXQok9dfEsEvJKNQhuReRfJMpXSNomi
 w4Q+8mLgSLdlU10BF27wzClyrb00QFXNqhQ9oVG8h/67x0CaMZd5C0kMkgpX0uL1t7XpY1
 TAyjymFVQpJZ/01WjWvk+Bk4LW/w2tg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-szK-C8QMPrGykTn4E63slg-1; Tue, 31 Dec 2019 08:04:38 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5607D107ACC5
 for <qemu-devel@nongnu.org>; Tue, 31 Dec 2019 13:04:37 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D15C978E96
 for <qemu-devel@nongnu.org>; Tue, 31 Dec 2019 13:04:36 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 59/86] ppc:e500: drop RAM size fixup
Date: Tue, 31 Dec 2019 14:03:43 +0100
Message-Id: <1577797450-88458-60-git-send-email-imammedo@redhat.com>
In-Reply-To: <1577797450-88458-1-git-send-email-imammedo@redhat.com>
References: <1577797450-88458-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: szK-C8QMPrGykTn4E63slg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If user provided non-sense RAM size, board will complain and
continue running with max RAM size supported.
Also RAM is going to be allocated by generic code, so it won't be
possible for board to fix things up for user.

Make it error message and exit to force user fix CLI,
instead of accepting non-sense CLI values.

While at it, replace usage of global ram_size with
machine->ram_size

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/ppc/e500.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 12b6a5b..aac4aba 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -906,12 +906,14 @@ void ppce500_init(MachineState *machine)
=20
     env =3D firstenv;
=20
-    /* Fixup Memory size on a alignment boundary */
-    ram_size &=3D ~(RAM_SIZES_ALIGN - 1);
-    machine->ram_size =3D ram_size;
+    if (!QEMU_IS_ALIGNED(machine->ram_size, RAM_SIZES_ALIGN)) {
+        error_report("RAM size must be multiple of %ld", RAM_SIZES_ALIGN);
+        exit(EXIT_FAILURE);
+    }
=20
     /* Register Memory */
-    memory_region_allocate_system_memory(ram, NULL, "mpc8544ds.ram", ram_s=
ize);
+    memory_region_allocate_system_memory(ram, NULL, "mpc8544ds.ram",
+                                         machine->ram_size);
     memory_region_add_subregion(address_space_mem, 0, ram);
=20
     dev =3D qdev_create(NULL, "e500-ccsr");
@@ -1083,7 +1085,7 @@ void ppce500_init(MachineState *machine)
         kernel_base =3D cur_base;
         kernel_size =3D load_image_targphys(machine->kernel_filename,
                                           cur_base,
-                                          ram_size - cur_base);
+                                          machine->ram_size - cur_base);
         if (kernel_size < 0) {
             error_report("could not load kernel '%s'",
                          machine->kernel_filename);
@@ -1097,7 +1099,7 @@ void ppce500_init(MachineState *machine)
     if (machine->initrd_filename) {
         initrd_base =3D (cur_base + INITRD_LOAD_PAD) & ~INITRD_PAD_MASK;
         initrd_size =3D load_image_targphys(machine->initrd_filename, init=
rd_base,
-                                          ram_size - initrd_base);
+                                          machine->ram_size - initrd_base)=
;
=20
         if (initrd_size < 0) {
             error_report("could not load initial ram disk '%s'",
@@ -1115,7 +1117,7 @@ void ppce500_init(MachineState *machine)
      * ensures enough space between kernel and initrd.
      */
     dt_base =3D (loadaddr + payload_size + DTC_LOAD_PAD) & ~DTC_PAD_MASK;
-    if (dt_base + DTB_MAX_SIZE > ram_size) {
+    if (dt_base + DTB_MAX_SIZE > machine->ram_size) {
             error_report("not enough memory for device tree");
             exit(1);
     }
--=20
2.7.4


