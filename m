Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D970368C63B
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 19:56:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP6bn-0004yZ-TM; Mon, 06 Feb 2023 13:52:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pP6bl-0004xf-Rb
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 13:52:53 -0500
Received: from mailout07.t-online.de ([194.25.134.83])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1pP6bj-0005Tp-T4
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 13:52:53 -0500
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
 by mailout07.t-online.de (Postfix) with SMTP id CC134C402;
 Mon,  6 Feb 2023 19:52:47 +0100 (CET)
Received: from linpower.localnet ([79.208.25.151]) by fwd79.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pP6bf-11EhJx0; Mon, 6 Feb 2023 19:52:47 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 7C16A200635; Mon,  6 Feb 2023 19:52:37 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v2 05/17] audio: remove sw == NULL check
Date: Mon,  6 Feb 2023 19:52:25 +0100
Message-Id: <20230206185237.8358-5-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <df6510fe-1dfd-1585-8590-db230c71d367@t-online.de>
References: <df6510fe-1dfd-1585-8590-db230c71d367@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1675709567-D53B29DF-A63D0D90/0/0 CLEAN NORMAL
X-TOI-MSGID: 11063a39-87cb-417f-bd0f-3aca6bac4306
Received-SPF: none client-ip=194.25.134.83;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout07.t-online.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

All call sites of audio_pcm_sw_write() guarantee that sw is not
NULL. Remove the unnecessary NULL check.

Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index 4412b5fad8..8f1c0e77b0 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -712,10 +712,6 @@ static size_t audio_pcm_sw_write(SWVoiceOut *sw, void *buf, size_t size)
     size_t hw_free;
     size_t ret, total;
 
-    if (!sw) {
-        return size;
-    }
-
     hwsamples = sw->hw->mix_buf.size;
 
     live = sw->total_hw_samples_mixed;
-- 
2.35.3


