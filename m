Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB16650425
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 18:18:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6xGs-0007xp-Hv; Sun, 18 Dec 2022 12:16:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1p6xGp-0007rI-Kl
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 12:16:16 -0500
Received: from mailout11.t-online.de ([194.25.134.85])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1p6xGn-0002Yu-QR
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 12:16:15 -0500
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
 by mailout11.t-online.de (Postfix) with SMTP id 80E12FBEE;
 Sun, 18 Dec 2022 18:16:04 +0100 (CET)
Received: from linpower.localnet ([79.208.21.92]) by fwd72.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1p6xGd-0pE2sb0; Sun, 18 Dec 2022 18:16:03 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 2C14A2006DC; Sun, 18 Dec 2022 18:15:39 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
 qemu-devel@nongnu.org
Subject: [PATCH 11/11] alsaaudio: reintroduce default recording settings
Date: Sun, 18 Dec 2022 18:15:39 +0100
Message-Id: <20221218171539.11193-11-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <3b1404eb-a7c5-f64c-3e47-1397c54c45bb@t-online.de>
References: <3b1404eb-a7c5-f64c-3e47-1397c54c45bb@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1671383763-69DEC991-85389DF5/0/0 CLEAN NORMAL
X-TOI-MSGID: 39131f35-84df-48bc-a5ba-787a96676045
Received-SPF: none client-ip=194.25.134.85;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout11.t-online.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Audio recording with ALSA default settings currently doesn't
work. The debug log shows updates every 0.75s and 1.5s.

audio: Elapsed since last alsa run (running): 0.743030
audio: Elapsed since last alsa run (running): 1.486048
audio: Elapsed since last alsa run (running): 0.743008
audio: Elapsed since last alsa run (running): 1.485878
audio: Elapsed since last alsa run (running): 1.486040
audio: Elapsed since last alsa run (running): 1.485886

The time between updates should be in the 10ms range. Audio
recording with ALSA has the same timing contraints as playback.
Reintroduce the default recording settings and use the same
default settings for recording as for playback.

The term "reintroduce" is correct because commit a93f328177
("alsaaudio: port to -audiodev config") removed the default
settings for recording.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/alsaaudio.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/audio/alsaaudio.c b/audio/alsaaudio.c
index 0cc982e61f..057571dd1e 100644
--- a/audio/alsaaudio.c
+++ b/audio/alsaaudio.c
@@ -923,15 +923,13 @@ static void *alsa_audio_init(Audiodev *dev)
         dev->u.alsa.out->buffer_length = 92880;
     }
 
-    /*
-     * OptsVisitor sets unspecified optional fields to zero, but do not depend
-     * on it...
-     */
     if (!dev->u.alsa.in->has_period_length) {
-        dev->u.alsa.in->period_length = 0;
+        /* 256 frames assuming 44100Hz */
+        dev->u.alsa.in->period_length = 5805;
     }
     if (!dev->u.alsa.in->has_buffer_length) {
-        dev->u.alsa.in->buffer_length = 0;
+        /* 4096 frames assuming 44100Hz */
+        dev->u.alsa.in->buffer_length = 92880;
     }
 
     return dev;
-- 
2.35.3


