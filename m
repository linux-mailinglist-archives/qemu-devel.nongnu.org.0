Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 538475E8242
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 21:02:29 +0200 (CEST)
Received: from localhost ([::1]:50404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obnwS-0007Su-3k
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 15:02:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1obnXu-0002mc-9v
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 14:37:15 -0400
Received: from mailout01.t-online.de ([194.25.134.80]:57700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1obnXs-0005GJ-2H
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 14:37:06 -0400
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
 by mailout01.t-online.de (Postfix) with SMTP id DDF845E42;
 Fri, 23 Sep 2022 20:36:52 +0200 (CEST)
Received: from linpower.localnet ([84.175.228.229]) by fwd82.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1obnXg-23jUX30; Fri, 23 Sep 2022 20:36:52 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id A151520061B; Fri, 23 Sep 2022 20:36:40 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org,
	Geoffrey McRae <geoff@hostfission.com>
Subject: [PATCH 06/12] spiceaudio: add a pcm_ops buffer_get_free function
Date: Fri, 23 Sep 2022 20:36:34 +0200
Message-Id: <20220923183640.8314-6-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <38d7417a-fc26-be39-6a63-99c79ee15fc9@t-online.de>
References: <38d7417a-fc26-be39-6a63-99c79ee15fc9@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1663958212-E77DC07E-BDCF2658/0/0 CLEAN NORMAL
X-TOI-MSGID: fcf06ed1-a251-4818-9303-96866f62dcf0
Received-SPF: none client-ip=194.25.134.80;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout01.t-online.de
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

It seems there is a demand [1] for low latency playback over
SPICE. Add a pcm_ops buffer_get_free function to reduce the
playback latency. The mixing engine buffer becomes a temporary
buffer.

[1] https://lists.nongnu.org/archive/html/qemu-devel/2022-01/msg01644.html

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/spiceaudio.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/audio/spiceaudio.c b/audio/spiceaudio.c
index a8d370fe6f..22892a7b9d 100644
--- a/audio/spiceaudio.c
+++ b/audio/spiceaudio.c
@@ -120,6 +120,13 @@ static void line_out_fini (HWVoiceOut *hw)
     spice_server_remove_interface (&out->sin.base);
 }
 
+static size_t line_out_get_free(HWVoiceOut *hw)
+{
+    SpiceVoiceOut *out = container_of(hw, SpiceVoiceOut, hw);
+
+    return audio_rate_peek_bytes(&out->rate, &hw->info);
+}
+
 static void *line_out_get_buffer(HWVoiceOut *hw, size_t *size)
 {
     SpiceVoiceOut *out = container_of(hw, SpiceVoiceOut, hw);
@@ -133,8 +140,6 @@ static void *line_out_get_buffer(HWVoiceOut *hw, size_t *size)
         *size = MIN((out->fsize - out->fpos) << 2, *size);
     }
 
-    *size = audio_rate_get_bytes(&hw->info, &out->rate, *size);
-
     return out->frame + out->fpos;
 }
 
@@ -142,6 +147,8 @@ static size_t line_out_put_buffer(HWVoiceOut *hw, void *buf, size_t size)
 {
     SpiceVoiceOut *out = container_of(hw, SpiceVoiceOut, hw);
 
+    audio_rate_add_bytes(&out->rate, size);
+
     if (buf) {
         assert(buf == out->frame + out->fpos && out->fpos <= out->fsize);
         out->fpos += size >> 2;
@@ -282,6 +289,7 @@ static struct audio_pcm_ops audio_callbacks = {
     .init_out = line_out_init,
     .fini_out = line_out_fini,
     .write    = audio_generic_write,
+    .buffer_get_free = line_out_get_free,
     .get_buffer_out = line_out_get_buffer,
     .put_buffer_out = line_out_put_buffer,
     .enable_out = line_out_enable,
-- 
2.35.3


