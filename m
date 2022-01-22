Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6CF496C92
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 14:27:48 +0100 (CET)
Received: from localhost ([::1]:51194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBGQl-0003al-7k
	for lists+qemu-devel@lfdr.de; Sat, 22 Jan 2022 08:27:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1nBFxz-0007eW-PS
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 07:58:04 -0500
Received: from mailout04.t-online.de ([194.25.134.18]:39144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1nBFxx-00053R-B4
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 07:58:03 -0500
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
 by mailout04.t-online.de (Postfix) with SMTP id 7E1AC1911;
 Sat, 22 Jan 2022 13:57:58 +0100 (CET)
Received: from linpower.localnet ([46.86.48.20]) by fwd84.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1nBFxp-1AkoHB0; Sat, 22 Jan 2022 13:57:53 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id D0A4720062F; Sat, 22 Jan 2022 13:57:45 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 04/15] audio: inline function audio_pcm_sw_get_rpos_in()
Date: Sat, 22 Jan 2022 13:57:34 +0100
Message-Id: <20220122125745.5037-4-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <addf2564-d61c-707e-ce5f-fb06264e7a39@t-online.de>
References: <addf2564-d61c-707e-ce5f-fb06264e7a39@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1642856273-00009E39-9BC96EB5/0/0 CLEAN NORMAL
X-TOI-MSGID: e4543aa4-0e9e-454a-9d87-d3ff73b38ab9
Received-SPF: none client-ip=194.25.134.18;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout04.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simplify code by inlining function audio_pcm_sw_get_rpos_in()
at the only call site and remove the duplicated audio_bug()
test.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio.c | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index f28e91853f..35437986d9 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -569,37 +569,24 @@ static size_t audio_pcm_hw_conv_in(HWVoiceIn *hw, void *pcm_buf, size_t samples)
 /*
  * Soft voice (capture)
  */
-static size_t audio_pcm_sw_get_rpos_in(SWVoiceIn *sw)
-{
-    HWVoiceIn *hw = sw->hw;
-    ssize_t live = hw->total_samples_captured - sw->total_hw_samples_acquired;
-
-    if (audio_bug(__func__, live < 0 || live > hw->conv_buf->size)) {
-        dolog("live=%zu hw->conv_buf->size=%zu\n", live, hw->conv_buf->size);
-        return 0;
-    }
-
-    return audio_ring_posb(hw->conv_buf->pos, live, hw->conv_buf->size);
-}
-
 static size_t audio_pcm_sw_read(SWVoiceIn *sw, void *buf, size_t size)
 {
     HWVoiceIn *hw = sw->hw;
     size_t samples, live, ret = 0, swlim, isamp, osamp, rpos, total = 0;
     struct st_sample *src, *dst = sw->buf;
 
-    rpos = audio_pcm_sw_get_rpos_in(sw) % hw->conv_buf->size;
-
     live = hw->total_samples_captured - sw->total_hw_samples_acquired;
+    if (!live) {
+        return 0;
+    }
     if (audio_bug(__func__, live > hw->conv_buf->size)) {
         dolog("live_in=%zu hw->conv_buf->size=%zu\n", live, hw->conv_buf->size);
         return 0;
     }
 
+    rpos = audio_ring_posb(hw->conv_buf->pos, live, hw->conv_buf->size);
+
     samples = size / sw->info.bytes_per_frame;
-    if (!live) {
-        return 0;
-    }
 
     swlim = (live * sw->ratio) >> 32;
     swlim = MIN (swlim, samples);
-- 
2.31.1


