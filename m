Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 083A01FA2C1
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jun 2020 23:27:10 +0200 (CEST)
Received: from localhost ([::1]:54386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkwdJ-0003t7-0G
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 17:27:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jkw23-000765-N8
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 16:48:39 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:36386
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jkw1z-0001sf-1m
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 16:48:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592254114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9PZ7gMsnDkZfsT8dOpZ8N54q8zd64/tNpgRjpJ9uTVQ=;
 b=MA9NBV+AsUVoZAhCUoVpJmrXR2E2zRs9xOzZvY2tvFhCSJNEqfQLbW/2X1PcCozBLhEJN5
 H/UXLt+X5f3Egnp7stwoOg0IBHUQtW3YiuICo6c9Ex/OzfwLl1gvzKSMvvtzcHDG6Fcxxk
 tdWrmAhIc6v1A9A1WzSoA3ZvWW2Ita4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-KxA-TmsBPeCXj4d6Pv6wDw-1; Mon, 15 Jun 2020 16:48:31 -0400
X-MC-Unique: KxA-TmsBPeCXj4d6Pv6wDw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E089B104ECFD
 for <qemu-devel@nongnu.org>; Mon, 15 Jun 2020 20:48:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B10DF1002394;
 Mon, 15 Jun 2020 20:48:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 00E7A1132C0D; Mon, 15 Jun 2020 22:40:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 60/84] auxbus: Eliminate aux_create_slave()
Date: Mon, 15 Jun 2020 22:39:44 +0200
Message-Id: <20200615204008.3069956-61-armbru@redhat.com>
In-Reply-To: <20200615204008.3069956-1-armbru@redhat.com>
References: <20200615204008.3069956-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/15 16:38:57
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

aux_create_slave() has become a trivial wrapper around qdev_new().
There's just one user.  Eliminate.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20200610053247.1583243-35-armbru@redhat.com>
---
 include/hw/misc/auxbus.h | 7 -------
 hw/display/xlnx_dp.c     | 2 +-
 hw/misc/auxbus.c         | 9 ---------
 3 files changed, 1 insertion(+), 17 deletions(-)

diff --git a/include/hw/misc/auxbus.h b/include/hw/misc/auxbus.h
index 0d849d9d89..15a8973517 100644
--- a/include/hw/misc/auxbus.h
+++ b/include/hw/misc/auxbus.h
@@ -131,13 +131,6 @@ I2CBus *aux_get_i2c_bus(AUXBus *bus);
  */
 void aux_init_mmio(AUXSlave *aux_slave, MemoryRegion *mmio);
 
-/* aux_create_slave: Create a new device on an AUX bus
- *
- * @bus The AUX bus for the new device.
- * @name The type of the device to be created.
- */
-DeviceState *aux_create_slave(AUXBus *bus, const char *name);
-
 /* aux_map_slave: Map the mmio for an AUX slave on the bus.
  *
  * @dev The AUX slave.
diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index 884d29c8ce..c56e6ec593 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -1249,7 +1249,7 @@ static void xlnx_dp_init(Object *obj)
     /*
      * Initialize DPCD and EDID..
      */
-    s->dpcd = DPCD(aux_create_slave(s->aux_bus, "dpcd"));
+    s->dpcd = DPCD(qdev_new("dpcd"));
     object_property_add_child(OBJECT(s), "dpcd", OBJECT(s->dpcd));
 
     s->edid = I2CDDC(qdev_new("i2c-ddc"));
diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
index 5c9c23a336..da361baa32 100644
--- a/hw/misc/auxbus.c
+++ b/hw/misc/auxbus.c
@@ -273,15 +273,6 @@ static void aux_slave_dev_print(Monitor *mon, DeviceState *dev, int indent)
                    memory_region_size(s->mmio));
 }
 
-DeviceState *aux_create_slave(AUXBus *bus, const char *type)
-{
-    DeviceState *dev;
-
-    dev = qdev_new(type);
-    assert(dev);
-    return dev;
-}
-
 void aux_init_mmio(AUXSlave *aux_slave, MemoryRegion *mmio)
 {
     assert(!aux_slave->mmio);
-- 
2.26.2


