Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BB95E8236
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 20:59:29 +0200 (CEST)
Received: from localhost ([::1]:50736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obntY-0004Ck-2p
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 14:59:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1obnY3-0002nQ-Gg
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 14:37:24 -0400
Received: from mailout04.t-online.de ([194.25.134.18]:46140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1obnY1-0005Hf-Bm
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 14:37:14 -0400
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
 by mailout04.t-online.de (Postfix) with SMTP id 2545D1F45;
 Fri, 23 Sep 2022 20:37:11 +0200 (CEST)
Received: from linpower.localnet ([84.175.228.229]) by fwd84.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1obnXu-0n7ykL0; Fri, 23 Sep 2022 20:37:06 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id B3174200622; Fri, 23 Sep 2022 20:36:40 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: [PATCH 12/12] audio: prevent an integer overflow in resampling code
Date: Fri, 23 Sep 2022 20:36:40 +0200
Message-Id: <20220923183640.8314-12-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <38d7417a-fc26-be39-6a63-99c79ee15fc9@t-online.de>
References: <38d7417a-fc26-be39-6a63-99c79ee15fc9@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1663958226-3EFE8B8C-F0658C6F/0/0 CLEAN NORMAL
X-TOI-MSGID: 642e6b64-ba26-4966-9300-38e8f4ec6d23
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

There are corner cases where rate->opos can overflow. For
example, if QEMU is started with -audiodev pa,id=audio0,
out.frequency=11025 -device ich9-intel-hda -device hda-duplex,
audiodev=audio0 and the guest plays audio with a sampling
frequency of 44100Hz, rate->opos will overflow after 27.05h
and the audio stream will be silent for a long time.

To prevent a rate->opos and also a rate->ipos overflow, both
are wrapped around after a short time. The wrap around point
rate->ipos >= 0x10001 is an arbitrarily selected value and can
be any small value, 0 and 1 included.

The comment that an ipos overflow will result in an infinite
loop has been removed, because in this case the resampling code
only generates no more output samples and the audio stream stalls.
However, there is no infinite loop.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/rate_template.h | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/audio/rate_template.h b/audio/rate_template.h
index f94c940c61..b432719ebb 100644
--- a/audio/rate_template.h
+++ b/audio/rate_template.h
@@ -72,11 +72,6 @@ void NAME (void *opaque, struct st_sample *ibuf, struct st_sample *obuf,
             ilast = *ibuf++;
             rate->ipos++;
 
-            /* if ipos overflow, there is  a infinite loop */
-            if (rate->ipos == 0xffffffff) {
-                rate->ipos = 1;
-                rate->opos = rate->opos & 0xffffffff;
-            }
             /* See if we finished the input buffer yet */
             if (ibuf >= iend) {
                 goto the_end;
@@ -85,6 +80,12 @@ void NAME (void *opaque, struct st_sample *ibuf, struct st_sample *obuf,
 
         icur = *ibuf;
 
+        /* wrap ipos and opos around long before they overflow */
+        if (rate->ipos >= 0x10001) {
+            rate->ipos = 1;
+            rate->opos &= 0xffffffff;
+        }
+
         /* interpolate */
 #ifdef FLOAT_MIXENG
 #ifdef RECIPROCAL
-- 
2.35.3


