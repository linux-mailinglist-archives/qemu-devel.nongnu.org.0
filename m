Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC44D1E1CA3
	for <lists+qemu-devel@lfdr.de>; Tue, 26 May 2020 09:58:08 +0200 (CEST)
Received: from localhost ([::1]:33538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jdUTP-0004d7-Ga
	for lists+qemu-devel@lfdr.de; Tue, 26 May 2020 03:58:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jdUSB-0002v9-8B
 for qemu-devel@nongnu.org; Tue, 26 May 2020 03:56:51 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:54691
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jdUSA-0002rh-Fd
 for qemu-devel@nongnu.org; Tue, 26 May 2020 03:56:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590479809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y8ddwg+s++ttioTNU7tIg5LAx1dAmXncXhQwk06rGsM=;
 b=LInLqpjT+w/1/Gl1r/nOvtbnpi5JXCcn/LJ1lhflxRv9VobP/mtSMTANzoUJDDOGdS95dm
 69uYJ8T/9ycfkv0QylQYS0l9w3Q6Vr3RcQtMaSdesQp76deNQSrqvbKW6+LbkDn62bX1GM
 rsLzAduNwMYw26FXPxxkRd1rXv8yiSQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-TgElYrxqPpuFr_--udHHgA-1; Tue, 26 May 2020 03:56:47 -0400
X-MC-Unique: TgElYrxqPpuFr_--udHHgA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A56751005510;
 Tue, 26 May 2020 07:56:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C0C110013D2;
 Tue, 26 May 2020 07:56:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 21DD19D54; Tue, 26 May 2020 09:56:40 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/8] audio: fix wavcapture segfault
Date: Tue, 26 May 2020 09:56:36 +0200
Message-Id: <20200526075639.27949-6-kraxel@redhat.com>
In-Reply-To: <20200526075639.27949-1-kraxel@redhat.com>
References: <20200526075639.27949-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/26 01:51:57
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Bruce Rogers <brogers@suse.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bruce Rogers <brogers@suse.com>

Commit 571a8c522e caused the HMP wavcapture command to segfault when
processing audio data in audio_pcm_sw_write(), where a NULL
sw->hw->pcm_ops is dereferenced. This fix checks that the pointer is
valid before dereferincing it. A similar fix is also made in the
parallel function audio_pcm_sw_read().

Fixes: 571a8c522e (audio: split ctl_* functions into enable_* and
volume_*)
Signed-off-by: Bruce Rogers <brogers@suse.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20200521172931.121903-1-brogers@suse.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/audio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index 95d9fb16caa5..ce8c6dec5f47 100644
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
2.18.4


