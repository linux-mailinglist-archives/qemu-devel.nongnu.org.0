Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3528E164A85
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Feb 2020 17:35:39 +0100 (CET)
Received: from localhost ([::1]:55924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4SK2-00016M-72
	for lists+qemu-devel@lfdr.de; Wed, 19 Feb 2020 11:35:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37602)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1j4RwC-00041F-Io
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:11:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1j4Rw9-00011x-0Q
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:11:00 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:55214
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1j4Rw8-00011c-Se
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:10:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582128656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z//QpzTQCOC5SMA/0cilewHk7hrp6uKkSGm7/CFDye4=;
 b=M4jULzJw8Zt+STSWcXpMldXEgBJTli+FQZ49DIfC0wceJFhWaq/D54MhhZ4Rk/19xdcwlt
 th84SQDvrf5MfOrH5M6OoyyHvR9w6eldksNCHv2UUwmTpgdOONb3QXL35BwfcX3XG0yNvJ
 9+TnSytjDAu6qzJoQ2IqarruutOPc5Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-ONxiC4cLMuSLsi6RuN99Lg-1; Wed, 19 Feb 2020 11:10:54 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54874801A0D
 for <qemu-devel@nongnu.org>; Wed, 19 Feb 2020 16:10:53 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A483C8ECF3;
 Wed, 19 Feb 2020 16:10:52 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 49/79] m68k/next-cube: use memdev for RAM
Date: Wed, 19 Feb 2020 11:09:23 -0500
Message-Id: <20200219160953.13771-50-imammedo@redhat.com>
In-Reply-To: <20200219160953.13771-1-imammedo@redhat.com>
References: <20200219160953.13771-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: ONxiC4cLMuSLsi6RuN99Lg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
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
Acked-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/m68k/next-cube.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/m68k/next-cube.c b/hw/m68k/next-cube.c
index e5343348d0..cd93d9e367 100644
--- a/hw/m68k/next-cube.c
+++ b/hw/m68k/next-cube.c
@@ -860,7 +860,6 @@ static void next_cube_init(MachineState *machine)
 {
     M68kCPU *cpu;
     CPUM68KState *env;
-    MemoryRegion *ram =3D g_new(MemoryRegion, 1);
     MemoryRegion *rom =3D g_new(MemoryRegion, 1);
     MemoryRegion *mmiomem =3D g_new(MemoryRegion, 1);
     MemoryRegion *scrmem =3D g_new(MemoryRegion, 1);
@@ -893,8 +892,7 @@ static void next_cube_init(MachineState *machine)
     memcpy(ns->rtc.ram, rtc_ram2, 32);
=20
     /* 64MB RAM starting at 0x04000000  */
-    memory_region_allocate_system_memory(ram, NULL, "next.ram", ram_size);
-    memory_region_add_subregion(sysmem, 0x04000000, ram);
+    memory_region_add_subregion(sysmem, 0x04000000, machine->ram);
=20
     /* Framebuffer */
     dev =3D qdev_create(NULL, TYPE_NEXTFB);
@@ -967,6 +965,7 @@ static void next_machine_class_init(ObjectClass *oc, vo=
id *data)
     mc->desc =3D "NeXT Cube";
     mc->init =3D next_cube_init;
     mc->default_ram_size =3D RAM_SIZE;
+    mc->default_ram_id =3D "next.ram";
     mc->default_cpu_type =3D M68K_CPU_TYPE_NAME("m68040");
 }
=20
--=20
2.18.1


