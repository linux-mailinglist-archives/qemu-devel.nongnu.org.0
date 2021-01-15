Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC712F7CD8
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 14:39:05 +0100 (CET)
Received: from localhost ([::1]:50834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0PJg-0005PQ-Ia
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 08:39:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3D-0006r1-Jh
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3A-0003J1-6k
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610716917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MbTWa6XA/XTnc8oR+OmYjlUe298v+sSdsQKTwN+5iEo=;
 b=U7yDhn4hoXRZvFguRv20gAZrK+HbUU7W8p5JEGA4OUKwujLeryYMKKFQzPmzcgc5BhAKLU
 RWyP9NURh8qa/fkm+jGWfxTpFTJ00ADfm+AGXdx1xFS0E8wH5XRN+7p5FDDyuKlTkEmdeZ
 ESiuCtNHkH870zHfwSumUWviat+GBAQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281--i-tHvozOkOLlUMAHEWQGA-1; Fri, 15 Jan 2021 08:21:55 -0500
X-MC-Unique: -i-tHvozOkOLlUMAHEWQGA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5384180A0A0;
 Fri, 15 Jan 2021 13:21:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 564616F81E;
 Fri, 15 Jan 2021 13:21:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EC0B01800D4D; Fri, 15 Jan 2021 14:21:46 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/30] paaudio: limit minreq to 75% of audio timer_rate
Date: Fri, 15 Jan 2021 14:21:34 +0100
Message-Id: <20210115132146.1443592-19-kraxel@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Currently with the playback buffer attribute minreq = -1 and flag
PA_STREAM_EARLY_REQUESTS PulseAudio uses minreq = tlength / 4.
To improve audio playback with larger PulseAudio server side
buffers, limit minreq to a maximum of 75% of audio timer_rate.
That way there is a good chance qemu receives a stream buffer
size update before it tries to write data to the playback stream.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-id: 9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de
Message-Id: <20210110100239.27588-18-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/paaudio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/audio/paaudio.c b/audio/paaudio.c
index ff3dd01c96dd..318686829428 100644
--- a/audio/paaudio.c
+++ b/audio/paaudio.c
@@ -517,7 +517,8 @@ static int qpa_init_out(HWVoiceOut *hw, struct audsettings *as,
     ss.rate = as->freq;
 
     ba.tlength = pa_usec_to_bytes(ppdo->latency, &ss);
-    ba.minreq = -1;
+    ba.minreq = pa_usec_to_bytes(MIN(ppdo->latency >> 2,
+                                     (g->dev->timer_period >> 2) * 3), &ss);
     ba.maxlength = -1;
     ba.prebuf = -1;
 
-- 
2.29.2


