Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDCA45624D
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 19:25:35 +0100 (CET)
Received: from localhost ([::1]:60588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnm6I-0000Lz-Ct
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 13:25:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mnlzy-0002Vz-Oy
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 13:19:02 -0500
Received: from [2001:41c9:1:41f::167] (port=45166
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mnlzp-0006Sd-Fu
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 13:18:58 -0500
Received: from [2a00:23c4:8b9e:9b00:2535:46c:7466:70fe] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mnlze-0001qH-Nv; Thu, 18 Nov 2021 18:18:46 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Date: Thu, 18 Nov 2021 18:18:35 +0000
Message-Id: <20211118181835.18497-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211118181835.18497-1-mark.cave-ayland@ilande.co.uk>
References: <20211118181835.18497-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9e:9b00:2535:46c:7466:70fe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH for-6.2 2/2] escc: update the R_SPEC register SPEC_ALLSENT bit
 when writing to W_TXCTRL1
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
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

The ESCC datasheet states that SPEC_ALLSENT is always set in sync mode and set
in async mode once all characters have cleared the transmitter. Since writes to
SERIAL_DATA use a synchronous chardev API, the guest can never see the state when
transmission is in progress so it is possible to set SPEC_ALLSENT in the
R_SPEC register unconditionally.

This fixes a hang when using the Sun PROM as it attempts to enumerate the
onboard serial devices, and a similar hang in OpenBSD SPARC32 where in both cases
the boot process will not proceed until SPEC_ALLSENT has been set after writing
to W_TXCTRL1.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/char/escc.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hw/char/escc.c b/hw/char/escc.c
index a7d9050c83..8755d8d34f 100644
--- a/hw/char/escc.c
+++ b/hw/char/escc.c
@@ -586,6 +586,20 @@ static void escc_mem_write(void *opaque, hwaddr addr,
             s->wregs[s->reg] = val;
             break;
         case W_TXCTRL1:
+            s->wregs[s->reg] = val;
+            /*
+             * The ESCC datasheet states that SPEC_ALLSENT is always set in
+             * sync mode, and set in async mode when all characters have
+             * cleared the transmitter. Since writes to SERIAL_DATA use the
+             * blocking qemu_chr_fe_write_all() function to write each
+             * character, the guest can never see the state when async data
+             * is in the process of being transmitted so we can set this bit
+             * unconditionally regardless of the state of the W_TXCTRL1 mode
+             * bits.
+             */
+            s->rregs[R_SPEC] |= SPEC_ALLSENT;
+            escc_update_parameters(s);
+            break;
         case W_TXCTRL2:
             s->wregs[s->reg] = val;
             escc_update_parameters(s);
-- 
2.20.1


