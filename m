Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94444662FDC
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 20:05:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pExRW-0004H9-Qy; Mon, 09 Jan 2023 14:04:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pExQn-0003xL-Uz
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 14:03:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pExQk-0001Iy-6p
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 14:03:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673291007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gIbvA16meAt5BD6PeVn8Nm6nFOLlFS3dcrYUWfmlxQg=;
 b=YLd7miryFJtddbSEW6dvSBNbj4w8h6y6gmMWRvkn3asNSLegDNKAWO/00iLtS1sUb9EeXT
 gZOEAWy4sCkOEo/8f+4QWMVs0QC1EsSz4WPH5v5O1L1tvOBhuOB1ubTUCbZ/U9rBW9TzOl
 BZiaYs3oFH9cyb9r3Tq6C5+6dqOTzbA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-575-ZeKWBditMPWKXR-jnnUDOQ-1; Mon, 09 Jan 2023 14:03:26 -0500
X-MC-Unique: ZeKWBditMPWKXR-jnnUDOQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0F9780234E;
 Mon,  9 Jan 2023 19:03:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A767E1121318;
 Mon,  9 Jan 2023 19:03:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C1A9321E59C1; Mon,  9 Jan 2023 20:03:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com, dgilbert@redhat.com, berrange@redhat.com,
 philmd@linaro.org
Subject: [PATCH v4 17/17] ui: Simplify control flow in qemu_mouse_set()
Date: Mon,  9 Jan 2023 20:03:21 +0100
Message-Id: <20230109190321.1056914-18-armbru@redhat.com>
In-Reply-To: <20230109190321.1056914-1-armbru@redhat.com>
References: <20230109190321.1056914-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 ui/input.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/ui/input.c b/ui/input.c
index 7048810a57..f2d1e7a3a7 100644
--- a/ui/input.c
+++ b/ui/input.c
@@ -595,28 +595,26 @@ MouseInfoList *qmp_query_mice(Error **errp)
 bool qemu_mouse_set(int index, Error **errp)
 {
     QemuInputHandlerState *s;
-    int found = 0;
 
     QTAILQ_FOREACH(s, &handlers, node) {
-        if (s->id != index) {
-            continue;
+        if (s->id == index) {
+            break;
         }
-        if (!(s->handler->mask & (INPUT_EVENT_MASK_REL |
-                                  INPUT_EVENT_MASK_ABS))) {
-            error_setg(errp, "Input device '%s' is not a mouse",
-                       s->handler->name);
-            return false;
-        }
-        found = 1;
-        qemu_input_handler_activate(s);
-        break;
     }
 
-    if (!found) {
+    if (!s) {
         error_setg(errp, "Mouse at index '%d' not found", index);
         return false;
     }
 
+    if (!(s->handler->mask & (INPUT_EVENT_MASK_REL |
+                              INPUT_EVENT_MASK_ABS))) {
+        error_setg(errp, "Input device '%s' is not a mouse",
+                   s->handler->name);
+        return false;
+    }
+
+    qemu_input_handler_activate(s);
     qemu_input_check_mode_change();
     return true;
 }
-- 
2.39.0


