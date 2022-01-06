Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E36B648668A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 16:11:02 +0100 (CET)
Received: from localhost ([::1]:54166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5UPu-000361-0F
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 10:11:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1n5P0B-0005p0-IC
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 04:24:07 -0500
Received: from mailout08.t-online.de ([194.25.134.20]:54212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1n5P0A-0006Tp-3z
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 04:24:07 -0500
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
 by mailout08.t-online.de (Postfix) with SMTP id 5BD5319885;
 Thu,  6 Jan 2022 10:24:04 +0100 (CET)
Received: from linpower.localnet ([46.86.48.20]) by fwd84.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1n5P08-4QSBRB0; Thu, 6 Jan 2022 10:24:04 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id E97F720062F; Thu,  6 Jan 2022 10:23:32 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <volker.ruemelin@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 13/15] ossaudio: reduce effective playback buffer size
Date: Thu,  6 Jan 2022 10:23:30 +0100
Message-Id: <20220106092332.7223-13-volker.ruemelin@t-online.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cfcae86f-59c3-a2c5-76cd-1ab5e23e20f3@t-online.de>
References: <cfcae86f-59c3-a2c5-76cd-1ab5e23e20f3@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1641461044-00009E39-833AC0D4/0/0 CLEAN NORMAL
X-TOI-MSGID: 95f836ff-458f-440d-a398-812bc48bdbac
Received-SPF: none client-ip=194.25.134.20;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout08.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 06 Jan 2022 10:04:59 -0500
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

From: Volker Rümelin <vr_qemu@t-online.de>

Add the buffer_get_free pcm_ops function for the mmapped case
to reduce the effective playback buffer size. All intermediate
audio playback buffers become temporary buffers.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/ossaudio.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/audio/ossaudio.c b/audio/ossaudio.c
index 1bd6800840..da9c232222 100644
--- a/audio/ossaudio.c
+++ b/audio/ossaudio.c
@@ -394,7 +394,7 @@ static size_t oss_buffer_get_free(HWVoiceOut *hw)
     OSSVoiceOut *oss = (OSSVoiceOut *)hw;
 
     if (oss->mmapped) {
-        return INT_MAX;
+        return oss_get_available_bytes(oss);
     } else {
         return audio_generic_buffer_get_free(hw);
     }
@@ -402,9 +402,10 @@ static size_t oss_buffer_get_free(HWVoiceOut *hw)
 
 static void *oss_get_buffer_out(HWVoiceOut *hw, size_t *size)
 {
-    OSSVoiceOut *oss = (OSSVoiceOut *) hw;
+    OSSVoiceOut *oss = (OSSVoiceOut *)hw;
+
     if (oss->mmapped) {
-        *size = MIN(oss_get_available_bytes(oss), hw->size_emul - hw->pos_emul);
+        *size = hw->size_emul - hw->pos_emul;
         return hw->buf_emul + hw->pos_emul;
     } else {
         return audio_generic_get_buffer_out(hw, size);
-- 
2.31.1


