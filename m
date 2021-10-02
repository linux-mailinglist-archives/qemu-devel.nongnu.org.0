Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B928741FB08
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 13:08:52 +0200 (CEST)
Received: from localhost ([::1]:46860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWcst-0005au-QB
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 07:08:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mWckq-0004mf-0h
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 07:00:32 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:33162
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mWckm-0004n6-1v
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 07:00:31 -0400
Received: from [2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mWckY-00020j-He; Sat, 02 Oct 2021 12:00:18 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Sat,  2 Oct 2021 11:59:58 +0100
Message-Id: <20211002110007.30825-4-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211002110007.30825-1-mark.cave-ayland@ilande.co.uk>
References: <20211002110007.30825-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 03/12] macfb: fix overflow of color_palette array
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

The palette_current index counter has a maximum size of 256 * 3 to cover a full
color palette of 256 RGB entries. Linux assumes that the palette_current index
wraps back around to zero after writing 256 RGB entries so ensure that
palette_current is reset at this point to prevent data corruption within
MacfbState.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/display/macfb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/display/macfb.c b/hw/display/macfb.c
index 815870f2fe..f4e789d0d7 100644
--- a/hw/display/macfb.c
+++ b/hw/display/macfb.c
@@ -307,6 +307,9 @@ static void macfb_ctrl_write(void *opaque,
         if (s->palette_current % 3) {
             macfb_invalidate_display(s);
         }
+        if (s->palette_current >= sizeof(s->color_palette)) {
+            s->palette_current = 0;
+        }
         break;
     }
 }
-- 
2.20.1


