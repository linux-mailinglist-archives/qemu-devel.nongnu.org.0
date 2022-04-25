Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E53A50E2CB
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 16:14:38 +0200 (CEST)
Received: from localhost ([::1]:55396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nizU5-0007Cv-ON
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 10:14:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nizOC-0004dA-1F
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:08:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nizOA-0001wt-4s
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:08:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650895709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qjGc0g5hl3pEZeoSZq4crs6p661wmhYJeS+kfwTcQtQ=;
 b=TIS6WDNGVxii/Ad6JyuwwWkoKL6qFQppwMLwquxZAQKXRWfcWR+cgvJJnY5tSjzUl9UgDS
 Sg9nfIzTBZpnnQU03+jV2rqvTdOLbtNM/SK3j9tA0186+iK7kdMdwMXxOjONVR37ITNy/S
 htQm0A/ybtm314i1YBuO5aWdXJKhvuE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-D5ScpPv8MWGNjqPKHVFjuA-1; Mon, 25 Apr 2022 10:08:25 -0400
X-MC-Unique: D5ScpPv8MWGNjqPKHVFjuA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DCAA538337FB;
 Mon, 25 Apr 2022 14:08:24 +0000 (UTC)
Received: from localhost (unknown [10.39.194.198])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 91B9740D1B9B;
 Mon, 25 Apr 2022 14:08:24 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 01/14] block: add 'force' parameter to 'blockdev-change-medium'
 command
Date: Mon, 25 Apr 2022 16:08:08 +0200
Message-Id: <20220425140821.957511-2-hreitz@redhat.com>
In-Reply-To: <20220425140821.957511-1-hreitz@redhat.com>
References: <20220425140821.957511-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Hanna Reitz <hreitz@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Denis V. Lunev" <den@openvz.org>

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
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Acked-by: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
CC: Kevin Wolf <kwolf@redhat.com>
CC: Hanna Reitz <hreitz@redhat.com>
CC: Eric Blake <eblake@redhat.com>
CC: Markus Armbruster <armbru@redhat.com>
Message-Id: <20220412221846.280723-1-den@openvz.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 qapi/block.json     |  6 ++++++
 block/qapi-sysemu.c |  3 ++-
 monitor/hmp-cmds.c  |  4 +++-
 hmp-commands.hx     | 11 +++++++----
 ui/cocoa.m          |  1 +
 5 files changed, 19 insertions(+), 6 deletions(-)

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
 
diff --git a/hmp-commands.hx b/hmp-commands.hx
index dd4006d355..34947d6d20 100644
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
diff --git a/ui/cocoa.m b/ui/cocoa.m
index 68bff4ff37..09a62817f2 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -1531,6 +1531,7 @@ - (void)changeDeviceMedia:(id)sender
                                        [file cStringUsingEncoding:
                                                  NSASCIIStringEncoding],
                                        true, "raw",
+                                       true, false,
                                        false, 0,
                                        &err);
         });
-- 
2.35.1


