Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0D62F0651
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 11:14:02 +0100 (CET)
Received: from localhost ([::1]:53664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyXjW-0005OP-06
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 05:14:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1kyXZX-0002Kl-T6
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 05:03:44 -0500
Received: from mailout01.t-online.de ([194.25.134.80]:59994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1kyXZU-0005cx-ME
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 05:03:43 -0500
Received: from fwd17.aul.t-online.de (fwd17.aul.t-online.de [172.20.27.64])
 by mailout01.t-online.de (Postfix) with SMTP id 4320E421C832;
 Sun, 10 Jan 2021 11:03:38 +0100 (CET)
Received: from linpower.localnet
 (Vsh4yEZb8h4kTiBY1NJtYXK3pTOYuhMrvxDikXTw4IuDTc6MaNzJa8zQgQAqXrjw17@[93.236.152.29])
 by fwd17.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1kyXZO-2g7jsG0; Sun, 10 Jan 2021 11:03:34 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 16C052006C5; Sun, 10 Jan 2021 11:02:40 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 22/23] dsoundaudio: enable f32 audio sample format
Date: Sun, 10 Jan 2021 11:02:38 +0100
Message-Id: <20210110100239.27588-22-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
References: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: Vsh4yEZb8h4kTiBY1NJtYXK3pTOYuhMrvxDikXTw4IuDTc6MaNzJa8zQgQAqXrjw17
X-TOI-EXPURGATEID: 150726::1610273014-00006CDB-5260A379/0/0 CLEAN NORMAL
X-TOI-MSGID: 43743ed1-774f-4d87-ab0a-afcd99bbfd59
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU <qemu-devel@nongnu.org>,
 =?UTF-8?q?Zolt=C3=A1n=20K=C5=91v=C3=A1g=C3=B3?= <dirty.ice.hu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Enable the f32 audio sample format for the DirectSound backend.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio_win_int.c | 71 ++++++++++++++++++++++++++++---------------
 1 file changed, 47 insertions(+), 24 deletions(-)

diff --git a/audio/audio_win_int.c b/audio/audio_win_int.c
index b938fd667b..b7db34900c 100644
--- a/audio/audio_win_int.c
+++ b/audio/audio_win_int.c
@@ -5,6 +5,7 @@
 
 #define AUDIO_CAP "win-int"
 #include <windows.h>
+#include <mmreg.h>
 #include <mmsystem.h>
 
 #include "audio.h"
@@ -16,7 +17,6 @@ int waveformat_from_audio_settings (WAVEFORMATEX *wfx,
 {
     memset (wfx, 0, sizeof (*wfx));
 
-    wfx->wFormatTag = WAVE_FORMAT_PCM;
     wfx->nChannels = as->nchannels;
     wfx->nSamplesPerSec = as->freq;
     wfx->nAvgBytesPerSec = as->freq << (as->nchannels == 2);
@@ -26,11 +26,13 @@ int waveformat_from_audio_settings (WAVEFORMATEX *wfx,
     switch (as->fmt) {
     case AUDIO_FORMAT_S8:
     case AUDIO_FORMAT_U8:
+        wfx->wFormatTag = WAVE_FORMAT_PCM;
         wfx->wBitsPerSample = 8;
         break;
 
     case AUDIO_FORMAT_S16:
     case AUDIO_FORMAT_U16:
+        wfx->wFormatTag = WAVE_FORMAT_PCM;
         wfx->wBitsPerSample = 16;
         wfx->nAvgBytesPerSec <<= 1;
         wfx->nBlockAlign <<= 1;
@@ -38,6 +40,14 @@ int waveformat_from_audio_settings (WAVEFORMATEX *wfx,
 
     case AUDIO_FORMAT_S32:
     case AUDIO_FORMAT_U32:
+        wfx->wFormatTag = WAVE_FORMAT_PCM;
+        wfx->wBitsPerSample = 32;
+        wfx->nAvgBytesPerSec <<= 2;
+        wfx->nBlockAlign <<= 2;
+        break;
+
+    case AUDIO_FORMAT_F32:
+        wfx->wFormatTag = WAVE_FORMAT_IEEE_FLOAT;
         wfx->wBitsPerSample = 32;
         wfx->nAvgBytesPerSec <<= 2;
         wfx->nBlockAlign <<= 2;
@@ -54,12 +64,6 @@ int waveformat_from_audio_settings (WAVEFORMATEX *wfx,
 int waveformat_to_audio_settings (WAVEFORMATEX *wfx,
                                   struct audsettings *as)
 {
-    if (wfx->wFormatTag != WAVE_FORMAT_PCM) {
-        dolog ("Invalid wave format, tag is not PCM, but %d\n",
-               wfx->wFormatTag);
-        return -1;
-    }
-
     if (!wfx->nSamplesPerSec) {
         dolog ("Invalid wave format, frequency is zero\n");
         return -1;
@@ -83,23 +87,42 @@ int waveformat_to_audio_settings (WAVEFORMATEX *wfx,
         return -1;
     }
 
-    switch (wfx->wBitsPerSample) {
-    case 8:
-        as->fmt = AUDIO_FORMAT_U8;
-        break;
-
-    case 16:
-        as->fmt = AUDIO_FORMAT_S16;
-        break;
-
-    case 32:
-        as->fmt = AUDIO_FORMAT_S32;
-        break;
-
-    default:
-        dolog ("Invalid wave format, bits per sample is not "
-               "8, 16 or 32, but %d\n",
-               wfx->wBitsPerSample);
+    if (wfx->wFormatTag == WAVE_FORMAT_PCM) {
+        switch (wfx->wBitsPerSample) {
+        case 8:
+            as->fmt = AUDIO_FORMAT_U8;
+            break;
+
+        case 16:
+            as->fmt = AUDIO_FORMAT_S16;
+            break;
+
+        case 32:
+            as->fmt = AUDIO_FORMAT_S32;
+            break;
+
+        default:
+            dolog("Invalid PCM wave format, bits per sample is not "
+                  "8, 16 or 32, but %d\n",
+                  wfx->wBitsPerSample);
+            return -1;
+        }
+    } else if (wfx->wFormatTag == WAVE_FORMAT_IEEE_FLOAT) {
+        switch (wfx->wBitsPerSample) {
+        case 32:
+            as->fmt = AUDIO_FORMAT_F32;
+            break;
+
+        default:
+            dolog("Invalid IEEE_FLOAT wave format, bits per sample is not "
+                  "32, but %d\n",
+                  wfx->wBitsPerSample);
+            return -1;
+        }
+    } else {
+        dolog("Invalid wave format, tag is not PCM and not IEEE_FLOAT, "
+              "but %d\n",
+              wfx->wFormatTag);
         return -1;
     }
 
-- 
2.26.2


