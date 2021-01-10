Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0584A2F065D
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 11:20:03 +0100 (CET)
Received: from localhost ([::1]:42692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyXpK-0004M5-0t
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 05:20:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1kyXZP-0002JJ-JM
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 05:03:35 -0500
Received: from mailout05.t-online.de ([194.25.134.82]:42692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1kyXZJ-0005b9-VF
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 05:03:35 -0500
Received: from fwd27.aul.t-online.de (fwd27.aul.t-online.de [172.20.26.132])
 by mailout05.t-online.de (Postfix) with SMTP id 6A58F42030A8;
 Sun, 10 Jan 2021 11:03:28 +0100 (CET)
Received: from linpower.localnet
 (XRs0VMZbZha5tNOVl7KXal1KCepQjBNkcgbJaR-q53PoJFBLZAwZEuIAvPDaSHSwhd@[93.236.152.29])
 by fwd27.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1kyXZE-095AA40; Sun, 10 Jan 2021 11:03:24 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 0E18D2006C1; Sun, 10 Jan 2021 11:02:40 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 18/23] paaudio: limit minreq to 75% of audio timer_rate
Date: Sun, 10 Jan 2021 11:02:34 +0100
Message-Id: <20210110100239.27588-18-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
References: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: XRs0VMZbZha5tNOVl7KXal1KCepQjBNkcgbJaR-q53PoJFBLZAwZEuIAvPDaSHSwhd
X-TOI-EXPURGATEID: 150726::1610273004-0000CED0-BC938EA4/0/0 CLEAN NORMAL
X-TOI-MSGID: a267f9ea-efe3-4a38-8799-5de0a5c0005d
Received-SPF: none client-ip=194.25.134.82;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout05.t-online.de
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

Currently with the playback buffer attribute minreq = -1 and flag
PA_STREAM_EARLY_REQUESTS PulseAudio uses minreq = tlength / 4.
To improve audio playback with larger PulseAudio server side
buffers, limit minreq to a maximum of 75% of audio timer_rate.
That way there is a good chance qemu receives a stream buffer
size update before it tries to write data to the playback stream.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/paaudio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/audio/paaudio.c b/audio/paaudio.c
index ff3dd01c96..3186868294 100644
--- a/audio/paaudio.c
+++ b/audio/paaudio.c
@@ -517,7 +517,8 @@ static int qpa_init_out(HWVoiceOut *hw, struct audsettings *as,
     ss.rate = as->freq;
 
     ba.tlength = pa_usec_to_bytes(ppdo->latency, &ss);
-    ba.minreq = -1;
+    ba.minreq = pa_usec_to_bytes(MIN(ppdo->latency >> 2,
+                                     (g->dev->timer_period >> 2) * 3), &ss);
     ba.maxlength = -1;
     ba.prebuf = -1;
 
-- 
2.26.2


