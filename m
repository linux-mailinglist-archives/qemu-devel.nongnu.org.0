Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFEA650426
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 18:19:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6xH2-0008Dc-5U; Sun, 18 Dec 2022 12:16:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1p6xGy-000883-7D
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 12:16:24 -0500
Received: from mailout04.t-online.de ([194.25.134.18])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1p6xGw-0002Zx-3O
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 12:16:23 -0500
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
 by mailout04.t-online.de (Postfix) with SMTP id CE25E131A0;
 Sun, 18 Dec 2022 18:16:01 +0100 (CET)
Received: from linpower.localnet ([79.208.21.92]) by fwd77.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1p6xGa-0G2Kqf0; Sun, 18 Dec 2022 18:16:00 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 292E92006DB; Sun, 18 Dec 2022 18:15:39 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
 qemu-devel@nongnu.org
Subject: [PATCH 10/11] alsaaudio: change default playback settings
Date: Sun, 18 Dec 2022 18:15:38 +0100
Message-Id: <20221218171539.11193-10-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <3b1404eb-a7c5-f64c-3e47-1397c54c45bb@t-online.de>
References: <3b1404eb-a7c5-f64c-3e47-1397c54c45bb@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1671383760-88EA281F-43087515/0/0 CLEAN NORMAL
X-TOI-MSGID: 7a3a9bcc-2621-4f0b-a0de-cc81c2da8e1d
Received-SPF: none client-ip=194.25.134.18;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout04.t-online.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

The currently used default playback settings in the ALSA audio
backend are a bit unfortunate. With a few emulated audio devices,
audio playback does not work properly. Here is a short part of
the debug log while audio is playing (elapsed time in seconds).

audio: Elapsed since last alsa run (running): 0.046244
audio: Elapsed since last alsa run (running): 0.023137
audio: Elapsed since last alsa run (running): 0.023170
audio: Elapsed since last alsa run (running): 0.023650
audio: Elapsed since last alsa run (running): 0.060802
audio: Elapsed since last alsa run (running): 0.031931

For some audio devices the time of more than 23ms between updates
is too long.

Set the period time to 5.8ms so that the maximum time between
two updates typically does not exceed 11ms. This roughly matches
the 10ms period time when doing playback with the audio timer.
After this patch the debug log looks like this.

audio: Elapsed since last alsa run (running): 0.011919
audio: Elapsed since last alsa run (running): 0.005788
audio: Elapsed since last alsa run (running): 0.005995
audio: Elapsed since last alsa run (running): 0.011069
audio: Elapsed since last alsa run (running): 0.005901
audio: Elapsed since last alsa run (running): 0.006084

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/alsaaudio.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/audio/alsaaudio.c b/audio/alsaaudio.c
index 5f50dfa0bf..0cc982e61f 100644
--- a/audio/alsaaudio.c
+++ b/audio/alsaaudio.c
@@ -913,17 +913,14 @@ static void *alsa_audio_init(Audiodev *dev)
     alsa_init_per_direction(aopts->in);
     alsa_init_per_direction(aopts->out);
 
-    /*
-     * need to define them, as otherwise alsa produces no sound
-     * doesn't set has_* so alsa_open can identify it wasn't set by the user
-     */
+    /* don't set has_* so alsa_open can identify it wasn't set by the user */
     if (!dev->u.alsa.out->has_period_length) {
-        /* 1024 frames assuming 44100Hz */
-        dev->u.alsa.out->period_length = 1024 * 1000000 / 44100;
+        /* 256 frames assuming 44100Hz */
+        dev->u.alsa.out->period_length = 5805;
     }
     if (!dev->u.alsa.out->has_buffer_length) {
         /* 4096 frames assuming 44100Hz */
-        dev->u.alsa.out->buffer_length = 4096ll * 1000000 / 44100;
+        dev->u.alsa.out->buffer_length = 92880;
     }
 
     /*
-- 
2.35.3


