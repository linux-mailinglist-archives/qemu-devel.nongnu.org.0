Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D89B96A220F
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 20:06:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVdOb-00022f-Gn; Fri, 24 Feb 2023 14:06:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pVdOa-0001yI-7d
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 14:06:16 -0500
Received: from mailout02.t-online.de ([194.25.134.17])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pVdOY-00045M-GP
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 14:06:15 -0500
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
 by mailout02.t-online.de (Postfix) with SMTP id 60FCB2A9A1;
 Fri, 24 Feb 2023 20:06:12 +0100 (CET)
Received: from linpower.localnet ([84.175.228.75]) by fwd89.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pVdOU-0Ul0Aj0; Fri, 24 Feb 2023 20:06:10 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 9BE0733552B; Fri, 24 Feb 2023 20:05:55 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Subject: [PATCH v3 07/15] audio: don't misuse audio_pcm_sw_write()
Date: Fri, 24 Feb 2023 20:05:47 +0100
Message-Id: <20230224190555.7409-7-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <fa61e27f-6c37-af55-44bc-119592240720@t-online.de>
References: <fa61e27f-6c37-af55-44bc-119592240720@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1677265570-CFFFF046-6C259FE7/0/0 CLEAN NORMAL
X-TOI-MSGID: d0594bb1-5e95-4675-a37a-a543cd5ef698
Received-SPF: none client-ip=194.25.134.17;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout02.t-online.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The audio_pcm_sw_write() function is intended to convert a
PCM audio stream to the internal representation, adjust the
volume, and then mix it with the other audio streams with a
possibly changed sample rate in mix_buf. In order for the
audio_capture_mix_and_clear() function to use audio_pcm_sw_write(),
it must bypass the first two tasks of audio_pcm_sw_write().

Since patch "audio: split out the resampling loop in
audio_pcm_sw_write()" this is no longer necessary, because now
the audio_pcm_sw_resample_out() function can be used instead of
audio_pcm_sw_write().

Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index cd10f1ec10..44eb7b63b4 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -1056,26 +1056,33 @@ static void audio_capture_mix_and_clear(HWVoiceOut *hw, size_t rpos,
 
         for (sc = hw->cap_head.lh_first; sc; sc = sc->entries.le_next) {
             SWVoiceOut *sw = &sc->sw;
-            int rpos2 = rpos;
+            size_t rpos2 = rpos;
 
             n = samples;
             while (n) {
                 size_t till_end_of_hw = hw->mix_buf.size - rpos2;
-                size_t to_write = MIN(till_end_of_hw, n);
-                size_t bytes = to_write * hw->info.bytes_per_frame;
-                size_t written;
+                size_t to_read = MIN(till_end_of_hw, n);
+                size_t live, frames_in, frames_out;
 
                 sw->resample_buf.buffer = hw->mix_buf.buffer + rpos2;
-                sw->resample_buf.size = to_write;
-                written = audio_pcm_sw_write (sw, NULL, bytes);
-                if (written - bytes) {
-                    dolog("Could not mix %zu bytes into a capture "
+                sw->resample_buf.size = to_read;
+                live = sw->total_hw_samples_mixed;
+
+                audio_pcm_sw_resample_out(sw,
+                                          to_read, sw->hw->mix_buf.size - live,
+                                          &frames_in, &frames_out);
+
+                sw->total_hw_samples_mixed += frames_out;
+                sw->empty = sw->total_hw_samples_mixed == 0;
+
+                if (to_read - frames_in) {
+                    dolog("Could not mix %zu frames into a capture "
                           "buffer, mixed %zu\n",
-                          bytes, written);
+                          to_read, frames_in);
                     break;
                 }
-                n -= to_write;
-                rpos2 = (rpos2 + to_write) % hw->mix_buf.size;
+                n -= to_read;
+                rpos2 = (rpos2 + to_read) % hw->mix_buf.size;
             }
         }
     }
-- 
2.35.3


