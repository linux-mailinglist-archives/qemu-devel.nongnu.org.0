Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCC7164A5E
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Feb 2020 17:29:44 +0100 (CET)
Received: from localhost ([::1]:55812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4SEJ-0006Dz-EY
	for lists+qemu-devel@lfdr.de; Wed, 19 Feb 2020 11:29:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37434)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1j4Rvw-0003MX-Ty
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:10:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1j4Rvv-0000ti-OT
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:10:44 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:20544
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1j4Rvv-0000tJ-Jl
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:10:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582128643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a0GlpCs4yvT4Vehz4KQ7+hk22d+s9VjkFOHnkDRpIa0=;
 b=W/m13krdDNmokhIwUVP0Gx36TJAlcVNWTYLCfpG1BW1Km789S1F28pPJbIhrgIsfmyFN+7
 LhutXkoR0iPpEyOT8tKXeNkdAReynrTRjeFT5K+hUsVlGT5swHJwc1mQg13PX10b4jqlHK
 QpxzK7wiaDKKuSKYlNLjzTlp/oytlh0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-Qo4XLVpxPZWAQYShPs6PDw-1; Wed, 19 Feb 2020 11:10:41 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3DE8C1098C07
 for <qemu-devel@nongnu.org>; Wed, 19 Feb 2020 16:10:40 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E1EB6E3EE;
 Wed, 19 Feb 2020 16:10:39 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 38/79] s390x/s390-virtio-ccw: use memdev for RAM
Date: Wed, 19 Feb 2020 11:09:12 -0500
Message-Id: <20200219160953.13771-39-imammedo@redhat.com>
In-Reply-To: <20200219160953.13771-1-imammedo@redhat.com>
References: <20200219160953.13771-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: Qo4XLVpxPZWAQYShPs6PDw-1
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
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Acked-by: Cornelia Huck <cohuck@redhat.com>
Tested-by: Halil Pasic <pasic@linux.ibm.com>
Acked-by: Halil Pasic <pasic@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/s390x/s390-virtio-ccw.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index e759eb5f83..a89cf4c129 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -154,14 +154,12 @@ static void virtio_ccw_register_hcalls(void)
                                    virtio_ccw_hcall_early_printk);
 }
=20
-static void s390_memory_init(ram_addr_t mem_size)
+static void s390_memory_init(MemoryRegion *ram)
 {
     MemoryRegion *sysmem =3D get_system_memory();
-    MemoryRegion *ram =3D g_new(MemoryRegion, 1);
     Error *local_err =3D NULL;
=20
     /* allocate RAM for core */
-    memory_region_allocate_system_memory(ram, NULL, "s390.ram", mem_size);
     memory_region_add_subregion(sysmem, 0, ram);
=20
     /*
@@ -245,7 +243,7 @@ static void ccw_init(MachineState *machine)
=20
     s390_sclp_init();
     /* init memory + setup max page size. Required for the CPU model */
-    s390_memory_init(machine->ram_size);
+    s390_memory_init(machine->ram);
=20
     /* init CPUs (incl. CPU model) early so s390_has_feature() works */
     s390_init_cpus(machine);
@@ -471,6 +469,7 @@ static void ccw_machine_class_init(ObjectClass *oc, voi=
d *data)
     hc->plug =3D s390_machine_device_plug;
     hc->unplug_request =3D s390_machine_device_unplug_request;
     nc->nmi_monitor_handler =3D s390_nmi;
+    mc->default_ram_id =3D "s390.ram";
 }
=20
 static inline bool machine_get_aes_key_wrap(Object *obj, Error **errp)
--=20
2.18.1


