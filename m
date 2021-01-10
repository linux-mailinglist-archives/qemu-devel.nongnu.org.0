Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8812F0646
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 11:09:08 +0100 (CET)
Received: from localhost ([::1]:37182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyXel-0006h4-1o
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 05:09:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1kyXYl-0001MF-BJ
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 05:02:55 -0500
Received: from mailout12.t-online.de ([194.25.134.22]:40080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1kyXYj-0005JC-IT
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 05:02:55 -0500
Received: from fwd08.aul.t-online.de (fwd08.aul.t-online.de [172.20.26.151])
 by mailout12.t-online.de (Postfix) with SMTP id CC79341F9695;
 Sun, 10 Jan 2021 11:02:51 +0100 (CET)
Received: from linpower.localnet
 (bdeIpmZJZhMcYYo0UNJ3G5bCjY+afcMXevlJ4INqW2oZga-WHYEdbG3BWxp8AFuZAx@[93.236.152.29])
 by fwd08.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1kyXYg-3qgj320; Sun, 10 Jan 2021 11:02:50 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id E5A0820062F; Sun, 10 Jan 2021 11:02:39 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 05/23] sdlaudio: always clear the sample buffer
Date: Sun, 10 Jan 2021 11:02:21 +0100
Message-Id: <20210110100239.27588-5-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
References: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: bdeIpmZJZhMcYYo0UNJ3G5bCjY+afcMXevlJ4INqW2oZga-WHYEdbG3BWxp8AFuZAx
X-TOI-EXPURGATEID: 150726::1610272970-000072E4-E3B700D0/0/0 CLEAN NORMAL
X-TOI-MSGID: 31d29c6c-8155-4a2a-bb6e-2fc7191aa9d2
Received-SPF: none client-ip=194.25.134.22;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout12.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU <qemu-devel@nongnu.org>,
 =?UTF-8?q?Zolt=C3=A1n=20K=C5=91v=C3=A1g=C3=B3?= <dirty.ice.hu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Always fill the remaining audio callback buffer with silence.
SDL 2.0 doesn't initialize the audio callback buffer. This was
an incompatible change compared to SDL 1.2. For reference read
the SDL 1.2 to 2.0 migration guide.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/sdlaudio.c | 33 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/audio/sdlaudio.c b/audio/sdlaudio.c
index 68126a99ab..79eed23849 100644
--- a/audio/sdlaudio.c
+++ b/audio/sdlaudio.c
@@ -211,27 +211,26 @@ static void sdl_callback (void *opaque, Uint8 *buf, int len)
     SDLAudioState *s = &glob_sdl;
     HWVoiceOut *hw = &sdl->hw;
 
-    if (s->exit) {
-        return;
-    }
+    if (!s->exit) {
 
-    /* dolog("callback: len=%d avail=%zu\n", len, hw->pending_emul); */
+        /* dolog("callback: len=%d avail=%zu\n", len, hw->pending_emul); */
 
-    while (hw->pending_emul && len) {
-        size_t write_len;
-        ssize_t start = ((ssize_t) hw->pos_emul) - hw->pending_emul;
-        if (start < 0) {
-            start += hw->size_emul;
-        }
-        assert(start >= 0 && start < hw->size_emul);
+        while (hw->pending_emul && len) {
+            size_t write_len;
+            ssize_t start = (ssize_t)hw->pos_emul - hw->pending_emul;
+            if (start < 0) {
+                start += hw->size_emul;
+            }
+            assert(start >= 0 && start < hw->size_emul);
 
-        write_len = MIN(MIN(hw->pending_emul, len),
-                        hw->size_emul - start);
+            write_len = MIN(MIN(hw->pending_emul, len),
+                            hw->size_emul - start);
 
-        memcpy(buf, hw->buf_emul + start, write_len);
-        hw->pending_emul -= write_len;
-        len -= write_len;
-        buf += write_len;
+            memcpy(buf, hw->buf_emul + start, write_len);
+            hw->pending_emul -= write_len;
+            len -= write_len;
+            buf += write_len;
+        }
     }
 
     /* clear remaining buffer that we couldn't fill with data */
-- 
2.26.2


