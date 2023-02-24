Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 727A46A220A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 20:06:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVdOS-0001tg-8b; Fri, 24 Feb 2023 14:06:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pVdOQ-0001sJ-Q4
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 14:06:06 -0500
Received: from mailout05.t-online.de ([194.25.134.82])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pVdOP-0003mf-5v
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 14:06:06 -0500
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
 by mailout05.t-online.de (Postfix) with SMTP id 8DAD65C8C;
 Fri, 24 Feb 2023 20:06:03 +0100 (CET)
Received: from linpower.localnet ([84.175.228.75]) by fwd79.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pVdOK-2mPfE10; Fri, 24 Feb 2023 20:06:00 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 9111A335521; Fri, 24 Feb 2023 20:05:55 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Subject: [PATCH v3 03/15] audio: make the resampling code greedy
Date: Fri, 24 Feb 2023 20:05:43 +0100
Message-Id: <20230224190555.7409-3-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <fa61e27f-6c37-af55-44bc-119592240720@t-online.de>
References: <fa61e27f-6c37-af55-44bc-119592240720@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1677265560-D5BB19DF-638E9B95/0/0 CLEAN NORMAL
X-TOI-MSGID: 2898f854-dfa2-4616-b22c-c5893ba3f450
Received-SPF: none client-ip=194.25.134.82;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout05.t-online.de
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
Acked-by: Marc-André Lureau <marcandre.lureau@redhat.com>
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


