Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C264364041C
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 11:09:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p12vV-0003fW-4S; Fri, 02 Dec 2022 05:05:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p12vO-0003c1-Da
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 05:05:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p12vM-0002P6-Nq
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 05:05:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669975540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2JvEG60EkTVaiKsOn91mAJtGbtsjJyxUKSnpMbu8Ykg=;
 b=YqxWSyTXj2i4K9dvncLm5IXkU9hqfdk5Q/OWbz720vegXoXIwKp1gTl8kwE+5hmWVvY82/
 oZsGw1iqs1/GXRZe0uxRT8YDNi4/ptfWBp+bMWJBepXrTyZFuR5L2xv8GOTYblk27aVsOA
 8N74RDMXWD7dhcbmM9WRjrZpm4kHeeY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-144-kIJyRw4MNz-MaR1EUbhUsg-1; Fri, 02 Dec 2022 05:05:39 -0500
X-MC-Unique: kIJyRw4MNz-MaR1EUbhUsg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AFDF82A2AD6F;
 Fri,  2 Dec 2022 10:05:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6EEB82028CE4;
 Fri,  2 Dec 2022 10:05:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0EEA521E65D2; Fri,  2 Dec 2022 11:05:13 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com, dgilbert@redhat.com, berrange@redhat.com,
 philmd@linaro.org
Subject: [PATCH v2 14/14] ui: Reduce nesting in hmp_change_vnc() slightly
Date: Fri,  2 Dec 2022 11:05:12 +0100
Message-Id: <20221202100512.4161901-15-armbru@redhat.com>
In-Reply-To: <20221202100512.4161901-1-armbru@redhat.com>
References: <20221202100512.4161901-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

Transform

    if (good) {
        do stuff
    } else {
        handle error
    }

to

    if (!good) {
        handle error
	return;
    }
    do stuff

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 ui/ui-hmp-cmds.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/ui/ui-hmp-cmds.c b/ui/ui-hmp-cmds.c
index e17f22c869..54ad7db5db 100644
--- a/ui/ui-hmp-cmds.c
+++ b/ui/ui-hmp-cmds.c
@@ -288,19 +288,16 @@ void hmp_change_vnc(Monitor *mon, const char *device, const char *target,
         error_setg(errp, "Parameter 'read-only-mode' is invalid for VNC");
         return;
     }
-    if (strcmp(target, "passwd") == 0 ||
-        strcmp(target, "password") == 0) {
-        if (!arg) {
-            MonitorHMP *hmp_mon = container_of(mon, MonitorHMP, common);
-            monitor_read_password(hmp_mon, hmp_change_read_arg, NULL);
-            return;
-        } else {
-            qmp_change_vnc_password(arg, errp);
-        }
-    } else {
+    if (strcmp(target, "passwd") && strcmp(target, "password")) {
         error_setg(errp, "Expected 'password' after 'vnc'");
         return;
     }
+    if (!arg) {
+        MonitorHMP *hmp_mon = container_of(mon, MonitorHMP, common);
+        monitor_read_password(hmp_mon, hmp_change_read_arg, NULL);
+    } else {
+        qmp_change_vnc_password(arg, errp);
+    }
 }
 #endif
 
-- 
2.37.3


