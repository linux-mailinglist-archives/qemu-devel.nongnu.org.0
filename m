Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A81B514679B
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 13:09:18 +0100 (CET)
Received: from localhost ([::1]:55898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iubIT-00041H-7Q
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 07:09:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35656)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iuasR-0006Iy-QG
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:42:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iuasQ-0004Xu-Rw
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:42:23 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:53858
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iuasQ-0004Xm-Od
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:42:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579779742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xIXPLjVlQwCxTpnHTQXJxzDVBIqJT9Y1zzNQZLC8wcg=;
 b=X2P3ye9Mqsbj9MTa35Wg3HDhURTUVbLmgH+SihEazChC2AlIWX/s1Tq7UzxKXMn0OyDzBI
 rFn3gx4Lah5JvxKWyctdKO6KC0n78DfzfYZ+TYy8kIiaTNrV3gR0R8YqhGoSNAZNfh199x
 mPkqBqF7Mqa6ee4HJShPRkih3DNbTKY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-51Kqh7CpNv6h7yAQpOTSMw-1; Thu, 23 Jan 2020 06:42:21 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D4721800D48
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 11:42:20 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A755310016EB
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 11:42:19 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH REPOST v3 37/80] null-machine: use memdev for RAM
Date: Thu, 23 Jan 2020 12:38:02 +0100
Message-Id: <1579779525-20065-38-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 51Kqh7CpNv6h7yAQpOTSMw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.120
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

memory_region_allocate_system_memory() API is going away, so
replace it with memdev allocated MemoryRegion. The later is
initialized by generic code, so board only needs to opt in
to memdev scheme by providing
  MachineClass::default_ram_id
and using MachineState::ram instead of manually initializing
RAM memory region.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/core/null-machine.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/core/null-machine.c b/hw/core/null-machine.c
index 1aa0a9a..cb47d9d 100644
--- a/hw/core/null-machine.c
+++ b/hw/core/null-machine.c
@@ -32,11 +32,8 @@ static void machine_none_init(MachineState *mch)
     }
=20
     /* RAM at address zero */
-    if (mch->ram_size) {
-        MemoryRegion *ram =3D g_new(MemoryRegion, 1);
-
-        memory_region_allocate_system_memory(ram, NULL, "ram", mch->ram_si=
ze);
-        memory_region_add_subregion(get_system_memory(), 0, ram);
+    if (mch->ram) {
+        memory_region_add_subregion(get_system_memory(), 0, mch->ram);
     }
=20
     if (mch->kernel_filename) {
@@ -52,6 +49,7 @@ static void machine_none_machine_init(MachineClass *mc)
     mc->init =3D machine_none_init;
     mc->max_cpus =3D 1;
     mc->default_ram_size =3D 0;
+    mc->default_ram_id =3D "ram";
 }
=20
 DEFINE_MACHINE("none", machine_none_machine_init)
--=20
2.7.4


