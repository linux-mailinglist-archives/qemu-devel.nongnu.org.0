Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7CD1E7F3C
	for <lists+qemu-devel@lfdr.de>; Fri, 29 May 2020 15:52:45 +0200 (CEST)
Received: from localhost ([::1]:40408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jefRE-00074S-VT
	for lists+qemu-devel@lfdr.de; Fri, 29 May 2020 09:52:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jefKN-0002hs-6h
 for qemu-devel@nongnu.org; Fri, 29 May 2020 09:45:39 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:59535
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jefKJ-00072E-1M
 for qemu-devel@nongnu.org; Fri, 29 May 2020 09:45:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590759934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b+xq2Bbv6cnyXBLe9hW8XvEXj2lOcW1J/oXTgBPgmF8=;
 b=ennAb1vWe2UkjM0Tno1HPGiFW0cgC2oogT7jOGepSka/TdSQzasJjTckb/NGy2vqbpR3zP
 sTqrTMk45IiRmaENFZyOE1roDjKr1hkpsk3V5Q0sWFK35a4DdoFOkuJ2x0ZfUlzOa13H56
 WEOL3CLIla06Mtq2AbT2kovkrRXf9b0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-Smi31wnGP7mVkbCD7yh4yQ-1; Fri, 29 May 2020 09:45:32 -0400
X-MC-Unique: Smi31wnGP7mVkbCD7yh4yQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0B1A107ACF5
 for <qemu-devel@nongnu.org>; Fri, 29 May 2020 13:45:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 83AEE6298C;
 Fri, 29 May 2020 13:45:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 45DF81135224; Fri, 29 May 2020 15:45:24 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 31/58] auxbus: Rename aux_init_bus() to aux_bus_init()
Date: Fri, 29 May 2020 15:44:56 +0200
Message-Id: <20200529134523.8477-32-armbru@redhat.com>
In-Reply-To: <20200529134523.8477-1-armbru@redhat.com>
References: <20200529134523.8477-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/hw/misc/auxbus.h | 4 ++--
 hw/display/xlnx_dp.c     | 2 +-
 hw/misc/auxbus.c         | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/hw/misc/auxbus.h b/include/hw/misc/auxbus.h
index a539a98c4b..5cfd7a9284 100644
--- a/include/hw/misc/auxbus.h
+++ b/include/hw/misc/auxbus.h
@@ -84,14 +84,14 @@ struct AUXSlave {
 };
 
 /**
- * aux_init_bus: Initialize an AUX bus.
+ * aux_bus_init: Initialize an AUX bus.
  *
  * Returns the new AUX bus created.
  *
  * @parent The device where this bus is located.
  * @name The name of the bus.
  */
-AUXBus *aux_init_bus(DeviceState *parent, const char *name);
+AUXBus *aux_bus_init(DeviceState *parent, const char *name);
 
 /*
  * aux_request: Make a request on the bus.
diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index dd6aa172f3..6122167771 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -1242,7 +1242,7 @@ static void xlnx_dp_init(Object *obj)
     /*
      * Initialize AUX Bus.
      */
-    s->aux_bus = aux_init_bus(DEVICE(obj), "aux");
+    s->aux_bus = aux_bus_init(DEVICE(obj), "aux");
 
     /*
      * Initialize DPCD and EDID..
diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
index 7fb020086f..2e1c27e842 100644
--- a/hw/misc/auxbus.c
+++ b/hw/misc/auxbus.c
@@ -62,7 +62,7 @@ static void aux_bus_class_init(ObjectClass *klass, void *data)
     k->print_dev = aux_slave_dev_print;
 }
 
-AUXBus *aux_init_bus(DeviceState *parent, const char *name)
+AUXBus *aux_bus_init(DeviceState *parent, const char *name)
 {
     AUXBus *bus;
     Object *auxtoi2c;
@@ -225,7 +225,7 @@ static void aux_bridge_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
 
     /* This device is private and is created only once for each
-     * aux-bus in aux_init_bus(..). So don't allow the user to add one.
+     * aux-bus in aux_bus_init(..). So don't allow the user to add one.
      */
     dc->user_creatable = false;
 }
-- 
2.21.3


