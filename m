Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 862711FA290
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jun 2020 23:12:19 +0200 (CEST)
Received: from localhost ([::1]:59132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkwOw-00076W-Ie
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 17:12:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jkvuR-0003F4-OR
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 16:40:47 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:23248
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jkvuK-0000Zo-Ow
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 16:40:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592253639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RE1dT4X0pXhJk5SKjj1PZfZX3Cv7LEcbkluEwgKx3ak=;
 b=i2y1rV9YLDua6hMwcZKP3GTmol5e+FzzcE4sXQtcObq0COfGlScLYQa0ULULNZnfHIhFhE
 e5lijJ2ijIiLC3RZYKi77BtffienJszTqS0DQtQ50KvrX+Lo1hSySX0jggKVInmfyrIbji
 3LjBqWNejomAVNTGojVWJHQNjuvtCO0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-yZXiH1U5PlevJ_9e9_nyBQ-1; Mon, 15 Jun 2020 16:40:38 -0400
X-MC-Unique: yZXiH1U5PlevJ_9e9_nyBQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4ECA2803308
 for <qemu-devel@nongnu.org>; Mon, 15 Jun 2020 20:40:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 21C127CAB1;
 Mon, 15 Jun 2020 20:40:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7716E1135227; Mon, 15 Jun 2020 22:40:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 26/84] qdev: Assert onboard devices all get realized properly
Date: Mon, 15 Jun 2020 22:39:10 +0200
Message-Id: <20200615204008.3069956-27-armbru@redhat.com>
In-Reply-To: <20200615204008.3069956-1-armbru@redhat.com>
References: <20200615204008.3069956-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/15 15:33:00
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This would have caught some of the bugs I just fixed.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20200609122339.937862-25-armbru@redhat.com>
---
 hw/core/qdev.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index b5b42b2616..a68ba674db 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -427,6 +427,19 @@ void qdev_init_nofail(DeviceState *dev)
     object_unref(OBJECT(dev));
 }
 
+static int qdev_assert_realized_properly(Object *obj, void *opaque)
+{
+    DeviceState *dev = DEVICE(object_dynamic_cast(obj, TYPE_DEVICE));
+    DeviceClass *dc;
+
+    if (dev) {
+        dc = DEVICE_GET_CLASS(dev);
+        assert(dev->realized);
+        assert(dev->parent_bus || !dc->bus_type);
+    }
+    return 0;
+}
+
 void qdev_machine_creation_done(void)
 {
     /*
@@ -434,6 +447,9 @@ void qdev_machine_creation_done(void)
      * only create hotpluggable devices
      */
     qdev_hotplug = true;
+
+    object_child_foreach_recursive(object_get_root(),
+                                   qdev_assert_realized_properly, NULL);
 }
 
 bool qdev_machine_modified(void)
-- 
2.26.2


