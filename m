Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B48486689
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 16:11:01 +0100 (CET)
Received: from localhost ([::1]:54074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5UPs-00032Q-7s
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 10:11:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1n5P12-0005sB-E7
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 04:25:03 -0500
Received: from mailout05.t-online.de ([194.25.134.82]:40032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1n5P10-0006XC-JV
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 04:25:00 -0500
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
 by mailout05.t-online.de (Postfix) with SMTP id CCBB1104B3;
 Thu,  6 Jan 2022 10:23:33 +0100 (CET)
Received: from linpower.localnet ([46.86.48.20]) by fwd75.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1n5Ozd-2IWHab0; Thu, 6 Jan 2022 10:23:33 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id D07DA200619; Thu,  6 Jan 2022 10:23:32 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <volker.ruemelin@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 01/15] audio: replace open-coded buffer arithmetic
Date: Thu,  6 Jan 2022 10:23:18 +0100
Message-Id: <20220106092332.7223-1-volker.ruemelin@t-online.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cfcae86f-59c3-a2c5-76cd-1ab5e23e20f3@t-online.de>
References: <cfcae86f-59c3-a2c5-76cd-1ab5e23e20f3@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1641461013-000184BD-37F24861/0/0 CLEAN NORMAL
X-TOI-MSGID: 52318789-439f-4264-bb62-5fee4067c6dc
Received-SPF: none client-ip=194.25.134.82;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout05.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 06 Jan 2022 10:04:59 -0500
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
Cc: Thomas Huth <huth@tuxfamily.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

Replace open-coded buffer arithmetic with the available function
audio_ring_dist(). Because the name audio_ring_dist implies it
calculates the distance between two points, define the alias
function name audio_ring_posb. That's the position in backward
direction of a given point at a given distance.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio.c     | 25 +++++++------------------
 audio/audio_int.h |  2 ++
 audio/coreaudio.c | 10 ++++------
 audio/sdlaudio.c  | 11 +++++------
 4 files changed, 18 insertions(+), 30 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index dc28685d22..e7a139e289 100644
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
 
diff --git a/audio/audio_int.h b/audio/audio_int.h
index 428a091d05..928d8e107e 100644
--- a/audio/audio_int.h
+++ b/audio/audio_int.h
@@ -266,6 +266,8 @@ static inline size_t audio_ring_dist(size_t dst, size_t src, size_t len)
     return (dst >= src) ? (dst - src) : (len - src + dst);
 }
 
+#define audio_ring_posb(pos, dist, len) audio_ring_dist(pos, dist, len)
+
 #define dolog(fmt, ...) AUD_log(AUDIO_CAP, fmt, ## __VA_ARGS__)
 
 #ifdef DEBUG
diff --git a/audio/coreaudio.c b/audio/coreaudio.c
index d8a21d3e50..1fdd1d4b14 100644
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
index c68c62a3e4..d6f3aa1a9a 100644
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
2.31.1


