Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C22C063E9AB
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 07:14:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0cp1-0005fs-E3; Thu, 01 Dec 2022 01:13:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0coy-0005eI-Hc
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 01:13:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0cow-0005ln-Lc
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 01:13:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669875197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6UAA36rMdL7CoNHGmLtZbZHnNDvSVBvjzxdayga4Qtw=;
 b=Hlk0oOhNWF1hzrJZNQaRPOqJIVX3W55RSZLleqdvEkXKN1OFIgUOFHO93+XrRh6UYl/VIZ
 f3SGoZvLrKdZyYdlKJmA4K1ywUDWDBbMHuGT1N0KrSW6onHE7MGBNW9MjeO/M21BbueFcJ
 6dm8G4fRbG1LeuzOOvobonfMYbPTNYQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-281-SZBf_tu5NlaubxrnUnDmxQ-1; Thu, 01 Dec 2022 01:13:15 -0500
X-MC-Unique: SZBf_tu5NlaubxrnUnDmxQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5084629DD9B0
 for <qemu-devel@nongnu.org>; Thu,  1 Dec 2022 06:13:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 212271121314;
 Thu,  1 Dec 2022 06:13:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E062821E6930; Thu,  1 Dec 2022 07:13:11 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com,
	dgilbert@redhat.com
Subject: [PATCH 1/9] ui: Check numeric part of expire_password argument @time
 properly
Date: Thu,  1 Dec 2022 07:13:03 +0100
Message-Id: <20221201061311.3619052-2-armbru@redhat.com>
In-Reply-To: <20221201061311.3619052-1-armbru@redhat.com>
References: <20221201061311.3619052-1-armbru@redhat.com>
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

When argument @time isn't 'now' or 'never', we parse it as an integer,
optionally prefixed with '+'.  If parsing fails, we silently assume
zero.  Report an error and fail instead.

While there, use qemu_strtou64() instead of strtoull() so
checkpatch.pl won't complain.

Aside: encoding numbers in strings is bad QMP practice.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 monitor/qmp-cmds.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 81c8fdadf8..054d7648b1 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -205,15 +205,28 @@ void qmp_expire_password(ExpirePasswordOptions *opts, Error **errp)
     time_t when;
     int rc;
     const char *whenstr = opts->time;
+    const char *numstr = NULL;
+    uint64_t num;
 
     if (strcmp(whenstr, "now") == 0) {
         when = 0;
     } else if (strcmp(whenstr, "never") == 0) {
         when = TIME_MAX;
     } else if (whenstr[0] == '+') {
-        when = time(NULL) + strtoull(whenstr+1, NULL, 10);
+        when = time(NULL);
+        numstr = whenstr + 1;
     } else {
-        when = strtoull(whenstr, NULL, 10);
+        when = 0;
+        numstr = whenstr;
+    }
+
+    if (numstr) {
+        if (qemu_strtou64(numstr, NULL, 10, &num) < 0) {
+            error_setg(errp, "Parameter 'time' doesn't take value '%s'",
+                       whenstr);
+            return;
+        }
+        when += num;
     }
 
     if (opts->protocol == DISPLAY_PROTOCOL_SPICE) {
-- 
2.37.3


