Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0543D0B82
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 11:36:33 +0200 (CEST)
Received: from localhost ([::1]:46158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m68eW-0003wl-DJ
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 05:36:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m68c4-0001RV-Qk
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:34:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m68c3-00063G-7x
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:34:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626860038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tcsMpfPBGwvlXcHMHCH5R0jAehp06wi47Sm23kfN+Ss=;
 b=ejQx9k2H6iijnP31cdhu8zw4Gdl2uFNEG8imMnXVTVF6c6GsYGNRjNI5jwgCBqHPw0xHBm
 liQcbnsD7zFpyPgmDRX9uDP428HM/4QATN6judZ3T9/Jbgkc93agmEsLmbNzezx72S7p7D
 gCVruWVbw9O8+gB4+RmqP4cw09F+1Dg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-D6GpCrM0MFKBpsw2Io38xA-1; Wed, 21 Jul 2021 05:33:55 -0400
X-MC-Unique: D6GpCrM0MFKBpsw2Io38xA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AADCE1084F53
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 09:33:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-106.ams2.redhat.com
 [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E23C019D7C;
 Wed, 21 Jul 2021 09:33:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 91A0F18000B5; Wed, 21 Jul 2021 11:33:47 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] Revert "qxl: add migration blocker to avoid pre-save
 assert"
Date: Wed, 21 Jul 2021 11:33:47 +0200
Message-Id: <20210721093347.338536-3-kraxel@redhat.com>
In-Reply-To: <20210721093347.338536-1-kraxel@redhat.com>
References: <20210721093347.338536-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: armbru@redhat.com, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit 86dbcdd9c7590d06db89ca256c5eaf0b4aba8858.

The pre-save assert is gone now, so the migration blocker
is not needed any more.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/qxl.h |  1 -
 hw/display/qxl.c | 31 -------------------------------
 2 files changed, 32 deletions(-)

diff --git a/hw/display/qxl.h b/hw/display/qxl.h
index 379d3304abc1..30d21f4d0bdc 100644
--- a/hw/display/qxl.h
+++ b/hw/display/qxl.h
@@ -39,7 +39,6 @@ struct PCIQXLDevice {
     uint32_t           cmdlog;
 
     uint32_t           guest_bug;
-    Error              *migration_blocker;
 
     enum qxl_mode      mode;
     uint32_t           cmdflags;
diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index 3867b94fe236..43482d4364ba 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -30,7 +30,6 @@
 #include "qemu/module.h"
 #include "hw/qdev-properties.h"
 #include "sysemu/runstate.h"
-#include "migration/blocker.h"
 #include "migration/vmstate.h"
 #include "trace.h"
 
@@ -666,30 +665,6 @@ static int interface_get_command(QXLInstance *sin, struct QXLCommandExt *ext)
         qxl->guest_primary.commands++;
         qxl_track_command(qxl, ext);
         qxl_log_command(qxl, "cmd", ext);
-        {
-            /*
-             * Windows 8 drivers place qxl commands in the vram
-             * (instead of the ram) bar.  We can't live migrate such a
-             * guest, so add a migration blocker in case we detect
-             * this, to avoid triggering the assert in pre_save().
-             *
-             * https://cgit.freedesktop.org/spice/win32/qxl-wddm-dod/commit/?id=f6e099db39e7d0787f294d5fd0dce328b5210faa
-             */
-            void *msg = qxl_phys2virt(qxl, ext->cmd.data, ext->group_id);
-            if (msg != NULL && (
-                    msg < (void *)qxl->vga.vram_ptr ||
-                    msg > ((void *)qxl->vga.vram_ptr + qxl->vga.vram_size))) {
-                if (!qxl->migration_blocker) {
-                    Error *local_err = NULL;
-                    error_setg(&qxl->migration_blocker,
-                               "qxl: guest bug: command not in ram bar");
-                    migrate_add_blocker(qxl->migration_blocker, &local_err);
-                    if (local_err) {
-                        error_report_err(local_err);
-                    }
-                }
-            }
-        }
         trace_qxl_ring_command_get(qxl->id, qxl_mode_to_string(qxl->mode));
         return true;
     default:
@@ -1283,12 +1258,6 @@ static void qxl_hard_reset(PCIQXLDevice *d, int loadvm)
     qemu_spice_create_host_memslot(&d->ssd);
     qxl_soft_reset(d);
 
-    if (d->migration_blocker) {
-        migrate_del_blocker(d->migration_blocker);
-        error_free(d->migration_blocker);
-        d->migration_blocker = NULL;
-    }
-
     if (startstop) {
         qemu_spice_display_start();
     }
-- 
2.31.1


