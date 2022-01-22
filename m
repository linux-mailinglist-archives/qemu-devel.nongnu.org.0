Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5C1496CA2
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 14:43:58 +0100 (CET)
Received: from localhost ([::1]:40920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBGgP-0007zA-K6
	for lists+qemu-devel@lfdr.de; Sat, 22 Jan 2022 08:43:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1nBFzZ-0007s8-I6
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 07:59:41 -0500
Received: from mailout07.t-online.de ([194.25.134.83]:53826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1nBFyx-000569-SR
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 07:59:41 -0500
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
 by mailout07.t-online.de (Postfix) with SMTP id 159EF7D5A;
 Sat, 22 Jan 2022 13:58:20 +0100 (CET)
Received: from linpower.localnet ([46.86.48.20]) by fwd76.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1nBFyF-2AZVwn0; Sat, 22 Jan 2022 13:58:19 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id E65F82006C1; Sat, 22 Jan 2022 13:57:45 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 14/15] paaudio: fix samples vs. frames mix-up
Date: Sat, 22 Jan 2022 13:57:44 +0100
Message-Id: <20220122125745.5037-14-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <addf2564-d61c-707e-ce5f-fb06264e7a39@t-online.de>
References: <addf2564-d61c-707e-ce5f-fb06264e7a39@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1642856299-0001619A-27210889/0/0 CLEAN NORMAL
X-TOI-MSGID: da7207c5-8144-4e8f-82de-ee29a14549dd
Received-SPF: none client-ip=194.25.134.83;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout07.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that the mixing buffer size no longer adds to playback
latency, fix the samples vs. frames mix-up in the mixing buffer
size calculation. This change will go largely unnoticed as long
as the user doesn't use a buffer-size smaller than timer-period.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/paaudio.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/audio/paaudio.c b/audio/paaudio.c
index d94f858ec7..a53ed85e0b 100644
--- a/audio/paaudio.c
+++ b/audio/paaudio.c
@@ -549,11 +549,8 @@ static int qpa_init_out(HWVoiceOut *hw, struct audsettings *as,
     }
 
     audio_pcm_init_info (&hw->info, &obt_as);
-    /*
-     * This is wrong. hw->samples counts in frames. hw->samples will be
-     * number of channels times larger than expected.
-     */
-    hw->samples = audio_buffer_samples(
+    /* hw->samples counts in frames */
+    hw->samples = audio_buffer_frames(
         qapi_AudiodevPaPerDirectionOptions_base(ppdo), &obt_as, 46440);
 
     return 0;
@@ -601,11 +598,8 @@ static int qpa_init_in(HWVoiceIn *hw, struct audsettings *as, void *drv_opaque)
     }
 
     audio_pcm_init_info (&hw->info, &obt_as);
-    /*
-     * This is wrong. hw->samples counts in frames. hw->samples will be
-     * number of channels times larger than expected.
-     */
-    hw->samples = audio_buffer_samples(
+    /* hw->samples counts in frames */
+    hw->samples = audio_buffer_frames(
         qapi_AudiodevPaPerDirectionOptions_base(ppdo), &obt_as, 46440);
 
     return 0;
-- 
2.31.1


