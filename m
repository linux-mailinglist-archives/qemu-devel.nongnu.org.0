Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F53651DD4
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 10:44:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7YaR-0000Xk-Hy; Tue, 20 Dec 2022 04:06:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7YaL-0000Td-Eo
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 04:06:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7YaI-0006SJ-On
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 04:06:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671527210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fu6bsEVKNyys7EmC8KoIVPopUzjka0Kot7CcR+gCvOQ=;
 b=c+4c29pOjJSIifBobVR38Bzaopl/NTQD8ddxPh2rtV5asegMkm5QVkfI+tZlebzRAvacZQ
 IdpKnGYGiUdralfbKTRn94540pmDvhe3R0I3uF1OIAhs1krvVe0m7Wic/crqPJRDHq1YES
 rhWzojFO0JbgvRWRd8/zbKhYXagpWE0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-lvlrK-PFPPu_mi7Ge38D-w-1; Tue, 20 Dec 2022 04:06:48 -0500
X-MC-Unique: lvlrK-PFPPu_mi7Ge38D-w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2CB4629AA2C4;
 Tue, 20 Dec 2022 09:06:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 04B102166B2B;
 Tue, 20 Dec 2022 09:06:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9203121E6826; Tue, 20 Dec 2022 10:06:45 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com, dgilbert@redhat.com, berrange@redhat.com,
 philmd@linaro.org
Subject: [PATCH v3 13/18] ui: Improve "change vnc" error reporting
Date: Tue, 20 Dec 2022 10:06:40 +0100
Message-Id: <20221220090645.2844881-14-armbru@redhat.com>
In-Reply-To: <20221220090645.2844881-1-armbru@redhat.com>
References: <20221220090645.2844881-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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

Switch from monitor_printf() to error_setg() and hmp_handle_error().
This makes "this is an error" more obvious both in the source and in
the monitor, where hmp_handle_error() prefixes the message with
"Error: ".

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 monitor/hmp-cmds.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index c4f161a596..4340e71c90 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1097,9 +1097,8 @@ void hmp_change(Monitor *mon, const QDict *qdict)
 #ifdef CONFIG_VNC
     if (strcmp(device, "vnc") == 0) {
         if (read_only) {
-            monitor_printf(mon,
-                           "Parameter 'read-only-mode' is invalid for VNC\n");
-            return;
+            error_setg(&err, "Parameter 'read-only-mode' is invalid for VNC");
+            goto end;
         }
         if (strcmp(target, "passwd") == 0 ||
             strcmp(target, "password") == 0) {
@@ -1111,7 +1110,8 @@ void hmp_change(Monitor *mon, const QDict *qdict)
                 qmp_change_vnc_password(arg, &err);
             }
         } else {
-            monitor_printf(mon, "Expected 'password' after 'vnc'\n");
+            error_setg(&err, "Expected 'password' after 'vnc'");
+            goto end;
         }
     } else
 #endif
-- 
2.38.1


