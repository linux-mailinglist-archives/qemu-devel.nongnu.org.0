Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 082BF2F0645
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 11:09:02 +0100 (CET)
Received: from localhost ([::1]:36700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyXef-0006Ul-2L
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 05:09:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1kyXYx-0001d3-Ok
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 05:03:07 -0500
Received: from mailout03.t-online.de ([194.25.134.81]:57036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1kyXYv-0005Ny-4S
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 05:03:06 -0500
Received: from fwd39.aul.t-online.de (fwd39.aul.t-online.de [172.20.27.138])
 by mailout03.t-online.de (Postfix) with SMTP id 075C74217779;
 Sun, 10 Jan 2021 11:03:04 +0100 (CET)
Received: from linpower.localnet
 (EPZUScZHghU5OdQsaS4N+3zlg2g4BU+7+KzhIpjklF9B3+2ETWR+xHi7rAvhhevZXJ@[93.236.152.29])
 by fwd39.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1kyXYt-2DO80G0; Sun, 10 Jan 2021 11:03:03 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id F0E9C200637; Sun, 10 Jan 2021 11:02:39 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 10/23] audio: break generic buffer dependency on mixing-engine
Date: Sun, 10 Jan 2021 11:02:26 +0100
Message-Id: <20210110100239.27588-10-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
References: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: EPZUScZHghU5OdQsaS4N+3zlg2g4BU+7+KzhIpjklF9B3+2ETWR+xHi7rAvhhevZXJ
X-TOI-EXPURGATEID: 150726::1610272983-00000BD0-AC32E848/0/0 CLEAN NORMAL
X-TOI-MSGID: 678f67c7-0fee-488e-99c9-26f0ae5f0329
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

Break the unnecessary dependency of the generic buffer management
code on mixing-engine. This is required for the next patch.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index 480b3cce1f..22d769db0c 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -1388,9 +1388,8 @@ void audio_run(AudioState *s, const char *msg)
 void audio_generic_run_buffer_in(HWVoiceIn *hw)
 {
     if (unlikely(!hw->buf_emul)) {
-        size_t calc_size = hw->conv_buf->size * hw->info.bytes_per_frame;
-        hw->buf_emul = g_malloc(calc_size);
-        hw->size_emul = calc_size;
+        hw->size_emul = hw->samples * hw->info.bytes_per_frame;
+        hw->buf_emul = g_malloc(hw->size_emul);
         hw->pos_emul = hw->pending_emul = 0;
     }
 
@@ -1452,10 +1451,8 @@ void audio_generic_run_buffer_out(HWVoiceOut *hw)
 void *audio_generic_get_buffer_out(HWVoiceOut *hw, size_t *size)
 {
     if (unlikely(!hw->buf_emul)) {
-        size_t calc_size = hw->mix_buf->size * hw->info.bytes_per_frame;
-
-        hw->buf_emul = g_malloc(calc_size);
-        hw->size_emul = calc_size;
+        hw->size_emul = hw->samples * hw->info.bytes_per_frame;
+        hw->buf_emul = g_malloc(hw->size_emul);
         hw->pos_emul = hw->pending_emul = 0;
     }
 
-- 
2.26.2


