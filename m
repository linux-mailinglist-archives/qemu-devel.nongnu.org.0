Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A552383DE3
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 21:55:01 +0200 (CEST)
Received: from localhost ([::1]:48560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lijKO-0001WY-Jt
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 15:55:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1lijBr-0005Uv-1Z
 for qemu-devel@nongnu.org; Mon, 17 May 2021 15:46:11 -0400
Received: from mailout02.t-online.de ([194.25.134.17]:47152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1lijBp-0000LO-As
 for qemu-devel@nongnu.org; Mon, 17 May 2021 15:46:10 -0400
Received: from fwd09.aul.t-online.de (fwd09.aul.t-online.de [172.20.27.151])
 by mailout02.t-online.de (Postfix) with SMTP id F20BBF164;
 Mon, 17 May 2021 21:46:04 +0200 (CEST)
Received: from linpower.localnet
 (bpmarGZXohy3MCWnQZRS-xfvn6rsNBbFXGDDjCkg8w7aMmqaqfJNI1CCK1l-3sRQjX@[79.208.18.63])
 by fwd09.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1lijBk-1mA0lE0; Mon, 17 May 2021 21:46:04 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id 5A57E2000A0; Mon, 17 May 2021 21:46:04 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 1/4] alsaaudio: remove #ifdef DEBUG to avoid bit rot
Date: Mon, 17 May 2021 21:46:01 +0200
Message-Id: <20210517194604.2545-1-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <b461d71c-a062-b85d-378d-53c0b5857b52@t-online.de>
References: <b461d71c-a062-b85d-378d-53c0b5857b52@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: bpmarGZXohy3MCWnQZRS-xfvn6rsNBbFXGDDjCkg8w7aMmqaqfJNI1CCK1l-3sRQjX
X-TOI-EXPURGATEID: 150726::1621280764-00002D5B-B3131B7A/0/0 CLEAN NORMAL
X-TOI-MSGID: 36fe0ee8-93e8-4fcd-ae6c-7e298ed45b94
Received-SPF: none client-ip=194.25.134.17;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout02.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Merge the #ifdef DEBUG code with the if statement a few lines
above to avoid bit rot.

Suggested-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/alsaaudio.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/audio/alsaaudio.c b/audio/alsaaudio.c
index fcc2f62864..2b9789e647 100644
--- a/audio/alsaaudio.c
+++ b/audio/alsaaudio.c
@@ -34,6 +34,8 @@
 #define AUDIO_CAP "alsa"
 #include "audio_int.h"
 
+#define DEBUG_ALSA 0
+
 struct pollhlp {
     snd_pcm_t *handle;
     struct pollfd *pfds;
@@ -587,16 +589,12 @@ static int alsa_open(bool in, struct alsa_params_req *req,
 
     *handlep = handle;
 
-    if (obtfmt != req->fmt ||
-         obt->nchannels != req->nchannels ||
-         obt->freq != req->freq) {
+    if (DEBUG_ALSA || obtfmt != req->fmt ||
+        obt->nchannels != req->nchannels || obt->freq != req->freq) {
         dolog ("Audio parameters for %s\n", typ);
         alsa_dump_info(req, obt, obtfmt, apdo);
     }
 
-#ifdef DEBUG
-    alsa_dump_info(req, obt, obtfmt, apdo);
-#endif
     return 0;
 
  err:
-- 
2.26.2


