Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EF81D704C
	for <lists+qemu-devel@lfdr.de>; Mon, 18 May 2020 07:21:16 +0200 (CEST)
Received: from localhost ([::1]:36638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jaYDD-00086G-VJ
	for lists+qemu-devel@lfdr.de; Mon, 18 May 2020 01:21:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jaYBs-0006Eo-D6
 for qemu-devel@nongnu.org; Mon, 18 May 2020 01:19:52 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:26763
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jaYBr-0007IW-9H
 for qemu-devel@nongnu.org; Mon, 18 May 2020 01:19:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589779189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y71cqKwuXBCCvV/05bpD+iMljK1QevfXj6/AipGXIOQ=;
 b=T2CGxvclecenNACqgijv73+VX2oWdyxAwq+pLFRk0z+y7RYF0A20KHSzGU0Ui7DazHJi3G
 AyJer6kVD10NEcKGUdm+x0YCn8LfUvfBkhyGHinrb9NFkcMOIUpLuFvJY39wY8BTtG6bn3
 ijn2oHQn7vfrQeOhJQZ8tw54FSSn9Lg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-8j9O1khPNVe1o2EOEoc1rw-1; Mon, 18 May 2020 01:19:47 -0400
X-MC-Unique: 8j9O1khPNVe1o2EOEoc1rw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27233107ACCD
 for <qemu-devel@nongnu.org>; Mon, 18 May 2020 05:19:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EB7EF82A11;
 Mon, 18 May 2020 05:19:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 640F611358BF; Mon, 18 May 2020 07:19:45 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH not-for-merge 3/5] qdev: Make "info qtree" show child devices
 sorted by QOM path
Date: Mon, 18 May 2020 07:19:43 +0200
Message-Id: <20200518051945.8621-4-armbru@redhat.com>
In-Reply-To: <20200518051945.8621-1-armbru@redhat.com>
References: <20200518051945.8621-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/17 22:51:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

"info qtree" shows children in reverse creation order.  Show them
sorted by QOM path.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qdev-monitor.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/qdev-monitor.c b/qdev-monitor.c
index a4735d3bb1..07f78e9f5d 100644
--- a/qdev-monitor.c
+++ b/qdev-monitor.c
@@ -771,17 +771,43 @@ static void qdev_print(Monitor *mon, DeviceState *dev, int indent)
     }
 }
 
+struct qbus_child {
+    DeviceState *dev;
+    char *qom_path;
+};
+
+static int dev_cmp(const void *a, const void *b)
+{
+    return g_strcmp0(((struct qbus_child *)a)->qom_path,
+                     ((struct qbus_child *)b)->qom_path);
+}
+
 static void qbus_print(Monitor *mon, BusState *bus, int indent)
 {
     BusChild *kid;
+    GSList *children = NULL;
 
     qdev_printf("bus: %s\n", bus->name);
     indent += 2;
     qdev_printf("type %s\n", object_get_typename(OBJECT(bus)));
     QTAILQ_FOREACH(kid, &bus->children, sibling) {
         DeviceState *dev = kid->child;
-        qdev_print(mon, dev, indent);
+        struct qbus_child *qc = g_malloc(sizeof(*qc));
+        qc->dev = dev;
+        qc->qom_path = object_get_canonical_path(OBJECT(dev));
+        children = g_slist_insert_sorted(children, qc, dev_cmp);
     }
+    while (children) {
+        struct qbus_child *qc = children->data;
+        DeviceState *dev = qc->dev;
+        GSList *next = children->next;
+        qdev_print(mon, dev, indent);
+        g_free(qc->qom_path);
+        g_free(qc);
+        g_slist_free_1(children);
+        children = next;
+    }
+
 }
 #undef qdev_printf
 
-- 
2.21.1


