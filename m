Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8442F064D
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 11:12:19 +0100 (CET)
Received: from localhost ([::1]:45462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyXhq-0001yU-Ph
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 05:12:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1kyXZ8-0001vl-Ae
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 05:03:18 -0500
Received: from mailout06.t-online.de ([194.25.134.19]:33672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1kyXZ6-0005Tc-FF
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 05:03:18 -0500
Received: from fwd13.aul.t-online.de (fwd13.aul.t-online.de [172.20.27.62])
 by mailout06.t-online.de (Postfix) with SMTP id BC68C412F754;
 Sun, 10 Jan 2021 11:03:14 +0100 (CET)
Received: from linpower.localnet
 (XH0AMYZXZh9vvbeXRE21rdT9I1p3G1zek3i+uQyxNutC1e9G9US0k5mMmFQupbpQq1@[93.236.152.29])
 by fwd13.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1kyXZ4-0INnii0; Sun, 10 Jan 2021 11:03:14 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 0581920063C; Sun, 10 Jan 2021 11:02:40 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 14/23] paaudio: wait for PA_STREAM_READY in qpa_write()
Date: Sun, 10 Jan 2021 11:02:30 +0100
Message-Id: <20210110100239.27588-14-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
References: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: XH0AMYZXZh9vvbeXRE21rdT9I1p3G1zek3i+uQyxNutC1e9G9US0k5mMmFQupbpQq1
X-TOI-EXPURGATEID: 150726::1610272994-00003E0D-ECD9F048/0/0 CLEAN NORMAL
X-TOI-MSGID: b2affc18-a0bf-4b2a-8f9c-e0b6404357a8
Received-SPF: none client-ip=194.25.134.19;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout06.t-online.de
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

Don't call pa_stream_writable_size() in qpa_write() before the
playback stream is ready. This prevents a lot of the following
pulseaudio error messages.

pulseaudio: pa_stream_writable_size failed
pulseaudio: Reason: Bad state

To reproduce start qemu with
-parallel none -device gus,audiodev=audio0
-audiodev pa,id=audio0,out.mixing-engine=off

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/paaudio.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/audio/paaudio.c b/audio/paaudio.c
index 229bcfcae8..1a7252b16d 100644
--- a/audio/paaudio.c
+++ b/audio/paaudio.c
@@ -269,6 +269,11 @@ static size_t qpa_write(HWVoiceOut *hw, void *data, size_t length)
 
     CHECK_DEAD_GOTO(c, p->stream, unlock_and_fail,
                     "pa_threaded_mainloop_lock failed\n");
+    if (pa_stream_get_state(p->stream) != PA_STREAM_READY) {
+        /* wait for stream to become ready */
+        l = 0;
+        goto unlock;
+    }
 
     l = pa_stream_writable_size(p->stream);
 
@@ -282,6 +287,7 @@ static size_t qpa_write(HWVoiceOut *hw, void *data, size_t length)
     r = pa_stream_write(p->stream, data, l, NULL, 0LL, PA_SEEK_RELATIVE);
     CHECK_SUCCESS_GOTO(c, r >= 0, unlock_and_fail, "pa_stream_write failed\n");
 
+unlock:
     pa_threaded_mainloop_unlock(c->mainloop);
     return l;
 
-- 
2.26.2


