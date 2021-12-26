Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D07B547F824
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Dec 2021 16:43:12 +0100 (CET)
Received: from localhost ([::1]:39952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1Vfz-0002PH-W2
	for lists+qemu-devel@lfdr.de; Sun, 26 Dec 2021 10:43:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1n1VdL-0008I3-PU
 for qemu-devel@nongnu.org; Sun, 26 Dec 2021 10:40:28 -0500
Received: from mailout03.t-online.de ([194.25.134.81]:59696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1n1VdK-00085i-2P
 for qemu-devel@nongnu.org; Sun, 26 Dec 2021 10:40:27 -0500
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
 by mailout03.t-online.de (Postfix) with SMTP id 705677DDD;
 Sun, 26 Dec 2021 16:40:22 +0100 (CET)
Received: from linpower.localnet ([46.86.48.20]) by fwd78.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1n1VdE-1Aji530; Sun, 26 Dec 2021 16:40:20 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 51D9F20055F; Sun, 26 Dec 2021 16:40:17 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 2/3] dsoundaudio: fix crackling audio recordings
Date: Sun, 26 Dec 2021 16:40:16 +0100
Message-Id: <20211226154017.6067-2-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cf516f2a-fea8-2000-1b80-a5465d0e1ee6@t-online.de>
References: <cf516f2a-fea8-2000-1b80-a5465d0e1ee6@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1640533220-0000AD4E-BFC9BE55/0/0 CLEAN NORMAL
X-TOI-MSGID: f9cb908c-1bbe-45c6-836d-42f5217d713a
Received-SPF: none client-ip=194.25.134.81;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout03.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Audio recordings with the DirectSound backend don't sound right.
A look a the Microsoft online documentation tells us why.

From the DirectSound Programming Guide, Capture Buffer Information:
'You can safely copy data from the buffer only up to the read
cursor.'

Change the code to read up to the read cursor instead of the
capture cursor.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/dsoundaudio.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/audio/dsoundaudio.c b/audio/dsoundaudio.c
index cfc79c129e..3dd2c4d4a6 100644
--- a/audio/dsoundaudio.c
+++ b/audio/dsoundaudio.c
@@ -536,13 +536,12 @@ static void *dsound_get_buffer_in(HWVoiceIn *hw, size_t *size)
     DSoundVoiceIn *ds = (DSoundVoiceIn *) hw;
     LPDIRECTSOUNDCAPTUREBUFFER dscb = ds->dsound_capture_buffer;
     HRESULT hr;
-    DWORD cpos, rpos, act_size;
+    DWORD rpos, act_size;
     size_t req_size;
     int err;
     void *ret;
 
-    hr = IDirectSoundCaptureBuffer_GetCurrentPosition(
-        dscb, &cpos, ds->first_time ? &rpos : NULL);
+    hr = IDirectSoundCaptureBuffer_GetCurrentPosition(dscb, NULL, &rpos);
     if (FAILED(hr)) {
         dsound_logerr(hr, "Could not get capture buffer position\n");
         *size = 0;
@@ -554,7 +553,7 @@ static void *dsound_get_buffer_in(HWVoiceIn *hw, size_t *size)
         ds->first_time = false;
     }
 
-    req_size = audio_ring_dist(cpos, hw->pos_emul, hw->size_emul);
+    req_size = audio_ring_dist(rpos, hw->pos_emul, hw->size_emul);
     req_size = MIN(*size, MIN(req_size, hw->size_emul - hw->pos_emul));
 
     if (req_size == 0) {
-- 
2.31.1


