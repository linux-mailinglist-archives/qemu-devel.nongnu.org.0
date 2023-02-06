Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF21268C62D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 19:53:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP6cB-0005Rk-GO; Mon, 06 Feb 2023 13:53:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pP6c1-000523-SV
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 13:53:09 -0500
Received: from mailout08.t-online.de ([194.25.134.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pP6c0-0005W4-8Y
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 13:53:09 -0500
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
 by mailout08.t-online.de (Postfix) with SMTP id AF1B029E7A;
 Mon,  6 Feb 2023 19:53:06 +0100 (CET)
Received: from linpower.localnet ([79.208.25.151]) by fwd80.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pP6by-3A7zjV0; Mon, 6 Feb 2023 19:53:06 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 91EF22006C6; Mon,  6 Feb 2023 19:52:37 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v2 13/17] audio/mixeng: calculate number of output frames
Date: Mon,  6 Feb 2023 19:52:33 +0100
Message-Id: <20230206185237.8358-13-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <df6510fe-1dfd-1585-8590-db230c71d367@t-online.de>
References: <df6510fe-1dfd-1585-8590-db230c71d367@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1675709586-B8817A74-8C6EAFD2/0/0 CLEAN NORMAL
X-TOI-MSGID: 8aac8eb5-823d-43cf-b481-3ad1367ebe27
Received-SPF: none client-ip=194.25.134.20;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout08.t-online.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Calculate the exact number of audio output frames the resampling
code can generate from a given number of audio input frames.
When upsampling, this function returns the maximum number of
output frames.

This function will later replace the audio_frontend_frames_in()
function, which calculates the average number of output frames
rounded down to the nearest integer.

Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/mixeng.c | 37 +++++++++++++++++++++++++++++++++++++
 audio/mixeng.h |  1 +
 2 files changed, 38 insertions(+)

diff --git a/audio/mixeng.c b/audio/mixeng.c
index 6bb3d54f77..92a3a1ac58 100644
--- a/audio/mixeng.c
+++ b/audio/mixeng.c
@@ -440,6 +440,43 @@ void st_rate_stop (void *opaque)
     g_free (opaque);
 }
 
+/**
+ * st_rate_frames_out() - returns the number of frames the resampling code
+ * generates from frames_in frames
+ *
+ * @opaque: pointer to struct rate
+ * @frames_in: number of frames
+ */
+uint32_t st_rate_frames_out(void *opaque, uint32_t frames_in)
+{
+    struct rate *rate = opaque;
+    uint64_t opos_end, opos_delta;
+    uint32_t ipos_end;
+    uint32_t frames_out;
+
+    if (rate->opos_inc == 1ULL << 32) {
+        return frames_in;
+    }
+
+    /* no output frame without at least one input frame */
+    if (!frames_in) {
+        return 0;
+    }
+
+    /* last frame read was at rate->ipos - 1 */
+    ipos_end = rate->ipos - 1 + frames_in;
+    opos_end = (uint64_t)ipos_end << 32;
+
+    /* last frame written was at rate->opos - rate->opos_inc */
+    if (opos_end + rate->opos_inc <= rate->opos) {
+        return 0;
+    }
+    opos_delta = opos_end - rate->opos + rate->opos_inc;
+    frames_out = opos_delta / rate->opos_inc;
+
+    return opos_delta % rate->opos_inc ? frames_out : frames_out - 1;
+}
+
 /**
  * st_rate_frames_in() - returns the number of frames needed to
  * get frames_out frames after resampling
diff --git a/audio/mixeng.h b/audio/mixeng.h
index 64c1e231cc..f9de7cffeb 100644
--- a/audio/mixeng.h
+++ b/audio/mixeng.h
@@ -52,6 +52,7 @@ void st_rate_flow(void *opaque, st_sample *ibuf, st_sample *obuf,
 void st_rate_flow_mix(void *opaque, st_sample *ibuf, st_sample *obuf,
                       size_t *isamp, size_t *osamp);
 void st_rate_stop (void *opaque);
+uint32_t st_rate_frames_out(void *opaque, uint32_t frames_in);
 uint32_t st_rate_frames_in(void *opaque, uint32_t frames_out);
 void mixeng_clear (struct st_sample *buf, int len);
 void mixeng_volume (struct st_sample *buf, int len, struct mixeng_volume *vol);
-- 
2.35.3


