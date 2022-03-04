Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 127054CD75D
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 16:11:11 +0100 (CET)
Received: from localhost ([::1]:58164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ9aI-0000MD-2d
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 10:11:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nQ8q1-0003Qx-Hh
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:23:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nQ8q0-0000QS-2C
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:23:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646403798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6x9q7bDR9PBKD4SHJYTDYhwfGMRNMDWp2mG2twanq5U=;
 b=EPAXGYVAxpYGIYHWZFjdz50c8Dv5MiBIYgc2DGNiBSRZzoB3PAxk57isr1L4iQHHfssVie
 sePV/KMMlCJAyYcMysDwmtcpUtMyVjK4f0459HPuB6AoDLVlmbbgYNw8ELoaZ16dTH52wx
 xp6mJ5KpiuwCYjB0kMtl4e6HA0Q74hw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-149-fVl6hZg7PI2fmbpbutFURA-1; Fri, 04 Mar 2022 09:23:13 -0500
X-MC-Unique: fVl6hZg7PI2fmbpbutFURA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C0A71006AA5;
 Fri,  4 Mar 2022 14:23:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC24B866EF;
 Fri,  4 Mar 2022 14:22:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 68E761800935; Fri,  4 Mar 2022 15:21:24 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/35] audio: inline function audio_pcm_sw_get_rpos_in()
Date: Fri,  4 Mar 2022 15:20:59 +0100
Message-Id: <20220304142123.956171-12-kraxel@redhat.com>
In-Reply-To: <20220304142123.956171-1-kraxel@redhat.com>
References: <20220304142123.956171-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

Simplify code by inlining function audio_pcm_sw_get_rpos_in()
at the only call site and remove the duplicated audio_bug()
test.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-Id: <20220301191311.26695-4-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/audio.c | 29 ++++++++---------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index f28e91853f0b..35437986d9dd 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -569,37 +569,24 @@ static size_t audio_pcm_hw_conv_in(HWVoiceIn *hw, void *pcm_buf, size_t samples)
 /*
  * Soft voice (capture)
  */
-static size_t audio_pcm_sw_get_rpos_in(SWVoiceIn *sw)
-{
-    HWVoiceIn *hw = sw->hw;
-    ssize_t live = hw->total_samples_captured - sw->total_hw_samples_acquired;
-
-    if (audio_bug(__func__, live < 0 || live > hw->conv_buf->size)) {
-        dolog("live=%zu hw->conv_buf->size=%zu\n", live, hw->conv_buf->size);
-        return 0;
-    }
-
-    return audio_ring_posb(hw->conv_buf->pos, live, hw->conv_buf->size);
-}
-
 static size_t audio_pcm_sw_read(SWVoiceIn *sw, void *buf, size_t size)
 {
     HWVoiceIn *hw = sw->hw;
     size_t samples, live, ret = 0, swlim, isamp, osamp, rpos, total = 0;
     struct st_sample *src, *dst = sw->buf;
 
-    rpos = audio_pcm_sw_get_rpos_in(sw) % hw->conv_buf->size;
-
     live = hw->total_samples_captured - sw->total_hw_samples_acquired;
-    if (audio_bug(__func__, live > hw->conv_buf->size)) {
-        dolog("live_in=%zu hw->conv_buf->size=%zu\n", live, hw->conv_buf->size);
-        return 0;
-    }
-
-    samples = size / sw->info.bytes_per_frame;
     if (!live) {
         return 0;
     }
+    if (audio_bug(__func__, live > hw->conv_buf->size)) {
+        dolog("live_in=%zu hw->conv_buf->size=%zu\n", live, hw->conv_buf->size);
+        return 0;
+    }
+
+    rpos = audio_ring_posb(hw->conv_buf->pos, live, hw->conv_buf->size);
+
+    samples = size / sw->info.bytes_per_frame;
 
     swlim = (live * sw->ratio) >> 32;
     swlim = MIN (swlim, samples);
-- 
2.35.1


