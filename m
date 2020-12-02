Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F212CBA1F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 11:06:27 +0100 (CET)
Received: from localhost ([::1]:55678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkP1m-0000vk-9z
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 05:06:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkO3Y-0003LE-01
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:04:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkO3V-0004ag-IH
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:04:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606899847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1QA9QKGPR2mzEt9SpQ/nyreNCtl0pogqlS8GocnevBg=;
 b=c3FNjRBRpzTj68KhtR7wQhU/nzJ4XgUmdmy+4kgf6vm1jVSWWOMWkt0V7feCJTF+Y7BirN
 pZOhyN51QXM+Nv0Yr0+70ocFx13n+3fIBfSf3McX5sbJIP3rlH/m7UC69ORbEU3rste4Ly
 wxEoWlfLAbaIVBWHYvXnhhMhVUFwcFw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-leXeRrePNh-3FgkY8yAeKA-1; Wed, 02 Dec 2020 04:04:06 -0500
X-MC-Unique: leXeRrePNh-3FgkY8yAeKA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FEA5136420;
 Wed,  2 Dec 2020 09:03:37 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F2D161F5E;
 Wed,  2 Dec 2020 09:03:36 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/28] qemu-option: simplify search for end of key
Date: Wed,  2 Dec 2020 04:02:38 -0500
Message-Id: <20201202090305.4129317-2-pbonzini@redhat.com>
In-Reply-To: <20201202090305.4129317-1-pbonzini@redhat.com>
References: <20201202090305.4129317-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, imammedo@redhat.com, armbru@redhat.com,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use strcspn to find an equal or comma value, and pass the result directly
to get_opt_name to avoid another strchr.

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



