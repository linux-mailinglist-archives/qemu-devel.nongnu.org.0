Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7838B1F41BE
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jun 2020 19:08:08 +0200 (CEST)
Received: from localhost ([::1]:47164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jihjL-0002hQ-H2
	for lists+qemu-devel@lfdr.de; Tue, 09 Jun 2020 13:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jihI3-0004P4-8T
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 12:39:55 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44421
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jihHw-0003Dc-Oa
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 12:39:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591720782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0uSbbrkYIbHdT4M5NbwKve6LKwSignSXpqv+lGxQxW4=;
 b=EtZX6ISCG2ssVrK4BdxJD2jgPFeKc9g+n3woKl8QAH+5SGQVp00Ep3xuQXrdEIX8mdcX9j
 qy8YPZx1IhU2kaqj6lUQcPLfNFS4kBMBEc5nhf8jU4vdijdB8aa4V4t1y4AYNe4BubFbv4
 Q48TubhRVZVLv2+FcbAa2DRWADmNG7A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-3Zd5_PewNGquusc9aUne6A-1; Tue, 09 Jun 2020 12:39:40 -0400
X-MC-Unique: 3Zd5_PewNGquusc9aUne6A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1374418FE861
 for <qemu-devel@nongnu.org>; Tue,  9 Jun 2020 16:39:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D9DBB5D9E5;
 Tue,  9 Jun 2020 16:39:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5F9761138477; Tue,  9 Jun 2020 18:39:33 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 33/39] auxbus: Convert a use of qdev_set_parent_bus()
Date: Tue,  9 Jun 2020 18:39:26 +0200
Message-Id: <20200609163932.1566209-34-armbru@redhat.com>
In-Reply-To: <20200609163932.1566209-1-armbru@redhat.com>
References: <20200609163932.1566209-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 01:38:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert qdev_set_parent_bus()/qdev_init_nofail() to qdev_realize();
recent commit "qdev: New qdev_new(), qdev_realize(), etc." explains
why.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/display/xlnx_dp.c | 2 +-
 hw/misc/auxbus.c     | 4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index a714cf8a50..884d29c8ce 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -1268,7 +1268,7 @@ static void xlnx_dp_realize(DeviceState *dev, Error **errp)
 
     aux_bus_realize(s->aux_bus);
 
-    qdev_init_nofail(DEVICE(s->dpcd));
+    qdev_realize(DEVICE(s->dpcd), BUS(s->aux_bus), &error_fatal);
     aux_map_slave(AUX_SLAVE(s->dpcd), 0x0000);
 
     qdev_realize_and_unref(DEVICE(s->edid), BUS(aux_get_i2c_bus(s->aux_bus)),
diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
index 113f4278aa..e7a5d26158 100644
--- a/hw/misc/auxbus.c
+++ b/hw/misc/auxbus.c
@@ -70,7 +70,6 @@ AUXBus *aux_bus_init(DeviceState *parent, const char *name)
     bus = AUX_BUS(qbus_create(TYPE_AUX_BUS, parent, name));
     auxtoi2c = object_new_with_props(TYPE_AUXTOI2C, OBJECT(bus), "i2c",
                                      &error_abort, NULL);
-    qdev_set_parent_bus(DEVICE(auxtoi2c), BUS(bus));
 
     bus->bridge = AUXTOI2C(auxtoi2c);
 
@@ -83,7 +82,7 @@ AUXBus *aux_bus_init(DeviceState *parent, const char *name)
 
 void aux_bus_realize(AUXBus *bus)
 {
-    qdev_init_nofail(DEVICE(bus->bridge));
+    qdev_realize(DEVICE(bus->bridge), BUS(bus), &error_fatal);
 }
 
 void aux_map_slave(AUXSlave *aux_dev, hwaddr addr)
@@ -280,7 +279,6 @@ DeviceState *aux_create_slave(AUXBus *bus, const char *type)
 
     dev = qdev_new(type);
     assert(dev);
-    qdev_set_parent_bus(dev, &bus->qbus);
     return dev;
 }
 
-- 
2.26.2


