Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF532F7D07
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 14:47:08 +0100 (CET)
Received: from localhost ([::1]:48856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0PRT-00080S-9O
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 08:47:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3K-0006yo-C7
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3A-0003JJ-4E
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610716918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HYOcwhM19OS83x0r3EaTN7pPiiX5hv/Nyz4UpIeAs5o=;
 b=HA1GzWaflkNIpVKsCtViB/oLqe3o9dJdrzptvGpuR/rn6ZZS2CHGAXUstJAaCspPbiZzu2
 XwVJ+Dw6BzAkgWyl8dUWsUIY0F1nK6awxBo/s2MudRbI1GTgd3L45qiMB+luuhhEbq/P/N
 eB5A3N3sj37RraA2AvuoxQ4pdfXdUjY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-pfN2gyj4NounUwctn-2ODA-1; Fri, 15 Jan 2021 08:21:56 -0500
X-MC-Unique: pfN2gyj4NounUwctn-2ODA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 791B7CE647;
 Fri, 15 Jan 2021 13:21:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 987635D9E8;
 Fri, 15 Jan 2021 13:21:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 23A3E1800D51; Fri, 15 Jan 2021 14:21:47 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/30] dsoundaudio: enable f32 audio sample format
Date: Fri, 15 Jan 2021 14:21:38 +0100
Message-Id: <20210115132146.1443592-23-kraxel@redhat.com>
In-Reply-To: <20210115132146.1443592-1-kraxel@redhat.com>
References: <20210115132146.1443592-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

Enable the f32 audio sample format for the DirectSound backend.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-id: 9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de
Message-Id: <20210110100239.27588-22-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/audio_win_int.c | 65 +++++++++++++++++++++++++++++--------------
 1 file changed, 44 insertions(+), 21 deletions(-)

diff --git a/audio/audio_win_int.c b/audio/audio_win_int.c
index b938fd667bae..b7db34900c7c 100644
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
+    if (wfx->wFormatTag == WAVE_FORMAT_PCM) {
+        switch (wfx->wBitsPerSample) {
+        case 8:
+            as->fmt = AUDIO_FORMAT_U8;
+            break;
 
-    case 16:
-        as->fmt = AUDIO_FORMAT_S16;
-        break;
+        case 16:
+            as->fmt = AUDIO_FORMAT_S16;
+            break;
 
-    case 32:
-        as->fmt = AUDIO_FORMAT_S32;
-        break;
+        case 32:
+            as->fmt = AUDIO_FORMAT_S32;
+            break;
 
-    default:
-        dolog ("Invalid wave format, bits per sample is not "
-               "8, 16 or 32, but %d\n",
-               wfx->wBitsPerSample);
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
2.29.2


