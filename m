Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C78F64CD715
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 16:05:33 +0100 (CET)
Received: from localhost ([::1]:41084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ9Uq-0005dE-Sl
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 10:05:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nQ8pR-0001RU-4w
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:22:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nQ8pP-0000NR-Dg
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:22:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646403762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CsCFb5CJyI+ZCBU6CBW9Mm7Xi4HwAt4PFtlSY7MXD14=;
 b=DXizzi9weKafiDjb+0tuqMM5gTnQiniOczNsgxt6VigGduRMhJJK+nqbbZJCbdfccj9RIV
 +bM+ZP/vfT15rQIT7iaAkrYOLtpbJneAXJ/8GMMcC2Tw2H2+aaAW78HpSyN2nBn/6mraIe
 eJDgyKoJBE4p9pEMHEMnblMfjZK3z8o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-265-IkerpFCIN-qd9s5XcoQH_Q-1; Fri, 04 Mar 2022 09:22:39 -0500
X-MC-Unique: IkerpFCIN-qd9s5XcoQH_Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0B9C801AFE;
 Fri,  4 Mar 2022 14:22:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E32157B616;
 Fri,  4 Mar 2022 14:22:34 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 40BB0180092E; Fri,  4 Mar 2022 15:21:24 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/35] audio: replace open-coded buffer arithmetic
Date: Fri,  4 Mar 2022 15:20:56 +0100
Message-Id: <20220304142123.956171-9-kraxel@redhat.com>
In-Reply-To: <20220304142123.956171-1-kraxel@redhat.com>
References: <20220304142123.956171-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

Replace open-coded buffer arithmetic with the new function
audio_ring_posb(). That's the position in backward direction
of a given point at a given distance.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <20220301191311.26695-1-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/audio_int.h | 13 +++++++++++++
 audio/audio.c     | 25 +++++++------------------
 audio/coreaudio.c | 10 ++++------
 audio/sdlaudio.c  | 11 +++++------
 4 files changed, 29 insertions(+), 30 deletions(-)

diff --git a/audio/audio_int.h b/audio/audio_int.h
index 428a091d05e5..71be162271b5 100644
--- a/audio/audio_int.h
+++ b/audio/audio_int.h
@@ -266,6 +266,19 @@ static inline size_t audio_ring_dist(size_t dst, size_t src, size_t len)
     return (dst >= src) ? (dst - src) : (len - src + dst);
 }
 
+/**
+ * audio_ring_posb() - returns new position in ringbuffer in backward
+ * direction at given distance
+ *
+ * @pos: current position in ringbuffer
+ * @dist: distance in ringbuffer to walk in reverse direction
+ * @len: size of ringbuffer
+ */
+static inline size_t audio_ring_posb(size_t pos, size_t dist, size_t len)
+{
+    return pos >= dist ? pos - dist : len - dist + pos;
+}
+
 #define dolog(fmt, ...) AUD_log(AUDIO_CAP, fmt, ## __VA_ARGS__)
 
 #ifdef DEBUG
diff --git a/audio/audio.c b/audio/audio.c
index dc28685d226d..e7a139e28949 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -574,19 +574,13 @@ static size_t audio_pcm_sw_get_rpos_in(SWVoiceIn *sw)
 {
     HWVoiceIn *hw = sw->hw;
     ssize_t live = hw->total_samples_captured - sw->total_hw_samples_acquired;
-    ssize_t rpos;
 
     if (audio_bug(__func__, live < 0 || live > hw->conv_buf->size)) {
         dolog("live=%zu hw->conv_buf->size=%zu\n", live, hw->conv_buf->size);
         return 0;
     }
 
-    rpos = hw->conv_buf->pos - live;
-    if (rpos >= 0) {
-        return rpos;
-    } else {
-        return hw->conv_buf->size + rpos;
-    }
+    return audio_ring_posb(hw->conv_buf->pos, live, hw->conv_buf->size);
 }
 
 static size_t audio_pcm_sw_read(SWVoiceIn *sw, void *buf, size_t size)
@@ -1394,12 +1388,10 @@ void audio_generic_run_buffer_in(HWVoiceIn *hw)
 
 void *audio_generic_get_buffer_in(HWVoiceIn *hw, size_t *size)
 {
-    ssize_t start = (ssize_t)hw->pos_emul - hw->pending_emul;
+    size_t start;
 
-    if (start < 0) {
-        start += hw->size_emul;
-    }
-    assert(start >= 0 && start < hw->size_emul);
+    start = audio_ring_posb(hw->pos_emul, hw->pending_emul, hw->size_emul);
+    assert(start < hw->size_emul);
 
     *size = MIN(*size, hw->pending_emul);
     *size = MIN(*size, hw->size_emul - start);
@@ -1415,13 +1407,10 @@ void audio_generic_put_buffer_in(HWVoiceIn *hw, void *buf, size_t size)
 void audio_generic_run_buffer_out(HWVoiceOut *hw)
 {
     while (hw->pending_emul) {
-        size_t write_len, written;
-        ssize_t start = ((ssize_t) hw->pos_emul) - hw->pending_emul;
+        size_t write_len, written, start;
 
-        if (start < 0) {
-            start += hw->size_emul;
-        }
-        assert(start >= 0 && start < hw->size_emul);
+        start = audio_ring_posb(hw->pos_emul, hw->pending_emul, hw->size_emul);
+        assert(start < hw->size_emul);
 
         write_len = MIN(hw->pending_emul, hw->size_emul - start);
 
diff --git a/audio/coreaudio.c b/audio/coreaudio.c
index d8a21d3e5075..1fdd1d4b14f6 100644
--- a/audio/coreaudio.c
+++ b/audio/coreaudio.c
@@ -333,12 +333,10 @@ static OSStatus audioDeviceIOProc(
 
     len = frameCount * hw->info.bytes_per_frame;
     while (len) {
-        size_t write_len;
-        ssize_t start = ((ssize_t) hw->pos_emul) - hw->pending_emul;
-        if (start < 0) {
-            start += hw->size_emul;
-        }
-        assert(start >= 0 && start < hw->size_emul);
+        size_t write_len, start;
+
+        start = audio_ring_posb(hw->pos_emul, hw->pending_emul, hw->size_emul);
+        assert(start < hw->size_emul);
 
         write_len = MIN(MIN(hw->pending_emul, len),
                         hw->size_emul - start);
diff --git a/audio/sdlaudio.c b/audio/sdlaudio.c
index c68c62a3e4f1..d6f3aa1a9ac5 100644
--- a/audio/sdlaudio.c
+++ b/audio/sdlaudio.c
@@ -224,12 +224,11 @@ static void sdl_callback_out(void *opaque, Uint8 *buf, int len)
         /* dolog("callback_out: len=%d avail=%zu\n", len, hw->pending_emul); */
 
         while (hw->pending_emul && len) {
-            size_t write_len;
-            ssize_t start = (ssize_t)hw->pos_emul - hw->pending_emul;
-            if (start < 0) {
-                start += hw->size_emul;
-            }
-            assert(start >= 0 && start < hw->size_emul);
+            size_t write_len, start;
+
+            start = audio_ring_posb(hw->pos_emul, hw->pending_emul,
+                                    hw->size_emul);
+            assert(start < hw->size_emul);
 
             write_len = MIN(MIN(hw->pending_emul, len),
                             hw->size_emul - start);
-- 
2.35.1


