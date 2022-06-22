Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F852554571
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 12:56:03 +0200 (CEST)
Received: from localhost ([::1]:44364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3y1i-0007cS-6u
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 06:56:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3xzk-0004El-JP; Wed, 22 Jun 2022 06:54:00 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:37856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3xzi-0005TE-UX; Wed, 22 Jun 2022 06:54:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aNUgQmbmhqQ8p8jWaNuFYtuMnRy////2vI3krZvzKv4=; b=sh3ndCJLfpaQe2ym8/rAXcVcIs
 X7ssqtvwbDQFvlicLM/81eYQ+LS2GUSpN6qPoqchc5yQ8hPua2G/fluOfN4Zby7W2UcSYKnUh3SJ6
 O8KszkkJrhl+8ycE1KM2ibY2YSLfqk72kxVS5kJ/9Q16JgxS/NEfYtQbDAVsj6xZ1pyWiahd2YLNH
 JpnZB3/JMo/yPKynvm6in8WVvgRbR7Uzx0nr1BZ3/uo7/u8nKGlbGhTgtt6a5AP+wcmNfj6b1PR/A
 B6QIs9Dvmvx23RGNphYaDiZAHiUBxtwN0lwOVQpvtCSb1eH5nUy4lkf1BtRK9lXNlqos2EFE4cvRE
 dtiKNM1MXDVUZqebugJmM9igDzwBzozaC8NvZkiG6JhOjzA84peycX8dhD/mECFTeLtZ03gd4TzWp
 slG4lvq9fCSFsoL+Aoox7tW48qGy/COoQL3cURdAkYNVUAk3X0HXoJpTgC51g3E1/jbuROKh8ZZxC
 pDX+iUlmgGlfzvY8CZEhnZBGclnqrg/nKv08Im/NxZTJMxXWXLOpTTrgljChHEnR/cFovli4/WcUr
 hy58kTSJG4FLkhq7S9goqjnN+xWW3i0snNYrcSBxQanr2FQ4MYdMoYYWBfY0aSgu1kkjiUSYZGZc2
 XGD2rNaW/aTAXb3x/ATiw8i8dWkHSqsr/6BDJmvpw=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3xyT-000CTX-Uy; Wed, 22 Jun 2022 11:52:46 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: pbonzini@redhat.com, laurent@vivier.eu, fam@euphon.net,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Date: Wed, 22 Jun 2022 11:53:06 +0100
Message-Id: <20220622105314.802852-7-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220622105314.802852-1-mark.cave-ayland@ilande.co.uk>
References: <20220622105314.802852-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 06/14] scsi-disk: add
 SCSI_DISK_QUIRK_MODE_PAGE_VENDOR_SPECIFIC_APPLE quirk for Macintosh
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Both MacOS and A/UX make use of vendor-specific MODE SELECT commands with PF=0
to identify SCSI devices:

- MacOS sends a MODE SELECT command with PF=0 for the MODE_PAGE_VENDOR_SPECIFIC
  (0x0) mode page containing 2 bytes before initialising a disk

- A/UX (installed on disk) sends a MODE SELECT command with PF=0 during SCSI
  bus enumeration, and gets stuck in an infinite loop if it fails

