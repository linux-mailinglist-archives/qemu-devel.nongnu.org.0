Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99383270F9D
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Sep 2020 18:46:43 +0200 (CEST)
Received: from localhost ([::1]:55318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJg0Y-00061y-Lr
	for lists+qemu-devel@lfdr.de; Sat, 19 Sep 2020 12:46:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kJfHY-0005dr-7E
 for qemu-devel@nongnu.org; Sat, 19 Sep 2020 12:00:12 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:31277
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kJfHK-0007SR-Kr
 for qemu-devel@nongnu.org; Sat, 19 Sep 2020 12:00:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600531195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pq35pprjY9O0C9/iJtey6JbSoVcKHmRAr2UADQ5C67Q=;
 b=YVQqh7BsFM1Fle25dl4WeHkkDNzD/o3HUv9HWmWQu5r7VyM4MyOHSvhQXjyhu8Tp61y8t/
 C+u9IYLRtshcZoESY8kZzb0oMTh5c1Tivg426bffPUWDJ8Dy0QDk0gSJgWy0jXMKBlI1tf
 ETup+lk7H/Sa8yGN+42uPnBglmIhZnE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-0jT_B4GxOjeqWfdiaKB4HQ-1; Sat, 19 Sep 2020 11:59:53 -0400
X-MC-Unique: 0jT_B4GxOjeqWfdiaKB4HQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9A23186DD4C
 for <qemu-devel@nongnu.org>; Sat, 19 Sep 2020 15:59:52 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F53F10016DA
 for <qemu-devel@nongnu.org>; Sat, 19 Sep 2020 15:59:52 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 51/57] qga: relocate path to default configuration and hook
Date: Sat, 19 Sep 2020 11:59:10 -0400
Message-Id: <20200919155916.1046398-52-pbonzini@redhat.com>
In-Reply-To: <20200919155916.1046398-1-pbonzini@redhat.com>
References: <20200919155916.1046398-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/19 06:12:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qga/main.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/qga/main.c b/qga/main.c
index 3febf3b0fd..740f5f7303 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -29,6 +29,7 @@
 #include "qapi/error.h"
 #include "channel.h"
 #include "qemu/bswap.h"
+#include "qemu/cutils.h"
 #include "qemu/help_option.h"
 #include "qemu/sockets.h"
 #include "qemu/systemd.h"
@@ -968,7 +969,7 @@ static void config_load(GAConfig *config)
 {
     GError *gerr = NULL;
     GKeyFile *keyfile;
-    const char *conf = g_getenv("QGA_CONF") ?: QGA_CONF_DEFAULT;
+    g_autofree char *conf = g_strdup(g_getenv("QGA_CONF")) ?: get_relocated_path(QGA_CONF_DEFAULT);
 
     /* read system config */
     keyfile = g_key_file_new();
@@ -1027,7 +1028,7 @@ end:
     if (gerr &&
         !(gerr->domain == G_FILE_ERROR && gerr->code == G_FILE_ERROR_NOENT)) {
         g_critical("error loading configuration from path: %s, %s",
-                   QGA_CONF_DEFAULT, gerr->message);
+                   conf, gerr->message);
         exit(EXIT_FAILURE);
     }
     g_clear_error(&gerr);
@@ -1141,7 +1142,7 @@ static void config_parse(GAConfig *config, int argc, char **argv)
 #ifdef CONFIG_FSFREEZE
         case 'F':
             g_free(config->fsfreeze_hook);
-            config->fsfreeze_hook = g_strdup(optarg ?: QGA_FSFREEZE_HOOK_DEFAULT);
+            config->fsfreeze_hook = optarg ? g_strdup(optarg) : get_relocated_path(QGA_FSFREEZE_HOOK_DEFAULT);
             break;
 #endif
         case 't':
@@ -1463,6 +1464,7 @@ int main(int argc, char **argv)
 
     config->log_level = G_LOG_LEVEL_ERROR | G_LOG_LEVEL_CRITICAL;
 
+    qemu_init_exec_dir(argv[0]);
     qga_qmp_init_marshal(&ga_commands);
 
     init_dfl_pathnames();
-- 
2.26.2



