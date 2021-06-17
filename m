Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A18F03AB438
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 15:01:30 +0200 (CEST)
Received: from localhost ([::1]:51770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltreD-0001ix-LV
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 09:01:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ltrL8-0000jH-RJ
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:41:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ltrL6-0007z7-Uf
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:41:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623933704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=51jOaAuZzVilf3cgR/If67urLft+HaaQSMMhh8ah09I=;
 b=MUJ90mcv/7dC8276o68eBKzzPFXHwOaGgWV3GdlQSaWS4GRzPL5UL7SzTfZItR2TVkqFwC
 49GUxHOLtM1ufdeKc8IMWCSJv5+ZHfKbeCCHOq3Y9oLFEkrQcggGVIx/swyaz5Y9T2uy4/
 Q3wusSKzpSwcihdbimujJcq0JTvsLjU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-CR_IScNvOtu45cpRE0nJug-1; Thu, 17 Jun 2021 08:41:42 -0400
X-MC-Unique: CR_IScNvOtu45cpRE0nJug-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFB5C19067F4;
 Thu, 17 Jun 2021 12:41:41 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DD4A85D6D1;
 Thu, 17 Jun 2021 12:41:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 00F7518017CD; Thu, 17 Jun 2021 14:41:08 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/7] audio: Fix format specifications of debug logs
Date: Thu, 17 Jun 2021 14:41:06 +0200
Message-Id: <20210617124107.2386073-7-kraxel@redhat.com>
In-Reply-To: <20210617124107.2386073-1-kraxel@redhat.com>
References: <20210617124107.2386073-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-id: 20210616141411.53892-1-akihiko.odaki@gmail.com
Message-Id: <20210616141411.53892-1-akihiko.odaki@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/audio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index 052ca6cb789b..59453ef85673 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -705,7 +705,7 @@ static size_t audio_pcm_sw_write(SWVoiceOut *sw, void *buf, size_t size)
 
     if (live == hwsamples) {
 #ifdef DEBUG_OUT
-        dolog ("%s is full %d\n", sw->name, live);
+        dolog ("%s is full %zu\n", sw->name, live);
 #endif
         return 0;
     }
@@ -995,7 +995,7 @@ static size_t audio_get_avail (SWVoiceIn *sw)
     }
 
     ldebug (
-        "%s: get_avail live %d ret %" PRId64 "\n",
+        "%s: get_avail live %zu ret %" PRId64 "\n",
         SW_NAME (sw),
         live, (((int64_t) live << 32) / sw->ratio) * sw->info.bytes_per_frame
         );
@@ -1022,7 +1022,7 @@ static size_t audio_get_free(SWVoiceOut *sw)
     dead = sw->hw->mix_buf->size - live;
 
 #ifdef DEBUG_OUT
-    dolog ("%s: get_free live %d dead %d ret %" PRId64 "\n",
+    dolog ("%s: get_free live %zu dead %zu ret %" PRId64 "\n",
            SW_NAME (sw),
            live, dead, (((int64_t) dead << 32) / sw->ratio) *
            sw->info.bytes_per_frame);
-- 
2.31.1


