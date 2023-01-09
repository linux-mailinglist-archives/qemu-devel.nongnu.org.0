Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF73662FD2
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 20:04:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pExRL-00043P-AI; Mon, 09 Jan 2023 14:04:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pExQn-0003xK-UB
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 14:03:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pExQj-0001Ho-Tx
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 14:03:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673291004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HEsDidP6dhhgOH1NXjLSsVAhqjLxIUuegUoLyL6521M=;
 b=jDre8vF0ocqDvnLa3vJXOGRrolfisToBMohQM7JKu74VkS6japWwP3xwjshkJwOUHiwg+f
 ZMGrr+XUl3qJL/R53hQ8Cufk2xbXfzicJB993qiwCG7X9+3RffU09USk1xi1RNPyylTcuM
 9988jCQKk9rwfiLsAfPKy9hgVickpRA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-424-LatkG1FwM2eAMdEcPPPA1w-1; Mon, 09 Jan 2023 14:03:23 -0500
X-MC-Unique: LatkG1FwM2eAMdEcPPPA1w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EECBE811E6E;
 Mon,  9 Jan 2023 19:03:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C4C17492B00;
 Mon,  9 Jan 2023 19:03:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8684221E5DF6; Mon,  9 Jan 2023 20:03:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com, dgilbert@redhat.com, berrange@redhat.com,
 philmd@linaro.org
Subject: [PATCH v4 01/17] ui: Check numeric part of expire_password argument
 @time properly
Date: Mon,  9 Jan 2023 20:03:05 +0100
Message-Id: <20230109190321.1056914-2-armbru@redhat.com>
In-Reply-To: <20230109190321.1056914-1-armbru@redhat.com>
References: <20230109190321.1056914-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

When argument @time isn't 'now' or 'never', we parse it as an integer,
optionally prefixed with '+'.  If parsing fails, we silently assume
zero.  Report an error and fail instead.

While there, use qemu_strtou64() instead of strtoull() so
checkpatch.pl won't complain.

Aside: encoding numbers in strings is bad QMP practice.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 monitor/qmp-cmds.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 2932b3f3a5..a1695b6c96 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -201,15 +201,28 @@ void qmp_expire_password(ExpirePasswordOptions *opts, Error **errp)
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
2.39.0


