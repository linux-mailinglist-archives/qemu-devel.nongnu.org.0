Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E075BB874
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 15:25:05 +0200 (CEST)
Received: from localhost ([::1]:37530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZXoe-0004wb-LX
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 09:25:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1oZXgS-0006zI-Ql
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 09:16:40 -0400
Received: from mailout08.t-online.de ([194.25.134.20]:35338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1oZXgP-0008OL-1J
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 09:16:35 -0400
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
 by mailout08.t-online.de (Postfix) with SMTP id 89C3B120B8;
 Sat, 17 Sep 2022 15:16:30 +0200 (CEST)
Received: from linpower.localnet ([84.175.228.229]) by fwd79.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1oZXgL-15QYXR0; Sat, 17 Sep 2022 15:16:29 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id CEC51200615; Sat, 17 Sep 2022 15:16:26 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 2/2] audio: remove abort() in audio_bug()
Date: Sat, 17 Sep 2022 15:16:26 +0200
Message-Id: <20220917131626.7521-2-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <988e1e66-6f03-5843-d686-666132cf8ef9@t-online.de>
References: <988e1e66-6f03-5843-d686-666132cf8ef9@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1663420589-F37EF417-09C68BD8/0/0 CLEAN NORMAL
X-TOI-MSGID: 556426e9-f984-414b-9bfd-fbdd5f0090aa
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

Commit ab32b78cd1 "audio: Simplify audio_bug() removing old code"
introduced abort() in audio_bug() for regular builds.

audio_bug() was never meant to abort QEMU for the following
reasons.

  - There's code in audio_bug() that expects audio_bug() gets
    called more than once with error condition true. The variable
    'shown' is only 0 on first error.

  - All call sites test the return code of audio_bug(), print
    an error context message and handle the errror.

  - The abort() in audio_bug() enables a class of guest-triggered
    aborts similar to the Launchpad Bug #1910603 at
    https://bugs.launchpad.net/bugs/1910603.

Fixes: ab32b78cd1 "audio: Simplify audio_bug() removing old code"
Buglink: https://bugs.launchpad.net/bugs/1910603
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 audio/audio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/audio/audio.c b/audio/audio.c
index 545ded6674..01c0cd8202 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -117,7 +117,6 @@ int audio_bug (const char *funcname, int cond)
             AUD_log (NULL, "I am sorry\n");
         }
         AUD_log (NULL, "Context:\n");
-        abort();
     }
 
     return cond;
-- 
2.35.3


