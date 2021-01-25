Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC763027D0
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 17:28:13 +0100 (CET)
Received: from localhost ([::1]:34478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l44iq-0005Ds-JS
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 11:28:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l44f4-0001g1-GL
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 11:24:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l44ey-0007jU-Nw
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 11:24:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611591850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Irr3/weK+OEk/uRyCOapqgobtTdUG41AY4OFmrn1JEI=;
 b=A0pSqVQlJcJ7tQjEmLzxO2PokllhW5PWNuD0c2SrpvTzfzjZ5BjlpWoBZvPD3Udw97HK0V
 5y7c9HWyYiL2aAEXjPA9gLgGhmU260nRKPBSDDq8JECvDAgRJ0T4YmJeH/KOrDxQhpaWEz
 CGQZOiXrwx418Bhowqb3eLAzLzrPWGQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-cKCk319GPNWcKTfHjm4Jpw-1; Mon, 25 Jan 2021 11:24:08 -0500
X-MC-Unique: cKCk319GPNWcKTfHjm4Jpw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2993107ACE4;
 Mon, 25 Jan 2021 16:24:07 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8259F10013BD;
 Mon, 25 Jan 2021 16:24:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 120E51138468; Mon, 25 Jan 2021 17:24:03 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] blockdev: Drop deprecated bogus -drive interface type
Date: Mon, 25 Jan 2021 17:24:02 +0100
Message-Id: <20210125162402.1807394-4-armbru@redhat.com>
In-Reply-To: <20210125162402.1807394-1-armbru@redhat.com>
References: <20210125162402.1807394-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: kwolf@redhat.com, libvir-list@redhat.com, jsnow@redhat.com,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Drop the crap deprecated in commit a1b40bda08 "blockdev: Deprecate
-drive with bogus interface type" (v5.1.0).

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 docs/system/deprecated.rst       |  7 ------
 docs/system/removed-features.rst |  7 ++++++
 include/sysemu/blockdev.h        |  1 -
 blockdev.c                       | 37 +++++++++++++-------------------
 softmmu/vl.c                     |  8 +------
 5 files changed, 23 insertions(+), 37 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index ccbddc79ff..2d0c46ec63 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -94,13 +94,6 @@ QEMU 5.1 has three options:
       to the user to load all the images they need.
  3. ``-bios <file>`` - Tells QEMU to load the specified file as the firmwrae.
 
-``-drive`` with bogus interface type
-''''''''''''''''''''''''''''''''''''
-
-Drives with interface types other than ``if=none`` are for onboard
-devices.  It is possible to use drives the board doesn't pick up with
--device.  This usage is now deprecated.  Use ``if=none`` instead.
-
 Short-form boolean options (since 6.0)
 ''''''''''''''''''''''''''''''''''''''
 
diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
index d17c39bce3..61c3f504b0 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -64,6 +64,13 @@ become
 
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
index 2431448c5d..8e7be8b7b1 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -240,19 +240,10 @@ DriveInfo *drive_get(BlockInterfaceType type, int bus, int unit)
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
@@ -262,7 +253,17 @@ void drive_check_orphaned(void)
 
     for (blk = blk_next(NULL); blk; blk = blk_next(blk)) {
         dinfo = blk_legacy_dinfo(blk);
-        if (dinfo->is_default || dinfo->type == IF_NONE) {
+        /*
+         * Ignore default drives, because we create certain default
+         * drives unconditionally, then leave them unclaimed.  Not the
+         * users fault.
+         * Ignore IF_VIRTIO, because it gets desugared into -device,
+         * so we can leave failing to -device.
+         * Ignore IF_NONE, because leaving unclaimed IF_NONE remains
+         * available for device_add is a feature.
+         */
+        if (dinfo->is_default || dinfo->type == IF_VIRTIO
+            || dinfo->type == IF_NONE) {
             continue;
         }
         if (!blk_get_attached_dev(blk)) {
@@ -273,14 +274,6 @@ void drive_check_orphaned(void)
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
index a8876b8965..81766cd568 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2454,13 +2454,7 @@ static void qemu_init_board(void)
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
 
-- 
2.26.2


