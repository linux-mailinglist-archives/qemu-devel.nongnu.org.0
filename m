Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E7D1FA1F2
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jun 2020 22:47:51 +0200 (CEST)
Received: from localhost ([::1]:59436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkw1G-0004eW-R2
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 16:47:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jkvuD-0002qP-KC
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 16:40:33 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:48697
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jkvuA-0000Wn-Rn
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 16:40:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592253630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lzropVQqWYmgxKdoaE2bXLCONn+cqWPhYVsaTDNn/Ug=;
 b=DgspzQjmFQJodFIhQ7KGO7EdQp/ff5r0vjM0wU+ttGoTzvFQPN0mIpg4nI0fheVzvEN579
 bRU0WFtx8uHEOwbucGrAkuiuM0oJxNYGDBNaa94rvvncY5SXsliUbLLtzT9sTaIRBLnh++
 VmO/4zuwinbIzSzvEeNbS3Q63o+O7Iw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-_T1RaI8vNxCYl6qm8mTUuQ-1; Mon, 15 Jun 2020 16:40:28 -0400
X-MC-Unique: _T1RaI8vNxCYl6qm8mTUuQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68BF9803304;
 Mon, 15 Jun 2020 20:40:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B0A05C1D6;
 Mon, 15 Jun 2020 20:40:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 40DD411358BD; Mon, 15 Jun 2020 22:40:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/84] macio: Fix to realize "mos6522-cuda" and "mos6522-pmu"
 devices
Date: Mon, 15 Jun 2020 22:38:55 +0200
Message-Id: <20200615204008.3069956-12-armbru@redhat.com>
In-Reply-To: <20200615204008.3069956-1-armbru@redhat.com>
References: <20200615204008.3069956-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/15 15:33:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cuda_init() creates a "mos6522-cuda" device, but it's never realized.
Affects machines mac99 with via=cuda (default) and g3beige.

pmu_init() creates a "mos6522-pmu" device, but it's never realized.
Affects machine mac99 with via=pmu and via=pmu-adb,

In theory, a device becomes real only on realize.  In practice, the
transition from unreal to real is a fuzzy one.  The work to make a
device real can be spread between realize methods (fine),
instance_init methods (wrong), and board code wiring up the device
(fine as long as it effectively happens on realize).  Depending on
what exactly is done where, a device can work even when we neglect
to realize it.

These two appear to work.  Nevertheless, it's a clear misuse of the
interface.  Even when it works today (more or less by chance), it can
break tomorrow.

Fix by realizing them in cuda_realize() and pmu_realize(),
respectively.

Fixes: 6dca62a0000f95e0b7020aa00d0ca9b2c421f341
Cc: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20200609122339.937862-10-armbru@redhat.com>
---
 hw/misc/macio/cuda.c | 15 ++++++++++-----
 hw/misc/macio/pmu.c  | 15 ++++++++++-----
 2 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/hw/misc/macio/cuda.c b/hw/misc/macio/cuda.c
index e0cc0aac5d..3cb10c743c 100644
--- a/hw/misc/macio/cuda.c
+++ b/hw/misc/macio/cuda.c
@@ -33,6 +33,7 @@
 #include "hw/misc/macio/cuda.h"
 #include "qemu/timer.h"
 #include "sysemu/runstate.h"
+#include "qapi/error.h"
 #include "qemu/cutils.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
@@ -522,16 +523,20 @@ static void cuda_reset(DeviceState *dev)
 static void cuda_realize(DeviceState *dev, Error **errp)
 {
     CUDAState *s = CUDA(dev);
+    Error *err = NULL;
     SysBusDevice *sbd;
-    MOS6522State *ms;
-    DeviceState *d;
     struct tm tm;
 
+    object_property_set_bool(OBJECT(&s->mos6522_cuda), true, "realized",
+                             &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
     /* Pass IRQ from 6522 */
-    d = DEVICE(&s->mos6522_cuda);
-    ms = MOS6522(d);
     sbd = SYS_BUS_DEVICE(s);
-    sysbus_pass_irq(sbd, SYS_BUS_DEVICE(ms));
+    sysbus_pass_irq(sbd, SYS_BUS_DEVICE(&s->mos6522_cuda));
 
     qemu_get_timedate(&tm, 0);
     s->tick_offset = (uint32_t)mktimegm(&tm) + RTC_OFFSET;
diff --git a/hw/misc/macio/pmu.c b/hw/misc/macio/pmu.c
index 9a9cd427e1..0895b78b59 100644
--- a/hw/misc/macio/pmu.c
+++ b/hw/misc/macio/pmu.c
@@ -40,6 +40,7 @@
 #include "hw/misc/macio/pmu.h"
 #include "qemu/timer.h"
 #include "sysemu/runstate.h"
+#include "qapi/error.h"
 #include "qemu/cutils.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
@@ -739,16 +740,20 @@ static void pmu_reset(DeviceState *dev)
 static void pmu_realize(DeviceState *dev, Error **errp)
 {
     PMUState *s = VIA_PMU(dev);
+    Error *err = NULL;
     SysBusDevice *sbd;
-    MOS6522State *ms;
-    DeviceState *d;
     struct tm tm;
 
+    object_property_set_bool(OBJECT(&s->mos6522_pmu), true, "realized",
+                             &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
     /* Pass IRQ from 6522 */
-    d = DEVICE(&s->mos6522_pmu);
-    ms = MOS6522(d);
     sbd = SYS_BUS_DEVICE(s);
-    sysbus_pass_irq(sbd, SYS_BUS_DEVICE(ms));
+    sysbus_pass_irq(sbd, SYS_BUS_DEVICE(&s->mos6522_pmu));
 
     qemu_get_timedate(&tm, 0);
     s->tick_offset = (uint32_t)mktimegm(&tm) + RTC_OFFSET;
-- 
2.26.2


