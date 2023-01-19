Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4676E673A2E
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 14:29:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIUxL-0005wE-Op; Thu, 19 Jan 2023 08:27:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIUx8-0005rQ-63
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 08:27:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIUx2-0008Cs-0X
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 08:27:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674134840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bIdJEKnEUPp+7AuvAI/G7QVkXj2pzo36gKcXDKriLRo=;
 b=J5U3xTyNeMVOu4TGXfYewRolsPd3yIoDhDH6HycS+4oS565pZ3+zkcLyL3r8Vw63nNY0vQ
 cuR11Am+fRBzeOxcuYsDbystWHnR8UNcN87RFox6eErVSTi8Xh2HGH9ubT2dpc7MemAew6
 KOGCo5lo/dWOnQGwcAEz2vlo83prFdk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-YboNdd9oNJizPPJo_yQQEA-1; Thu, 19 Jan 2023 08:27:17 -0500
X-MC-Unique: YboNdd9oNJizPPJo_yQQEA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E168280606B;
 Thu, 19 Jan 2023 13:27:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D9EA41121319;
 Thu, 19 Jan 2023 13:27:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 74DF421E5A69; Thu, 19 Jan 2023 14:27:13 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 17/17] ui: Simplify control flow in qemu_mouse_set()
Date: Thu, 19 Jan 2023 14:27:13 +0100
Message-Id: <20230119132713.3493556-18-armbru@redhat.com>
In-Reply-To: <20230119132713.3493556-1-armbru@redhat.com>
References: <20230119132713.3493556-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Message-Id: <20230109190321.1056914-18-armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
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


