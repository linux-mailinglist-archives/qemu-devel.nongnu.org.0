Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A2A4FD36C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 11:52:58 +0200 (CEST)
Received: from localhost ([::1]:32866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neDCj-0003Es-2a
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 05:52:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@openvz.org>)
 id 1neDAz-0002I1-KC; Tue, 12 Apr 2022 05:51:09 -0400
Received: from relay.virtuozzo.com ([130.117.225.111]:49132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@openvz.org>)
 id 1neDAt-000186-Mz; Tue, 12 Apr 2022 05:51:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-Id:Date:Subject:From:
 Content-Type; bh=FjbqLd/xsNAD49CYXxpvI4JTbSpLN4DieCqiCs2/uN4=; b=ixMYz+OjXrFA
 XXj928Hgx8Lp+jniv3pRCl7ae+QXidFdhsDMpxPCfg01f0z6Rn5GasRg/WSoF2ihpmMEyrg49wjqy
 piFoI1SB2O6L37F0ScrxbJBEl6RGO7p3ZRnBQ3b7UNDSWAPIpkrrg2rHOJlgbO1O5YWxaIPhVeGSu
 fFvWQ=;
Received: from [192.168.16.228] (helo=iris.sw.ru)
 by relay.virtuozzo.com with esmtp (Exim 4.94.2)
 (envelope-from <den@openvz.org>)
 id 1neDAN-009oVH-6y; Tue, 12 Apr 2022 11:50:42 +0200
From: "Denis V. Lunev" <den@openvz.org>
To: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 for 7.1 1/1] block: add 'force' parameter to
 'blockdev-change-medium' command
Date: Tue, 12 Apr 2022 12:50:48 +0300
Message-Id: <20220412095048.231030-1-den@openvz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=130.117.225.111; envelope-from=den@openvz.org;
 helo=relay.virtuozzo.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>,
 "Denis V. Lunev" <den@openvz.org>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'blockdev-change-medium' is a convinient wrapper for the following
sequence of commands:
 * blockdev-open-tray
 * blockdev-remove-medium
 * blockdev-insert-medium
 * blockdev-close-tray
and should be used f.e. to change ISO image inside the CD-ROM tray.
Though the guest could lock the tray and some linux guests like
CentOS 8.5 actually does that. In this case the execution if this
command results in the error like the following:
  Device 'scsi0-0-1-0' is locked and force was not specified,
  wait for tray to open and try again.

This situation is could be resolved 'blockdev-open-tray' by passing
flag 'force' inside. Thus is seems reasonable to add the same
capability for 'blockdev-change-medium' too.

Signed-off-by: Denis V. Lunev <den@openvz.org>
CC: Kevin Wolf <kwolf@redhat.com>
CC: Hanna Reitz <hreitz@redhat.com>
CC: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
CC: Eric Blake <eblake@redhat.com>
CC: Markus Armbruster <armbru@redhat.com>
CC: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 block/qapi-sysemu.c |  3 ++-
 hmp-commands.hx     | 11 +++++++----
 monitor/hmp-cmds.c  |  4 +++-
 qapi/block.json     |  6 ++++++
 ui/cocoa.m          |  1 +
 5 files changed, 19 insertions(+), 6 deletions(-)

Changes from v1:
- added kludge to Objective C code
- simplified a bit call of do_open_tray() (thanks, Vova!)
- added record to hmp-command.hx

diff --git a/block/qapi-sysemu.c b/block/qapi-sysemu.c
index 8498402ad4..680c7ee342 100644
--- a/block/qapi-sysemu.c
+++ b/block/qapi-sysemu.c
@@ -318,6 +318,7 @@ void qmp_blockdev_change_medium(bool has_device, const char *device,
                                 bool has_id, const char *id,
                                 const char *filename,
                                 bool has_format, const char *format,
+                                bool has_force, bool force,
                                 bool has_read_only,
                                 BlockdevChangeReadOnlyMode read_only,
                                 Error **errp)
