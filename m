Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFDF1FA292
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jun 2020 23:12:56 +0200 (CEST)
Received: from localhost ([::1]:60526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkwPX-0007hm-6R
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 17:12:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jkvuf-0003YJ-Lu
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 16:41:01 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:44632
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jkvua-0000gv-2d
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 16:41:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592253651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vyJJny2n+uv4N9Ypg1gW88LQd4WLpK2YY9vPs+d/TRA=;
 b=aqD3Q8ND/q8SK3Hvpkh1KGDstP0I11yO4XsayH8V28TSAIHZlm+ZOQR0NP1eGmrF09zeS5
 Fmiojjs9D+iZCx5zBKXbzTOKL7nBPiiVzSgt32GwJXE5sHNhauJ5XVDvjMKQaCEF+8h4Mc
 gmKlnZs13rEX6arcWVbFRSEe0nhosu0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-OgafaLUTOC-vc7BRXjbXtg-1; Mon, 15 Jun 2020 16:40:49 -0400
X-MC-Unique: OgafaLUTOC-vc7BRXjbXtg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38FAA1091325
 for <qemu-devel@nongnu.org>; Mon, 15 Jun 2020 20:40:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0AA0E5D9CD;
 Mon, 15 Jun 2020 20:40:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 936BE113523F; Mon, 15 Jun 2020 22:40:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 34/84] qdev: Convert to qdev_unrealize() manually
Date: Mon, 15 Jun 2020 22:39:18 +0200
Message-Id: <20200615204008.3069956-35-armbru@redhat.com>
In-Reply-To: <20200615204008.3069956-1-armbru@redhat.com>
References: <20200615204008.3069956-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/15 15:33:04
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

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20200610053247.1583243-9-armbru@redhat.com>
---
 include/hw/qdev-core.h | 1 -
 hw/core/qdev.c         | 4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index fba29308f7..be6f7c4736 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -328,7 +328,6 @@ void qdev_init_nofail(DeviceState *dev);
 bool qdev_realize(DeviceState *dev, BusState *bus, Error **errp);
 bool qdev_realize_and_unref(DeviceState *dev, BusState *bus, Error **errp);
 void qdev_unrealize(DeviceState *dev);
-
 void qdev_set_legacy_instance_id(DeviceState *dev, int alias_id,
                                  int required_for_version);
 HotplugHandler *qdev_get_bus_hotplug_handler(DeviceState *dev);
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index b7355fbcd0..4768244f31 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -421,7 +421,7 @@ static void device_reset_child_foreach(Object *obj, ResettableChildCallback cb,
 void qdev_simple_device_unplug_cb(HotplugHandler *hotplug_dev,
                                   DeviceState *dev, Error **errp)
 {
-    object_property_set_bool(OBJECT(dev), false, "realized", &error_abort);
+    qdev_unrealize(dev);
 }
 
 /*
@@ -1183,7 +1183,7 @@ static void device_unparent(Object *obj)
     BusState *bus;
 
     if (dev->realized) {
-        object_property_set_bool(obj, false, "realized", &error_abort);
+        qdev_unrealize(dev);
     }
     while (dev->num_child_bus) {
         bus = QLIST_FIRST(&dev->child_bus);
-- 
2.26.2


