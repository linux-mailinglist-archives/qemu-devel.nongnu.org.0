Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABE74C94FE
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 20:49:31 +0100 (CET)
Received: from localhost ([::1]:39914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP8Uz-0001Ni-1R
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 14:49:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1nP7wT-0005i3-Uj
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 14:13:50 -0500
Received: from mailout11.t-online.de ([194.25.134.85]:49906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1nP7wS-0001tR-HA
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 14:13:49 -0500
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
 by mailout11.t-online.de (Postfix) with SMTP id 004EC1BD34;
 Tue,  1 Mar 2022 20:13:42 +0100 (CET)
Received: from linpower.localnet ([46.86.48.20]) by fwd77.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1nP7wM-0bHmAD0; Tue, 1 Mar 2022 20:13:42 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 16159200628; Tue,  1 Mar 2022 20:13:12 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v3 13/15] ossaudio: reduce effective playback buffer size
Date: Tue,  1 Mar 2022 20:13:09 +0100
Message-Id: <20220301191311.26695-13-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <3d0bd2ac-e5b9-9cf6-c98f-c047390a3ec5@t-online.de>
References: <3d0bd2ac-e5b9-9cf6-c98f-c047390a3ec5@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1646162022-0001606D-412A4309/0/0 CLEAN NORMAL
X-TOI-MSGID: 8489a4bd-bae0-4264-9912-bdf92b2cc355
Received-SPF: none client-ip=194.25.134.85;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout11.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Return the free buffer size for the mmapped case in function
oss_buffer_get_free() to reduce the effective playback buffer
size. All intermediate audio playback buffers become temporary
buffers.

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
2.34.1


