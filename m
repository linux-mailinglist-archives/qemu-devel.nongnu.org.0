Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C7B258825
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 08:26:20 +0200 (CEST)
Received: from localhost ([::1]:50628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCzkJ-0000eB-Jc
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 02:26:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kCzj7-00082k-8Q
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 02:25:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kCzj5-0001NI-Js
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 02:25:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598941502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XPqE+1RTgT7cBSEBGYwO//KNVPh3KzZA8Ugolxgl+TE=;
 b=Od76Ri8ZTn3g01ftvHu+Z9TqaZEEss4ZXY/Um9GqrBikR8Ce/e4T4KQGNGzO4TJkgMETg6
 /fpa1nmAbLzIeV5m6D1yBMZDszBX+zZo/0Hn453Taccoi7943f48dpEOizGhgxnhzzXE2x
 ynEkNdDAq1MCyFHKFqqn5xJfOEoAkKE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-SZOppECwOg657Fo9W6DdVQ-1; Tue, 01 Sep 2020 02:20:26 -0400
X-MC-Unique: SZOppECwOg657Fo9W6DdVQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B13C110066FE;
 Tue,  1 Sep 2020 06:20:25 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F32B78B46;
 Tue,  1 Sep 2020 06:20:25 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/13] qga: relocate path to default configuration and hook
Date: Tue,  1 Sep 2020 02:20:18 -0400
Message-Id: <20200901062020.26660-12-pbonzini@redhat.com>
In-Reply-To: <20200901062020.26660-1-pbonzini@redhat.com>
References: <20200901062020.26660-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 01:27:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
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
+            config->fsfreeze_hook = g_strdup(optarg) ?: get_relocated_path(QGA_FSFREEZE_HOOK_DEFAULT);
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



