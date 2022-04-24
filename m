Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6671E50D3B8
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Apr 2022 18:55:55 +0200 (CEST)
Received: from localhost ([::1]:48918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nifWc-0002V4-FE
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 12:55:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nifR7-0002Au-01; Sun, 24 Apr 2022 12:50:13 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:36142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nifR2-00013V-3G; Sun, 24 Apr 2022 12:50:09 -0400
Received: from [2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nifQ8-000BIt-01; Sun, 24 Apr 2022 17:49:12 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: pbonzini@redhat.com, laurent@vivier.eu, fam@euphon.net,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Date: Sun, 24 Apr 2022 17:49:29 +0100
Message-Id: <20220424164935.7339-6-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220424164935.7339-1-mark.cave-ayland@ilande.co.uk>
References: <20220424164935.7339-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 05/11] scsi-disk: add
 SCSI_DISK_QUIRK_MODE_SENSE_ROM_FORCE_DBD quirk for Macintosh
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

During SCSI bus enumeration A/UX sends a MODE SENSE command to the CDROM and
expects the response to include a block descriptor. As per the latest SCSI
documentation, QEMU currently force-disables the block descriptor for CDROM
devices but the A/UX driver expects the block descriptor to always be
returned.

If the block descriptor is not returned in the response then A/UX becomes
confused, since the block descriptor returned in the MODE SENSE response is
used to generate a subsequent MODE SELECT command which is then invalid.

Add a new SCSI_DISK_QUIRK_MODE_SENSE_ROM_FORCE_DBD to allow this behaviour
to be enabled as required.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/scsi-disk.c    | 18 +++++++++++++-----
 include/hw/scsi/scsi.h |  1 +
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 5de4506b97..71fdf132c1 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -1279,10 +1279,17 @@ static int scsi_disk_emulate_mode_sense(SCSIDiskReq *r, uint8_t *outbuf)
             dev_specific_param |= 0x80; /* Readonly.  */
         }
     } else {
-        /* MMC prescribes that CD/DVD drives have no block descriptors,
-         * and defines no device-specific parameter.  */
-        dev_specific_param = 0x00;
-        dbd = true;
+        if (s->quirks & (1 << SCSI_DISK_QUIRK_MODE_SENSE_ROM_FORCE_DBD)) {
+            dev_specific_param = 0x00;
+            dbd = false;
+        } else {
+            /*
+             * MMC prescribes that CD/DVD drives have no block descriptors,
+             * and defines no device-specific parameter.
+             */
+            dev_specific_param = 0x00;
+            dbd = true;
+        }
     }
 
     if (r->req.cmd.buf[0] == MODE_SENSE) {
@@ -1578,7 +1585,6 @@ static void scsi_disk_emulate_mode_select(SCSIDiskReq *r, uint8_t *inbuf)
     /* Ensure no change is made if there is an error!  */
     for (pass = 0; pass < 2; pass++) {
         if (mode_select_pages(r, p, len, pass == 1) < 0) {
-            assert(pass == 0);
             return;
         }
     }
@@ -3107,6 +3113,8 @@ static Property scsi_cd_properties[] = {
                        DEFAULT_MAX_IO_SIZE),
     DEFINE_PROP_INT32("scsi_version", SCSIDiskState, qdev.default_scsi_version,
                       5),
+    DEFINE_PROP_BIT("quirk_mode_sense_rom_force_dbd", SCSIDiskState, quirks,
+                    SCSI_DISK_QUIRK_MODE_SENSE_ROM_FORCE_DBD, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
index 975d462347..a9e657e03c 100644
--- a/include/hw/scsi/scsi.h
+++ b/include/hw/scsi/scsi.h
@@ -228,5 +228,6 @@ extern const SCSIReqOps scsi_generic_req_ops;
 
 /* scsi-disk.c */
 #define SCSI_DISK_QUIRK_MODE_PAGE_APPLE_VENDOR     0
+#define SCSI_DISK_QUIRK_MODE_SENSE_ROM_FORCE_DBD   1
 
 #endif
-- 
2.20.1


