Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 620945E8204
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 20:50:29 +0200 (CEST)
Received: from localhost ([::1]:49372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obnkq-0002em-EU
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 14:50:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1obnXp-0002mG-Iw
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 14:37:03 -0400
Received: from mailout02.t-online.de ([194.25.134.17]:43246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1obnXl-0005FO-JJ
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 14:36:58 -0400
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
 by mailout02.t-online.de (Postfix) with SMTP id 477ED3B10;
 Fri, 23 Sep 2022 20:36:56 +0200 (CEST)
Received: from linpower.localnet ([84.175.228.229]) by fwd70.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1obnXZ-261Nlh0; Fri, 23 Sep 2022 20:36:45 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id 984D8200615; Fri, 23 Sep 2022 20:36:40 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: [PATCH 03/12] audio: run downstream playback queue unconditionally
Date: Fri, 23 Sep 2022 20:36:31 +0200
Message-Id: <20220923183640.8314-3-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <38d7417a-fc26-be39-6a63-99c79ee15fc9@t-online.de>
References: <38d7417a-fc26-be39-6a63-99c79ee15fc9@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1663958205-4AFF5689-12BE794F/0/0 CLEAN NORMAL
X-TOI-MSGID: 9d7e3173-1984-42dc-8b59-2c1282675954
Received-SPF: none client-ip=194.25.134.17;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout02.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Run the downstream playback queue even if the emulated audio
device didn't write new samples. There still may be buffered
audio samples downstream.

This is for the -audiodev out.mixing-engine=off case. Commit
a8a98cfd42 ("audio: run downstream playback queue uncondition-
ally") fixed the out.mixing-engine=on case.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index 343786243d..9e55834909 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -1143,6 +1143,10 @@ static void audio_run_out (AudioState *s)
                                 hw_free * sw->info.bytes_per_frame);
             }
 
+            if (hw->pcm_ops->run_buffer_out) {
+                hw->pcm_ops->run_buffer_out(hw);
+            }
+
             continue;
         }
 
@@ -1501,10 +1505,6 @@ size_t audio_generic_write(HWVoiceOut *hw, void *buf, size_t size)
         }
     }
 
-    if (hw->pcm_ops->run_buffer_out) {
-        hw->pcm_ops->run_buffer_out(hw);
-    }
-
     return total;
 }
 
-- 
2.35.3


