Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B4043DAC2
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 07:32:40 +0200 (CEST)
Received: from localhost ([::1]:38568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfy1n-0000yH-Pi
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 01:32:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfxzR-0007Ge-Fm
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 01:30:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfxzP-0000y9-J8
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 01:30:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635399010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6jjZkV51NqSID/Jd4Ddm654xicoEmoj+KgJoXbD3X4M=;
 b=htfXoVn0Vghjm2MW/fydqmRs20NgbYXKfIVY6SZPxbc4oXoTs6dBkt4ctpEAqnruZAtwpG
 EQVmNJ74p6Zd9WKTer2SRVQUoWDAeFVBKUXBGcpZthGcL4J/V3rsfAXtALzKN3PkxZIUou
 ysXQtODtt6uS1Qsh7hoVMi8RSn43C50=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-uZPGfLvRNkC8QY7HUsMeog-1; Thu, 28 Oct 2021 01:30:07 -0400
X-MC-Unique: uZPGfLvRNkC8QY7HUsMeog-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E92201006AA5;
 Thu, 28 Oct 2021 05:30:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E02201A26A;
 Thu, 28 Oct 2021 05:29:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9D86611380C3; Thu, 28 Oct 2021 07:29:55 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/4] qapi/monitor: only allow 'keep' SetPasswordAction for VNC
 and deprecate
Date: Thu, 28 Oct 2021 07:29:55 +0200
Message-Id: <20211028052955.454209-5-armbru@redhat.com>
In-Reply-To: <20211028052955.454209-1-armbru@redhat.com>
References: <20211028052955.454209-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eric Blake <eblake@redhat.com>, Stefan Reiter <s.reiter@proxmox.com>,
 richard.henderson@linaro.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Reiter <s.reiter@proxmox.com>

VNC only supports 'keep' here, enforce this via a seperate
SetPasswordActionVnc enum and mark the option 'deprecated' (as it is
useless with only one value possible).

Also add a deprecation note to docs.

Suggested-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
Message-Id: <20211021100135.4146766-5-s.reiter@proxmox.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 docs/about/deprecated.rst |  6 ++++++
 qapi/ui.json              | 21 ++++++++++++++++++++-
 monitor/qmp-cmds.c        |  5 -----
 3 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index be19317470..15b016e344 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -234,6 +234,12 @@ single ``bitmap``, the new ``block-export-add`` uses a list of ``bitmaps``.
 Member ``values`` in return value elements with meta-type ``enum`` is
 deprecated.  Use ``members`` instead.
 
+``set_password`` argument ``connected`` for VNC protocol (since 6.2)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Only the value ``keep`` is and was ever supported for VNC. The (useless)
+argument will be dropped in a future version of QEMU.
+
 System accelerators
 -------------------
 
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
-- 
2.31.1


