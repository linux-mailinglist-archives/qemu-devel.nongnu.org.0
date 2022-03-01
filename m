Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D794C9441
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 20:30:01 +0100 (CET)
Received: from localhost ([::1]:34904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP8C8-0003Eu-Un
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 14:30:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1nP7w0-00051G-P7
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 14:13:21 -0500
Received: from mailout06.t-online.de ([194.25.134.19]:60624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1nP7vx-0001nf-IW
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 14:13:20 -0500
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
 by mailout06.t-online.de (Postfix) with SMTP id 99CFD18E15;
 Tue,  1 Mar 2022 20:13:15 +0100 (CET)
Received: from linpower.localnet ([46.86.48.20]) by fwd89.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1nP7vu-1SNrgP0; Tue, 1 Mar 2022 20:13:15 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id EA79320060C; Tue,  1 Mar 2022 20:13:11 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v3 02/15] audio: move function audio_pcm_hw_clip_out()
Date: Tue,  1 Mar 2022 20:12:58 +0100
Message-Id: <20220301191311.26695-2-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <3d0bd2ac-e5b9-9cf6-c98f-c047390a3ec5@t-online.de>
References: <3d0bd2ac-e5b9-9cf6-c98f-c047390a3ec5@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1646161995-0000F5B3-8FF0D597/0/0 CLEAN NORMAL
X-TOI-MSGID: 71b61ebc-3472-4350-913e-c70c9bc9a364
Received-SPF: none client-ip=194.25.134.19;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout06.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the function audio_pcm_hw_clip_out() into the correct
section 'Hard voice (playback)'.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index e7a139e289..dfd32912da 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -548,25 +548,6 @@ static size_t audio_pcm_hw_get_live_in(HWVoiceIn *hw)
     return live;
 }
 
-static void audio_pcm_hw_clip_out(HWVoiceOut *hw, void *pcm_buf, size_t len)
-{
-    size_t clipped = 0;
-    size_t pos = hw->mix_buf->pos;
-
-    while (len) {
-        st_sample *src = hw->mix_buf->samples + pos;
-        uint8_t *dst = advance(pcm_buf, clipped * hw->info.bytes_per_frame);
-        size_t samples_till_end_of_buf = hw->mix_buf->size - pos;
-        size_t samples_to_clip = MIN(len, samples_till_end_of_buf);
-
-        hw->clip(dst, src, samples_to_clip);
-
-        pos = (pos + samples_to_clip) % hw->mix_buf->size;
-        len -= samples_to_clip;
-        clipped += samples_to_clip;
-    }
-}
-
 /*
  * Soft voice (capture)
  */
@@ -677,6 +658,25 @@ static size_t audio_pcm_hw_get_live_out (HWVoiceOut *hw, int *nb_live)
     return 0;
 }
 
+static void audio_pcm_hw_clip_out(HWVoiceOut *hw, void *pcm_buf, size_t len)
+{
+    size_t clipped = 0;
+    size_t pos = hw->mix_buf->pos;
+
+    while (len) {
+        st_sample *src = hw->mix_buf->samples + pos;
+        uint8_t *dst = advance(pcm_buf, clipped * hw->info.bytes_per_frame);
+        size_t samples_till_end_of_buf = hw->mix_buf->size - pos;
+        size_t samples_to_clip = MIN(len, samples_till_end_of_buf);
+
+        hw->clip(dst, src, samples_to_clip);
+
+        pos = (pos + samples_to_clip) % hw->mix_buf->size;
+        len -= samples_to_clip;
+        clipped += samples_to_clip;
+    }
+}
+
 /*
  * Soft voice (playback)
  */
-- 
2.34.1


