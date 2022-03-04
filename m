Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F264CD731
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 16:08:16 +0100 (CET)
Received: from localhost ([::1]:49660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ9XT-000306-5E
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 10:08:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nQ8pb-00022h-Or
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:22:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nQ8pa-0000OW-6U
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:22:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646403773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l3yjkI+OFuK6ktDSGxqhnf8/yPH5EcnYhM1aCcC7f1U=;
 b=L7Lii6fkTsY/IEqC2dLZBzGxulY2VjPQYybHS5cBSXMuE7x6YsGMIJ0VCIlTxHjkzxb2OY
 gvf7XcI/trr8i0li/28f6ITsicjuOSqZUvKXNa0qDCJCZiPYp2SkAreWm8eFcxspbNf30Q
 5boc/ATmoVjb9Rr7qkmMSoD+zZRTmyQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-401-dudPXEZhMzy2b-byXEeBKg-1; Fri, 04 Mar 2022 09:22:50 -0500
X-MC-Unique: dudPXEZhMzy2b-byXEeBKg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E923F1854E26;
 Fri,  4 Mar 2022 14:22:48 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7195A808BD;
 Fri,  4 Mar 2022 14:22:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 50CE51800930; Fri,  4 Mar 2022 15:21:24 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/35] audio: move function audio_pcm_hw_clip_out()
Date: Fri,  4 Mar 2022 15:20:57 +0100
Message-Id: <20220304142123.956171-10-kraxel@redhat.com>
In-Reply-To: <20220304142123.956171-1-kraxel@redhat.com>
References: <20220304142123.956171-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

Move the function audio_pcm_hw_clip_out() into the correct
section 'Hard voice (playback)'.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-Id: <20220301191311.26695-2-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/audio.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index e7a139e28949..dfd32912da48 100644
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
2.35.1


