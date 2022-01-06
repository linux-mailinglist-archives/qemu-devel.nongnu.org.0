Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC90D486690
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 16:13:15 +0100 (CET)
Received: from localhost ([::1]:59788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5US2-000726-Sr
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 10:13:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1n5P1F-0005uJ-Mp
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 04:25:14 -0500
Received: from mailout02.t-online.de ([194.25.134.17]:38016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1n5P1E-0006km-71
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 04:25:13 -0500
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
 by mailout02.t-online.de (Postfix) with SMTP id BE373778D;
 Thu,  6 Jan 2022 10:24:09 +0100 (CET)
Received: from linpower.localnet ([46.86.48.20]) by fwd80.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1n5P0D-1fY0q90; Thu, 6 Jan 2022 10:24:09 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id EDBF7200631; Thu,  6 Jan 2022 10:23:32 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <volker.ruemelin@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 15/15] sdlaudio: fix samples vs. frames mix-up
Date: Thu,  6 Jan 2022 10:23:32 +0100
Message-Id: <20220106092332.7223-15-volker.ruemelin@t-online.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cfcae86f-59c3-a2c5-76cd-1ab5e23e20f3@t-online.de>
References: <cfcae86f-59c3-a2c5-76cd-1ab5e23e20f3@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1641461049-00001C4D-DD58036B/0/0 CLEAN NORMAL
X-TOI-MSGID: fda1647d-72d8-4cf4-8b8a-730ef10820bb
Received-SPF: none client-ip=194.25.134.17;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout02.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 06 Jan 2022 10:05:00 -0500
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
Cc: Thomas Huth <huth@tuxfamily.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

Fix the same samples vs. frames mix-up that the previous commit
fixed for the PulseAudio backend.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/sdlaudio.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/audio/sdlaudio.c b/audio/sdlaudio.c
index e605c787ba..797b47bbdd 100644
--- a/audio/sdlaudio.c
+++ b/audio/sdlaudio.c
@@ -347,11 +347,8 @@ static int sdl_init_out(HWVoiceOut *hw, struct audsettings *as,
     req.freq = as->freq;
     req.format = aud_to_sdlfmt (as->fmt);
     req.channels = as->nchannels;
-    /*
-     * This is wrong. SDL samples are QEMU frames. The buffer size will be
-     * the requested buffer size multiplied by the number of channels.
-     */
-    req.samples = audio_buffer_samples(
+    /* SDL samples are QEMU frames */
+    req.samples = audio_buffer_frames(
         qapi_AudiodevSdlPerDirectionOptions_base(spdo), as, 11610);
     req.callback = sdl_callback_out;
     req.userdata = sdl;
-- 
2.31.1


