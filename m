Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A3721540F
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jul 2020 10:35:56 +0200 (CEST)
Received: from localhost ([::1]:38794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsMbT-0004oZ-2m
	for lists+qemu-devel@lfdr.de; Mon, 06 Jul 2020 04:35:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jsMCz-0002nE-Or
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 04:10:37 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47325
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jsMCT-0003Id-3N
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 04:10:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594023004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qpZYK+l6bhxWwhREZbAL9oi0CNZv/UNo2VRaFzxpXOU=;
 b=g7w4zrAk3jalImCFhtz8dglz5reweY2BbUlMqm0He7YfQ3BP3dJk/T6c7duW+GOYV4UblZ
 pVCSRyAhuYh32UJbDJkYzkvjM0+meB9Y9zx1MX1NzlhiXYv4OEQxFymVfuiiWMBUgjcy3b
 VL8ea1rAjsLP6h8m5pib7W4zGOh0Fuo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-1zSz-dfHNeGD6LhTHTeSLA-1; Mon, 06 Jul 2020 04:09:58 -0400
X-MC-Unique: 1zSz-dfHNeGD6LhTHTeSLA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5935B1883619;
 Mon,  6 Jul 2020 08:09:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 22C9260BF3;
 Mon,  6 Jul 2020 08:09:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3B5DC113522D; Mon,  6 Jul 2020 10:09:51 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 28/44] qom: Use returned bool to check for failure,
 manual part
Date: Mon,  6 Jul 2020 10:09:34 +0200
Message-Id: <20200706080950.403087-29-armbru@redhat.com>
In-Reply-To: <20200706080950.403087-1-armbru@redhat.com>
References: <20200706080950.403087-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/06 01:52:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, groug@kaod.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The previous commit used Coccinelle to convert from checking the Error
object to checking the return value.  Convert a few more manually.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 hw/core/bus.c              |  6 +-----
 hw/core/qdev.c             |  7 +------
 hw/s390x/s390-virtio-ccw.c | 13 +++++++------
 3 files changed, 9 insertions(+), 17 deletions(-)

diff --git a/hw/core/bus.c b/hw/core/bus.c
index 00d1d31762..6b987b6946 100644
--- a/hw/core/bus.c
+++ b/hw/core/bus.c
@@ -166,11 +166,7 @@ BusState *qbus_create(const char *typename, DeviceState *parent, const char *nam
 
 bool qbus_realize(BusState *bus, Error **errp)
 {
-    Error *err = NULL;
-
-    object_property_set_bool(OBJECT(bus), "realized", true, &err);
-    error_propagate(errp, err);
-    return !err;
+    return object_property_set_bool(OBJECT(bus), "realized", true, errp);
 }
 
 void qbus_unrealize(BusState *bus)
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index d6416fb894..17bd8fc2ec 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -386,8 +386,6 @@ void qdev_simple_device_unplug_cb(HotplugHandler *hotplug_dev,
  */
 bool qdev_realize(DeviceState *dev, BusState *bus, Error **errp)
 {
-    Error *err = NULL;
-
     assert(!dev->realized && !dev->parent_bus);
 
     if (bus) {
@@ -396,10 +394,7 @@ bool qdev_realize(DeviceState *dev, BusState *bus, Error **errp)
         assert(!DEVICE_GET_CLASS(dev)->bus_type);
     }
 
-    if (!object_property_set_bool(OBJECT(dev), "realized", true, &err)) {
-        error_propagate(errp, err);
-    }
-    return !err;
+    return object_property_set_bool(OBJECT(dev), "realized", true, errp);
 }
 
 /*
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 62af349c31..f7a68343ef 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -70,19 +70,20 @@ static S390CPU *s390x_new_cpu(const char *typename, uint32_t core_id,
 {
     S390CPU *cpu = S390_CPU(object_new(typename));
     Error *err = NULL;
+    S390CPU *ret = NULL;
 
     if (!object_property_set_int(OBJECT(cpu), "core-id", core_id, &err)) {
         goto out;
     }
-    qdev_realize(DEVICE(cpu), NULL, &err);
+    if (!qdev_realize(DEVICE(cpu), NULL, &err)) {
+        goto out;
+    }
+    ret = cpu;
 
 out:
     object_unref(OBJECT(cpu));
-    if (err) {
-        error_propagate(errp, err);
-        cpu = NULL;
-    }
-    return cpu;
+    error_propagate(errp, err);
+    return ret;
 }
 
 static void s390_init_cpus(MachineState *machine)
-- 
2.26.2


