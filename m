Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3005C1D7052
	for <lists+qemu-devel@lfdr.de>; Mon, 18 May 2020 07:22:52 +0200 (CEST)
Received: from localhost ([::1]:44152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jaYEl-0002nI-8s
	for lists+qemu-devel@lfdr.de; Mon, 18 May 2020 01:22:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jaYBt-0006Fv-8W
 for qemu-devel@nongnu.org; Mon, 18 May 2020 01:19:53 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:20144
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jaYBr-0007It-Gn
 for qemu-devel@nongnu.org; Mon, 18 May 2020 01:19:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589779190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pl+UCiGWsmgOqH6TPA15ReEJptIY3N02HvxxwvL94as=;
 b=FQY3R+gn5/ozJABb85Hf7ltpF5HBT12Yn5oFkYVPeQ61ktQZJiWfd8HZbwvbD59AMen5yn
 GwXHuhbSTHm4ayB52YCMdmepXTgYm4pPURvlo2LREX2WeMGx+XNMbphmdIrdhs0tub/huD
 2WfmiD4GDnK4POkbbIdo/B/eQVqs2oo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-9pAs8xkwN0iyIUc_w8-OHQ-1; Mon, 18 May 2020 01:19:49 -0400
X-MC-Unique: 9pAs8xkwN0iyIUc_w8-OHQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9040518FE860
 for <qemu-devel@nongnu.org>; Mon, 18 May 2020 05:19:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E2DE600E5;
 Mon, 18 May 2020 05:19:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6A90811358C1; Mon, 18 May 2020 07:19:45 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH not-for-merge 5/5] qdev: Instrument to detect bus mismatch
Date: Mon, 18 May 2020 07:19:45 +0200
Message-Id: <20200518051945.8621-6-armbru@redhat.com>
In-Reply-To: <20200518051945.8621-1-armbru@redhat.com>
References: <20200518051945.8621-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/17 22:52:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
 hw/core/qdev.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 9e5538aeae..936ef3988a 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -98,6 +98,23 @@ void qdev_set_parent_bus(DeviceState *dev, BusState *bus)
 {
     BusState *old_parent_bus = dev->parent_bus;
 
+    DeviceClass *dc = DEVICE_GET_CLASS(dev);
+    if (bus) {
+        BusClass *bc;
+        for (bc = BUS_GET_CLASS(bus);
+             bc;
+             bc = (BusClass *)object_class_dynamic_cast(object_class_get_parent(OBJECT_CLASS(bc)), TYPE_BUS)) {
+            if (!g_strcmp0(dc->bus_type, object_class_get_name(OBJECT_CLASS(bc)))) {
+                break;
+            }
+        }
+        if (!bc) {
+            printf("### bus mismatch %s is %s plugged into %s\n",
+                   object_get_typename(OBJECT(dev)), dc->bus_type,
+                   object_class_get_name(OBJECT_CLASS(BUS_GET_CLASS(bus))));
+        }
+    }
+
     if (old_parent_bus) {
         trace_qdev_update_parent_bus(dev, object_get_typename(OBJECT(dev)),
             old_parent_bus, object_get_typename(OBJECT(old_parent_bus)),
-- 
2.21.1


