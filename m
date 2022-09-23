Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6864B5E8205
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 20:50:31 +0200 (CEST)
Received: from localhost ([::1]:49374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obnks-0002ke-Cf
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 14:50:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1obnXw-0002mq-OD
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 14:37:15 -0400
Received: from mailout11.t-online.de ([194.25.134.85]:47566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1obnXv-0005Gn-0j
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 14:37:08 -0400
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
 by mailout11.t-online.de (Postfix) with SMTP id 047CA127EA;
 Fri, 23 Sep 2022 20:37:05 +0200 (CEST)
Received: from linpower.localnet ([84.175.228.229]) by fwd76.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1obnXs-2r31Kj0; Fri, 23 Sep 2022 20:37:04 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id B0392200620; Fri, 23 Sep 2022 20:36:40 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: [PATCH 11/12] audio: fix sw->buf size for audio recording
Date: Fri, 23 Sep 2022 20:36:39 +0200
Message-Id: <20220923183640.8314-11-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <38d7417a-fc26-be39-6a63-99c79ee15fc9@t-online.de>
References: <38d7417a-fc26-be39-6a63-99c79ee15fc9@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1663958224-EEFF2A26-51EF2029/0/0 CLEAN NORMAL
X-TOI-MSGID: cb28168f-647c-4334-a556-853adb77d7d4
Received-SPF: none client-ip=194.25.134.85;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout11.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

The calculation of the buffer size needed to store audio samples
after resampling is wrong for audio recording. For audio recording
sw->ratio is calculated as

sw->ratio = frontend sample rate / backend sample rate.

From this follows

frontend samples = frontend sample rate / backend sample rate
 * backend samples
frontend samples = sw->ratio * backend samples

In 2 of 3 places in the audio recording code where sw->ratio
is used in a calculation to get the number of frontend frames,
the calculation is wrong. Fix this. The 3rd formula in
audio_pcm_sw_read() is correct.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/71
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio.c          | 2 +-
 audio/audio_template.h | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/audio/audio.c b/audio/audio.c
index ba0c62b120..60c7472d37 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -995,7 +995,7 @@ void AUD_set_active_in (SWVoiceIn *sw, int on)
  */
 static size_t audio_frontend_frames_in(SWVoiceIn *sw, size_t frames_in)
 {
-    return ((int64_t)frames_in << 32) / sw->ratio;
+    return (int64_t)frames_in * sw->ratio >> 32;
 }
 
 static size_t audio_get_avail (SWVoiceIn *sw)
diff --git a/audio/audio_template.h b/audio/audio_template.h
index 7192b19e73..6a0337ac6b 100644
--- a/audio/audio_template.h
+++ b/audio/audio_template.h
@@ -112,7 +112,11 @@ static int glue (audio_pcm_sw_alloc_resources_, TYPE) (SW *sw)
         return 0;
     }
 
+#ifdef DAC
     samples = ((int64_t) sw->HWBUF->size << 32) / sw->ratio;
+#else
+    samples = (int64_t)sw->HWBUF->size * sw->ratio >> 32;
+#endif
 
     sw->buf = audio_calloc(__func__, samples, sizeof(struct st_sample));
     if (!sw->buf) {
-- 
2.35.3


