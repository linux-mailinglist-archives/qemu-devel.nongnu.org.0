Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52701435EA3
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 12:07:52 +0200 (CEST)
Received: from localhost ([::1]:53682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdUzH-0007N2-EJ
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 06:07:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1mdUtQ-0001gz-6m
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 06:01:48 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:64823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1mdUtN-0002mi-4W
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 06:01:47 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id A0A2B45CDB;
 Thu, 21 Oct 2021 12:01:41 +0200 (CEST)
From: Stefan Reiter <s.reiter@proxmox.com>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Wolfgang Bumiller <w.bumiller@proxmox.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Subject: [PATCH v7 4/4] qapi/monitor: only allow 'keep' SetPasswordAction for
 VNC and deprecate
Date: Thu, 21 Oct 2021 12:01:35 +0200
Message-Id: <20211021100135.4146766-5-s.reiter@proxmox.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211021100135.4146766-1-s.reiter@proxmox.com>
References: <20211021100135.4146766-1-s.reiter@proxmox.com>
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

Also add a deprecation note to docs.

Suggested-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
---
 docs/about/deprecated.rst |  6 ++++++
 monitor/qmp-cmds.c        |  5 -----
 qapi/ui.json              | 21 ++++++++++++++++++++-
 3 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 0bed6ecb1d..f484b058bc 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -228,6 +228,12 @@ Use the more generic commands ``block-export-add`` and ``block-export-del``
 instead.  As part of this deprecation, where ``nbd-server-add`` used a
 single ``bitmap``, the new ``block-export-add`` uses a list of ``bitmaps``.
 
+``set_password`` argument ``connected`` for VNC protocol (since 6.2)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Only the value ``keep`` is and was ever supported for VNC. The (useless)
+argument will be dropped in a future version of QEMU.
+
 System accelerators
 -------------------
 
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



