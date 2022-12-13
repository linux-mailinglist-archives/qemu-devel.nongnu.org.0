Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A8564BED2
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 22:47:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5D0F-0001I7-C8; Tue, 13 Dec 2022 16:39:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fasano@mit.edu>) id 1p5D00-0001Ea-S9
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:39:41 -0500
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fasano@mit.edu>) id 1p5Czz-0007jY-9X
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:39:40 -0500
Received: from panda194.. ([18.4.85.108]) (authenticated bits=0)
 (User authenticated as fasano@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 2BDLcaPA030603
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Dec 2022 16:39:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1670967574; bh=b/fRDQjk1a1CUz1f4lwvRtAJOQhJid7h6LlJif5e9Qk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Re+IXSkO82sIvAiugHKM0M5MOjygXQVHZ60AwcxOAk5N5C2ZU1vYkj7pFS51f0z+D
 owhAdwuM0wBDr5cDX0FMHQRCgOwVi0c1IwaVBGLGaO5L3WnVufPMd3eVg9w2Eol/El
 OF+ML6mFGBQ4exZt9IVyXUPOnKyO/NVXvWWdhBXeHtUzqfyNRlYsI6lHnmRIocKUDd
 gB6Ccu2qxbnDT4F8RhuTKGULyhwDOjm+i3ecEUy1DtKjJ5Y4ex/6BfXxY2uSvAgJYk
 k6eey1l2c7EZiCcQDNrg2sXs6O8jsG4bYtjOc2rTugAcmU54veozI39MMGQ5A6+9A7
 d+GukysafNJ4Q==
From: Andrew Fasano <fasano@mit.edu>
To: qemu-devel@nongnu.org
Cc: elysia.witham@ll.mit.edu, alex.bennee@linaro.org, erdnaxe@crans.org,
 ma.mandourr@gmail.com, Andrew Fasano <fasano@mit.edu>
Subject: [PATCH 3/8] plugins: add id_to_plugin_name
Date: Tue, 13 Dec 2022 16:37:52 -0500
Message-Id: <20221213213757.4123265-4-fasano@mit.edu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221213213757.4123265-1-fasano@mit.edu>
References: <20221213213757.4123265-1-fasano@mit.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=18.9.28.11; envelope-from=fasano@mit.edu;
 helo=outgoing.mit.edu
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

From: Elysia Witham <elysia.witham@ll.mit.edu>

Plugins will pass their unique id when creating callbacks to
ensure they are associated with the correct plugin. This
internal function resolves those ids to the declared names.

Signed-off-by: Elysia Witham <elysia.witham@ll.mit.edu>
Signed-off-by: Andrew Fasano <fasano@mit.edu>
---
 plugins/core.c   | 12 ++++++++++++
 plugins/plugin.h |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/plugins/core.c b/plugins/core.c
index 5fbdcb5768..6a50b4a6e6 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -248,6 +248,18 @@ int name_to_plugin_version(const char *name)
     return -1;
 }
 
+const char *id_to_plugin_name(qemu_plugin_id_t id)
+{
+    const char *plugin = plugin_id_to_ctx_locked(id)->name;
+    if (plugin) {
+        return plugin;
+    } else {
+        warn_report("Unnamed plugin cannot use QPP, not supported in plugin "
+                    "version. Please update plugin.");
+        return NULL;
+    }
+}
+
 struct plugin_for_each_args {
     struct qemu_plugin_ctx *ctx;
     qemu_plugin_vcpu_simple_cb_t cb;
diff --git a/plugins/plugin.h b/plugins/plugin.h
index ce885bfa98..9e710c23a7 100644
--- a/plugins/plugin.h
+++ b/plugins/plugin.h
@@ -104,4 +104,6 @@ void exec_inline_op(struct qemu_plugin_dyn_cb *cb);
 
 int name_to_plugin_version(const char *name);
 
+const char *id_to_plugin_name(qemu_plugin_id_t id);
+
 #endif /* PLUGIN_H */
-- 
2.34.1


