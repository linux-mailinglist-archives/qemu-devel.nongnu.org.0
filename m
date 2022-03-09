Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F874D2E0A
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 12:31:35 +0100 (CET)
Received: from localhost ([::1]:46246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRuXV-00048Y-Qz
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 06:31:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nRuCq-0007EY-TD
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 06:10:12 -0500
Received: from [2001:41c9:1:41f::167] (port=35774
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nRuCp-0005I3-BP
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 06:10:12 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nRuBk-000CWr-BH; Wed, 09 Mar 2022 11:09:08 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	laurent@vivier.eu,
	qemu-devel@nongnu.org
Date: Wed,  9 Mar 2022 11:08:25 +0000
Message-Id: <20220309110831.18443-17-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220309110831.18443-1-mark.cave-ayland@ilande.co.uk>
References: <20220309110831.18443-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 16/22] macfb: add VMStateDescription fields for display type
 and VBL timer
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

These fields are required in the migration stream to restore macfb state
correctly.

Note this is a migration break, but since there are upcoming incompatible changes
for the q800 machine (and migration does not even succeed without these patches)
then this is not an issue.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220305155530.9265-5-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/display/macfb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/display/macfb.c b/hw/display/macfb.c
index dfdae90144..7371986480 100644
--- a/hw/display/macfb.c
+++ b/hw/display/macfb.c
@@ -625,9 +625,11 @@ static const VMStateDescription vmstate_macfb = {
     .minimum_version_id = 1,
     .post_load = macfb_post_load,
     .fields = (VMStateField[]) {
+        VMSTATE_UINT8(type, MacfbState),
         VMSTATE_UINT8_ARRAY(color_palette, MacfbState, 256 * 3),
         VMSTATE_UINT32(palette_current, MacfbState),
         VMSTATE_UINT32_ARRAY(regs, MacfbState, MACFB_NUM_REGS),
+        VMSTATE_TIMER_PTR(vbl_timer, MacfbState),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.20.1


