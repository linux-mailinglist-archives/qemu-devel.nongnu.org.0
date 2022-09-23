Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C24855E81E2
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 20:41:29 +0200 (CEST)
Received: from localhost ([::1]:44472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obnc8-0008WK-J8
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 14:41:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1obnXf-0002h4-Ah
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 14:36:54 -0400
Received: from mailout08.t-online.de ([194.25.134.20]:52320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1obnXd-0005Dz-Lh
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 14:36:50 -0400
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
 by mailout08.t-online.de (Postfix) with SMTP id 7B36C155C1;
 Fri, 23 Sep 2022 20:36:43 +0200 (CEST)
Received: from linpower.localnet ([84.175.228.229]) by fwd73.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1obnXX-1r5F330; Fri, 23 Sep 2022 20:36:43 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id 95EAC200613; Fri, 23 Sep 2022 20:36:40 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: [PATCH 02/12] audio: fix GUS audio playback with out.mixing-engine=off
Date: Fri, 23 Sep 2022 20:36:30 +0200
Message-Id: <20220923183640.8314-2-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <38d7417a-fc26-be39-6a63-99c79ee15fc9@t-online.de>
References: <38d7417a-fc26-be39-6a63-99c79ee15fc9@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1663958203-2588998D-AD322BB3/0/0 CLEAN NORMAL
X-TOI-MSGID: bb95f857-31b9-4127-96af-baedaac05a68
Received-SPF: none client-ip=194.25.134.20;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout08.t-online.de
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

Fix GUS audio playback with out.mixing-engine=off.

The GUS audio device needs to know the amount of samples to
produce in advance.

To reproduce start qemu with
-parallel none -device gus,audiodev=audio0
-audiodev pa,id=audio0,out.mixing-engine=off

and start the cartoon.exe demo in a FreeDOS guest. The demo file
is available on the download page of the GUSemu32 author.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/audio/audio.c b/audio/audio.c
index 04f685fe24..343786243d 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -1139,7 +1139,8 @@ static void audio_run_out (AudioState *s)
             }
 
             if (sw->active) {
-                sw->callback.fn(sw->callback.opaque, INT_MAX);
+                sw->callback.fn(sw->callback.opaque,
+                                hw_free * sw->info.bytes_per_frame);
             }
 
             continue;
-- 
2.35.3


