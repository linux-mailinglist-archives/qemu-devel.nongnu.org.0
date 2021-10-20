Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C59434CF4
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 16:01:00 +0200 (CEST)
Received: from localhost ([::1]:47248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdC9L-0006aY-Sk
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 10:00:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1mdC3r-00076c-4k
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 09:55:19 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:35305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1mdC3o-0006uM-Ls
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 09:55:18 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id F2FEB452EF;
 Wed, 20 Oct 2021 15:55:13 +0200 (CEST)
From: Stefan Reiter <s.reiter@proxmox.com>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Wolfgang Bumiller <w.bumiller@proxmox.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Subject: [PATCH v6 4/5] qapi/monitor: only allow 'keep' SetPasswordAction for
 VNC and deprecate
Date: Wed, 20 Oct 2021 15:54:59 +0200
Message-Id: <20211020135500.2384930-5-s.reiter@proxmox.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211020135500.2384930-1-s.reiter@proxmox.com>
References: <20211020135500.2384930-1-s.reiter@proxmox.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=s.reiter@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VNC only supports 'keep' here, enforce this via a seperate
SetPasswordActionVnc enum and mark the option 'deprecated' (as it is
useless with only one value possible).

Suggested-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
---
 monitor/qmp-cmds.c |  5 -----
 qapi/ui.json       | 21 ++++++++++++++++++++-
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 5637bd70b6..4825d0cbea 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -176,11 +176,6 @@ void qmp_set_password(SetPasswordOptions *opts, Error **errp)
                 opts->u.spice.connected == SET_PASSWORD_ACTION_DISCONNECT);
     } else {
         assert(opts->protocol == DISPLAY_PROTOCOL_VNC);
-        if (opts->u.vnc.connected != SET_PASSWORD_ACTION_KEEP) {
-            /* vnc supports "connected=keep" only */
-            error_setg(errp, QERR_INVALID_PARAMETER, "connected");
-            return;
-        }
         /* Note that setting an empty password will not disable login through
          * this interface. */
         rc = vnc_display_password(opts->u.vnc.display, opts->password);
diff --git a/qapi/ui.json b/qapi/ui.json
index 99ac29ad9c..5292617b44 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -38,6 +38,20 @@
 { 'enum': 'SetPasswordAction',
   'data': [ 'fail', 'disconnect', 'keep' ] }
 
+##
+# @SetPasswordActionVnc:
+#
+# See @SetPasswordAction. VNC only supports the keep action. 'connection'
+# should just be omitted for VNC, this is kept for backwards compatibility.
+#
+# @keep: maintain existing clients
+#
+# Since: 6.2
+#
+##
+{ 'enum': 'SetPasswordActionVnc',
+  'data': [ 'keep' ] }
+
 ##
 # @SetPasswordOptions:
 #
@@ -83,12 +97,17 @@
 # @connected: How to handle existing clients when changing the
 #             password.
 #
+# Features:
+# @deprecated: For VNC, @connected will always be 'keep', parameter should be
+#              omitted.
+#
 # Since: 6.2
 #
 ##
 { 'struct': 'SetPasswordOptionsVnc',
   'data': { '*display': 'str',
-            '*connected': 'SetPasswordAction' }}
+            '*connected': { 'type': 'SetPasswordActionVnc',
+                            'features': ['deprecated'] } } }
 
 ##
 # @set_password:
-- 
2.30.2



