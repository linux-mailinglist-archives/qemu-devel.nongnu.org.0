Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DABF155459A
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 13:06:59 +0200 (CEST)
Received: from localhost ([::1]:40322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3yCI-0007wn-TJ
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 07:06:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3xzY-0003ZO-Im; Wed, 22 Jun 2022 06:53:48 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:37824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3xzX-0005Rg-2P; Wed, 22 Jun 2022 06:53:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VJ8memk3OEaFs/fHyCocfyjLGPsn2s817p2kBMOunq8=; b=aLWPVDxE2sP3s3mVN6brpFVhJj
 ASwGeLvGOjDCXf94ol05KBpCemjGxnf/+490tZWM3PA8o3qC82Z7C9SOH8p6M2LkygvZTL57bz8NK
 WJhJMroQS4LLqgFGdBLY+wN5eDiiW6KvLSN1WZJ46uns4F4P3r6nvJSIkticrf7d+MuOkshd/UQ4e
 WvHVbAec6bsyBtd/+JV3eXX6HO2bmo61z/AZ+wIK9eFsmM4yLM6lki1tcfUNCsuAoNDoEjqaxkjW+
 kOGzUBl7JLAdsj+BTp/Gop7ie3dqc61jhZh3QRBscGAb0sr6VnrW5ABGW0GhdDA5zfTHMrGFcrhza
 obUBRbkMMCztcexz5urIjzOgoKMKCc4sNgeK0FS9JVecgIjg2mZx1kh1NbymkLonJ014zy/qoiYKA
 qWVNIREor/bajYtWtgiVW2iZCDbBFTMDKXWBvHmhw8AmJKwviG4ydA6s9i6kJRir28eCbE79MHOVn
 wgd7B8TAofjxp4iR8RB2g0yLOb01GKoPOoW6jxuUaXB7eAj/IhwGradCZRNL5RoC2bOhd8TWaqBQI
 QIjAmJbOi2CtJu0ovnSCk21XfHFlX4BlEcMdnG8owRpLuszaxVsYfvr/LMqm1Qi2gAfOMJS+n2l19
 duv72u2O7Jp1E1MJUAMIrDWc0btHr2M9mLPGoPDO0=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3xyH-000CTX-7n; Wed, 22 Jun 2022 11:52:33 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: pbonzini@redhat.com, laurent@vivier.eu, fam@euphon.net,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Date: Wed, 22 Jun 2022 11:53:02 +0100
Message-Id: <20220622105314.802852-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220622105314.802852-1-mark.cave-ayland@ilande.co.uk>
References: <20220622105314.802852-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 02/14] scsi-disk: add MODE_PAGE_APPLE_VENDOR quirk for
 Macintosh
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

One of the mechanisms MacOS uses to identify CDROM drives compatible with MacOS
is to send a custom MODE SELECT command for page 0x30 to the drive. The
response to this is a hard-coded manufacturer string which must match in order
for the CDROM to be usable within MacOS.

Add an implementation of the MODE SELECT page 0x30 response guarded by a newly
defined SCSI_DISK_QUIRK_MODE_PAGE_APPLE_VENDOR quirk bit so that CDROM drives
attached to non-Apple machines function exactly as before.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/scsi/scsi-disk.c      | 17 +++++++++++++++++
 include/hw/scsi/scsi.h   |  3 +++
 include/scsi/constants.h |  1 +
 3 files changed, 21 insertions(+)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 8c28dd8566..64f9418dc9 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -1085,6 +1085,7 @@ static int mode_sense_page(SCSIDiskState *s, int page, uint8_t **p_outbuf,
         [MODE_PAGE_R_W_ERROR]              = (1 << TYPE_DISK) | (1 << TYPE_ROM),
         [MODE_PAGE_AUDIO_CTL]              = (1 << TYPE_ROM),
         [MODE_PAGE_CAPABILITIES]           = (1 << TYPE_ROM),
+        [MODE_PAGE_APPLE_VENDOR]           = (1 << TYPE_ROM),
     };
 
     uint8_t *p = *p_outbuf + 2;
@@ -1229,6 +1230,20 @@ static int mode_sense_page(SCSIDiskState *s, int page, uint8_t **p_outbuf,
         p[19] = (16 * 176) & 0xff;
         break;
 
+     case MODE_PAGE_APPLE_VENDOR:
+        if (s->quirks & (1 << SCSI_DISK_QUIRK_MODE_PAGE_APPLE_VENDOR)) {
+            length = 0x1e;
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
@@ -3086,6 +3101,8 @@ static Property scsi_cd_properties[] = {
                        DEFAULT_MAX_IO_SIZE),
     DEFINE_PROP_INT32("scsi_version", SCSIDiskState, qdev.default_scsi_version,
                       5),
+    DEFINE_PROP_BIT("quirk_mode_page_apple_vendor", SCSIDiskState, quirks,
+                    SCSI_DISK_QUIRK_MODE_PAGE_APPLE_VENDOR, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
index 1ffb367f94..e090ea1b40 100644
--- a/include/hw/scsi/scsi.h
+++ b/include/hw/scsi/scsi.h
@@ -226,4 +226,7 @@ SCSIDevice *scsi_device_get(SCSIBus *bus, int channel, int target, int lun);
 /* scsi-generic.c. */
 extern const SCSIReqOps scsi_generic_req_ops;
 
+/* scsi-disk.c */
+#define SCSI_DISK_QUIRK_MODE_PAGE_APPLE_VENDOR             0
+
 #endif
diff --git a/include/scsi/constants.h b/include/scsi/constants.h
index 2a32c08b5e..891aa0f45c 100644
--- a/include/scsi/constants.h
+++ b/include/scsi/constants.h
@@ -234,6 +234,7 @@
 #define MODE_PAGE_FAULT_FAIL                  0x1c
 #define MODE_PAGE_TO_PROTECT                  0x1d
 #define MODE_PAGE_CAPABILITIES                0x2a
+#define MODE_PAGE_APPLE_VENDOR                0x30
 #define MODE_PAGE_ALLS                        0x3f
 /* Not in Mt. Fuji, but in ATAPI 2.6 -- deprecated now in favor
  * of MODE_PAGE_SENSE_POWER */
-- 
2.30.2


