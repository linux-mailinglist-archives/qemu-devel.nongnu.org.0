Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 175E81128B3
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Dec 2019 10:58:13 +0100 (CET)
Received: from localhost ([::1]:36324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1icRQB-0005Fl-5q
	for lists+qemu-devel@lfdr.de; Wed, 04 Dec 2019 04:58:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38697)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1icR5Q-0007De-UK
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 04:36:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1icR5J-0000S0-N8
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 04:36:39 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:59931
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1icR5J-00009j-Hy
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 04:36:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575452193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eNZoyFYgA/aKwuSgWEKLFPIR/VOAmutzfJxKqf7RMFw=;
 b=EEP3peeavoa68rI6rilk0oqtoSDQG2UAABAOhpAkhFv3kIAb0+uLhPe5G4ohC9FCufd8gG
 qd/+2RjzHwugkhGyDJHefXE2mSRLkiw9Ce7EKH5x4TBbv/6RNtvBZ9Meqqg61sv7HYJpDe
 TifFDPeMBN4dt7FlqiWUcj68RLMuMhU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-gNVdFu32OQGLAmDUoyTh7g-1; Wed, 04 Dec 2019 04:36:32 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30CFC18543A1
 for <qemu-devel@nongnu.org>; Wed,  4 Dec 2019 09:36:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-134.ams2.redhat.com
 [10.36.116.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 721F65D6AE;
 Wed,  4 Dec 2019 09:36:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9586C11366DB; Wed,  4 Dec 2019 10:36:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/18] hw/acpi: Fix legacy CPU plug error API violations
Date: Wed,  4 Dec 2019 10:36:13 +0100
Message-Id: <20191204093625.14836-7-armbru@redhat.com>
In-Reply-To: <20191204093625.14836-1-armbru@redhat.com>
References: <20191204093625.14836-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: gNVdFu32OQGLAmDUoyTh7g-1
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
Cc: Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

legacy_acpi_cpu_plug_cb() dereferences @errp when
acpi_set_cpu_present_bit() fails.  That's wrong; see the big comment
in error.h.  Introduced in commit cc43364de7 "acpi/cpu-hotplug:
introduce helper function to keep bit setting in one place".

No caller actually passes null, and acpi_set_cpu_present_bit() can't
actually fail.

Fix anyway: drop acpi_set_cpu_present_bit()'s @errp parameter.

Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/cpu_hotplug.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/hw/acpi/cpu_hotplug.c b/hw/acpi/cpu_hotplug.c
index 3ac2045a95..9c3bcc84de 100644
--- a/hw/acpi/cpu_hotplug.c
+++ b/hw/acpi/cpu_hotplug.c
@@ -55,8 +55,7 @@ static const MemoryRegionOps AcpiCpuHotplug_ops =3D {
     },
 };
=20
-static void acpi_set_cpu_present_bit(AcpiCpuHotplug *g, CPUState *cpu,
-                                     Error **errp)
+static void acpi_set_cpu_present_bit(AcpiCpuHotplug *g, CPUState *cpu)
 {
     CPUClass *k =3D CPU_GET_CLASS(cpu);
     int64_t cpu_id;
@@ -74,10 +73,7 @@ static void acpi_set_cpu_present_bit(AcpiCpuHotplug *g, =
CPUState *cpu,
 void legacy_acpi_cpu_plug_cb(HotplugHandler *hotplug_dev,
                              AcpiCpuHotplug *g, DeviceState *dev, Error **=
errp)
 {
-    acpi_set_cpu_present_bit(g, CPU(dev), errp);
-    if (*errp !=3D NULL) {
-        return;
-    }
+    acpi_set_cpu_present_bit(g, CPU(dev));
     acpi_send_event(DEVICE(hotplug_dev), ACPI_CPU_HOTPLUG_STATUS);
 }
=20
@@ -92,7 +88,7 @@ void legacy_acpi_cpu_hotplug_init(MemoryRegion *parent, O=
bject *owner,
     gpe_cpu->device =3D owner;
=20
     CPU_FOREACH(cpu) {
-        acpi_set_cpu_present_bit(gpe_cpu, cpu, &error_abort);
+        acpi_set_cpu_present_bit(gpe_cpu, cpu);
     }
 }
=20
--=20
2.21.0


