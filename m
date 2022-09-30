Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 430BF5F109D
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 19:16:40 +0200 (CEST)
Received: from localhost ([::1]:57232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeJct-0004LD-9L
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 13:16:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oeJFv-0006lS-TV
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 12:52:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oeJFt-0006hn-V1
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 12:52:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664556773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VRlEUOM1qeE9+nvz4hF5vEgRMiGWQ0qR7RFnjxXiuB8=;
 b=BtaIDZbLWFc3i7rDCHGHR72ED0L8QU7sgP9c99zNpUPSx4XdUoCpXeOUufMFxMrn+xJebc
 qnPdgmapMwR+bmsblym9fd2i9u89X8Ph4N5586L4zI6rtSQWbBbkM/w0QJA014Sb1QR8Vx
 oVEGGFeb+UkW0frutxSIl6gPpHASHkY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-nnhQVtpLNuayQOZLURytvw-1; Fri, 30 Sep 2022 12:52:52 -0400
X-MC-Unique: nnhQVtpLNuayQOZLURytvw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D19693C10226;
 Fri, 30 Sep 2022 16:52:51 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.192.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1DC0417582;
 Fri, 30 Sep 2022 16:52:51 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 18/18] hw/ide/core.c: Implement ATA
 INITIALIZE_DEVICE_PARAMETERS command
Date: Fri, 30 Sep 2022 18:52:22 +0200
Message-Id: <20220930165222.249716-19-kwolf@redhat.com>
In-Reply-To: <20220930165222.249716-1-kwolf@redhat.com>
References: <20220930165222.249716-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lev Kujawski <lkujaw@member.fsf.org>

CHS-based disk utilities and operating systems may adjust the logical
geometry of a hard drive to cope with the expectations or limitations
of software using the ATA INITIALIZE_DEVICE_PARAMETERS command.

Prior to this patch, INITIALIZE_DEVICE_PARAMETERS was a nop that
always returned success, raising the possibility of data loss or
corruption if the CHS<->LBA translation redirected a write to the
wrong sector.

* hw/ide/core.c
ide_reset():
  Reset the logical CHS geometry of the hard disk when the power-on
  defaults feature is enabled.
cmd_specify():
  a) New function implementing INITIALIZE_DEVICE_PARAMETERS.
  b) Ignore calls for empty or ATAPI devices.
cmd_set_features():
  Implement the power-on defaults enable and disable features.
struct ide_cmd_table:
  Switch WIN_SPECIFY from cmd_nop() to cmd_specify().
ide_init_drive():
  Set new fields 'drive_heads' and 'drive_sectors' based upon the
  actual disk geometry.

* include/hw/ide/internal.h
struct IDEState:
a) Store the actual drive CHS values within the new fields
   'drive_heads' and 'drive_sectors.'
b) Track whether a soft IDE reset should also reset the logical CHS
   geometry of the hard disk within the new field 'reset_reverts'.

Signed-off-by: Lev Kujawski <lkujaw@member.fsf.org>
Message-Id: <20220707031140.158958-7-lkujaw@member.fsf.org>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/hw/ide/internal.h |  3 +++
 hw/ide/core.c             | 29 ++++++++++++++++++++++++++---
 2 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index 97e7e59dc5..b17f36df95 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -375,6 +375,7 @@ struct IDEState {
     uint8_t unit;
     /* ide config */
     IDEDriveKind drive_kind;
+    int drive_heads, drive_sectors;
     int cylinders, heads, sectors, chs_trans;
     int64_t nb_sectors;
     int mult_sectors;
@@ -401,6 +402,8 @@ struct IDEState {
     uint8_t select;
     uint8_t status;
 
+    bool reset_reverts;
+
     /* set for lba48 access */
     uint8_t lba48;
     BlockBackend *blk;
diff --git a/hw/ide/core.c b/hw/ide/core.c
index b747191ebf..39afdc0006 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -1340,6 +1340,11 @@ static void ide_reset(IDEState *s)
         s->pio_aiocb = NULL;
     }
 
+    if (s->reset_reverts) {
+        s->reset_reverts = false;
+        s->heads         = s->drive_heads;
+        s->sectors       = s->drive_sectors;
+    }
     if (s->drive_kind == IDE_CFATA)
         s->mult_sectors = 0;
     else
@@ -1618,6 +1623,20 @@ static bool cmd_check_power_mode(IDEState *s, uint8_t cmd)
     return true;
 }
 
+/* INITIALIZE DEVICE PARAMETERS */
+static bool cmd_specify(IDEState *s, uint8_t cmd)
+{
+    if (s->blk && s->drive_kind != IDE_CD) {
+        s->heads = (s->select & (ATA_DEV_HS)) + 1;
+        s->sectors = s->nsector;
+        ide_set_irq(s->bus);
+    } else {
+        ide_abort_command(s);
+    }
+
+    return true;
+}
+
 static bool cmd_set_features(IDEState *s, uint8_t cmd)
 {
     uint16_t *identify_data;
@@ -1641,7 +1660,11 @@ static bool cmd_set_features(IDEState *s, uint8_t cmd)
         ide_flush_cache(s);
         return false;
     case 0xcc: /* reverting to power-on defaults enable */
+        s->reset_reverts = true;
+        return true;
     case 0x66: /* reverting to power-on defaults disable */
+        s->reset_reverts = false;
+        return true;
     case 0xaa: /* read look-ahead enable */
     case 0x55: /* read look-ahead disable */
     case 0x05: /* set advanced power management mode */
@@ -2051,7 +2074,7 @@ static const struct {
     [WIN_SEEK]                    = { cmd_seek, HD_CFA_OK | SET_DSC },
     [CFA_TRANSLATE_SECTOR]        = { cmd_cfa_translate_sector, CFA_OK },
     [WIN_DIAGNOSE]                = { cmd_exec_dev_diagnostic, ALL_OK },
-    [WIN_SPECIFY]                 = { cmd_nop, HD_CFA_OK | SET_DSC },
+    [WIN_SPECIFY]                 = { cmd_specify, HD_CFA_OK | SET_DSC },
     [WIN_STANDBYNOW2]             = { cmd_nop, HD_CFA_OK },
     [WIN_IDLEIMMEDIATE2]          = { cmd_nop, HD_CFA_OK },
     [WIN_STANDBY2]                = { cmd_nop, HD_CFA_OK },
@@ -2541,8 +2564,8 @@ int ide_init_drive(IDEState *s, BlockBackend *blk, IDEDriveKind kind,
 
     blk_get_geometry(blk, &nb_sectors);
     s->cylinders = cylinders;
-    s->heads = heads;
-    s->sectors = secs;
+    s->heads = s->drive_heads = heads;
+    s->sectors = s->drive_sectors = secs;
     s->chs_trans = chs_trans;
     s->nb_sectors = nb_sectors;
     s->wwn = wwn;
-- 
2.37.3


