Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 752474421EF
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 21:49:30 +0100 (CET)
Received: from localhost ([::1]:51944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mheFB-0001Sk-BR
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 16:49:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mhdxS-0002m7-Vl
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 16:31:07 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:43488
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mhdxO-0002mX-5A
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 16:31:06 -0400
Received: from [2a00:23c4:8b9d:f500:9396:df17:737c:b32c] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mhdwz-00030v-IL; Mon, 01 Nov 2021 20:30:41 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Date: Mon,  1 Nov 2021 20:30:49 +0000
Message-Id: <20211101203049.28925-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:f500:9396:df17:737c:b32c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH] escc: update transmit status bits when switching to async mode
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

The recent ESCC reset changes cause a regression when attemping to use a real
SS-5 Sun PROM instead of OpenBIOS. The Sun PROM doesn't send an explicit reset
command to the ESCC but gets stuck in a loop probing the keyboard waiting for
STATUS_TXEMPTY to be set in R_STATUS followed by SPEC_ALLSENT in R_SPEC.

Reading through the ESCC datasheet again indicates that SPEC_ALLSENT is updated
when a write to W_TXCTRL1 selects async mode, or remains high if sync mode is
selected. Whilst there is no explicit mention of STATUS_TXEMPTY, the ESCC device
emulation always updates these two register bits together when transmitting data.

Add extra logic to update both transmit status bits accordingly when writing to
W_TXCTRL1 which enables the Sun PROM to initialise and boot again under QEMU.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/char/escc.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/char/escc.c b/hw/char/escc.c
index 0fce4f6324..b33cdc229f 100644
--- a/hw/char/escc.c
+++ b/hw/char/escc.c
@@ -575,6 +575,18 @@ static void escc_mem_write(void *opaque, hwaddr addr,
             s->wregs[s->reg] = val;
             break;
         case W_TXCTRL1:
+            s->wregs[s->reg] = val;
+            if (val & TXCTRL1_STPMSK) {
+                ESCCSERIOQueue *q = &s->queue;
+                if (s->type == escc_serial || q->count == 0) {
+                    s->rregs[R_STATUS] |= STATUS_TXEMPTY;
+                    s->rregs[R_SPEC] |= SPEC_ALLSENT;
+                }
+            } else {
+                s->rregs[R_STATUS] &= ~STATUS_TXEMPTY;
+                s->rregs[R_SPEC] |= SPEC_ALLSENT;
+            }
+            /* fallthrough */
         case W_TXCTRL2:
             s->wregs[s->reg] = val;
             escc_update_parameters(s);
-- 
2.20.1


