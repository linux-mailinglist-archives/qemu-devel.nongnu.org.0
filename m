Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCA4533FA0
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 16:56:18 +0200 (CEST)
Received: from localhost ([::1]:50826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntsQr-0004dP-3s
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 10:56:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ntsGp-00033c-Kc
 for qemu-devel@nongnu.org; Wed, 25 May 2022 10:45:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ntsCp-00063p-2Y
 for qemu-devel@nongnu.org; Wed, 25 May 2022 10:41:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653489706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lwU0IIX84LupWziufp4z1foxxfyW5QXhf/iA8+wlBWQ=;
 b=c5YYKMUm4mda3wPk+xH4lnA1lV6Wp7IFzkS3/X5POHvcMuDhnUgPZmN8HcxhnjIMnLiQYQ
 cf3IepSv/MlKQXFxEM7acrw8WSEwopvu7GpmTHh5SeKs83PYBG1o0IU66Ivkgdol0T77Kk
 qhya4GswheJb9Vc2llbGB3Oh7/9/rvo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-318-lqLcK3FFOdyo0IYWzNtQcg-1; Wed, 25 May 2022 10:41:44 -0400
X-MC-Unique: lqLcK3FFOdyo0IYWzNtQcg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DA2F3C0D190
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 14:41:44 +0000 (UTC)
Received: from localhost (unknown [10.39.192.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F4DCC23DBF;
 Wed, 25 May 2022 14:41:44 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Konstantin Kostiuk <kkostiuk@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v5 02/15] util/win32: simplify qemu_get_local_state_dir()
Date: Wed, 25 May 2022 16:41:27 +0200
Message-Id: <20220525144140.591926-3-marcandre.lureau@redhat.com>
In-Reply-To: <20220525144140.591926-1-marcandre.lureau@redhat.com>
References: <20220525144140.591926-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

SHGetFolderPath() is a deprecated API:
https://docs.microsoft.com/en-us/windows/win32/api/shlobj_core/nf-shlobj_core-shgetfolderpatha

It is a wrapper for SHGetKnownFolderPath() and CSIDL_COMMON_PATH is
mapped to FOLDERID_ProgramData:
https://docs.microsoft.com/en-us/windows/win32/shell/csidl

g_get_system_data_dirs() is a suitable replacement, as it will have
FOLDERID_ProgramData in the returned list. However, it follows the XDG
Base Directory Specification, if `XDG_DATA_DIRS` is defined, it will be
returned instead.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
---
 util/oslib-win32.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index 6c818749d2..5723d3eb4c 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -40,9 +40,6 @@
 #include "qemu/error-report.h"
 #include <malloc.h>
 
-/* this must come after including "trace.h" */
-#include <shlobj.h>
-
 static int get_allocation_granularity(void)
 {
     SYSTEM_INFO system_info;
@@ -237,17 +234,11 @@ int qemu_get_thread_id(void)
 char *
 qemu_get_local_state_dir(void)
 {
-    HRESULT result;
-    char base_path[MAX_PATH+1] = "";
+    const char * const *data_dirs = g_get_system_data_dirs();
 
-    result = SHGetFolderPath(NULL, CSIDL_COMMON_APPDATA, NULL,
-                             /* SHGFP_TYPE_CURRENT */ 0, base_path);
-    if (result != S_OK) {
-        /* misconfigured environment */
-        g_critical("CSIDL_COMMON_APPDATA unavailable: %ld", (long)result);
-        abort();
-    }
-    return g_strdup(base_path);
+    g_assert(data_dirs && data_dirs[0]);
+
+    return g_strdup(data_dirs[0]);
 }
 
 void qemu_set_tty_echo(int fd, bool echo)
-- 
2.36.1


