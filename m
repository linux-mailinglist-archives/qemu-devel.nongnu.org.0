Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F1A2F065B
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 11:18:02 +0100 (CET)
Received: from localhost ([::1]:40160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyXnN-0003Gj-Nn
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 05:18:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1kyXZN-0002Ip-Aa
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 05:03:33 -0500
Received: from mailout04.t-online.de ([194.25.134.18]:55038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1kyXZJ-0005b7-7r
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 05:03:33 -0500
Received: from fwd39.aul.t-online.de (fwd39.aul.t-online.de [172.20.27.138])
 by mailout04.t-online.de (Postfix) with SMTP id 048DB41AA781;
 Sun, 10 Jan 2021 11:03:28 +0100 (CET)
Received: from linpower.localnet
 (EAVH5mZToh23QiYENvIVgbpDE3zBdDG-aOxfNzdjuaMHUxE8F1isBX4h+uA+litZrS@[93.236.152.29])
 by fwd39.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1kyXZG-2rw17A0; Sun, 10 Jan 2021 11:03:26 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 102BD2006C2; Sun, 10 Jan 2021 11:02:40 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 19/23] paaudio: send recorded data in smaller chunks
Date: Sun, 10 Jan 2021 11:02:35 +0100
Message-Id: <20210110100239.27588-19-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
References: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: EAVH5mZToh23QiYENvIVgbpDE3zBdDG-aOxfNzdjuaMHUxE8F1isBX4h+uA+litZrS
X-TOI-EXPURGATEID: 150726::1610273007-00000BD0-353D45A1/0/0 CLEAN NORMAL
X-TOI-MSGID: cf1b0246-e2bf-474a-8fff-4524f33d5335
Received-SPF: none client-ip=194.25.134.18;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout04.t-online.de
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

Tell PulseAudio to send recorded audio data in smaller chunks
than timer_period, so there's a good chance that qemu can read
recorded audio data every time it looks for new data.

PulseAudio tries to send buffer updates at a fragsize / 2 rate.
With fragsize = timer_period / 2 * 3 the update rate is 75% of
timer_period. The lower limit for the recording buffer size
maxlength is fragsize * 2.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/paaudio.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/audio/paaudio.c b/audio/paaudio.c
index 3186868294..1e6f4448ce 100644
--- a/audio/paaudio.c
+++ b/audio/paaudio.c
@@ -568,8 +568,9 @@ static int qpa_init_in(HWVoiceIn *hw, struct audsettings *as, void *drv_opaque)
     ss.channels = as->nchannels;
     ss.rate = as->freq;
 
-    ba.fragsize = pa_usec_to_bytes(ppdo->latency, &ss);
-    ba.maxlength = pa_usec_to_bytes(ppdo->latency * 2, &ss);
+    ba.fragsize = pa_usec_to_bytes((g->dev->timer_period >> 1) * 3, &ss);
+    ba.maxlength = pa_usec_to_bytes(
+        MAX(ppdo->latency, g->dev->timer_period * 3), &ss);
     ba.minreq = -1;
     ba.prebuf = -1;
 
-- 
2.26.2


