Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7552A1F4CFC
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jun 2020 07:34:54 +0200 (CEST)
Received: from localhost ([::1]:34316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jitO1-0006px-EH
	for lists+qemu-devel@lfdr.de; Wed, 10 Jun 2020 01:34:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jitM7-0004v1-9t
 for qemu-devel@nongnu.org; Wed, 10 Jun 2020 01:32:55 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:52610
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jitM5-0003o0-KK
 for qemu-devel@nongnu.org; Wed, 10 Jun 2020 01:32:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591767172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JmfV2lyXxzyriLghLZNE7LX24yAODMlBXvgUNemIP7U=;
 b=IcMrkDthG4D3T9SnHBueTICs4Sc0dvDfNiZ75OB9uh3m4C5v71+qDiMJSmanK0q3APTzIa
 ZlG5edh2juueHCt6D54SwTgsyL5eUZ5Taf8asmswknIGledj3d7j1JXKtJm0FymS5qsu9Q
 ciHt1kGiHnXPnjCEduqhG2RI7B2IUDo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-zPajVVifPBGGIytMhblzgg-1; Wed, 10 Jun 2020 01:32:50 -0400
X-MC-Unique: zPajVVifPBGGIytMhblzgg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 587A8A0BD7
 for <qemu-devel@nongnu.org>; Wed, 10 Jun 2020 05:32:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 282E519C71;
 Wed, 10 Jun 2020 05:32:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AC3F811385C2; Wed, 10 Jun 2020 07:32:47 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND v3 01/58] qdev: Rename qbus_realize() to qbus_init()
Date: Wed, 10 Jun 2020 07:31:50 +0200
Message-Id: <20200610053247.1583243-2-armbru@redhat.com>
In-Reply-To: <20200610053247.1583243-1-armbru@redhat.com>
References: <20200610053247.1583243-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 21:17:20
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qbus_realize() does not actually realize.  Rename it to qbus_init().

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/bus.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/core/bus.c b/hw/core/bus.c
index 50924793ac..33a4443217 100644
--- a/hw/core/bus.c
+++ b/hw/core/bus.c
@@ -95,7 +95,7 @@ static void bus_reset_child_foreach(Object *obj, ResettableChildCallback cb,
     }
 }
 
-static void qbus_realize(BusState *bus, DeviceState *parent, const char *name)
+static void qbus_init(BusState *bus, DeviceState *parent, const char *name)
 {
     const char *typename = object_get_typename(OBJECT(bus));
     BusClass *bc;
@@ -151,7 +151,7 @@ void qbus_create_inplace(void *bus, size_t size, const char *typename,
                          DeviceState *parent, const char *name)
 {
     object_initialize(bus, size, typename);
-    qbus_realize(bus, parent, name);
+    qbus_init(bus, parent, name);
 }
 
 BusState *qbus_create(const char *typename, DeviceState *parent, const char *name)
@@ -159,7 +159,7 @@ BusState *qbus_create(const char *typename, DeviceState *parent, const char *nam
     BusState *bus;
 
     bus = BUS(object_new(typename));
-    qbus_realize(bus, parent, name);
+    qbus_init(bus, parent, name);
 
     return bus;
 }
-- 
2.26.2


