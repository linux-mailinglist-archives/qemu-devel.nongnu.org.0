Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 710D01758D0
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Mar 2020 12:00:12 +0100 (CET)
Received: from localhost ([::1]:58540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8inz-0005rl-EV
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 06:00:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57842)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j8ijc-00089H-Rq
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 05:55:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j8ijb-00047H-Mn
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 05:55:40 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:60782
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j8ijb-00046Q-Hr
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 05:55:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583146539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tj+QfnBzXs/RdJSFTSmoyijGNCFa/L+oedc7uRt6geI=;
 b=IE9T7mXiICeR89bYDVBqmFdu9QvkV1sfTeR3AIScYuCWf/Ir/0T3rlIc1k7MIqmFBci6E6
 Gl/5YW63tFeMH2SXYWiuz7MtnYv0buRBWRp9PbBm1s2IlYLPjYvyMKAho5Aax5Sst0zCnG
 YsylKeL9OSs7I3xof2iFMTqTLBhLP4g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-e0oEMpZMOJ6X7b5-2aZR8w-1; Mon, 02 Mar 2020 05:55:37 -0500
X-MC-Unique: e0oEMpZMOJ6X7b5-2aZR8w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB1C5800D54;
 Mon,  2 Mar 2020 10:55:36 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E7E18385;
 Mon,  2 Mar 2020 10:55:34 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [PATCH v3 6/6] hw/arm/virt: kvm: allow gicv3 by default if v2 cannot
 work
Date: Mon,  2 Mar 2020 11:55:16 +0100
Message-Id: <20200302105516.5972-7-eric.auger@redhat.com>
In-Reply-To: <20200302105516.5972-1-eric.auger@redhat.com>
References: <20200302105516.5972-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: maz@kernel.org, drjones@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At the moment if the end-user does not specify the gic-version along
with KVM acceleration, v2 is set by default. However most of the
systems now have GICv3 and sometimes they do not support GICv2
compatibility.

This patch keeps the default v2 selection in all cases except
in the KVM accelerated mode when either
- the host does not support GICv2 in-kernel emulation or
- number of VCPUS exceeds 8.

Those cases did not work anyway so we do not break any compatibility.
Now we get v3 selected in such a case.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reported-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

---

v2 -> v3:
- add ()
---
 hw/arm/virt.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index aeb6c45e51..2d1dee50f8 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1542,6 +1542,8 @@ static void virt_set_memmap(VirtMachineState *vms)
  */
 static void finalize_gic_version(VirtMachineState *vms)
 {
+    unsigned int max_cpus =3D MACHINE(vms)->smp.max_cpus;
+
     if (kvm_enabled()) {
         int probe_bitmap =3D kvm_arm_vgic_probe();
=20
@@ -1552,7 +1554,17 @@ static void finalize_gic_version(VirtMachineState *v=
ms)
=20
         switch (vms->gic_version) {
         case VIRT_GIC_VERSION_NOSEL:
-            vms->gic_version =3D VIRT_GIC_VERSION_2;
+            if (((probe_bitmap & KVM_ARM_VGIC_V2) && max_cpus <=3D GIC_NCP=
U) ||
+                !kvm_irqchip_in_kernel()) {
+                vms->gic_version =3D VIRT_GIC_VERSION_2;
+            } else {
+                /*
+                 * in case the host does not support v2 in-kernel emulatio=
n or
+                 * the end-user requested more than 8 VCPUs we now default
+                 * to v3. In any case defaulting to v2 would be broken.
+                 */
+                vms->gic_version =3D VIRT_GIC_VERSION_3;
+            }
             break;
         case VIRT_GIC_VERSION_HOST:
         case VIRT_GIC_VERSION_MAX:
--=20
2.20.1


