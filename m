Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D449C4C9439
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 20:28:21 +0100 (CET)
Received: from localhost ([::1]:60938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP8AW-0001h0-UR
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 14:28:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1nP7wS-0005hn-Pn
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 14:13:49 -0500
Received: from mailout09.t-online.de ([194.25.134.84]:39562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1nP7wR-0001tO-CS
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 14:13:48 -0500
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
 by mailout09.t-online.de (Postfix) with SMTP id 1F4E3F94D;
 Tue,  1 Mar 2022 20:13:46 +0100 (CET)
Received: from linpower.localnet ([46.86.48.20]) by fwd86.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1nP7wP-1vdvKD0; Tue, 1 Mar 2022 20:13:45 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 18E7D20062A; Tue,  1 Mar 2022 20:13:12 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v3 14/15] paaudio: fix samples vs. frames mix-up
Date: Tue,  1 Mar 2022 20:13:10 +0100
Message-Id: <20220301191311.26695-14-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <3d0bd2ac-e5b9-9cf6-c98f-c047390a3ec5@t-online.de>
References: <3d0bd2ac-e5b9-9cf6-c98f-c047390a3ec5@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1646162025-000116DC-73836D0D/0/0 CLEAN NORMAL
X-TOI-MSGID: dd8b434b-3562-4d89-a823-90542305d01a
Received-SPF: none client-ip=194.25.134.84;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout09.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
2.34.1


