Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 815C31D9AE2
	for <lists+qemu-devel@lfdr.de>; Tue, 19 May 2020 17:13:15 +0200 (CEST)
Received: from localhost ([::1]:39626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jb3ve-0002In-Il
	for lists+qemu-devel@lfdr.de; Tue, 19 May 2020 11:13:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jb3fA-0001ZY-A9
 for qemu-devel@nongnu.org; Tue, 19 May 2020 10:56:12 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:50093
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jb3f3-0003XJ-9J
 for qemu-devel@nongnu.org; Tue, 19 May 2020 10:56:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589900164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sLwUB7ki+fyuaqAUR2EQQnWJjwqFXyWa3+g/e4ELQSk=;
 b=Dl1QwaEh/eaNV4AlSsrnmptrAWaM9YLWa5Y1Yi+WUThFcLAOy+t8H885k2yXfMx7dy2CKR
 PtKhUkxGFy2Xgdevz5AJQXzYG4RSKHEXRZ6g5SgYTGD1/3JtDfuEK9rpCfehqBdjDcqfQB
 bqcLTXJk4jhhUMWT9mkoQEtcKJ7zMQ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-IpQop9gTPreWiMZfVA4xQQ-1; Tue, 19 May 2020 10:56:02 -0400
X-MC-Unique: IpQop9gTPreWiMZfVA4xQQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5BCA8835B68
 for <qemu-devel@nongnu.org>; Tue, 19 May 2020 14:56:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 29D895C1C8;
 Tue, 19 May 2020 14:56:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 727941135232; Tue, 19 May 2020 16:55:52 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 52/55] qdev: Use qdev_realize() in qdev_device_add()
Date: Tue, 19 May 2020 16:55:48 +0200
Message-Id: <20200519145551.22836-53-armbru@redhat.com>
In-Reply-To: <20200519145551.22836-1-armbru@redhat.com>
References: <20200519145551.22836-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/18 23:56:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
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
Cc: pbonzini@redhat.com, berrange@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qdev-monitor.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/qdev-monitor.c b/qdev-monitor.c
index bbbbf3d907..249d9a2408 100644
--- a/qdev-monitor.c
+++ b/qdev-monitor.c
@@ -661,9 +661,7 @@ DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
         goto err_del_dev;
     }
 
-    if (bus) {
-        qdev_set_parent_bus(dev, bus);
-    } else if (qdev_hotplug && !qdev_get_machine_hotplug_handler(dev)) {
+    if (!bus && qdev_hotplug && !qdev_get_machine_hotplug_handler(dev)) {
         /* No bus, no machine hotplug handler --> device is not hotpluggable */
         error_setg(&err, "Device '%s' can not be hotplugged on this machine",
                    driver);
@@ -678,7 +676,7 @@ DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
     }
 
     dev->opts = opts;
-    object_property_set_bool(OBJECT(dev), true, "realized", &err);
+    qdev_realize(DEVICE(dev), bus, &err);
     if (err != NULL) {
         dev->opts = NULL;
         goto err_del_dev;
-- 
2.21.1


