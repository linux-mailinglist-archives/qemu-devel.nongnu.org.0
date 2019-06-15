Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5D1470F8
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Jun 2019 17:40:28 +0200 (CEST)
Received: from localhost ([::1]:32835 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcAn5-00011T-3T
	for lists+qemu-devel@lfdr.de; Sat, 15 Jun 2019 11:40:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34544)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <spheenik@zoidberg.machine.schrodt.org>)
 id 1hcAlm-0008VU-Fi
 for qemu-devel@nongnu.org; Sat, 15 Jun 2019 11:39:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <spheenik@zoidberg.machine.schrodt.org>)
 id 1hcAll-0006r6-IL
 for qemu-devel@nongnu.org; Sat, 15 Jun 2019 11:39:06 -0400
Received: from zapp.schrodt.org ([46.4.119.246]:39286)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <spheenik@zoidberg.machine.schrodt.org>)
 id 1hcAll-0006S1-CA
 for qemu-devel@nongnu.org; Sat, 15 Jun 2019 11:39:05 -0400
Received: from schapa.schrodt.org ([109.192.32.242]:59940
 helo=zoidberg.machine.schrodt.org)
 by zapp.schrodt.org with esmtps (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <spheenik@zoidberg.machine.schrodt.org>)
 id 1hcAla-0004Hk-RL; Sat, 15 Jun 2019 17:38:54 +0200
Received: from spheenik by zoidberg.machine.schrodt.org with local (Exim 4.92)
 (envelope-from <spheenik@zoidberg.machine.schrodt.org>)
 id 1hcAlY-000Pms-MZ; Sat, 15 Jun 2019 17:38:52 +0200
From: Martin Schrodt <martin@schrodt.org>
To: qemu-devel@nongnu.org
Date: Sat, 15 Jun 2019 17:38:52 +0200
Message-Id: <20190615153852.99040-1-martin@schrodt.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.4.119.246
Subject: [Qemu-devel] [PATCH] fix microphone lag with PA
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
Cc: kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Several people have reported to have bag microphone lag with the PA
backend. While I cannot reproduce the problem here, it seems that their
PA somehow decides to buffer the microphone input for way too long,
causing this delay. This patch sets an upper limit to the amount of
data PA should hold. This fixes the problem reliably on their side,
while having no adverse effects on mine.

Signed-off-by: Martin Schrodt <martin@schrodt.org>
---
 audio/paaudio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/audio/paaudio.c b/audio/paaudio.c
index fa9dd9efd4..5fc886bb33 100644
--- a/audio/paaudio.c
+++ b/audio/paaudio.c
@@ -618,7 +618,7 @@ static int qpa_init_in(HWVoiceIn *hw, struct audsettings *as, void *drv_opaque)
     ss.rate = as->freq;
 
     ba.fragsize = pa_usec_to_bytes(ppdo->latency, &ss);
-    ba.maxlength = -1;
+    ba.maxlength = pa_usec_to_bytes(ppdo->latency * 2, &ss);
     ba.minreq = -1;
     ba.prebuf = -1;
 
-- 
2.22.0


