Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89567383DE4
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 21:56:14 +0200 (CEST)
Received: from localhost ([::1]:50878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lijLZ-0003Ba-M8
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 15:56:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1lijBr-0005WT-Uq
 for qemu-devel@nongnu.org; Mon, 17 May 2021 15:46:11 -0400
Received: from mailout01.t-online.de ([194.25.134.80]:33098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1lijBq-0000ND-94
 for qemu-devel@nongnu.org; Mon, 17 May 2021 15:46:11 -0400
Received: from fwd08.aul.t-online.de (fwd08.aul.t-online.de [172.20.26.151])
 by mailout01.t-online.de (Postfix) with SMTP id 9945129D8F;
 Mon, 17 May 2021 21:46:07 +0200 (CEST)
Received: from linpower.localnet
 (bHj86QZOYh0WhC4qUwlnwFlOORTfOEsAmAHd0b5EHVHeqzdEjAnhlcHpiCfvj-6Zr9@[79.208.18.63])
 by fwd08.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1lijBn-0qPBtA0; Mon, 17 May 2021 21:46:07 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id 5C2F92000C5; Mon, 17 May 2021 21:46:04 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 2/4] paaudio: remove unused stream flags
Date: Mon, 17 May 2021 21:46:02 +0200
Message-Id: <20210517194604.2545-2-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <b461d71c-a062-b85d-378d-53c0b5857b52@t-online.de>
References: <b461d71c-a062-b85d-378d-53c0b5857b52@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: bHj86QZOYh0WhC4qUwlnwFlOORTfOEsAmAHd0b5EHVHeqzdEjAnhlcHpiCfvj-6Zr9
X-TOI-EXPURGATEID: 150726::1621280767-0000AFFF-2A0807A4/0/0 CLEAN NORMAL
X-TOI-MSGID: dee59d10-18ac-42b0-ac7a-774c925ec266
Received-SPF: none client-ip=194.25.134.80;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout01.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In current code there are no calls to pa_stream_get_latency()
or pa_stream_get_time() to receive latency or time information.

Remove the flags PA_STREAM_INTERPOLATE_TIMING and
PA_STREAM_AUTO_TIMING_UPDATE which instruct PulseAudio to
calculate this information in regular intervals.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/paaudio.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/audio/paaudio.c b/audio/paaudio.c
index c97b22e970..14b4269c55 100644
--- a/audio/paaudio.c
+++ b/audio/paaudio.c
@@ -463,10 +463,7 @@ static pa_stream *qpa_simple_new (
 
     pa_stream_set_state_callback(stream, stream_state_cb, c);
 
-    flags =
-        PA_STREAM_INTERPOLATE_TIMING
-        | PA_STREAM_AUTO_TIMING_UPDATE
-        | PA_STREAM_EARLY_REQUESTS;
+    flags = PA_STREAM_EARLY_REQUESTS;
 
     if (dev) {
         /* don't move the stream if the user specified a sink/source */
-- 
2.26.2


