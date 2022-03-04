Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B98664CD6D9
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:56:23 +0100 (CET)
Received: from localhost ([::1]:47924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ9Ly-0007Q4-OW
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:56:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nQ8pd-0002At-TE
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:22:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nQ8pc-0000Ok-Bs
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:22:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646403775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1CIrGEnX/ivFjkEyndIGbmi18SsTsrHcjbfXWxVknGo=;
 b=D0To/mt6yUQP+47yLqs27LWBr3YJdTzh4+8BVN4sEoetaudZUVPna2ggOfpMdnB5yD7j+c
 fO8KG0a7aceHa52e1ESpB2/ozqnDIqGNWWr1fnLOqhMVuLYoE9e46XECv+U/tvJegFaZ3i
 /0LPsrD3XG6vgF8UUBsd6kWvKSORFU4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-6cxZujNaPuOOk1XqWPbP6Q-1; Fri, 04 Mar 2022 09:22:50 -0500
X-MC-Unique: 6cxZujNaPuOOk1XqWPbP6Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E16901854E21;
 Fri,  4 Mar 2022 14:22:48 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4837483092;
 Fri,  4 Mar 2022 14:22:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5CE2D1800934; Fri,  4 Mar 2022 15:21:24 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/35] audio: add function audio_pcm_hw_conv_in()
Date: Fri,  4 Mar 2022 15:20:58 +0100
Message-Id: <20220304142123.956171-11-kraxel@redhat.com>
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

Add a function audio_pcm_hw_conv_in() similar to the existing
counterpart function audio_pcm_hw_clip_out(). This function reduces
the number of calls to the pcm_ops functions get_buffer_in() and
put_buffer_in(). That's one less call to get_buffer_in() and
put_buffer_in() every time the conv_buffer wraps around.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-Id: <20220301191311.26695-3-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/audio.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index dfd32912da48..f28e91853f0b 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -548,6 +548,24 @@ static size_t audio_pcm_hw_get_live_in(HWVoiceIn *hw)
     return live;
 }
 
+static size_t audio_pcm_hw_conv_in(HWVoiceIn *hw, void *pcm_buf, size_t samples)
+{
+    size_t conv = 0;
+    STSampleBuffer *conv_buf = hw->conv_buf;
+
+    while (samples) {
+        uint8_t *src = advance(pcm_buf, conv * hw->info.bytes_per_frame);
+        size_t proc = MIN(samples, conv_buf->size - conv_buf->pos);
+
+        hw->conv(conv_buf->samples + conv_buf->pos, src, proc);
+        conv_buf->pos = (conv_buf->pos + proc) % conv_buf->size;
+        samples -= proc;
+        conv += proc;
+    }
+
+    return conv;
+}
+
 /*
  * Soft voice (capture)
  */
@@ -1219,7 +1237,6 @@ static void audio_run_out (AudioState *s)
 static size_t audio_pcm_hw_run_in(HWVoiceIn *hw, size_t samples)
 {
     size_t conv = 0;
-    STSampleBuffer *conv_buf = hw->conv_buf;
 
     if (hw->pcm_ops->run_buffer_in) {
         hw->pcm_ops->run_buffer_in(hw);
@@ -1235,11 +1252,7 @@ static size_t audio_pcm_hw_run_in(HWVoiceIn *hw, size_t samples)
             break;
         }
 
-        proc = MIN(size / hw->info.bytes_per_frame,
-                   conv_buf->size - conv_buf->pos);
-
-        hw->conv(conv_buf->samples + conv_buf->pos, buf, proc);
-        conv_buf->pos = (conv_buf->pos + proc) % conv_buf->size;
+        proc = audio_pcm_hw_conv_in(hw, buf, size / hw->info.bytes_per_frame);
 
         samples -= proc;
         conv += proc;
-- 
2.35.1