@@ -380,7 +381,7 @@ void qmp_blockdev_change_medium(bool has_device, const char *device,
 
     rc = do_open_tray(has_device ? device : NULL,
                       has_id ? id : NULL,
-                      false, &err);
+                      force, &err);
     if (rc && rc != -ENOSYS) {
         error_propagate(errp, err);
         goto fail;
diff --git a/hmp-commands.hx b/hmp-commands.hx
index 8476277aa9..6ec593ea08 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -202,9 +202,9 @@ ERST
 
     {
         .name       = "change",
-        .args_type  = "device:B,target:F,arg:s?,read-only-mode:s?",
-        .params     = "device filename [format [read-only-mode]]",
-        .help       = "change a removable medium, optional format",
+        .args_type  = "device:B,force:-f,target:F,arg:s?,read-only-mode:s?",
+        .params     = "device [-f] filename [format [read-only-mode]]",
+        .help       = "change a removable medium, optional format, use -f to force the operation",
         .cmd        = hmp_change,
     },
 
@@ -212,11 +212,14 @@ SRST
 ``change`` *device* *setting*
   Change the configuration of a device.
 
-  ``change`` *diskdevice* *filename* [*format* [*read-only-mode*]]
+  ``change`` *diskdevice* [-f] *filename* [*format* [*read-only-mode*]]
     Change the medium for a removable disk device to point to *filename*. eg::
 
       (qemu) change ide1-cd0 /path/to/some.iso
 
+    ``-f``
+      forces the operation even if the guest has locked the tray.
+
     *format* is optional.
 
     *read-only-mode* may be used to change the read-only status of the device.
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 634968498b..d8b98bed6c 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1472,6 +1472,7 @@ void hmp_change(Monitor *mon, const QDict *qdict)
     const char *target = qdict_get_str(qdict, "target");
     const char *arg = qdict_get_try_str(qdict, "arg");
     const char *read_only = qdict_get_try_str(qdict, "read-only-mode");
+    bool force = qdict_get_try_bool(qdict, "force", false);
     BlockdevChangeReadOnlyMode read_only_mode = 0;
     Error *err = NULL;
 
@@ -1508,7 +1509,8 @@ void hmp_change(Monitor *mon, const QDict *qdict)
         }
 
         qmp_blockdev_change_medium(true, device, false, NULL, target,
-                                   !!arg, arg, !!read_only, read_only_mode,
+                                   !!arg, arg, true, force,
+                                   !!read_only, read_only_mode,
                                    &err);
     }
 
diff --git a/qapi/block.json b/qapi/block.json
index 82fcf2c914..3f100d4887 100644
--- a/qapi/block.json
+++ b/qapi/block.json
@@ -326,6 +326,11 @@
 # @read-only-mode: change the read-only mode of the device; defaults
 #                  to 'retain'
 #
+# @force: if false (the default), an eject request through blockdev-open-tray
+#         will be sent to the guest if it has locked the tray (and the tray
+#         will not be opened immediately); if true, the tray will be opened
+#         regardless of whether it is locked. (since 7.1)
+#
 # Features:
 # @deprecated: Member @device is deprecated.  Use @id instead.
 #
@@ -367,6 +372,7 @@
             '*id': 'str',
             'filename': 'str',
             '*format': 'str',
+            '*force': 'bool',
             '*read-only-mode': 'BlockdevChangeReadOnlyMode' } }
 
 
diff --git a/ui/cocoa.m b/ui/cocoa.m
index c4e5468f9e..a931174397 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -1529,6 +1529,7 @@ - (void)changeDeviceMedia:(id)sender
                                        false, NULL,
                                        [file cStringUsingEncoding:
                                                  NSASCIIStringEncoding],
+                                       true, false,
                                        true, "raw",
                                        false, 0,
                                        &err);
-- 
2.32.0


