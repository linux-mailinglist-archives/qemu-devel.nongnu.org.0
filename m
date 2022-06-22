Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1AB554597
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 13:03:47 +0200 (CEST)
Received: from localhost ([::1]:60046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3y9C-0001ul-5S
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 07:03:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3xzd-0003oP-8O; Wed, 22 Jun 2022 06:53:53 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:37836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3xzb-0005SC-MA; Wed, 22 Jun 2022 06:53:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1tbTNNf1JfvQvlLYgy4qUuuVuD00+MuLV7j3l93jr4U=; b=fxZSvJoAYY6JxGOJTAlj0H3uzv
 iwIn/FSlzD2oCEYTCvqubDEBgQzJcm6nUTk4gZzW97hmUv4bbniAC9Yk4aTKrZvdcVoLsM3im/qII
 ZRR2ysCCCnPit2ha7JJFr/N0YOKsBJT4QQ01Mc5fBmEvAci642eJYWmX2zwNpwCdEVoE/eh8DFcnm
 rpI0/OA3ya2QIltwXYlAZ61rX55fq62DpoD2/PwO2vCfYHnqqgdNg8qU4tJykBKvq3J8LZvZudUwe
 6AWe7Hj8PXGHoVDBmI8n9a1oLFmdO0kgsHDTsM28qeDqHlFbIP39zaDPc1ffblRBwoBnU2Ig4p47r
 Dd4LVDO+vzwxpuNPtEwcCqbSeMeBIaheqk8rAlPFt91wz+v+YsE6sY7yor1vQO4om4cJP8R1AZgeX
 EzrhMZAnUwLOKV2hjX0bElemh5iubIU5vgZuWl/6yKAZSsW+8YFIRluRQ5q23DRRFy63qRhygqNJi
 YqQPPSOl8buwK4aznU0cPqnsCukGtupSBD1NHkAUh4+AFzyA2q0cAGXUCXoX0Y0g3QmZaOjvQUUZb
 SJOHHgy0AMUA8B/p4W4oyN26kJkoZUUd8ahIzN3KXGpNA24820HlIvRPfH7DK/G6wadadLuY4z6yN
 REMbULe+WvwByusLMNMhFw4/m1S0QZPYIF7rIec00=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3xyL-000CTX-QH; Wed, 22 Jun 2022 11:52:37 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: pbonzini@redhat.com, laurent@vivier.eu, fam@euphon.net,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Date: Wed, 22 Jun 2022 11:53:04 +0100
Message-Id: <20220622105314.802852-5-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220622105314.802852-1-mark.cave-ayland@ilande.co.uk>
References: <20220622105314.802852-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 04/14] scsi-disk: add
 SCSI_DISK_QUIRK_MODE_SENSE_ROM_USE_DBD quirk for Macintosh
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

During SCSI bus enumeration A/UX sends a MODE SENSE command to the CDROM with
the DBD bit unset and expects the response to include a block descriptor. As per
the latest SCSI documentation, QEMU currently force-disables the block
descriptor for CDROM devices but the A/UX driver expects the requested block
descriptor to be returned.

If the block descriptor is not returned in the response then A/UX becomes
confused, since the block descriptor returned in the MODE SENSE response is
used to generate a subsequent MODE SELECT command which is then invalid.

Add a new SCSI_DISK_QUIRK_MODE_SENSE_ROM_USE_DBD quirk to allow this behaviour
to be enabled as required. Note that an additional workaround is required for
the previous SCSI_DISK_QUIRK_MODE_PAGE_APPLE_VENDOR quirk which must never
return a block descriptor even though the DBD bit is left unset.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/scsi-disk.c    | 27 +++++++++++++++++++++++----
 include/hw/scsi/scsi.h |  1 +
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 64f9418dc9..41bcf07272 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -1279,10 +1279,27 @@ static int scsi_disk_emulate_mode_sense(SCSIDiskReq *r, uint8_t *outbuf)
             dev_specific_param |= 0x80; /* Readonly.  */
         }
     } else {
-        /* MMC prescribes that CD/DVD drives have no block descriptors,
-         * and defines no device-specific parameter.  */
-        dev_specific_param = 0x00;
-        dbd = true;
+        if (s->quirks & (1 << SCSI_DISK_QUIRK_MODE_SENSE_ROM_USE_DBD)) {
+            /* Use DBD from the request... */
+            dev_specific_param = 0x00;
+
+            /*
+             * ... unless we receive a request for MODE_PAGE_APPLE_VENDOR
+             * which should never return a block descriptor even though DBD is
+             * not set, otherwise CDROM detection fails in MacOS
+             */
+            if (s->quirks & (1 << SCSI_DISK_QUIRK_MODE_PAGE_APPLE_VENDOR) &&
+                page == MODE_PAGE_APPLE_VENDOR) {
+                dbd = true;
+            }
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
@@ -3103,6 +3120,8 @@ static Property scsi_cd_properties[] = {
                       5),
     DEFINE_PROP_BIT("quirk_mode_page_apple_vendor", SCSIDiskState, quirks,
                     SCSI_DISK_QUIRK_MODE_PAGE_APPLE_VENDOR, 0),
+    DEFINE_PROP_BIT("quirk_mode_sense_rom_use_dbd", SCSIDiskState, quirks,
+                    SCSI_DISK_QUIRK_MODE_SENSE_ROM_USE_DBD, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
index e090ea1b40..845d05722b 100644
--- a/include/hw/scsi/scsi.h
+++ b/include/hw/scsi/scsi.h
@@ -228,5 +228,6 @@ extern const SCSIReqOps scsi_generic_req_ops;
 
 /* scsi-disk.c */
 #define SCSI_DISK_QUIRK_MODE_PAGE_APPLE_VENDOR             0
+#define SCSI_DISK_QUIRK_MODE_SENSE_ROM_USE_DBD             1
 
 #endif
-- 
2.30.2


