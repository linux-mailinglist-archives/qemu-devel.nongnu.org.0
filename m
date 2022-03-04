Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 273B74CD707
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 16:02:04 +0100 (CET)
Received: from localhost ([::1]:60350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ9RT-0007ec-6Z
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 10:02:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nQ8q9-0003Zz-IG
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:23:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nQ8q7-0000Rb-UX
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:23:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646403807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ui4CfxKhlynO4qirwjH9anS0yn4WvwIgkFz+4TC0svE=;
 b=MrQWT+ZJ9HDBzPZ2fkhW944PtxTARs5izxkM8nSE6kedH0iHicA4sPIGKmccwf1dNUt8ug
 8suxyq/KG5J4QEogwkW5E8eh60klqHAX8vFOPSHXvbcuJN/2Eq/E0vBI9bfk6whuI4yADQ
 qrd0wYCp7TH41r96FevVBExzCVafJ4I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-VAoaOAaDMlqg_yYu2SVtXA-1; Fri, 04 Mar 2022 09:23:26 -0500
X-MC-Unique: VAoaOAaDMlqg_yYu2SVtXA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79A0E835DE1;
 Fri,  4 Mar 2022 14:23:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D994B1057059;
 Fri,  4 Mar 2022 14:23:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8D22618009A7; Fri,  4 Mar 2022 15:21:24 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/35] audio: copy playback stream in sequential order
Date: Fri,  4 Mar 2022 15:21:02 +0100
Message-Id: <20220304142123.956171-15-kraxel@redhat.com>
In-Reply-To: <20220304142123.956171-1-kraxel@redhat.com>
References: <20220304142123.956171-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

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
Message-Id: <20220301191311.26695-7-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/audio.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index 35437986d9dd..9e2d7fb20978 100644
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
2.35.1


