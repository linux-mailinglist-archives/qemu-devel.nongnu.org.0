Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8F5336D60
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 08:56:46 +0100 (CET)
Received: from localhost ([::1]:33342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKGBZ-0007JF-QO
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 02:56:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lKG7h-0003XN-Vc
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 02:52:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lKG7S-00077v-G5
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 02:52:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615449149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=origTRd/6QwIFTBf2+vHW/E+QKQjO0XtzaaIEuVWKvI=;
 b=XKoMKHGlx41fiG9DB49ziRHpE6H3ScSanocHApUpVB2Pfwm54iWoG3ipurxHGpGJyqJYI/
 fvV90/kXHoZHbgEWudblhWTUC37Ipbou5MWXVjwNK0UbiXJaDzV9YsYdF++Q0Q6Py82/P8
 Keg0+wrCALA/5eqlK9DL3sQwuoKob4g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-jd4mMevVMJGJ3xqdSbZimg-1; Thu, 11 Mar 2021 02:52:27 -0500
X-MC-Unique: jd4mMevVMJGJ3xqdSbZimg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87108802690;
 Thu, 11 Mar 2021 07:52:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0800A5B6BF;
 Thu, 11 Mar 2021 07:52:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 90F991141CBD; Thu, 11 Mar 2021 08:52:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 4/4] blockdev: Drop deprecated bogus -drive interface type
Date: Thu, 11 Mar 2021 08:52:21 +0100
Message-Id: <20210311075221.1795266-5-armbru@redhat.com>
In-Reply-To: <20210311075221.1795266-1-armbru@redhat.com>
References: <20210311075221.1795266-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, berrange@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, richard.henderson@linaro.org, mreitz@redhat.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Drop the crap deprecated in commit a1b40bda08 "blockdev: Deprecate
-drive with bogus interface type" (v5.1.0).

drive_check_orphaned() no longer depends on qemu_create_cli_devices().
Call it right after board initialization for clarity.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 docs/system/deprecated.rst       |  7 ------
 docs/system/removed-features.rst |  7 ++++++
 include/sysemu/blockdev.h        |  1 -
 blockdev.c                       | 37 +++++++++++++-------------------
 softmmu/vl.c                     | 11 +---------
 5 files changed, 23 insertions(+), 40 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 8d43b9336a..1279b57ee2 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -94,13 +94,6 @@ QEMU 5.1 has three options:
       to the user to load all the images they need.
  3. ``-bios <file>`` - Tells QEMU to load the specified file as the firmwrae.
 
-``-drive`` with bogus interface type (since 5.1)
-''''''''''''''''''''''''''''''''''''''''''''''''
-
-Drives with interface types other than ``if=none`` are for onboard
-devices.  It is possible to use drives the board doesn't pick up with
--device.  This usage is now deprecated.  Use ``if=none`` instead.
-
 Short-form boolean options (since 6.0)
 ''''''''''''''''''''''''''''''''''''''
 
diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
index d10fc8cc17..40b1a5ede3 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -87,6 +87,13 @@ becomes
     -device isa-fdc,...
     -device floppy,unit=1,drive=...
 
+``-drive`` with bogus interface type (removed in 6.0)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Drives with interface types other than ``if=none`` are for onboard
+devices.  Drives the board doesn't pick up can no longer be used with
+-device.  Use ``if=none`` instead.
+
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
 
diff --git a/include/sysemu/blockdev.h b/include/sysemu/blockdev.h
index 3b5fcda08d..32c2d6023c 100644
--- a/include/sysemu/blockdev.h
+++ b/include/sysemu/blockdev.h
@@ -35,7 +35,6 @@ struct DriveInfo {
     bool is_default;            /* Added by default_drive() ?  */
     int media_cd;
     QemuOpts *opts;
-    bool claimed_by_board;
     QTAILQ_ENTRY(DriveInfo) next;
 };
 
diff --git a/blockdev.c b/blockdev.c
index 68f022827c..c6149fe6a8 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -239,19 +239,10 @@ DriveInfo *drive_get(BlockInterfaceType type, int bus, int unit)
     return NULL;
 }
 
-void drive_mark_claimed_by_board(void)
-{
-    BlockBackend *blk;
-    DriveInfo *dinfo;
-
-    for (blk = blk_next(NULL); blk; blk = blk_next(blk)) {
-        dinfo = blk_legacy_dinfo(blk);
-        if (dinfo && blk_get_attached_dev(blk)) {
-            dinfo->claimed_by_board = true;
-        }
-    }
-}
-
+/*
+ * Check board claimed all -drive that are meant to be claimed.
+ * Fatal error if any remain unclaimed.
+ */
 void drive_check_orphaned(void)
 {
     BlockBackend *blk;
@@ -261,7 +252,17 @@ void drive_check_orphaned(void)
 
     for (blk = blk_next(NULL); blk; blk = blk_next(blk)) {
         dinfo = blk_legacy_dinfo(blk);
-        if (dinfo->is_default || dinfo->type == IF_NONE) {
+        /*
+         * Ignore default drives, because we create certain default
+         * drives unconditionally, then leave them unclaimed.  Not the
+         * user's fault.
+         * Ignore IF_VIRTIO, because it gets desugared into -device.
+         * Leave failing to -device.
+         * Ignore IF_NONE, because leaving unclaimed IF_NONE available
+         * for device_add is a feature.
+         */
+        if (dinfo->is_default || dinfo->type == IF_VIRTIO
+            || dinfo->type == IF_NONE) {
             continue;
         }
         if (!blk_get_attached_dev(blk)) {
@@ -272,14 +273,6 @@ void drive_check_orphaned(void)
                          if_name[dinfo->type], dinfo->bus, dinfo->unit);
             loc_pop(&loc);
             orphans = true;
-            continue;
-        }
-        if (!dinfo->claimed_by_board && dinfo->type != IF_VIRTIO) {
-            loc_push_none(&loc);
-            qemu_opts_loc_restore(dinfo->opts);
-            warn_report("bogus if=%s is deprecated, use if=none",
-                        if_name[dinfo->type]);
-            loc_pop(&loc);
         }
     }
 
diff --git a/softmmu/vl.c b/softmmu/vl.c
index ff488ea3e7..acaba95346 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2460,13 +2460,7 @@ static void qemu_init_board(void)
     /* From here on we enter MACHINE_PHASE_INITIALIZED.  */
     machine_run_board_init(current_machine);
 
-    /*
-     * TODO To drop support for deprecated bogus if=..., move
-     * drive_check_orphaned() here, replacing this call.  Also drop
-     * its deprecation warning, along with DriveInfo member
-     * @claimed_by_board.
-     */
-    drive_mark_claimed_by_board();
+    drive_check_orphaned();
 
     realtime_init();
 
@@ -2500,9 +2494,6 @@ static void qemu_machine_creation_done(void)
 {
     MachineState *machine = MACHINE(qdev_get_machine());
 
-    /* Did we create any drives that we failed to create a device for? */
-    drive_check_orphaned();
-
     /* Don't warn about the default network setup that you get if
      * no command line -net or -netdev options are specified. There
      * are two cases that we would otherwise complain about:
-- 
2.26.2


