Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEAA3EA2F0
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 12:24:48 +0200 (CEST)
Received: from localhost ([::1]:41716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE7tH-0004UF-3k
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 06:24:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mE7sU-0003q2-JH
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 06:23:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mE7sR-00085P-U7
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 06:23:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628763834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gkC2uVklQOfwXYmwKVIiZqWOhJtFJ5X6r/F8uiF5Ihs=;
 b=I7r2S1WvIYpCfuPcu7PBhdnxFKnG9D5hcufwOsRL2/9+lk8H6cUM0m6rB54bMW8e1pPWUh
 407mE44u8DXm0mqy0EWlWq3F24xcHXjee6m5+FiMH4OoJBVf8G7bO0zHG3kOLOggZXt0MQ
 c/6ADEDFf/qL6LZqNuMpY+uxUcAh01I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-X1f3to24O-21SeHTxMOeYg-1; Thu, 12 Aug 2021 06:23:52 -0400
X-MC-Unique: X1f3to24O-21SeHTxMOeYg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1C248015C7;
 Thu, 12 Aug 2021 10:23:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A62BB5D9D5;
 Thu, 12 Aug 2021 10:23:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1093D1800922; Thu, 12 Aug 2021 12:23:42 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] q35: catch invalid cpu hotplug configuration
Date: Thu, 12 Aug 2021 12:23:41 +0200
Message-Id: <20210812102341.3316254-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Related: https://bugzilla.redhat.com//show_bug.cgi?id=1985924
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/isa/lpc_ich9.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 5f9de0239cf9..5f143dca17aa 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -31,6 +31,7 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "cpu.h"
+#include "qapi/error.h"
 #include "qapi/visitor.h"
 #include "qemu/range.h"
 #include "hw/isa/isa.h"
@@ -676,6 +677,18 @@ static void ich9_lpc_realize(PCIDevice *d, Error **errp)
     DeviceState *dev = DEVICE(d);
     ISABus *isa_bus;
 
+    if ((lpc->smi_host_features & BIT_ULL(ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT)) &&
+        !(lpc->smi_host_features & BIT_ULL(ICH9_LPC_SMI_F_CPU_HOTPLUG_BIT))) {
+        /*
+         * smi_features_ok_callback() throws an error on this.
+         *
+         * So bail out here instead of advertizing the invalid
+         * configuration and get obscure firmware failures from that.
+         */
+        error_setg(errp, "cpu hot-unplug requires cpu hot-plug");
+        return;
+    }
+
     isa_bus = isa_bus_new(DEVICE(d), get_system_memory(), get_system_io(),
                           errp);
     if (!isa_bus) {
-- 
2.31.1


