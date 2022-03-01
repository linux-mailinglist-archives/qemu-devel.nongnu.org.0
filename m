Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 183904C9432
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 20:24:43 +0100 (CET)
Received: from localhost ([::1]:54746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP86z-0005eq-3r
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 14:24:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1nP7wB-0005EX-Sr
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 14:13:31 -0500
Received: from mailout01.t-online.de ([194.25.134.80]:51352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1nP7w9-0001p1-Cs
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 14:13:31 -0500
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
 by mailout01.t-online.de (Postfix) with SMTP id 386C5857B;
 Tue,  1 Mar 2022 20:13:25 +0100 (CET)
Received: from linpower.localnet ([46.86.48.20]) by fwd85.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1nP7w4-2fZMlF0; Tue, 1 Mar 2022 20:13:25 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 016BE200617; Tue,  1 Mar 2022 20:13:11 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v3 06/15] jackaudio: use more jack audio buffers
Date: Tue,  1 Mar 2022 20:13:02 +0100
Message-Id: <20220301191311.26695-6-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <3d0bd2ac-e5b9-9cf6-c98f-c047390a3ec5@t-online.de>
References: <3d0bd2ac-e5b9-9cf6-c98f-c047390a3ec5@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1646162005-00014AB5-B51A0BF1/0/0 CLEAN NORMAL
X-TOI-MSGID: 53ebc7aa-0f3a-432f-a532-a68ffcd5f474
Received-SPF: none client-ip=194.25.134.80;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout01.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The next patch reduces the effective qemu playback buffer size
by timer-period. Increase the number of jack audio buffers by
one to preserve the total effective buffer size. The size of one
jack audio buffer is 512 samples. With audio defaults that's
512 samples / 44100 samples/s = 11.6 ms and only slightly larger
than the timer-period of 10 ms.

The larger jack audio buffer increases audio dropout safety,
because the high priority jack-audio worker threads can provide
audio data for a longer period of time as with a smaller buffer
and more audio data in the mixing engine buffer that they can't
access.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/jackaudio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/audio/jackaudio.c b/audio/jackaudio.c
index 317009e936..26246c3a8b 100644
--- a/audio/jackaudio.c
+++ b/audio/jackaudio.c
@@ -483,8 +483,8 @@ static int qjack_client_init(QJackClient *c)
         c->buffersize = 512;
     }
 
-    /* create a 2 period buffer */
-    qjack_buffer_create(&c->fifo, c->nchannels, c->buffersize * 2);
+    /* create a 3 period buffer */
+    qjack_buffer_create(&c->fifo, c->nchannels, c->buffersize * 3);
 
     qjack_client_connect_ports(c);
     c->state = QJACK_STATE_RUNNING;
-- 
2.34.1


