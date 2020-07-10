Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDC421B64C
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jul 2020 15:26:41 +0200 (CEST)
Received: from localhost ([::1]:56126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtt32-0006Ar-MN
	for lists+qemu-devel@lfdr.de; Fri, 10 Jul 2020 09:26:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1jtsos-0004JI-3l
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 09:12:02 -0400
Received: from esa6.hc3370-68.iphmx.com ([216.71.155.175]:1501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1jtsoq-0001jK-5q
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 09:12:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594386720;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gKGoav32jy6D1wTYeXqZwznlDdJCPEmNvpiim4Sia2E=;
 b=TjRFcUfbRZZN1Ux5w5/MJ3FYZRfB6OWZ6n/KJEfb6vmyedtDSDjHno7R
 5nWHo3gMhH7dsTW8kaO/zxgoguhweds3snNL5NusrUdMDMI1eWlZ/Jmhl
 c1nklS5MolX2VIQNSqj3OFFUUNXo5AicgDtmssP+BlGZoSO3Okzt+nz5I o=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: PAEOZAOKqwv1y16lNBHg3giB8y3OZJyWJXsMaUXbOJ9Hc7VtEC77P29THrOmz6qG2SZYDoxRFW
 h6F7PAcRbfX+CjoSrh/Dcrcg0W52hgNAOgRHBIyDsyAquBlvYLHbTovsY5g9Xyu0HfoY1KGqjt
 S/xoGRgnuesTHCeVHRu+qqLTObwKfNW5ojPbJ6FHA3VhlnEVL6IKsber/OW8VEX7HoFG7RfXxX
 cewNIK1QNbRl04dnyt/sDRmSFMBRNMK+9Rh9jieeXMwgvTXnpUP0iXxBCDlng4Tyvew5BFxzJA
 eYE=
X-SBRS: 2.7
X-MesageID: 22397957
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,335,1589256000"; d="scan'208";a="22397957"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Subject: [PULL 1/2] xen: Fix xen-legacy-backend qdev types
Date: Fri, 10 Jul 2020 14:11:44 +0100
Message-ID: <20200710131145.589476-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200710131145.589476-1-anthony.perard@citrix.com>
References: <20200710131145.589476-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=216.71.155.175;
 envelope-from=anthony.perard@citrix.com; helo=esa6.hc3370-68.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/10 09:11:58
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Andryuk <jandryuk@gmail.com>,
 xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jason Andryuk <jandryuk@gmail.com>

xen-sysdev is a TYPE_SYS_BUS_DEVICE.  bus_type should not be changed so
that it can plug into the System bus.  Otherwise this assert triggers:
qemu-system-i386: hw/core/qdev.c:102: qdev_set_parent_bus: Assertion
`dc->bus_type && object_dynamic_cast(OBJECT(bus), dc->bus_type)'
failed.

TYPE_XENBACKEND attaches to TYPE_XENSYSBUS, so its class_init needs to
be set accordingly to attach the qdev.  Otherwise the following assert
triggers:
qemu-system-i386: hw/core/qdev.c:102: qdev_set_parent_bus: Assertion
`dc->bus_type && object_dynamic_cast(OBJECT(bus), dc->bus_type)'
failed.

TYPE_XENBACKEND is not a subclass of XEN_XENSYSDEV, so it's parent
is just TYPE_DEVICE.  Change that.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Acked-by: Paul Durrant <pdurrant@amazon.com>
Fixes: 81cb05732efb ("qdev: Assert devices are plugged into a bus that can take them")
Message-Id: <20200624121939.10282-1-jandryuk@gmail.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 hw/xen/xen-legacy-backend.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
index 7d4b13351e06..083d8dc1b28b 100644
--- a/hw/xen/xen-legacy-backend.c
+++ b/hw/xen/xen-legacy-backend.c
@@ -789,11 +789,12 @@ static void xendev_class_init(ObjectClass *klass, void *data)
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
     /* xen-backend devices can be plugged/unplugged dynamically */
     dc->user_creatable = true;
+    dc->bus_type = TYPE_XENSYSBUS;
 }
 
 static const TypeInfo xendev_type_info = {
     .name          = TYPE_XENBACKEND,
-    .parent        = TYPE_XENSYSDEV,
+    .parent        = TYPE_DEVICE,
     .class_init    = xendev_class_init,
     .instance_size = sizeof(struct XenLegacyDevice),
 };
@@ -824,7 +825,6 @@ static void xen_sysdev_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     device_class_set_props(dc, xen_sysdev_properties);
-    dc->bus_type = TYPE_XENSYSBUS;
 }
 
 static const TypeInfo xensysdev_info = {
-- 
Anthony PERARD


