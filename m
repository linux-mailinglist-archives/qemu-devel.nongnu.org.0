Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A32C2DB389
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 19:19:33 +0100 (CET)
Received: from localhost ([::1]:37754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpEv6-0002xg-D5
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 13:19:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEXX-0003IO-7d
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:55:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEXQ-0001WI-4O
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:55:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608054901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qxw/RZnZykeapm+MKpgJxCcnEqziup2f0T5FbW4opcY=;
 b=Z8aSYA43iXPZht1tVD/EIsnDU9TFwuMvQM4NF3VBtVFWcBDh0BJnysgsepCw81LnLfmxAl
 qKH/aEoLWH9j4w/PvGuctX9HwON36olGYIptJmuYoUvPGb0+rBPTHlN+sCgZf7fdM7GPL5
 M/KAivYSMGLLCdjLun+xBWIzSIUhXfs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-Wjm4zh3FOHu2aETXOqWZ9A-1; Tue, 15 Dec 2020 12:54:58 -0500
X-MC-Unique: Wjm4zh3FOHu2aETXOqWZ9A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D5B4107ACE8
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 17:54:57 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D65D5C1C4;
 Tue, 15 Dec 2020 17:54:57 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 27/45] qemu-option: simplify search for end of key
Date: Tue, 15 Dec 2020 12:54:27 -0500
Message-Id: <20201215175445.1272776-28-pbonzini@redhat.com>
In-Reply-To: <20201215175445.1272776-1-pbonzini@redhat.com>
References: <20201215175445.1272776-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use strcspn to find an equal or comma value, and pass the result directly
to get_opt_name to avoid another strchr.

Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-option.c | 35 +++++++++++++----------------------
 1 file changed, 13 insertions(+), 22 deletions(-)

diff --git a/util/qemu-option.c b/util/qemu-option.c
index 25792159ba..6bd654a473 100644
--- a/util/qemu-option.c
+++ b/util/qemu-option.c
@@ -38,27 +38,19 @@
 #include "qemu/help_option.h"
 
 /*
- * Extracts the name of an option from the parameter string (p points at the
+ * Extracts the name of an option from the parameter string (@p points at the
  * first byte of the option name)
  *
- * The option name is delimited by delim (usually , or =) or the string end
- * and is copied into option. The caller is responsible for free'ing option
- * when no longer required.
+ * The option name is @len characters long and is copied into @option. The
+ * caller is responsible for free'ing @option when no longer required.
  *
  * The return value is the position of the delimiter/zero byte after the option
- * name in p.
+ * name in @p.
  */
-static const char *get_opt_name(const char *p, char **option, char delim)
+static const char *get_opt_name(const char *p, char **option, size_t len)
 {
-    char *offset = strchr(p, delim);
-
-    if (offset) {
-        *option = g_strndup(p, offset - p);
-        return offset;
-    } else {
-        *option = g_strdup(p);
-        return p + strlen(p);
-    }
+    *option = g_strndup(p, len);
+    return p + len;
 }
 
 /*
@@ -766,12 +758,11 @@ static const char *get_opt_name_value(const char *params,
                                       const char *firstname,
                                       char **name, char **value)
 {
-    const char *p, *pe, *pc;
-
-    pe = strchr(params, '=');
-    pc = strchr(params, ',');
+    const char *p;
+    size_t len;
 
-    if (!pe || (pc && pc < pe)) {
+    len = strcspn(params, "=,");
+    if (params[len] != '=') {
         /* found "foo,more" */
         if (firstname) {
             /* implicitly named first option */
@@ -779,7 +770,7 @@ static const char *get_opt_name_value(const char *params,
             p = get_opt_value(params, value);
         } else {
             /* option without value, must be a flag */
-            p = get_opt_name(params, name, ',');
+            p = get_opt_name(params, name, len);
             if (strncmp(*name, "no", 2) == 0) {
                 memmove(*name, *name + 2, strlen(*name + 2) + 1);
                 *value = g_strdup("off");
@@ -789,7 +780,7 @@ static const char *get_opt_name_value(const char *params,
         }
     } else {
         /* found "foo=bar,more" */
-        p = get_opt_name(params, name, '=');
+        p = get_opt_name(params, name, len);
         assert(*p == '=');
         p++;
         p = get_opt_value(p, value);
-- 
2.26.2



