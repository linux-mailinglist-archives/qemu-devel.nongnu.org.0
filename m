Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB621DD46A
	for <lists+qemu-devel@lfdr.de>; Thu, 21 May 2020 19:31:01 +0200 (CEST)
Received: from localhost ([::1]:32786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbp24-0001Yi-27
	for lists+qemu-devel@lfdr.de; Thu, 21 May 2020 13:31:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brogers@suse.com>) id 1jbp0u-0000De-TC
 for qemu-devel@nongnu.org; Thu, 21 May 2020 13:29:48 -0400
Received: from mx2.suse.de ([195.135.220.15]:42924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brogers@suse.com>) id 1jbp0t-0007b3-9b
 for qemu-devel@nongnu.org; Thu, 21 May 2020 13:29:47 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B75B2B200;
 Thu, 21 May 2020 17:29:44 +0000 (UTC)
From: Bruce Rogers <brogers@suse.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] audio: fix wavcapture segfault
Date: Thu, 21 May 2020 11:29:31 -0600
Message-Id: <20200521172931.121903-1-brogers@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=brogers@suse.com;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/21 02:02:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Bruce Rogers <brogers@suse.com>, kraxel@redhat.com, dirty.ice.hu@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 571a8c522e caused the HMP wavcapture command to segfault when
processing audio data in audio_pcm_sw_write(), where a NULL
sw->hw->pcm_ops is dereferenced. This fix checks that the pointer is
valid before dereferincing it. A similar fix is also made in the
parallel function audio_pcm_sw_read().

Fixes: 571a8c522e (audio: split ctl_* functions into enable_* and
volume_*)
Signed-off-by: Bruce Rogers <brogers@suse.com>
---
 audio/audio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index 7a9e680355..08a067722b 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -649,7 +649,7 @@ static size_t audio_pcm_sw_read(SWVoiceIn *sw, void *buf, size_t size)
         total += isamp;
     }
 
-    if (!hw->pcm_ops->volume_in) {
+    if (hw->pcm_ops && !hw->pcm_ops->volume_in) {
         mixeng_volume (sw->buf, ret, &sw->vol);
     }
 
@@ -736,7 +736,7 @@ static size_t audio_pcm_sw_write(SWVoiceOut *sw, void *buf, size_t size)
     if (swlim) {
         sw->conv (sw->buf, buf, swlim);
 
-        if (!sw->hw->pcm_ops->volume_out) {
+        if (sw->hw->pcm_ops && !sw->hw->pcm_ops->volume_out) {
             mixeng_volume (sw->buf, swlim, &sw->vol);
         }
     }
-- 
2.26.2


