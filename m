Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF8A3A57B0
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Jun 2021 12:27:45 +0200 (CEST)
Received: from localhost ([::1]:55370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsNLE-0005gN-Hi
	for lists+qemu-devel@lfdr.de; Sun, 13 Jun 2021 06:27:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lsNKA-0004hO-Mz
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 06:26:38 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:40964
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lsNK8-0000bk-UM
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 06:26:38 -0400
Received: from host86-132-109-72.range86-132.btcentralplus.com
 ([86.132.109.72] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lsNJq-0004HT-CL; Sun, 13 Jun 2021 11:26:22 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: pbonzini@redhat.com, qemu-devel@nongnu.org, laurent@vivier.eu,
 hpoussin@reactos.org
Date: Sun, 13 Jun 2021 11:26:14 +0100
Message-Id: <20210613102614.5438-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.132.109.72
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH] esp: fix migration version check in esp_is_version_5()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 4e78f3bf35 "esp: defer command completion interrupt on incoming data
transfers" added a version check for use with VMSTATE_*_TEST macros to allow
migration from older QEMU versions. Unfortunately the version check fails to
work in its current form since if the VMStateDescription version_id is
incremented, the test returns false and so the fields are not included in the
outgoing migration stream.

Change the version check to use >= rather == to ensure that migration works
correctly when the ESPState VMStateDescription has version_id > 5.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Fixes: 4e78f3bf35 ("esp: defer command completion interrupt on incoming data transfers")
---
 hw/scsi/esp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index bfdb94292b..39756ddd99 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -1120,7 +1120,7 @@ static bool esp_is_version_5(void *opaque, int version_id)
     ESPState *s = ESP(opaque);
 
     version_id = MIN(version_id, s->mig_version_id);
-    return version_id == 5;
+    return version_id >= 5;
 }
 
 int esp_pre_save(void *opaque)
-- 
2.20.1


