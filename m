Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 178B5650424
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 18:17:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6xGt-0007yQ-1R; Sun, 18 Dec 2022 12:16:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1p6xGo-0007r1-GJ
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 12:16:14 -0500
Received: from mailout11.t-online.de ([194.25.134.85])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1p6xGn-0002Yb-3w
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 12:16:14 -0500
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
 by mailout11.t-online.de (Postfix) with SMTP id A07A260F2;
 Sun, 18 Dec 2022 18:15:55 +0100 (CET)
Received: from linpower.localnet ([79.208.21.92]) by fwd83.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1p6xGR-3nC2Vd0; Sun, 18 Dec 2022 18:15:51 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 1E76F200638; Sun, 18 Dec 2022 18:15:39 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
 qemu-devel@nongnu.org
Subject: [PATCH 06/11] audio/alsaaudio: use g_new0() instead of audio_calloc()
Date: Sun, 18 Dec 2022 18:15:34 +0100
Message-Id: <20221218171539.11193-6-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <3b1404eb-a7c5-f64c-3e47-1397c54c45bb@t-online.de>
References: <3b1404eb-a7c5-f64c-3e47-1397c54c45bb@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1671383751-6120D2DC-1C3D1ACA/0/0 CLEAN NORMAL
X-TOI-MSGID: 812b2cd9-ecb1-41b5-b13a-f5445178e41d
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

Replace audio_calloc() with the equivalent g_new0().

The value of the g_new0() argument count is >= 1, which means
g_new0() will never return NULL. Also remove the unnecessary
NULL check.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/alsaaudio.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/audio/alsaaudio.c b/audio/alsaaudio.c
index 714bfb6453..5f50dfa0bf 100644
--- a/audio/alsaaudio.c
+++ b/audio/alsaaudio.c
@@ -222,11 +222,7 @@ static int alsa_poll_helper (snd_pcm_t *handle, struct pollhlp *hlp, int mask)
         return -1;
     }
 
-    pfds = audio_calloc ("alsa_poll_helper", count, sizeof (*pfds));
-    if (!pfds) {
-        dolog ("Could not initialize poll mode\n");
-        return -1;
-    }
+    pfds = g_new0(struct pollfd, count);
 
     err = snd_pcm_poll_descriptors (handle, pfds, count);
     if (err < 0) {
-- 
2.35.3


