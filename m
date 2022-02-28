Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3944C7D65
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 23:32:36 +0100 (CET)
Received: from localhost ([::1]:36324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOoZD-0006nY-LE
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 17:32:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nOoSw-00046e-RX
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 17:26:02 -0500
Received: from [2001:41c9:1:41f::167] (port=51134
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nOoSt-0003Q7-24
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 17:26:01 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nOoSC-0004GN-2o; Mon, 28 Feb 2022 22:25:20 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu, pbonzini@redhat.com, fam@euphon.net,
 qemu-devel@nongnu.org
Date: Mon, 28 Feb 2022 22:25:22 +0000
Message-Id: <20220228222527.8234-6-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220228222527.8234-1-mark.cave-ayland@ilande.co.uk>
References: <20220228222527.8234-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 05/10] macfb: set initial value of mode control registers in
 macfb_common_realize()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

If booting Linux directly in the q800 machine using -kernel rather than using a
MacOS toolbox ROM, the mode control registers are never initialised,
causing macfb_mode_write() to fail to determine the current resolution after
migration. Resolve this by always setting the initial values of the mode control
registers based upon the initial macfb properties during realize.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/display/macfb.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/display/macfb.c b/hw/display/macfb.c
index f9ceea532e..bcfb2d0dab 100644
--- a/hw/display/macfb.c
+++ b/hw/display/macfb.c
@@ -647,6 +647,14 @@ static bool macfb_common_realize(DeviceState *dev, MacfbState *s, Error **errp)
         return false;
     }
 
+    /*
+     * Set mode control registers to match the mode found above so that
+     * macfb_mode_write() does the right thing if no MacOS toolbox ROM
+     * is present to initialise them
+     */
+    s->regs[DAFB_MODE_CTRL1 >> 2] = s->mode->mode_ctrl1;
+    s->regs[DAFB_MODE_CTRL2 >> 2] = s->mode->mode_ctrl2;
+
     s->con = graphic_console_init(dev, 0, &macfb_ops, s);
     surface = qemu_console_surface(s->con);
 
-- 
2.20.1


