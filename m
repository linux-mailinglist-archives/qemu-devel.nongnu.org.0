Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4831FA1F0
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jun 2020 22:47:33 +0200 (CEST)
Received: from localhost ([::1]:58302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkw0y-0004BQ-V3
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 16:47:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jkvu7-0002ae-5y
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 16:40:27 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:48527
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jkvu5-0000VV-DH
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 16:40:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592253624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rd8rJibFwW2Da7IE5EPhqB8KHe53zDefvJz6ub3lYDo=;
 b=Kr5NkvT86jMtK38YBka3wsKTiX6iBqF+33cyRQvaJu7JYabtAnSlwPLplOeBMM32XXGVOD
 vr3faUKTkT1Zijdtfv4h9UEaNjkJdNRIFFmfWmSwY2XZ55lQc1iRwBuZ5SQrjmnyT/6Nt5
 czfnpP+LIibDCxz+HErDNpsE4gahDkk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-MzD0h1eWMoy56BR7jGOlfg-1; Mon, 15 Jun 2020 16:40:20 -0400
X-MC-Unique: MzD0h1eWMoy56BR7jGOlfg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6D9B1091327;
 Mon, 15 Jun 2020 20:40:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B06546ED96;
 Mon, 15 Jun 2020 20:40:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3D5DC1138538; Mon, 15 Jun 2020 22:40:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/84] mac_via: Fix to realize "mos6522-q800-via*" devices
Date: Mon, 15 Jun 2020 22:38:54 +0200
Message-Id: <20200615204008.3069956-11-armbru@redhat.com>
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

mac_via_realize() creates a "mos6522-q800-via1" and a
"mos6522-q800-via2" device, but neglects to realize them.  Affects
machine q800.

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

Fix by realizing them right away.

Fixes: 6dca62a0000f95e0b7020aa00d0ca9b2c421f341
Cc: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20200609122339.937862-9-armbru@redhat.com>
Tested-by: Laurent Vivier <laurent@vivier.eu>
Acked-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/misc/mac_via.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index e05623d730..82614c155a 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -890,6 +890,11 @@ static void mac_via_realize(DeviceState *dev, Error **errp)
     object_property_add_alias(OBJECT(dev), "irq[1]", OBJECT(ms),
                               SYSBUS_DEVICE_GPIO_IRQ "[0]");
 
+    object_property_set_bool(OBJECT(&m->mos6522_via1), true, "realized",
+                             &error_abort);
+    object_property_set_bool(OBJECT(&m->mos6522_via2), true, "realized",
+                             &error_abort);
+
     /* Pass through mos6522 input IRQs */
     qdev_pass_gpios(DEVICE(&m->mos6522_via1), dev, "via1-irq");
     qdev_pass_gpios(DEVICE(&m->mos6522_via2), dev, "via2-irq");
-- 
2.26.2


