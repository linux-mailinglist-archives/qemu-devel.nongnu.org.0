Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 649472F0655
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 11:15:46 +0100 (CET)
Received: from localhost ([::1]:33682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyXlB-0000V5-Ep
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 05:15:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1kyXZB-00024G-CE
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 05:03:21 -0500
Received: from mailout03.t-online.de ([194.25.134.81]:57118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1kyXZ9-0005WY-OF
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 05:03:21 -0500
Received: from fwd22.aul.t-online.de (fwd22.aul.t-online.de [172.20.26.127])
 by mailout03.t-online.de (Postfix) with SMTP id 30E80421777C;
 Sun, 10 Jan 2021 11:03:18 +0100 (CET)
Received: from linpower.localnet
 (XL5dysZO8h4j4kC8N7jjUA4vY8nh-OhR0m8PqtbX3GAyGdD1uSOZNbDKIE1AXnBZN8@[93.236.152.29])
 by fwd22.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1kyXZ6-3W2PKq0; Sun, 10 Jan 2021 11:03:16 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 0790A20063D; Sun, 10 Jan 2021 11:02:40 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 15/23] paaudio: wait until the playback stream is ready
Date: Sun, 10 Jan 2021 11:02:31 +0100
Message-Id: <20210110100239.27588-15-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
References: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: XL5dysZO8h4j4kC8N7jjUA4vY8nh-OhR0m8PqtbX3GAyGdD1uSOZNbDKIE1AXnBZN8
X-TOI-EXPURGATEID: 150726::1610272996-00011FFC-69646FD1/0/0 CLEAN NORMAL
X-TOI-MSGID: 33a8d171-e8c7-4d91-b872-c5b7244c5dfd
Received-SPF: none client-ip=194.25.134.81;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout03.t-online.de
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
Cc: QEMU <qemu-devel@nongnu.org>,
 =?UTF-8?q?Zolt=C3=A1n=20K=C5=91v=C3=A1g=C3=B3?= <dirty.ice.hu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Don't call pa_stream_writable_size() in qpa_get_buffer_out()
before the playback stream is ready. This prevents a lot of the
following pulseaudio error messages.

pulseaudio: pa_stream_writable_size failed
pulseaudio: Reason: Bad state

To reproduce start qemu with
-parallel none -device gus,audiodev=audio0 -audiodev pa,id=audio0

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/paaudio.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/audio/paaudio.c b/audio/paaudio.c
index 1a7252b16d..4a1ffda753 100644
--- a/audio/paaudio.c
+++ b/audio/paaudio.c
@@ -214,6 +214,12 @@ static void *qpa_get_buffer_out(HWVoiceOut *hw, size_t *size)
 
     CHECK_DEAD_GOTO(c, p->stream, unlock_and_fail,
                     "pa_threaded_mainloop_lock failed\n");
+    if (pa_stream_get_state(p->stream) != PA_STREAM_READY) {
+        /* wait for stream to become ready */
+        l = 0;
+        ret = NULL;
+        goto unlock;
+    }
 
     l = pa_stream_writable_size(p->stream);
     CHECK_SUCCESS_GOTO(c, l != (size_t) -1, unlock_and_fail,
@@ -224,6 +230,7 @@ static void *qpa_get_buffer_out(HWVoiceOut *hw, size_t *size)
     CHECK_SUCCESS_GOTO(c, r >= 0, unlock_and_fail,
                        "pa_stream_begin_write failed\n");
 
+unlock:
     pa_threaded_mainloop_unlock(c->mainloop);
     if (*size > l) {
         *size = l;
-- 
2.26.2


