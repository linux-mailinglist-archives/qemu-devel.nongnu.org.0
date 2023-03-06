Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A21E06AB69E
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 07:53:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ4jG-00079b-FA; Mon, 06 Mar 2023 01:53:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ4j2-00074D-OS
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 01:53:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ4j0-0000e6-Sd
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 01:53:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678085614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rYCMrgTy8xVD/anHHjp9hzJPi1IH/Ms6Zyu0fMQd86g=;
 b=fdX0Ply+00sULtEvg8ajzrympFOV2/sZUw3Vyd0cuqcuRHX4KjJ8ovK68wd+oCRLh8mpsT
 HCVufxP4vTuyJ1Pzyu/VJxQXwov+6s7C9zGfj2ssSkO55MRqABdYp5miKQI0FMDh41p9uO
 lWsGsfviaWDtPc3oFeV1Jz+vEWiWbmU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-546-UZ6Jv4zEMoCpS1kVA00l6Q-1; Mon, 06 Mar 2023 01:53:30 -0500
X-MC-Unique: UZ6Jv4zEMoCpS1kVA00l6Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8122C885623;
 Mon,  6 Mar 2023 06:53:30 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF9D2C16029;
 Mon,  6 Mar 2023 06:53:29 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: [PULL 19/27] audio: don't misuse audio_pcm_sw_write()
Date: Mon,  6 Mar 2023 10:51:54 +0400
Message-Id: <20230306065202.2160066-20-marcandre.lureau@redhat.com>
In-Reply-To: <20230306065202.2160066-1-marcandre.lureau@redhat.com>
References: <20230306065202.2160066-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Volker Rümelin <vr_qemu@t-online.de>

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
Message-Id: <20230224190555.7409-7-vr_qemu@t-online.de>
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
2.39.2


