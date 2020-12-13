Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E43102D8D2B
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 14:10:17 +0100 (CET)
Received: from localhost ([::1]:53922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koR8j-0008PH-0H
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 08:10:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1koR4J-0006cS-Nq
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 08:05:43 -0500
Received: from mailout02.t-online.de ([194.25.134.17]:60508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1koR4C-0000jo-Fi
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 08:05:43 -0500
Received: from fwd34.aul.t-online.de (fwd34.aul.t-online.de [172.20.26.145])
 by mailout02.t-online.de (Postfix) with SMTP id A558B41ACBB7;
 Sun, 13 Dec 2020 14:05:32 +0100 (CET)
Received: from linpower.localnet
 (TF5WLkZawhW1i+siDZ1kBkNHL2e4i2pPW5Vbs-7Meqmc+TvNrgFjfraAWbX4sD5w2o@[79.208.17.59])
 by fwd34.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1koR47-1463rk0; Sun, 13 Dec 2020 14:05:31 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 1F05D200617; Sun, 13 Dec 2020 14:05:28 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 2/4] coreaudio: don't start playback in init routine
Date: Sun, 13 Dec 2020 14:05:26 +0100
Message-Id: <20201213130528.5863-2-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <1a970310-4cff-f2f7-985e-05b2f4cd446b@t-online.de>
References: <1a970310-4cff-f2f7-985e-05b2f4cd446b@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: TF5WLkZawhW1i+siDZ1kBkNHL2e4i2pPW5Vbs-7Meqmc+TvNrgFjfraAWbX4sD5w2o
X-TOI-EXPURGATEID: 150726::1607864731-000171DC-E4377A34/0/0 CLEAN NORMAL
X-TOI-MSGID: bc1e07b5-2eff-4f12-9148-cff2c6586f19
Received-SPF: none client-ip=194.25.134.17;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout02.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Every emulated audio device has a way to enable audio playback. Don't
start playback until the guest enables the audio device to keep the
Core Audio device run state in sync with hw->enabled.

Tested-by: Howard Spoelstra <hsp.cat7@gmail.com>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/coreaudio.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/audio/coreaudio.c b/audio/coreaudio.c
index 0ee85052c4..a5df950514 100644
--- a/audio/coreaudio.c
+++ b/audio/coreaudio.c
@@ -584,17 +584,6 @@ static int coreaudio_init_out(HWVoiceOut *hw, struct audsettings *as,
         return -1;
     }
 
-    /* start Playback */
-    if (!isPlaying(core->outputDeviceID)) {
-        status = AudioDeviceStart(core->outputDeviceID, core->ioprocid);
-        if (status != kAudioHardwareNoError) {
-            coreaudio_logerr2 (status, typ, "Could not start playback\n");
-            AudioDeviceDestroyIOProcID(core->outputDeviceID, core->ioprocid);
-            core->outputDeviceID = kAudioDeviceUnknown;
-            return -1;
-        }
-    }
-
     return 0;
 }
 
-- 
2.26.2


