Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF0368C642
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 19:57:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP6bx-00050v-43; Mon, 06 Feb 2023 13:53:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pP6bu-00050f-IH
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 13:53:02 -0500
Received: from mailout03.t-online.de ([194.25.134.81])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pP6bs-0005VE-NS
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 13:53:02 -0500
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
 by mailout03.t-online.de (Postfix) with SMTP id 7B78218B86;
 Mon,  6 Feb 2023 19:52:57 +0100 (CET)
Received: from linpower.localnet ([79.208.25.151]) by fwd71.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pP6bo-0DMnPF0; Mon, 6 Feb 2023 19:52:57 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 86DE820063D; Mon,  6 Feb 2023 19:52:37 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v2 09/17] audio/mixeng: calculate number of input frames
Date: Mon,  6 Feb 2023 19:52:29 +0100
Message-Id: <20230206185237.8358-9-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <df6510fe-1dfd-1585-8590-db230c71d367@t-online.de>
References: <df6510fe-1dfd-1585-8590-db230c71d367@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1675709577-437ECC4D-ECB023D0/0/0 CLEAN NORMAL
X-TOI-MSGID: 2dd0f31e-9e34-4b4c-96fd-3037ff24e60d
Received-SPF: none client-ip=194.25.134.81;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout03.t-online.de
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

Calculate the exact number of audio input frames needed to get
a given number of audio output frames. The exact number of
frames depends only on the difference of opos - ipos and the
number of output frames. When downsampling, this function
returns the maximum number of input frames needed.

This function will later replace the audio_frontend_frames_out()
function, which calculates the average number of input frames
rounded down to the nearest integer.

Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/mixeng.c | 36 ++++++++++++++++++++++++++++++++++++
 audio/mixeng.h |  1 +
 2 files changed, 37 insertions(+)

diff --git a/audio/mixeng.c b/audio/mixeng.c
index fe454e0725..6bb3d54f77 100644
--- a/audio/mixeng.c
+++ b/audio/mixeng.c
@@ -440,6 +440,42 @@ void st_rate_stop (void *opaque)
     g_free (opaque);
 }
 
+/**
+ * st_rate_frames_in() - returns the number of frames needed to
+ * get frames_out frames after resampling
+ *
+ * @opaque: pointer to struct rate
+ * @frames_out: number of frames
+ */
+uint32_t st_rate_frames_in(void *opaque, uint32_t frames_out)
+{
+    struct rate *rate = opaque;
+    uint64_t opos_start, opos_end;
+    uint32_t ipos_start, ipos_end;
+
+    if (rate->opos_inc == 1ULL << 32) {
+        return frames_out;
+    }
+
+    if (frames_out) {
+        opos_start = rate->opos;
+        ipos_start = rate->ipos;
+    } else {
+        uint64_t offset;
+
+        /* add offset = ceil(opos_inc) to opos and ipos to avoid an underflow */
+        offset = (rate->opos_inc + (1ULL << 32) - 1) & ~((1ULL << 32) - 1);
+        opos_start = rate->opos + offset;
+        ipos_start = rate->ipos + (offset >> 32);
+    }
+    /* last frame written was at opos_start - rate->opos_inc */
+    opos_end = opos_start - rate->opos_inc + rate->opos_inc * frames_out;
+    ipos_end = (opos_end >> 32) + 1;
+
+    /* last frame read was at ipos_start - 1 */
+    return ipos_end + 1 > ipos_start ? ipos_end + 1 - ipos_start : 0;
+}
+
 void mixeng_clear (struct st_sample *buf, int len)
 {
     memset (buf, 0, len * sizeof (struct st_sample));
diff --git a/audio/mixeng.h b/audio/mixeng.h
index 2dcd6df245..64c1e231cc 100644
--- a/audio/mixeng.h
+++ b/audio/mixeng.h
@@ -52,6 +52,7 @@ void st_rate_flow(void *opaque, st_sample *ibuf, st_sample *obuf,
 void st_rate_flow_mix(void *opaque, st_sample *ibuf, st_sample *obuf,
                       size_t *isamp, size_t *osamp);
 void st_rate_stop (void *opaque);
+uint32_t st_rate_frames_in(void *opaque, uint32_t frames_out);
 void mixeng_clear (struct st_sample *buf, int len);
 void mixeng_volume (struct st_sample *buf, int len, struct mixeng_volume *vol);
 
-- 
2.35.3


