Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9334B5606C2
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 18:54:26 +0200 (CEST)
Received: from localhost ([::1]:37846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6axN-0000oZ-B0
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 12:54:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkujaw@member.fsf.org>)
 id 1o6af3-0001PM-9N; Wed, 29 Jun 2022 12:35:29 -0400
Received: from mout-u-204.mailbox.org ([2001:67c:2050:101:465::204]:49108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <lkujaw@member.fsf.org>)
 id 1o6af1-0001Xu-7z; Wed, 29 Jun 2022 12:35:28 -0400
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-u-204.mailbox.org (Postfix) with ESMTPS id 4LY6Wd43b7z9sWv;
 Wed, 29 Jun 2022 18:35:09 +0200 (CEST)
From: Lev Kujawski <lkujaw@member.fsf.org>
To: qemu-devel@nongnu.org
Cc: Lev Kujawski <lkujaw@member.fsf.org>, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org (open list:IDE)
Subject: [PATCH 2/2] hw/ide/core.c: Implement ATA INITIALIZE_DEVICE_PARAMETERS
 command
Date: Wed, 29 Jun 2022 16:34:50 +0000
Message-Id: <20220629163450.210111-2-lkujaw@member.fsf.org>
In-Reply-To: <20220629163450.210111-1-lkujaw@member.fsf.org>
References: <20220629163450.210111-1-lkujaw@member.fsf.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2050:101:465::204;
 envelope-from=lkujaw@member.fsf.org; helo=mout-u-204.mailbox.org
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CHS-based disk utilities and operating systems may adjust the logical
geometry of a hard drive to cope with the expectations or limitations
of software using the ATA INITIALIZE_DEVICE_PARAMETERS command.

Prior to this patch, INITIALIZE_DEVICE_PARAMETERS was a nop that
always returned success, raising the possibility of data loss or
corruption if the CHS<->LBA translation redirected a write to the
wrong sector.

* hw/ide/core.c
ide_reset():
- Reset the logical CHS geometry of the hard disk when the power-on
  defaults feature is enabled.
cmd_specify():
- New function implementing INITIALIZE_DEVICE_PARAMETERS.
- Ignore calls for empty or ATAPI devices.
cmd_set_features():
- Implement the power-on defaults enable and disable features.
struct ide_cmd_table:
- Switch WIN_SPECIFY from cmd_nop() to cmd_specify().
ide_init_drive():
- Set new fields 'drive_heads' and 'drive_sectors' based upon the
  actual disk geometry.

* include/hw/ide/internal.h
struct IDEState:
- Store the actual drive CHS values within the new fields
  'drive_heads' and 'drive_sectors.'
- Track whether a soft IDE reset should also reset the logical CHS
  geometry of the hard disk within the new field 'reset_reverts'.
---
 hw/ide/core.c             | 29 ++++++++++++++++++++++++++---
 include/hw/ide/internal.h |  3 +++
 2 files changed, 29 insertions(+), 3 deletions(-)

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
-- 
2.34.1


