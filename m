Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 842904CD6F6
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:59:33 +0100 (CET)
Received: from localhost ([::1]:54498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ9P2-0003cE-KZ
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:59:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nQ8qn-0004fH-PE
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:24:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nQ8ql-0001E0-JF
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:24:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646403847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FSgcpgra0vIwtKyU6UVTJ8vqwM3vHylvGpblIOXwlIU=;
 b=CSKJO5QkDhyRQxTgjjBSLMRlI8I6k/qUCAvsO4gDaEG7sJON4+/IjJg+kYlExwBBcLtEpY
 UnOwkZQKDjpssgEg8bURDhaPpxSwnSMOYY1fuZRxhwL88vnZBX0McqlR2/JUt6DCxuamcJ
 DD8fkVA4gPFFWJRx2HnF+YB+SHSLhL8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-113-CLFqTrbWNdu1Iqe8wVzi2Q-1; Fri, 04 Mar 2022 09:24:04 -0500
X-MC-Unique: CLFqTrbWNdu1Iqe8wVzi2Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AB661006AA7;
 Fri,  4 Mar 2022 14:24:02 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3AF487B616;
 Fri,  4 Mar 2022 14:23:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D9DE818009AE; Fri,  4 Mar 2022 15:21:24 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/35] dsoundaudio: reduce effective playback buffer size
Date: Fri,  4 Mar 2022 15:21:07 +0100
Message-Id: <20220304142123.956171-20-kraxel@redhat.com>
In-Reply-To: <20220304142123.956171-1-kraxel@redhat.com>
References: <20220304142123.956171-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

Add the buffer_get_free pcm_ops function to reduce the effective
playback buffer size. All intermediate audio playback buffers
become temporary buffers.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-Id: <20220301191311.26695-12-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/dsoundaudio.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/audio/dsoundaudio.c b/audio/dsoundaudio.c
index 3dd2c4d4a60b..231f3e65b3c8 100644
--- a/audio/dsoundaudio.c
+++ b/audio/dsoundaudio.c
@@ -427,22 +427,18 @@ static void dsound_enable_out(HWVoiceOut *hw, bool enable)
     }
 }
 
-static void *dsound_get_buffer_out(HWVoiceOut *hw, size_t *size)
+static size_t dsound_buffer_get_free(HWVoiceOut *hw)
 {
     DSoundVoiceOut *ds = (DSoundVoiceOut *) hw;
     LPDIRECTSOUNDBUFFER dsb = ds->dsound_buffer;
     HRESULT hr;
-    DWORD ppos, wpos, act_size;
-    size_t req_size;
-    int err;
-    void *ret;
+    DWORD ppos, wpos;
 
     hr = IDirectSoundBuffer_GetCurrentPosition(
         dsb, &ppos, ds->first_time ? &wpos : NULL);
     if (FAILED(hr)) {
         dsound_logerr(hr, "Could not get playback buffer position\n");
-        *size = 0;
-        return NULL;
+        return 0;
     }
 
     if (ds->first_time) {
@@ -450,13 +446,20 @@ static void *dsound_get_buffer_out(HWVoiceOut *hw, size_t *size)
         ds->first_time = false;
     }
 
-    req_size = audio_ring_dist(ppos, hw->pos_emul, hw->size_emul);
-    req_size = MIN(req_size, hw->size_emul - hw->pos_emul);
+    return audio_ring_dist(ppos, hw->pos_emul, hw->size_emul);
+}
 
-    if (req_size == 0) {
-        *size = 0;
-        return NULL;
-    }
+static void *dsound_get_buffer_out(HWVoiceOut *hw, size_t *size)
+{
+    DSoundVoiceOut *ds = (DSoundVoiceOut *)hw;
+    LPDIRECTSOUNDBUFFER dsb = ds->dsound_buffer;
+    DWORD act_size;
+    size_t req_size;
+    int err;
+    void *ret;
+
+    req_size = MIN(*size, hw->size_emul - hw->pos_emul);
+    assert(req_size > 0);
 
     err = dsound_lock_out(dsb, &hw->info, hw->pos_emul, req_size, &ret, NULL,
                           &act_size, NULL, false, ds->s);
@@ -699,6 +702,7 @@ static struct audio_pcm_ops dsound_pcm_ops = {
     .init_out = dsound_init_out,
     .fini_out = dsound_fini_out,
     .write    = audio_generic_write,
+    .buffer_get_free = dsound_buffer_get_free,
     .get_buffer_out = dsound_get_buffer_out,
     .put_buffer_out = dsound_put_buffer_out,
     .enable_out = dsound_enable_out,
-- 
2.35.1


