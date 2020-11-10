Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0304D2AD3D6
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 11:32:35 +0100 (CET)
Received: from localhost ([::1]:57468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcQx0-0001LT-36
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 05:32:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kcQvx-0000gm-7R; Tue, 10 Nov 2020 05:31:29 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:43202
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kcQvu-0006wH-Uj; Tue, 10 Nov 2020 05:31:28 -0500
Received: from host86-184-131-53.range86-184.btcentralplus.com
 ([86.184.131.53] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kcQw2-0005Tt-E0; Tue, 10 Nov 2020 10:31:36 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: thuth@redhat.com, armbru@redhat.com, david@gibson.dropbear.id.au,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 10 Nov 2020 10:31:11 +0000
Message-Id: <20201110103111.18395-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <thuth@redhat.com, armbru@redhat.com, david@gibson.dropbear.id.au,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-trivial@nongnu.org>
References: <thuth@redhat.com, armbru@redhat.com, david@gibson.dropbear.id.au,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-trivial@nongnu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.184.131.53
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2-for-5.2] macio: set user_creatable to false in
 macio_class_init()
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
---
 hw/misc/macio/macio.c | 2 ++
 1 file changed, 2 insertions(+)

v2:
- Rebase onto master
- Add for-5.2 into subject prefix
- Add R-B tags from Philippe and Thomas


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