Add a new SCSI_DISK_QUIRK_MODE_PAGE_VENDOR_SPECIFIC_APPLE quirk to allow both
PF=0 MODE SELECT commands and implement a MODE_PAGE_VENDOR_SPECIFIC (0x0)
mode page which is compatible with MacOS.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/scsi-disk.c      | 30 ++++++++++++++++++++++++++++--
 include/hw/scsi/scsi.h   |  1 +
 include/scsi/constants.h |  1 +
 3 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 41bcf07272..ce915f326e 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -1079,6 +1079,7 @@ static int mode_sense_page(SCSIDiskState *s, int page, uint8_t **p_outbuf,
                            int page_control)
 {
     static const int mode_sense_valid[0x3f] = {
+        [MODE_PAGE_VENDOR_SPECIFIC]        = (1 << TYPE_DISK) | (1 << TYPE_ROM),
         [MODE_PAGE_HD_GEOMETRY]            = (1 << TYPE_DISK),
         [MODE_PAGE_FLEXIBLE_DISK_GEOMETRY] = (1 << TYPE_DISK),
         [MODE_PAGE_CACHING]                = (1 << TYPE_DISK) | (1 << TYPE_ROM),
@@ -1244,6 +1245,22 @@ static int mode_sense_page(SCSIDiskState *s, int page, uint8_t **p_outbuf,
             return -1;
         }
 
+    case MODE_PAGE_VENDOR_SPECIFIC:
+        if (s->qdev.type == TYPE_DISK && (s->quirks &
+            (1 << SCSI_DISK_QUIRK_MODE_PAGE_VENDOR_SPECIFIC_APPLE))) {
+            length = 0x2;
+            if (page_control == 1) { /* Changeable Values */
+                p[0] = 0xff;
+                p[1] = 0xff;
+                break;
+            }
+            p[0] = 0;
+            p[1] = 0;
+            break;
+        } else {
+            return -1;
+        }
+
     default:
         return -1;
     }
@@ -1570,9 +1587,12 @@ static void scsi_disk_emulate_mode_select(SCSIDiskReq *r, uint8_t *inbuf)
     int bd_len;
     int pass;
 
-    /* We only support PF=1, SP=0.  */
     if ((r->req.cmd.buf[1] & 0x11) != 0x10) {
-        goto invalid_field;
+        if (!(s->quirks &
+            (1 << SCSI_DISK_QUIRK_MODE_PAGE_VENDOR_SPECIFIC_APPLE))) {
+            /* We only support PF=1, SP=0.  */
+            goto invalid_field;
+        }
     }
 
     if (len < hdr_len) {
@@ -3070,6 +3090,9 @@ static Property scsi_hd_properties[] = {
     DEFINE_PROP_UINT16("rotation_rate", SCSIDiskState, rotation_rate, 0),
     DEFINE_PROP_INT32("scsi_version", SCSIDiskState, qdev.default_scsi_version,
                       5),
+    DEFINE_PROP_BIT("quirk_mode_page_vendor_specific_apple", SCSIDiskState,
+                    quirks, SCSI_DISK_QUIRK_MODE_PAGE_VENDOR_SPECIFIC_APPLE,
+                    0),
     DEFINE_BLOCK_CHS_PROPERTIES(SCSIDiskState, qdev.conf),
     DEFINE_PROP_END_OF_LIST(),
 };
@@ -3122,6 +3145,9 @@ static Property scsi_cd_properties[] = {
                     SCSI_DISK_QUIRK_MODE_PAGE_APPLE_VENDOR, 0),
     DEFINE_PROP_BIT("quirk_mode_sense_rom_use_dbd", SCSIDiskState, quirks,
                     SCSI_DISK_QUIRK_MODE_SENSE_ROM_USE_DBD, 0),
+    DEFINE_PROP_BIT("quirk_mode_page_vendor_specific_apple", SCSIDiskState,
+                    quirks, SCSI_DISK_QUIRK_MODE_PAGE_VENDOR_SPECIFIC_APPLE,
+                    0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
index 845d05722b..011cb84753 100644
--- a/include/hw/scsi/scsi.h
+++ b/include/hw/scsi/scsi.h
@@ -229,5 +229,6 @@ extern const SCSIReqOps scsi_generic_req_ops;
 /* scsi-disk.c */
 #define SCSI_DISK_QUIRK_MODE_PAGE_APPLE_VENDOR             0
 #define SCSI_DISK_QUIRK_MODE_SENSE_ROM_USE_DBD             1
+#define SCSI_DISK_QUIRK_MODE_PAGE_VENDOR_SPECIFIC_APPLE    2
 
 #endif
diff --git a/include/scsi/constants.h b/include/scsi/constants.h
index 891aa0f45c..6a8bad556a 100644
--- a/include/scsi/constants.h
+++ b/include/scsi/constants.h
@@ -225,6 +225,7 @@
 #define TYPE_NO_LUN         0x7f
 
 /* Mode page codes for mode sense/set */
+#define MODE_PAGE_VENDOR_SPECIFIC             0x00
 #define MODE_PAGE_R_W_ERROR                   0x01
 #define MODE_PAGE_HD_GEOMETRY                 0x04
 #define MODE_PAGE_FLEXIBLE_DISK_GEOMETRY      0x05
-- 
2.30.2


