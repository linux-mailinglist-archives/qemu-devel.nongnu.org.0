Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBD41FA2FA
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jun 2020 23:39:37 +0200 (CEST)
Received: from localhost ([::1]:47770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkwpM-0007uW-BV
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 17:39:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jkw6j-0006N5-G1
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 16:53:29 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:40840
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jkw6h-0002Zx-OC
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 16:53:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592254407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XspKplkkGC3H6N9voSjI3xvUOJlfM1ITQDFN+GfAPzw=;
 b=IHjuoyE/W7pvqoOBqx3TZc0pbJaf0I3pNAbBbymznHTrSRp7zyBr2ZuAo/agMVsX69Vr0l
 KsN8V/QEGBANuOAI1bldvZCCz9Bu1IiRzmbKkVgIYN84joJqXW3scIAQvdCAPWyV9dyWSp
 OINKSD/PAXHIV/Es/aQtVY+gJqUyWk0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-AGJbpY6tPGG-1MbyJqywmQ-1; Mon, 15 Jun 2020 16:53:25 -0400
X-MC-Unique: AGJbpY6tPGG-1MbyJqywmQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8835DBE2
 for <qemu-devel@nongnu.org>; Mon, 15 Jun 2020 20:53:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9903E768AA;
 Mon, 15 Jun 2020 20:53:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 56D571131C02; Mon, 15 Jun 2020 22:40:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 77/84] sysbus: sysbus_init_child_obj() is now unused, drop
Date: Mon, 15 Jun 2020 22:40:01 +0200
Message-Id: <20200615204008.3069956-78-armbru@redhat.com>
In-Reply-To: <20200615204008.3069956-1-armbru@redhat.com>
References: <20200615204008.3069956-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20200610053247.1583243-52-armbru@redhat.com>
---
 include/hw/sysbus.h | 17 -----------------
 hw/core/sysbus.c    |  8 --------
 2 files changed, 25 deletions(-)

diff --git a/include/hw/sysbus.h b/include/hw/sysbus.h
index 606095ba35..da9f85c58c 100644
--- a/include/hw/sysbus.h
+++ b/include/hw/sysbus.h
@@ -93,23 +93,6 @@ MemoryRegion *sysbus_address_space(SysBusDevice *dev);
 bool sysbus_realize(SysBusDevice *dev, Error **errp);
 bool sysbus_realize_and_unref(SysBusDevice *dev, Error **errp);
 
-/**
- * sysbus_init_child_obj:
- * @parent: The parent object
- * @childname: Used as name of the "child<>" property in the parent
- * @child: A pointer to the memory to be used for the object.
- * @childsize: The maximum size available at @child for the object.
- * @childtype: The name of the type of the object to instantiate.
- *
- * This function will initialize an object and attach it to the main system
- * bus. The memory for the object should have already been allocated. The
- * object will then be added as child to the given parent. The returned object
- * has a reference count of 1 (for the "child<...>" property from the parent),
- * so the object will be finalized automatically when the parent gets removed.
- */
-void sysbus_init_child_obj(Object *parent, const char *childname, void *child,
-                           size_t childsize, const char *childtype);
-
 /* Call func for every dynamically created sysbus device in the system */
 void foreach_dynamic_sysbus_device(FindSysbusDeviceFunc *func, void *opaque);
 
diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index 1220298e8f..70239b7e7d 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -355,14 +355,6 @@ BusState *sysbus_get_default(void)
     return main_system_bus;
 }
 
-void sysbus_init_child_obj(Object *parent, const char *childname, void *child,
-                           size_t childsize, const char *childtype)
-{
-    object_initialize_child_with_props(parent, childname, child, childsize,
-                                       childtype, &error_abort, NULL);
-    qdev_set_parent_bus(DEVICE(child), sysbus_get_default());
-}
-
 static void sysbus_register_types(void)
 {
     type_register_static(&system_bus_info);
-- 
2.26.2


