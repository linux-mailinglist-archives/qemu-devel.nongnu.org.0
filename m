Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BC8655D39
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Dec 2022 13:42:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9QJR-0001vQ-NC; Sun, 25 Dec 2022 07:41:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1p9QJG-0001v6-CZ
 for qemu-devel@nongnu.org; Sun, 25 Dec 2022 07:40:58 -0500
Received: from [220.184.252.86] (helo=liuqiang-OptiPlex-7060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1p9QJB-0004Y8-2S
 for qemu-devel@nongnu.org; Sun, 25 Dec 2022 07:40:55 -0500
Received: from localhost (liuqiang-OptiPlex-7060 [local])
 by liuqiang-OptiPlex-7060 (OpenSMTPD) with ESMTPA id 3beee653;
 Sun, 25 Dec 2022 12:14:06 +0000 (UTC)
From: Qiang Liu <cyruscyliu@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH] hw/audio/c97: fix abort in audio_calloc()
Date: Sun, 25 Dec 2022 20:13:57 +0800
Message-Id: <20221225121357.498040-1-cyruscyliu@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 220.184.252.86 (failed)
Received-SPF: softfail client-ip=220.184.252.86;
 envelope-from=cyruscyliu@gmail.com; helo=liuqiang-OptiPlex-7060
X-Spam_score_int: 48
X-Spam_score: 4.8
X-Spam_bar: ++++
X-Spam_report: (4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FROM=0.001, FSL_HELO_NON_FQDN_1=0.001,
 HELO_NO_DOMAIN=0.001, NML_ADSP_CUSTOM_MED=0.9, RCVD_IN_PBL=3.335,
 RCVD_IN_SORBS_DUL=0.001, RDNS_NONE=0.793, SPF_SOFTFAIL=0.665,
 SPOOFED_FREEMAIL=0.001, SPOOFED_FREEMAIL_NO_RDNS=0.001, SPOOF_GMAIL_MID=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Section 5.10.2 of the AC97 specification (https://hands.com/~lkcl/ac97_r23.pdf)
shows the feasibility to support for rates other than 48kHZ. Specifically,
AC97_PCM_Front_DAC_Rate (reg 2Ch) should be from 8kHZ to 48kHZ.

Before Volker Rümelin fixed it in 12f4abf6a245 and 0cbc8bd4694f, an adversary
could leverage this to crash QEMU.

Fixes: e5c9a13e2670 ("PCI AC97 emulation by malc.")
Reported-by: Volker Rümelin <vr_qemu@t-online.de>
Reported-by: Qiang Liu <cyruscyliu@gmail.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1393
Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
---
 hw/audio/ac97.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/hw/audio/ac97.c b/hw/audio/ac97.c
index be2dd701a4..826411e462 100644
--- a/hw/audio/ac97.c
+++ b/hw/audio/ac97.c
@@ -625,9 +625,14 @@ static void nam_writew(void *opaque, uint32_t addr, uint32_t val)
         break;
     case AC97_PCM_Front_DAC_Rate:
         if (mixer_load(s, AC97_Extended_Audio_Ctrl_Stat) & EACS_VRA) {
-            mixer_store(s, addr, val);
-            dolog("Set front DAC rate to %d\n", val);
-            open_voice(s, PO_INDEX, val);
+            if (val >= 8000 && val <= 48000) {
+                mixer_store(s, addr, val);
+                dolog("Set front DAC rate to %d\n", val);
+                open_voice(s, PO_INDEX, val);
+            } else {
+                dolog("Attempt to set front DAC rate to %d, but valid is"
+                      "8-48kHZ\n", val);
+            }
         } else {
             dolog("Attempt to set front DAC rate to %d, but VRA is not set\n",
                   val);
-- 
2.25.1


