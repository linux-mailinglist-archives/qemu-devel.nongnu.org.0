Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D932368C62A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 19:53:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP6bn-0004y4-BE; Mon, 06 Feb 2023 13:52:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pP6bk-0004wX-4h
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 13:52:52 -0500
Received: from mailout08.t-online.de ([194.25.134.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pP6bi-0005Tf-EP
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 13:52:51 -0500
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
 by mailout08.t-online.de (Postfix) with SMTP id E53A98080;
 Mon,  6 Feb 2023 19:52:42 +0100 (CET)
Received: from linpower.localnet ([79.208.25.151]) by fwd80.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pP6ba-2AXabZ0; Mon, 6 Feb 2023 19:52:42 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 76B7920062A; Mon,  6 Feb 2023 19:52:37 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v2 03/17] audio: make the resampling code greedy
Date: Mon,  6 Feb 2023 19:52:23 +0100
Message-Id: <20230206185237.8358-3-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <df6510fe-1dfd-1585-8590-db230c71d367@t-online.de>
References: <df6510fe-1dfd-1585-8590-db230c71d367@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1675709562-B8817A74-FEE2E169/0/0 CLEAN NORMAL
X-TOI-MSGID: f9a5fea7-8344-49ca-9af9-97cdd5a43e4b
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

Read the maximum possible number of audio frames instead of the
minimum necessary number of frames when the audio stream is
downsampled and the output buffer is limited. This makes the
function symmetrical to upsampling when the input buffer is
limited. The maximum possible number of frames is written here.

With this change it's easier to calculate the exact number of
audio frames the resample function will read or write. These two
functions will be introduced later.

Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/rate_template.h | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/audio/rate_template.h b/audio/rate_template.h
index b432719ebb..6648f0d2e5 100644
--- a/audio/rate_template.h
+++ b/audio/rate_template.h
@@ -40,8 +40,6 @@ void NAME (void *opaque, struct st_sample *ibuf, struct st_sample *obuf,
     int64_t t;
 #endif
 
-    ilast = rate->ilast;
-
     istart = ibuf;
     iend = ibuf + *isamp;
 
@@ -59,15 +57,17 @@ void NAME (void *opaque, struct st_sample *ibuf, struct st_sample *obuf,
         return;
     }
 
-    while (obuf < oend) {
+    /* without input samples, there's nothing to do */
+    if (ibuf >= iend) {
+        *osamp = 0;
+        return;
+    }
 
-        /* Safety catch to make sure we have input samples.  */
-        if (ibuf >= iend) {
-            break;
-        }
+    ilast = rate->ilast;
 
-        /* read as many input samples so that ipos > opos */
+    while (true) {
 
+        /* read as many input samples so that ipos > opos */
         while (rate->ipos <= (rate->opos >> 32)) {
             ilast = *ibuf++;
             rate->ipos++;
@@ -78,6 +78,11 @@ void NAME (void *opaque, struct st_sample *ibuf, struct st_sample *obuf,
             }
         }
 
+        /* make sure that the next output sample can be written */
+        if (obuf >= oend) {
+            break;
+        }
+
         icur = *ibuf;
 
         /* wrap ipos and opos around long before they overflow */
-- 
2.35.3


