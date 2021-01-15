Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C5B2F7D68
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 14:58:11 +0100 (CET)
Received: from localhost ([::1]:55360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0PcA-0005uo-6s
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 08:58:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3J-0006xN-Nw
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3A-0003Ih-6s
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610716915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IcYGpixJsOdNXA7cGNh8k3hPWJdlHtoXcTQ2oq2ff/8=;
 b=hTauWUnkpIBHOkTjIyWeqlDE0w1ddzYO/QYgpn6DzzLdhUKI/uyftlHZGqMFkQ4Sn3Y5je
 RJImA7PX9BUHBcYAaWMEZaTaQHzeA3+1dQ1Sx+/VP7U1UdCFux0Zd++W9VBTpZqsANodq1
 2AEkKbpnWL6KWP2k1M9OPQ7/m8M5Joc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-TypLu9H4OSORI3sXNzL7uQ-1; Fri, 15 Jan 2021 08:21:53 -0500
X-MC-Unique: TypLu9H4OSORI3sXNzL7uQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1CAE180A09B;
 Fri, 15 Jan 2021 13:21:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 926FE6F7F3;
 Fri, 15 Jan 2021 13:21:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A0ACB1800D45; Fri, 15 Jan 2021 14:21:46 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/30] sdlaudio: enable (in|out).mixing-engine=off
Date: Fri, 15 Jan 2021 14:21:27 +0100
Message-Id: <20210115132146.1443592-12-kraxel@redhat.com>
In-Reply-To: <20210115132146.1443592-1-kraxel@redhat.com>
References: <20210115132146.1443592-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

Enable the SDL2 backend options -audiodev sdl,out.mixing-
engine=off,in.mixing-engine=off.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-id: 9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de
Message-Id: <20210110100239.27588-11-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/sdlaudio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/audio/sdlaudio.c b/audio/sdlaudio.c
index 445cae8de578..c68c62a3e4f1 100644
--- a/audio/sdlaudio.c
+++ b/audio/sdlaudio.c
@@ -495,8 +495,8 @@ static struct audio_driver sdl_audio_driver = {
     .fini           = sdl_audio_fini,
     .pcm_ops        = &sdl_pcm_ops,
     .can_be_default = 1,
-    .max_voices_out = 1,
-    .max_voices_in  = 1,
+    .max_voices_out = INT_MAX,
+    .max_voices_in  = INT_MAX,
     .voice_size_out = sizeof(SDLVoiceOut),
     .voice_size_in  = sizeof(SDLVoiceIn),
 };
-- 
2.29.2


