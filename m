Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E25841E7F6C
	for <lists+qemu-devel@lfdr.de>; Fri, 29 May 2020 15:58:32 +0200 (CEST)
Received: from localhost ([::1]:37636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jefWp-0000vw-Sf
	for lists+qemu-devel@lfdr.de; Fri, 29 May 2020 09:58:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jefKN-0002iY-GD
 for qemu-devel@nongnu.org; Fri, 29 May 2020 09:45:39 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:36314
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jefKJ-00073K-Gk
 for qemu-devel@nongnu.org; Fri, 29 May 2020 09:45:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590759934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nNeZLg02kHizW5oArB/BGfOomX5md7H65Qta24lxAhU=;
 b=RWBiGkBCO0YKQvt7BkU9UKcTt+058AWOhcey3MPlxJq+RHxLd56HUwP8+16VK5I7DGESqF
 iHG+BmMF2bSm8ZqCiXsGsR1QiqOA5M81Kxwa8zbYWuhWENe3DefuxWoaKNryCwPVLR40EE
 BvPzSsLCcI48S3LlmDdm/BSfWDy4jYE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-EBO5PSxBPR2v0HRq8tTIqw-1; Fri, 29 May 2020 09:45:32 -0400
X-MC-Unique: EBO5PSxBPR2v0HRq8tTIqw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4EBF8015CF
 for <qemu-devel@nongnu.org>; Fri, 29 May 2020 13:45:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 88685100164C;
 Fri, 29 May 2020 13:45:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4942B1135226; Fri, 29 May 2020 15:45:24 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 32/58] auxbus: New aux_bus_realize(),
 pairing with aux_bus_init()
Date: Fri, 29 May 2020 15:44:57 +0200
Message-Id: <20200529134523.8477-33-armbru@redhat.com>
In-Reply-To: <20200529134523.8477-1-armbru@redhat.com>
References: <20200529134523.8477-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/29 01:27:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

aux_bus_init() encapsulates the creation of an aux-bus and its
aux-to-i2c-bridge device.

Create aux_bus_realize() to similarly encapsulate their realization.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/misc/auxbus.h | 7 +++++++
 hw/display/xlnx_dp.c     | 2 +-
 hw/misc/auxbus.c         | 5 +++++
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/include/hw/misc/auxbus.h b/include/hw/misc/auxbus.h
index 5cfd7a9284..0d849d9d89 100644
--- a/include/hw/misc/auxbus.h
+++ b/include/hw/misc/auxbus.h
@@ -93,6 +93,13 @@ struct AUXSlave {
  */
 AUXBus *aux_bus_init(DeviceState *parent, const char *name);
 
+/**
+ * aux_bus_realize: Realize an AUX bus.
+ *
+ * @bus: The AUX bus.
+ */
+void aux_bus_realize(AUXBus *bus);
+
 /*
  * aux_request: Make a request on the bus.
  *
diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index 6122167771..900d95fc93 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -1264,7 +1264,7 @@ static void xlnx_dp_realize(DeviceState *dev, Error **errp)
     DisplaySurface *surface;
     struct audsettings as;
 
-    qdev_init_nofail(DEVICE(s->aux_bus->bridge));
+    aux_bus_realize(s->aux_bus);
 
     qdev_init_nofail(DEVICE(s->dpcd));
     aux_map_slave(AUX_SLAVE(s->dpcd), 0x0000);
diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
index 2e1c27e842..113f4278aa 100644
--- a/hw/misc/auxbus.c
+++ b/hw/misc/auxbus.c
@@ -81,6 +81,11 @@ AUXBus *aux_bus_init(DeviceState *parent, const char *name)
     return bus;
 }
 
+void aux_bus_realize(AUXBus *bus)
+{
+    qdev_init_nofail(DEVICE(bus->bridge));
+}
+
 void aux_map_slave(AUXSlave *aux_dev, hwaddr addr)
 {
     DeviceState *dev = DEVICE(aux_dev);
-- 
2.21.3


