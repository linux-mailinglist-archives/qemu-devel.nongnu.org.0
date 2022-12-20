Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2902B651CEC
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 10:11:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7YaT-0000Yv-P2; Tue, 20 Dec 2022 04:07:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7YaM-0000Ul-K6
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 04:06:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7YaJ-0006Sa-I8
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 04:06:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671527210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9SNFzH5EiVNv3B12ySUoPPuchF7cyMFQp+Qo0xSUnJY=;
 b=DUeZ74A7d+BSCir+SDMEtl7w1wiv17vCVEfa0qKbMxmSXlGOClrI5idirU0OaEP6Rf3yh/
 EntAtiWHm+fpGe0TZEv4Bnnt7R+2vbSvnCR6HPcAgbyPwHBMY1KJFgupjZcBVL6ckMBXhf
 mEz6nQpmhirWcM3AjltufoK7Ng4Cum4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-154-WeUDGN6EO6CjA4qz7KlgXA-1; Tue, 20 Dec 2022 04:06:49 -0500
X-MC-Unique: WeUDGN6EO6CjA4qz7KlgXA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E686811E6E;
 Tue, 20 Dec 2022 09:06:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 157CD492C14;
 Tue, 20 Dec 2022 09:06:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9F75821E660F; Tue, 20 Dec 2022 10:06:45 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com, dgilbert@redhat.com, berrange@redhat.com,
 philmd@linaro.org
Subject: [PATCH v3 18/18] ui: Simplify control flow in qemu_mouse_set()
Date: Tue, 20 Dec 2022 10:06:45 +0100
Message-Id: <20221220090645.2844881-19-armbru@redhat.com>
In-Reply-To: <20221220090645.2844881-1-armbru@redhat.com>
References: <20221220090645.2844881-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
 ui/input.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/ui/input.c b/ui/input.c
index 99e52c938e..df2f54cb9a 100644
--- a/ui/input.c
+++ b/ui/input.c
@@ -595,26 +595,24 @@ MouseInfoList *qmp_query_mice(Error **errp)
 void qemu_mouse_set(int index, Error **err)
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
-            error_report("Input device '%s' is not a mouse", s->handler->name);
-            return;
-        }
-        found = 1;
-        qemu_input_handler_activate(s);
-        break;
     }
 
-    if (!found) {
+    if (!s) {
         error_report("Mouse at index '%d' not found", index);
         return;
     }
 
+    if (!(s->handler->mask & (INPUT_EVENT_MASK_REL |
+                              INPUT_EVENT_MASK_ABS))) {
+        error_report("Input device '%s' is not a mouse", s->handler->name);
+        return;
+    }
+
+    qemu_input_handler_activate(s);
     qemu_input_check_mode_change();
 }
-- 
2.38.1


