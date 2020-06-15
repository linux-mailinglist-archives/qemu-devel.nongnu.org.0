Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C74AB1FA2B3
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jun 2020 23:23:46 +0200 (CEST)
Received: from localhost ([::1]:39664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkwa1-000633-Kx
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 17:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aperamak@pp1.inet.fi>)
 id 1jkvZ5-0004ql-IW; Mon, 15 Jun 2020 16:18:43 -0400
Received: from mta-out1.inet.fi ([62.71.2.202]:46608 helo=julia1.inet.fi)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aperamak@pp1.inet.fi>)
 id 1jkvZ2-0005Pm-Up; Mon, 15 Jun 2020 16:18:43 -0400
Received: from localhost.localdomain (91.154.154.51) by julia1.inet.fi
 (9.0.019.26-1) (authenticated as perall-2)
 id 5EE535C5000C63B7; Mon, 15 Jun 2020 23:18:04 +0300
From: Allan Peramaki <aperamak@pp1.inet.fi>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/audio/gus: Fix registers 32-bit access
Date: Mon, 15 Jun 2020 23:17:57 +0300
Message-Id: <20200615201757.16868-1-aperamak@pp1.inet.fi>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=62.71.2.202; envelope-from=aperamak@pp1.inet.fi;
 helo=julia1.inet.fi
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/15 16:18:36
X-ACL-Warn: Detected OS   = Linux 3.1-3.10
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 15 Jun 2020 17:16:08 -0400
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
Cc: qemu-trivial@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix audio on software that accesses DRAM above 64k via register peek/poke
and some cases when more than 16 voices are used.

Fixes: 135f5ae1974c ("audio: GUSsample is int16_t")
Signed-off-by: Allan Peramaki <aperamak@pp1.inet.fi>
---
 hw/audio/gusemu_hal.c   | 6 +++---
 hw/audio/gusemu_mixer.c | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/audio/gusemu_hal.c b/hw/audio/gusemu_hal.c
index ae40ca341c..e35e941926 100644
--- a/hw/audio/gusemu_hal.c
+++ b/hw/audio/gusemu_hal.c
@@ -30,9 +30,9 @@
 #include "gustate.h"
 #include "gusemu.h"
 
-#define GUSregb(position) (*            (gusptr+(position)))
-#define GUSregw(position) (*(uint16_t *) (gusptr+(position)))
-#define GUSregd(position) (*(uint16_t *)(gusptr+(position)))
+#define GUSregb(position) (*(gusptr + (position)))
+#define GUSregw(position) (*(uint16_t *)(gusptr + (position)))
+#define GUSregd(position) (*(uint32_t *)(gusptr + (position)))
 
 /* size given in bytes */
 unsigned int gus_read(GUSEmuState * state, int port, int size)
diff --git a/hw/audio/gusemu_mixer.c b/hw/audio/gusemu_mixer.c
index 00b9861b92..3b39254518 100644
--- a/hw/audio/gusemu_mixer.c
+++ b/hw/audio/gusemu_mixer.c
@@ -26,11 +26,11 @@
 #include "gusemu.h"
 #include "gustate.h"
 
-#define GUSregb(position)  (*            (gusptr+(position)))
-#define GUSregw(position)  (*(uint16_t *) (gusptr+(position)))
-#define GUSregd(position)  (*(uint16_t *)(gusptr+(position)))
+#define GUSregb(position)  (*(gusptr + (position)))
+#define GUSregw(position)  (*(uint16_t *)(gusptr + (position)))
+#define GUSregd(position)  (*(uint32_t *)(gusptr + (position)))
 
-#define GUSvoice(position) (*(uint16_t *)(voiceptr+(position)))
+#define GUSvoice(position) (*(uint16_t *)(voiceptr + (position)))
 
 /* samples are always 16bit stereo (4 bytes each, first right then left interleaved) */
 void gus_mixvoices(GUSEmuState * state, unsigned int playback_freq, unsigned int numsamples,
-- 
2.20.1


