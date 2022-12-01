Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5871563E9C8
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 07:17:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0cpA-0005kE-Ea; Thu, 01 Dec 2022 01:13:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0cp5-0005jK-C5
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 01:13:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0cp3-0005mb-Vu
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 01:13:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669875200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w53NfcJyeWiZyvfE3+PIaAUAWPbIvdAyglWPwpEtIcs=;
 b=HRKml1TZFWWzVcgasM3gvs6F+H4RNN13TomjfiXiRnxrRtf8O+GFQxfEqfw+EseJk3SNUL
 ZWJ8hyixzlIft8v55yAGkyMkRSKjRqIfRe/QsXh6BnDUTCc9vZCxTtQpGqdtMWKrYrKPCA
 iRqRzoxQluQavfrZVPSE5V8DQBT1ZsE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-300-TADqhg8CNrq7BsnYUvfs3Q-1; Thu, 01 Dec 2022 01:13:18 -0500
X-MC-Unique: TADqhg8CNrq7BsnYUvfs3Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD8623C0D192
 for <qemu-devel@nongnu.org>; Thu,  1 Dec 2022 06:13:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 85C264B3FC6;
 Thu,  1 Dec 2022 06:13:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F36FE21E65C9; Thu,  1 Dec 2022 07:13:11 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com,
	dgilbert@redhat.com
Subject: [PATCH 9/9] ui: Reduce nesting in hmp_change_vnc() slightly
Date: Thu,  1 Dec 2022 07:13:11 +0100
Message-Id: <20221201061311.3619052-10-armbru@redhat.com>
In-Reply-To: <20221201061311.3619052-1-armbru@redhat.com>
References: <20221201061311.3619052-1-armbru@redhat.com>
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
---
 ui/ui-hmp-cmds.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/ui/ui-hmp-cmds.c b/ui/ui-hmp-cmds.c
index b1b18d5a5d..31778122d3 100644
--- a/ui/ui-hmp-cmds.c
+++ b/ui/ui-hmp-cmds.c
@@ -287,19 +287,16 @@ void hmp_change_vnc(Monitor *mon, const char *device, const char *target,
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


