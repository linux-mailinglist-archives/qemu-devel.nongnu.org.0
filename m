Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F5E496C98
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 14:33:27 +0100 (CET)
Received: from localhost ([::1]:55586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBGWE-0006fh-D0
	for lists+qemu-devel@lfdr.de; Sat, 22 Jan 2022 08:33:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1nBFy2-0007gG-3p
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 07:58:06 -0500
Received: from mailout02.t-online.de ([194.25.134.17]:34980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1nBFy0-00054V-KQ
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 07:58:05 -0500
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
 by mailout02.t-online.de (Postfix) with SMTP id 725F36046;
 Sat, 22 Jan 2022 13:58:03 +0100 (CET)
Received: from linpower.localnet ([46.86.48.20]) by fwd71.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1nBFxx-3a9ain0; Sat, 22 Jan 2022 13:58:01 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id D76B8200632; Sat, 22 Jan 2022 13:57:45 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 07/15] audio: copy playback stream in sequential order
Date: Sat, 22 Jan 2022 13:57:37 +0100
Message-Id: <20220122125745.5037-7-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <addf2564-d61c-707e-ce5f-fb06264e7a39@t-online.de>
References: <addf2564-d61c-707e-ce5f-fb06264e7a39@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1642856281-00001674-CC177F27/0/0 CLEAN NORMAL
X-TOI-MSGID: ac4b2805-1bab-4546-b758-c93d104d0082
Received-SPF: none client-ip=194.25.134.17;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout02.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Change the code to copy the playback stream in sequential order.
The advantage can be seen in the next patches where the stream
copy operation effectively becomes a write through operation.

The following diagram shows the average buffer fill level and
the stream copy sequence. ### represents a timer_period sized
chunk. The rest of the buffer sizes are not to scale.

With current code:
         |--------| |#####111| |---#####|
          sw->buf    mix_buf    backend buffer
  1. clip
         |--------| |---#####| |111##222|
          sw->buf    mix_buf    backend buffer
  2. write to audio device
  333 -> |--------| |---#####| |---111##| -> 222
          sw->buf    mix_buf    backend buffer
  3a. sw device write
         |-----333| |---#####| |---111##|
          sw->buf    mix_buf    backend buffer
  3b. resample and mix
         |--------| |333#####| |---111##|
          sw->buf    mix_buf    backend buffer

With this patch:
  111 -> |--------| |---#####| |---#####|
          sw->buf    mix_buf    backend buffer
  1a: sw device write
         |-----111| |---#####| |---#####|
          sw->buf    mix_buf    backend buffer
  1b. resample and mix
         |--------| |111##222| |---#####|
          sw->buf    mix_buf    backend buffer
  2. clip
         |--------| |---111##| |222##333|
          sw->buf    mix_buf    backend buffer
  3. write to audio device
         |--------| |---111##| |---222##| -> 333
          sw->buf    mix_buf    backend buffer

The effective total playback buffer size is reduced by
timer_period.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index 35437986d9..9e2d7fb209 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -1134,6 +1134,15 @@ static void audio_run_out (AudioState *s)
         size_t played, live, prev_rpos, free;
         int nb_live;
 
+        for (sw = hw->sw_head.lh_first; sw; sw = sw->entries.le_next) {
+            if (sw->active) {
+                free = audio_get_free(sw);
+                if (free > 0) {
+                    sw->callback.fn(sw->callback.opaque, free);
+                }
+            }
+        }
+
         live = audio_pcm_hw_get_live_out (hw, &nb_live);
         if (!nb_live) {
             live = 0;
@@ -1162,14 +1171,6 @@ static void audio_run_out (AudioState *s)
         }
 
         if (!live) {
-            for (sw = hw->sw_head.lh_first; sw; sw = sw->entries.le_next) {
-                if (sw->active) {
-                    free = audio_get_free (sw);
-                    if (free > 0) {
-                        sw->callback.fn (sw->callback.opaque, free);
-                    }
-                }
-            }
             if (hw->pcm_ops->run_buffer_out) {
                 hw->pcm_ops->run_buffer_out(hw);
             }
@@ -1210,13 +1211,6 @@ static void audio_run_out (AudioState *s)
             if (!sw->total_hw_samples_mixed) {
                 sw->empty = 1;
             }
-
-            if (sw->active) {
-                free = audio_get_free (sw);
-                if (free > 0) {
-                    sw->callback.fn (sw->callback.opaque, free);
-                }
-            }
         }
     }
 }
-- 
2.31.1


