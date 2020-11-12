Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6158B2B0267
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 10:58:34 +0100 (CET)
Received: from localhost ([::1]:60454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kd9NB-00077v-DV
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 04:58:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kd9LL-0006C8-JE; Thu, 12 Nov 2020 04:56:39 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:46540
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kd9LK-0002zy-2S; Thu, 12 Nov 2020 04:56:39 -0500
Received: from host109-155-147-35.range109-155.btcentralplus.com
 ([109.155.147.35] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kd9LR-0007d5-QF; Thu, 12 Nov 2020 09:56:52 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Date: Thu, 12 Nov 2020 09:56:20 +0000
Message-Id: <20201112095620.27372-2-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201112095620.27372-1-mark.cave-ayland@ilande.co.uk>
References: <20201112095620.27372-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.155.147.35
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 1/1] macio: set user_creatable to false in macio_class_init()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

Commit 348b8d1a76 "macio: don't reference serial_hd() directly within the device"
removed the setting of user_creatable to false on the basis that the restriction
was due to the use of serial_hd() in macio_instance_init().

Unfortunately this isn't the full story since the PIC object property links
must still be set before the device is realized. Whilst it is possible to update
the macio device and Mac machines to resolve this, the fix is too invasive at
this point in the release cycle.

For now simply set user_creatable back to false in macio_class_init() to
prevent QEMU from segfaulting in anticipation of the proper fix arriving in
QEMU 6.0.

Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20201110103111.18395-1-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/misc/macio/macio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
index 51368884d0..bb601f782c 100644
--- a/hw/misc/macio/macio.c
+++ b/hw/misc/macio/macio.c
@@ -456,6 +456,8 @@ static void macio_class_init(ObjectClass *klass, void *data)
     k->class_id = PCI_CLASS_OTHERS << 8;
     device_class_set_props(dc, macio_properties);
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
+    /* Reason: requires PIC property links to be set in macio_*_realize() */
+    dc->user_creatable = false;
 }
 
 static const TypeInfo macio_bus_info = {
-- 
2.20.1


