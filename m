Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAA0142177
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 02:33:46 +0100 (CET)
Received: from localhost ([::1]:57034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itLwn-000695-6H
	for lists+qemu-devel@lfdr.de; Sun, 19 Jan 2020 20:33:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42488)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhukeqian1@huawei.com>) id 1itLu9-000469-5U
 for qemu-devel@nongnu.org; Sun, 19 Jan 2020 20:31:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhukeqian1@huawei.com>) id 1itLu8-00055i-7H
 for qemu-devel@nongnu.org; Sun, 19 Jan 2020 20:31:01 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2743 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhukeqian1@huawei.com>)
 id 1itLu7-00053j-Te
 for qemu-devel@nongnu.org; Sun, 19 Jan 2020 20:31:00 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id EB206395A4C9961A0A3C;
 Mon, 20 Jan 2020 09:30:56 +0800 (CST)
Received: from linux-TFkxOR.huawei.com (10.175.104.212) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.439.0; Mon, 20 Jan 2020 09:30:49 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v3 2/2] hw/arm: Use helper function to trigger hotplug handler
 plug
Date: Mon, 20 Jan 2020 09:27:55 +0800
Message-ID: <20200120012755.44581-3-zhukeqian1@huawei.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20200120012755.44581-1-zhukeqian1@huawei.com>
References: <20200120012755.44581-1-zhukeqian1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.212]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.191
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, wanghaibin.wang@huawei.com,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can use existing helper function to trigger hotplug handler
plug, which makes code clearer.

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
---
 hw/arm/virt.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 39ab5f47e0..656b0081c2 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1934,7 +1934,6 @@ static void virt_memory_pre_plug(HotplugHandler *ho=
tplug_dev, DeviceState *dev,
 static void virt_memory_plug(HotplugHandler *hotplug_dev,
                              DeviceState *dev, Error **errp)
 {
-    HotplugHandlerClass *hhc;
     VirtMachineState *vms =3D VIRT_MACHINE(hotplug_dev);
     Error *local_err =3D NULL;
=20
@@ -1943,8 +1942,9 @@ static void virt_memory_plug(HotplugHandler *hotplu=
g_dev,
         goto out;
     }
=20
-    hhc =3D HOTPLUG_HANDLER_GET_CLASS(vms->acpi_dev);
-    hhc->plug(HOTPLUG_HANDLER(vms->acpi_dev), dev, &error_abort);
+    hotplug_handler_plug(HOTPLUG_HANDLER(vms->acpi_dev),
+                         dev, &error_abort);
+
 out:
     error_propagate(errp, local_err);
 }
--=20
2.19.1


