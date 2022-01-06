Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF01486684
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 16:10:03 +0100 (CET)
Received: from localhost ([::1]:51090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5UOw-00014f-2k
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 10:10:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1n5P14-0005tY-AC
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 04:25:03 -0500
Received: from mailout05.t-online.de ([194.25.134.82]:40258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1n5P11-0006XK-Dp
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 04:25:01 -0500
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
 by mailout05.t-online.de (Postfix) with SMTP id 7C9EC1804B;
 Thu,  6 Jan 2022 10:23:45 +0100 (CET)
Received: from linpower.localnet ([46.86.48.20]) by fwd71.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1n5Ozn-0k7odV0; Thu, 6 Jan 2022 10:23:43 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id D8345200625; Thu,  6 Jan 2022 10:23:32 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <volker.ruemelin@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 05/15] paaudio: increase default latency to 46ms
Date: Thu,  6 Jan 2022 10:23:22 +0100
Message-Id: <20220106092332.7223-5-volker.ruemelin@t-online.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cfcae86f-59c3-a2c5-76cd-1ab5e23e20f3@t-online.de>
References: <cfcae86f-59c3-a2c5-76cd-1ab5e23e20f3@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1641461023-00001674-FB04F9C7/0/0 CLEAN NORMAL
X-TOI-MSGID: 2d3263b5-bcd1-4e8a-bd19-cf6fc7ff7016
Received-SPF: none client-ip=194.25.134.82;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout05.t-online.de
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

This is a patch to improve the pulseaudio playback experience.
Asking pulseaudio for a playback latency of 15ms is quite
demanding. Increase this to 46ms. The total playback latency
now is 31ms larger. One of the next patches will reduce the
total playback latency again by more than 46ms.

Here is a quote from the PulseAudio Latency Control
documentation: 'For the sake of (...) drop-out safety always
make sure to pick the highest latency possible that fulfills
your needs.'

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/paaudio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/audio/paaudio.c b/audio/paaudio.c
index 75401d5391..9df1e69c08 100644
--- a/audio/paaudio.c
+++ b/audio/paaudio.c
@@ -744,7 +744,7 @@ static int qpa_validate_per_direction_opts(Audiodev *dev,
 {
     if (!pdo->has_latency) {
         pdo->has_latency = true;
-        pdo->latency = 15000;
+        pdo->latency = 46440;
     }
     return 1;
 }
-- 
2.31.1


