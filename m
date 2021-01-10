Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 950D52F0641
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 11:05:33 +0100 (CET)
Received: from localhost ([::1]:57586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyXbI-0003Le-KQ
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 05:05:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1kyXYp-0001TR-HH
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 05:03:00 -0500
Received: from mailout09.t-online.de ([194.25.134.84]:40272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1kyXYm-0005KY-PY
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 05:02:59 -0500
Received: from fwd25.aul.t-online.de (fwd25.aul.t-online.de [172.20.26.130])
 by mailout09.t-online.de (Postfix) with SMTP id 0F6D142B8C84;
 Sun, 10 Jan 2021 11:02:55 +0100 (CET)
Received: from linpower.localnet
 (TtyMxMZOgh9YM6EchCbilY3HjO4cpubcuP+464FrA0qpDMKdEjOTddVtZxaKlFygaG@[93.236.152.29])
 by fwd25.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1kyXYj-1nUmTw0; Sun, 10 Jan 2021 11:02:53 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id E7CF3200630; Sun, 10 Jan 2021 11:02:39 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 06/23] sdlaudio: fill remaining sample buffer with silence
Date: Sun, 10 Jan 2021 11:02:22 +0100
Message-Id: <20210110100239.27588-6-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
References: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: TtyMxMZOgh9YM6EchCbilY3HjO4cpubcuP+464FrA0qpDMKdEjOTddVtZxaKlFygaG
X-TOI-EXPURGATEID: 150726::1610272973-00015F3A-8180E6F4/0/0 CLEAN NORMAL
X-TOI-MSGID: 9d6dc805-0078-4051-adc2-7e7fc154eb03
Received-SPF: none client-ip=194.25.134.84;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout09.t-online.de
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

Fill the remaining sample buffer with silence. To fill it with
zeroes is wrong for unsigned samples because this is silence
with a DC bias.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/sdlaudio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/audio/sdlaudio.c b/audio/sdlaudio.c
index 79eed23849..01ae4c600e 100644
--- a/audio/sdlaudio.c
+++ b/audio/sdlaudio.c
@@ -235,7 +235,8 @@ static void sdl_callback (void *opaque, Uint8 *buf, int len)
 
     /* clear remaining buffer that we couldn't fill with data */
     if (len) {
-        memset(buf, 0, len);
+        audio_pcm_info_clear_buf(&hw->info, buf,
+                                 len / hw->info.bytes_per_frame);
     }
 }
 
-- 
2.26.2


