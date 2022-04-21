Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 942CA509A3E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 10:10:40 +0200 (CEST)
Received: from localhost ([::1]:45480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhRtf-0005Sz-62
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 04:10:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nhQfz-0003KU-67; Thu, 21 Apr 2022 02:52:27 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:60168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nhQfx-0001Y4-GK; Thu, 21 Apr 2022 02:52:26 -0400
Received: from [2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nhQez-0006rv-ME; Thu, 21 Apr 2022 07:51:29 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: pbonzini@redhat.com, laurent@vivier.eu, fam@euphon.net,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Date: Thu, 21 Apr 2022 07:51:52 +0100
Message-Id: <20220421065155.31276-4-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220421065155.31276-1-mark.cave-ayland@ilande.co.uk>
References: <20220421065155.31276-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 3/6] scsi-disk: add MODE_PAGE_APPLE quirk for Macintosh
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

One of the mechanisms MacOS uses to identify drives compatible with MacOS is to
send a custom MODE SELECT command for page 0x30 to the drive. The response to
this is a hard-coded manufacturer string which must match in order for the
drive to be usable within MacOS.

Add an implementation of the MODE SELECT page 0x30 response guarded by a newly
defined SCSI_DISK_QUIRK_MODE_PAGE_APPLE quirk bit so that drives attached
to non-Apple machines function exactly as before.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/scsi-disk.c      | 19 +++++++++++++++++++
 include/hw/scsi/scsi.h   |  3 +++
 include/scsi/constants.h |  1 +
 3 files changed, 23 insertions(+)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index d89cdd4e4a..37013756d5 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -1085,6 +1085,7 @@ static int mode_sense_page(SCSIDiskState *s, int page, uint8_t **p_outbuf,
         [MODE_PAGE_R_W_ERROR]              = (1 << TYPE_DISK) | (1 << TYPE_ROM),
         [MODE_PAGE_AUDIO_CTL]              = (1 << TYPE_ROM),
         [MODE_PAGE_CAPABILITIES]           = (1 << TYPE_ROM),
+        [MODE_PAGE_APPLE]                  = (1 << TYPE_ROM),
     };
 
     uint8_t *p = *p_outbuf + 2;
@@ -1229,6 +1230,22 @@ static int mode_sense_page(SCSIDiskState *s, int page, uint8_t **p_outbuf,
         p[19] = (16 * 176) & 0xff;
         break;
 
+     case MODE_PAGE_APPLE:
+        if (s->qdev.type == TYPE_DISK &&
+            (s->quirks & SCSI_DISK_QUIRK_MODE_PAGE_APPLE)) {
+
+            length = 0x24;
+            if (page_control == 1) { /* Changeable Values */
+                break;
+            }
+
+            memset(p, 0, length);
+            strcpy((char *)p + 8, "APPLE COMPUTER, INC   ");
+            break;
+        } else {
+            return -1;
+        }
+
     default:
         return -1;
     }
@@ -3042,6 +3059,8 @@ static Property scsi_hd_properties[] = {
     DEFINE_PROP_UINT16("rotation_rate", SCSIDiskState, rotation_rate, 0),
     DEFINE_PROP_INT32("scsi_version", SCSIDiskState, qdev.default_scsi_version,
                       5),
+    DEFINE_PROP_BIT("quirk_mode_page_apple", SCSIDiskState, quirks,
+                    SCSI_DISK_QUIRK_MODE_PAGE_APPLE, 0),
     DEFINE_BLOCK_CHS_PROPERTIES(SCSIDiskState, qdev.conf),
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
index 1ffb367f94..f629706250 100644
--- a/include/hw/scsi/scsi.h
+++ b/include/hw/scsi/scsi.h
@@ -226,4 +226,7 @@ SCSIDevice *scsi_device_get(SCSIBus *bus, int channel, int target, int lun);
 /* scsi-generic.c. */
 extern const SCSIReqOps scsi_generic_req_ops;
 
+/* scsi-disk.c */
+#define SCSI_DISK_QUIRK_MODE_PAGE_APPLE 0
+
 #endif
diff --git a/include/scsi/constants.h b/include/scsi/constants.h
index 2a32c08b5e..21ca7b50cd 100644
--- a/include/scsi/constants.h
+++ b/include/scsi/constants.h
@@ -234,6 +234,7 @@
 #define MODE_PAGE_FAULT_FAIL                  0x1c
 #define MODE_PAGE_TO_PROTECT                  0x1d
 #define MODE_PAGE_CAPABILITIES                0x2a
+#define MODE_PAGE_APPLE                       0x30
 #define MODE_PAGE_ALLS                        0x3f
 /* Not in Mt. Fuji, but in ATAPI 2.6 -- deprecated now in favor
  * of MODE_PAGE_SENSE_POWER */
-- 
2.20.1


