Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FD9164A7A
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Feb 2020 17:34:00 +0100 (CET)
Received: from localhost ([::1]:55892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4SIR-000662-0w
	for lists+qemu-devel@lfdr.de; Wed, 19 Feb 2020 11:33:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37529)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1j4Rw6-0003k5-Qi
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:10:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1j4Rw5-000103-PH
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:10:54 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:26422
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1j4Rw5-0000zo-LG
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:10:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582128653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FNYMvUL3QjYv5GaS9aJU1SCDqoA/m5q1yAQyQFO9mXs=;
 b=UR0nhX0Ilq6QiU3ODhAM2v19FabwxJTqHHX0n65eYQ5aknIcipReKBa6owaARMMuaGNcJd
 khZtpbaFD0jWIrsyciA97R4OeLw/doRtTlhh/SmWXqrF3IGUoYDBoRNa7v645ZjaRW7TIr
 mqFOoCW+HkBye06TNAWjyYWY3QKnFx8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-woRhMafqO6KCZO0_xlQBYQ-1; Wed, 19 Feb 2020 11:10:51 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 661F7100E87E
 for <qemu-devel@nongnu.org>; Wed, 19 Feb 2020 16:10:50 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B3A4048;
 Wed, 19 Feb 2020 16:10:49 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 46/79] m68k/an5206: use memdev for RAM
Date: Wed, 19 Feb 2020 11:09:20 -0500
Message-Id: <20200219160953.13771-47-imammedo@redhat.com>
In-Reply-To: <20200219160953.13771-1-imammedo@redhat.com>
References: <20200219160953.13771-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: woRhMafqO6KCZO0_xlQBYQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
 hw/m68k/an5206.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/m68k/an5206.c b/hw/m68k/an5206.c
index bed43a936d..846f4e40c6 100644
--- a/hw/m68k/an5206.c
+++ b/hw/m68k/an5206.c
@@ -33,7 +33,6 @@ static void an5206_init(MachineState *machine)
     uint64_t elf_entry;
     hwaddr entry;
     MemoryRegion *address_space_mem =3D get_system_memory();
-    MemoryRegion *ram =3D g_new(MemoryRegion, 1);
     MemoryRegion *sram =3D g_new(MemoryRegion, 1);
=20
     cpu =3D M68K_CPU(cpu_create(machine->cpu_type));
@@ -46,8 +45,7 @@ static void an5206_init(MachineState *machine)
     env->rambar0 =3D AN5206_RAMBAR_ADDR | 1;
=20
     /* DRAM at address zero */
-    memory_region_allocate_system_memory(ram, NULL, "an5206.ram", ram_size=
);
-    memory_region_add_subregion(address_space_mem, 0, ram);
+    memory_region_add_subregion(address_space_mem, 0, machine->ram);
=20
     /* Internal SRAM.  */
     memory_region_init_ram(sram, NULL, "an5206.sram", 512, &error_fatal);
@@ -89,6 +87,7 @@ static void an5206_machine_init(MachineClass *mc)
     mc->desc =3D "Arnewsh 5206";
     mc->init =3D an5206_init;
     mc->default_cpu_type =3D M68K_CPU_TYPE_NAME("m5206");
+    mc->default_ram_id =3D "an5206.ram";
 }
=20
 DEFINE_MACHINE("an5206", an5206_machine_init)
--=20
2.18.1


