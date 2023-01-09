Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5D1662FE9
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 20:07:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pExRY-0004Lz-0j; Mon, 09 Jan 2023 14:04:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pExQn-0003xJ-Rq
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 14:03:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pExQj-0001J7-T8
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 14:03:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673291008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vYEN8u+nr8ehSNY8DBiXNicgkVNI0viYPy4uZwDn06Y=;
 b=hVPRYoz6QFPpXrOz7aa0DoDxSm75Gj0Qnf2PkZMbIErvyOfuHxqYMadFWU66jA9pe8bTEW
 qi2/8bxzVGvV5nxNVX0EAIKM7i4RU7fI6yVAmAfBSnmjpfRw/QmVs3rp9jlgKp46ZR7ff6
 LsPdkdDqRrNuRb56+nYpqYk5OpoFxx4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-PDGj53_ROPu4L2VrXadlfA-1; Mon, 09 Jan 2023 14:03:24 -0500
X-MC-Unique: PDGj53_ROPu4L2VrXadlfA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6AB6C101A521;
 Mon,  9 Jan 2023 19:03:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FEAA1121319;
 Mon,  9 Jan 2023 19:03:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B8B1021E5A17; Mon,  9 Jan 2023 20:03:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com, dgilbert@redhat.com, berrange@redhat.com,
 philmd@linaro.org
Subject: [PATCH v4 14/17] ui: Reduce nesting in hmp_change_vnc() slightly
Date: Mon,  9 Jan 2023 20:03:18 +0100
Message-Id: <20230109190321.1056914-15-armbru@redhat.com>
In-Reply-To: <20230109190321.1056914-1-armbru@redhat.com>
References: <20230109190321.1056914-1-armbru@redhat.com>
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
index 8ae96749f3..7ca80c8626 100644
--- a/ui/ui-hmp-cmds.c
+++ b/ui/ui-hmp-cmds.c
@@ -328,19 +328,16 @@ void hmp_change_vnc(Monitor *mon, const char *device, const char *target,
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
2.39.0


