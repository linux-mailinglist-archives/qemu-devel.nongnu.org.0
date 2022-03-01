Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEFD4C94AE
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 20:45:44 +0100 (CET)
Received: from localhost ([::1]:60320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP8RL-0004KD-F3
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 14:45:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1nP7wN-0005ga-Te
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 14:13:45 -0500
Received: from mailout03.t-online.de ([194.25.134.81]:53856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1nP7wM-0001sQ-54
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 14:13:43 -0500
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
 by mailout03.t-online.de (Postfix) with SMTP id A9DB9D7A;
 Tue,  1 Mar 2022 20:13:40 +0100 (CET)
Received: from linpower.localnet ([46.86.48.20]) by fwd75.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1nP7wK-0n79bF0; Tue, 1 Mar 2022 20:13:40 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 13213200627; Tue,  1 Mar 2022 20:13:12 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v3 12/15] dsoundaudio: reduce effective playback buffer size
Date: Tue,  1 Mar 2022 20:13:08 +0100
Message-Id: <20220301191311.26695-12-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <3d0bd2ac-e5b9-9cf6-c98f-c047390a3ec5@t-online.de>
References: <3d0bd2ac-e5b9-9cf6-c98f-c047390a3ec5@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1646162020-000184BD-DDDEE319/0/0 CLEAN NORMAL
X-TOI-MSGID: 77040ca6-0874-4c28-bb83-bf8fd5066c9d
Received-SPF: none client-ip=194.25.134.81;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout03.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the buffer_get_free pcm_ops function to reduce the effective
playback buffer size. All intermediate audio playback buffers
become temporary buffers.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/dsoundaudio.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/audio/dsoundaudio.c b/audio/dsoundaudio.c
index 3dd2c4d4a6..231f3e65b3 100644
--- a/audio/dsoundaudio.c
+++ b/audio/dsoundaudio.c
@@ -427,22 +427,18 @@ static void dsound_enable_out(HWVoiceOut *hw, bool enable)
     }
 }
 
-static void *dsound_get_buffer_out(HWVoiceOut *hw, size_t *size)
+static size_t dsound_buffer_get_free(HWVoiceOut *hw)
 {
     DSoundVoiceOut *ds = (DSoundVoiceOut *) hw;
     LPDIRECTSOUNDBUFFER dsb = ds->dsound_buffer;
     HRESULT hr;
-    DWORD ppos, wpos, act_size;
-    size_t req_size;
-    int err;
-    void *ret;
+    DWORD ppos, wpos;
 
     hr = IDirectSoundBuffer_GetCurrentPosition(
         dsb, &ppos, ds->first_time ? &wpos : NULL);
     if (FAILED(hr)) {
         dsound_logerr(hr, "Could not get playback buffer position\n");
-        *size = 0;
-        return NULL;
+        return 0;
     }
 
     if (ds->first_time) {
@@ -450,13 +446,20 @@ static void *dsound_get_buffer_out(HWVoiceOut *hw, size_t *size)
         ds->first_time = false;
     }
 
-    req_size = audio_ring_dist(ppos, hw->pos_emul, hw->size_emul);
-    req_size = MIN(req_size, hw->size_emul - hw->pos_emul);
+    return audio_ring_dist(ppos, hw->pos_emul, hw->size_emul);
+}
 
-    if (req_size == 0) {
-        *size = 0;
-        return NULL;
-    }
+static void *dsound_get_buffer_out(HWVoiceOut *hw, size_t *size)
+{
+    DSoundVoiceOut *ds = (DSoundVoiceOut *)hw;
+    LPDIRECTSOUNDBUFFER dsb = ds->dsound_buffer;
+    DWORD act_size;
+    size_t req_size;
+    int err;
+    void *ret;
+
+    req_size = MIN(*size, hw->size_emul - hw->pos_emul);
+    assert(req_size > 0);
 
     err = dsound_lock_out(dsb, &hw->info, hw->pos_emul, req_size, &ret, NULL,
                           &act_size, NULL, false, ds->s);
@@ -699,6 +702,7 @@ static struct audio_pcm_ops dsound_pcm_ops = {
     .init_out = dsound_init_out,
     .fini_out = dsound_fini_out,
     .write    = audio_generic_write,
+    .buffer_get_free = dsound_buffer_get_free,
     .get_buffer_out = dsound_get_buffer_out,
     .put_buffer_out = dsound_put_buffer_out,
     .enable_out = dsound_enable_out,
-- 
2.34.1


