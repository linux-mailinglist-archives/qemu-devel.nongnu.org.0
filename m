Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0D0346315
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 16:38:59 +0100 (CET)
Received: from localhost ([::1]:57634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOj7S-0006o1-2C
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 11:38:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lOj5G-0004iI-EE
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:36:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lOj54-00032b-2Q
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:36:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616513789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wwWLfWWX4qqGwZnECrRt2Ou8JXQloBXFgKVi2KmuOAw=;
 b=Gns8qiXZqqlelSD+8qbBH5+t8t7JHPsOGeogA194JxVzEd2y8vwyPN8Jp3flvRvHCtIyq6
 0Aeu30t71HA+AzbzGuRP1U5uVtFbz7VEqYcujUdSplODdDgXnaOuqwrf3FfBn+kI0LTReI
 rXP7eREyLRfKRaJyEq6szdlWev9j5XE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-DpfIQMBQPBONcfECvkdMNw-1; Tue, 23 Mar 2021 11:36:26 -0400
X-MC-Unique: DpfIQMBQPBONcfECvkdMNw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73E3B800D53;
 Tue, 23 Mar 2021 15:36:25 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-41.ams2.redhat.com
 [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F7025C22B;
 Tue, 23 Mar 2021 15:36:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0D4F7180061A; Tue, 23 Mar 2021 16:36:17 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/5] qmp: add new qmp display-reload
Date: Tue, 23 Mar 2021 16:36:14 +0100
Message-Id: <20210323153616.873822-4-kraxel@redhat.com>
In-Reply-To: <20210323153616.873822-1-kraxel@redhat.com>
References: <20210323153616.873822-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Zihao Chang <changzihao1@huawei.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zihao Chang <changzihao1@huawei.com>

This patch provides a new qmp to reload display configuration
without restart VM, but only reloading the vnc tls certificates
is implemented.
Example:
{"execute": "display-reload", "arguments":{"type": "vnc", "tls-certs": true}}

Signed-off-by: Zihao Chang <changzihao1@huawei.com>
Message-Id: <20210316075845.1476-4-changzihao1@huawei.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 monitor/qmp-cmds.c | 17 +++++++++++++
 qapi/ui.json       | 61 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 78 insertions(+)

diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index c7df8c0ee268..f7d64a64577a 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -334,3 +334,20 @@ MemoryInfo *qmp_query_memory_size_summary(Error **errp)
 
     return mem_info;
 }
+
+void qmp_display_reload(DisplayReloadOptions *arg, Error **errp)
+{
+    switch (arg->type) {
+    case DISPLAY_RELOAD_TYPE_VNC:
+#ifdef CONFIG_VNC
+        if (arg->u.vnc.has_tls_certs && arg->u.vnc.tls_certs) {
+            vnc_display_reload_certs(NULL, errp);
+        }
+#else
+        error_setg(errp, "vnc is invalid, missing 'CONFIG_VNC'");
+#endif
+        break;
+    default:
+        abort();
+    }
+}
diff --git a/qapi/ui.json b/qapi/ui.json
index cc1882108b96..1052ca9c3848 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1168,3 +1168,64 @@
 ##
 { 'command': 'query-display-options',
   'returns': 'DisplayOptions' }
+
+##
+# @DisplayReloadType:
+#
+# Available DisplayReload types.
+#
+# @vnc: VNC display
+#
+# Since: 6.0
+#
+##
+{ 'enum': 'DisplayReloadType',
+  'data': ['vnc'] }
+
+##
+# @DisplayReloadOptionsVNC:
+#
+# Specify the VNC reload options.
+#
+# @tls-certs: reload tls certs or not.
+#
+# Since: 6.0
+#
+##
+{ 'struct': 'DisplayReloadOptionsVNC',
+  'data': { '*tls-certs': 'bool' } }
+
+##
+# @DisplayReloadOptions:
+#
+# Options of the display configuration reload.
+#
+# @type: Specify the display type.
+#
+# Since: 6.0
+#
+##
+{ 'union': 'DisplayReloadOptions',
+  'base': {'type': 'DisplayReloadType'},
+  'discriminator': 'type',
+  'data': { 'vnc': 'DisplayReloadOptionsVNC' } }
+
+##
+# @display-reload:
+#
+# Reload display configuration.
+#
+# Returns: Nothing on success.
+#
+# Since: 6.0
+#
+# Example:
+#
+# -> { "execute": "display-reload",
+#      "arguments": { "type": "vnc", "tls-certs": true  } }
+# <- { "return": {} }
+#
+##
+{ 'command': 'display-reload',
+  'data': 'DisplayReloadOptions',
+  'boxed' : true }
-- 
2.30.2


