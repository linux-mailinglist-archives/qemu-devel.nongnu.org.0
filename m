Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DE74B0CC3
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 12:49:56 +0100 (CET)
Received: from localhost ([::1]:59380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI7xT-0007Sj-7F
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 06:49:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <7c1101e9be922915491bc9ec2ca2150554192d53@lizzy.crudebyte.com>)
 id 1nI7kC-0007ej-JT
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 06:36:14 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:59481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <7c1101e9be922915491bc9ec2ca2150554192d53@lizzy.crudebyte.com>)
 id 1nI7jp-0003U0-G9
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 06:36:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=mcbRg2xlZAZHldg9PdPezpruRYnaMN84QxS/hR585+U=; b=hPSY5
 IwO0dXLNPdNr8awmLIiKCOgB6DPOPIvdWMQushRilJ+rUH9Dy8aKKY0s4lw4bzOgo9aruCD6cXSS+
 uWn6fzGm93KtIdz/vKa7iEe29VDSOqFWa5M/UUE0ArW+R0ReB/AiX2bMQTkbf45wTftlm9MNguYsm
 9WBC9sWvVvQiWmxgIL7qoIJ47H1sSenr7MC6oUygo0cN6G3GwfePVYH7h9a/eNm8oppBX6AGItNjy
 3bbJmBYRCCvQO+yYpcFRRLZ9fhRryhLWiCa7jnoqtLnOJyi0NRzNpDoMZ4NI35DamdUfyFoJeKmFM
 1v2lJm7qTyYKd82qr3tcsaHBSvdpg==;
Message-Id: <7c1101e9be922915491bc9ec2ca2150554192d53.1644492115.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1644492115.git.qemu_oss@crudebyte.com>
References: <cover.1644492115.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Thu, 10 Feb 2022 12:21:55 +0100
Subject: [PULL 4/5] tests/9pfs: Use g_autofree and g_autoptr where possible
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=7c1101e9be922915491bc9ec2ca2150554192d53@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Greg Kurz <groug@kaod.org>

It is recommended to use g_autofree or g_autoptr as it reduces
the odds of introducing memory leaks in future changes.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20220201151508.190035-3-groug@kaod.org>
Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/libqos/virtio-9p.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/tests/qtest/libqos/virtio-9p.c b/tests/qtest/libqos/virtio-9p.c
index 5d18e5eae5..f51f0635cc 100644
--- a/tests/qtest/libqos/virtio-9p.c
+++ b/tests/qtest/libqos/virtio-9p.c
@@ -41,7 +41,7 @@ void virtio_9p_create_local_test_dir(void)
 {
     g_assert(local_test_path == NULL);
     struct stat st;
-    char *pwd = g_get_current_dir();
+    g_autofree char *pwd = g_get_current_dir();
     /*
      * template gets cached into local_test_path and freed in
      * virtio_9p_remove_local_test_dir().
@@ -52,7 +52,6 @@ void virtio_9p_create_local_test_dir(void)
     if (!local_test_path) {
         g_test_message("mkdtemp('%s') failed: %s", template, strerror(errno));
     }
-    g_free(pwd);
 
     g_assert(local_test_path != NULL);
 
@@ -65,12 +64,11 @@ void virtio_9p_create_local_test_dir(void)
 void virtio_9p_remove_local_test_dir(void)
 {
     g_assert(local_test_path != NULL);
-    char *cmd = g_strdup_printf("rm -fr '%s'\n", local_test_path);
+    g_autofree char *cmd = g_strdup_printf("rm -fr '%s'\n", local_test_path);
     int res = system(cmd);
     if (res < 0) {
         /* ignore error, dummy check to prevent compiler error */
     }
-    g_free(cmd);
     g_free(local_test_path);
     local_test_path = NULL;
 }
@@ -216,8 +214,8 @@ static void *virtio_9p_pci_create(void *pci_bus, QGuestAllocator *t_alloc,
 static void regex_replace(GString *haystack, const char *pattern,
                           const char *replace_fmt, ...)
 {
-    GRegex *regex;
-    char *replace, *s;
+    g_autoptr(GRegex) regex = NULL;
+    g_autofree char *replace = NULL, *s = NULL;
     va_list argp;
 
     va_start(argp, replace_fmt);
@@ -227,9 +225,6 @@ static void regex_replace(GString *haystack, const char *pattern,
     regex = g_regex_new(pattern, 0, 0, NULL);
     s = g_regex_replace(regex, haystack->str, -1, 0, replace, 0, NULL);
     g_string_assign(haystack, s);
-    g_free(s);
-    g_regex_unref(regex);
-    g_free(replace);
 }
 
 void virtio_9p_assign_local_driver(GString *cmd_line, const char *args)
-- 
2.20.1


