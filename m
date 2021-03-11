Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7B2336E66
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 10:01:21 +0100 (CET)
Received: from localhost ([::1]:40886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKHC4-0005b0-Ng
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 04:01:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1lKHAM-0004pK-66
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 03:59:34 -0500
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:35374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1lKHAI-0004fK-Gu
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 03:59:32 -0500
Received: from iva8-d077482f1536.qloud-c.yandex.net
 (iva8-d077482f1536.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2f26:0:640:d077:482f])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 1884E2E15EC;
 Thu, 11 Mar 2021 11:59:25 +0300 (MSK)
Received: from iva8-5ba4ca89b0c6.qloud-c.yandex.net
 (iva8-5ba4ca89b0c6.qloud-c.yandex.net [2a02:6b8:c0c:a8ae:0:640:5ba4:ca89])
 by iva8-d077482f1536.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 Y8I071V31I-xOx0NUGZ; Thu, 11 Mar 2021 11:59:25 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1615453165; bh=FxpCeXiidvNJwE7rPl521PmAEY8PSOl29Hl4evXKyn0=;
 h=Message-Id:Date:Subject:To:From:Cc;
 b=qALzcKz0kbtwfMPT6CxRjYJZ6er7Sm2fMEoXUn0y0Ewa7jaX29hsFP+l3qZgaBV8M
 GwTOo+3IwDUywSpBoyH2JQztUaNiTgTQdDfKFRwWVLaD8DZV3wgT2LqoiNdXh0RNvk
 mx1IUp6TsiWRHwoZDySuVRmCAXrzJD0VRUcmj7bE=
Authentication-Results: iva8-d077482f1536.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-iva.dhcp.yndx.net (dynamic-iva.dhcp.yndx.net
 [2a02:6b8:b080:8818::1:8])
 by iva8-5ba4ca89b0c6.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 C5N1gh1pOz-xOoiAqvH; Thu, 11 Mar 2021 11:59:24 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Denis Plotnikov <den-plotnikov@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH v1] softmmu/vl: make default prealloc-threads work w/o
 -mem-prealloc
Date: Thu, 11 Mar 2021 11:59:18 +0300
Message-Id: <20210311085918.284903-1-den-plotnikov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1a2d::193;
 envelope-from=den-plotnikov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, yc-core@yandex-team.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Preallocation in memory backends can be specified with either global
QEMU option "-mem-prealloc", or with per-backend property
"prealloc=true".  In the latter case, however, the default for the
number of preallocation threads is not set to the number of vcpus, but
remains at 1 instead.

Fix it by setting the "prealloc-threads" sugar property of
"memory-backend" to the number of vcpus unconditionally.

Fixes: ffac16fab3 ("hostmem: introduce "prealloc-threads" property")

Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
---
 softmmu/vl.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index ff488ea3e7db..e392e226a2d3 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2300,14 +2300,17 @@ static void qemu_validate_options(void)
 
 static void qemu_process_sugar_options(void)
 {
-    if (mem_prealloc) {
-        char *val;
+    char *val;
 
-        val = g_strdup_printf("%d",
-                 (uint32_t) qemu_opt_get_number(qemu_find_opts_singleton("smp-opts"), "cpus", 1));
-        object_register_sugar_prop("memory-backend", "prealloc-threads", val,
-                                   false);
-        g_free(val);
+    val = g_strdup_printf("%d",
+              (uint32_t) qemu_opt_get_number(
+                             qemu_find_opts_singleton("smp-opts"), "cpus", 1));
+
+    object_register_sugar_prop("memory-backend", "prealloc-threads", val,
+                                false);
+    g_free(val);
+
+    if (mem_prealloc) {
         object_register_sugar_prop("memory-backend", "prealloc", "on", false);
     }
 
-- 
2.25.1


