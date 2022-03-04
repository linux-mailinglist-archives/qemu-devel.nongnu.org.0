Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E89E04CD711
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 16:03:16 +0100 (CET)
Received: from localhost ([::1]:34794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ9Sd-0001AK-Vu
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 10:03:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nQ8qr-0004kX-15
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:24:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nQ8qp-0001IN-AS
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:24:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646403850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/t8awGVSb3LoEgSj8kOF9+qQ1uXEEzUpjHhd65P9f24=;
 b=i9Nz+qe7srTVNdP/cD8xiLqfw3avmD2mK9GqE0Mf+LhhasuidPWDFAghrQolqM8aAcK2Vs
 qiJrWpg1/teXt+BgsDOWf4d0j40EaL8NjeX61eZS4YvWecMZyeFnI5ZajUAe1NLRW/fb/h
 yWeLKI8D2iMjrq1CMnIEyRtxGWDtuYU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-247-qSvx-YxXMWiSbhTKL01krw-1; Fri, 04 Mar 2022 09:24:09 -0500
X-MC-Unique: qSvx-YxXMWiSbhTKL01krw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE4A81006AA5;
 Fri,  4 Mar 2022 14:24:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AFB0C832AE;
 Fri,  4 Mar 2022 14:23:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CDB6018009AC; Fri,  4 Mar 2022 15:21:24 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/35] paaudio: reduce effective playback buffer size
Date: Fri,  4 Mar 2022 15:21:06 +0100
Message-Id: <20220304142123.956171-19-kraxel@redhat.com>
In-Reply-To: <20220304142123.956171-1-kraxel@redhat.com>
References: <20220304142123.956171-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Message-Id: <20220301191311.26695-11-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/paaudio.c | 47 +++++++++++++++++++++++++++++++----------------
 1 file changed, 31 insertions(+), 16 deletions(-)

diff --git a/audio/paaudio.c b/audio/paaudio.c
index 9df1e69c086f..d94f858ec761 100644
--- a/audio/paaudio.c
+++ b/audio/paaudio.c
@@ -201,39 +201,53 @@ unlock_and_fail:
     return 0;
 }
 
+static size_t qpa_buffer_get_free(HWVoiceOut *hw)
+{
+    PAVoiceOut *p = (PAVoiceOut *)hw;
+    PAConnection *c = p->g->conn;
+    size_t l;
+
+    pa_threaded_mainloop_lock(c->mainloop);
+
+    CHECK_DEAD_GOTO(c, p->stream, unlock_and_fail,
+                    "pa_threaded_mainloop_lock failed\n");
+    if (pa_stream_get_state(p->stream) != PA_STREAM_READY) {
+        /* wait for stream to become ready */
+        l = 0;
+        goto unlock;
+    }
+
+    l = pa_stream_writable_size(p->stream);
+    CHECK_SUCCESS_GOTO(c, l != (size_t) -1, unlock_and_fail,
+                       "pa_stream_writable_size failed\n");
+
+unlock:
+    pa_threaded_mainloop_unlock(c->mainloop);
+    return l;
+
+unlock_and_fail:
+    pa_threaded_mainloop_unlock(c->mainloop);
+    return 0;
+}
+
 static void *qpa_get_buffer_out(HWVoiceOut *hw, size_t *size)
 {
-    PAVoiceOut *p = (PAVoiceOut *) hw;
+    PAVoiceOut *p = (PAVoiceOut *)hw;
     PAConnection *c = p->g->conn;
     void *ret;
-    size_t l;
     int r;
 
     pa_threaded_mainloop_lock(c->mainloop);
 
     CHECK_DEAD_GOTO(c, p->stream, unlock_and_fail,
                     "pa_threaded_mainloop_lock failed\n");
-    if (pa_stream_get_state(p->stream) != PA_STREAM_READY) {
-        /* wait for stream to become ready */
-        l = 0;
-        ret = NULL;
-        goto unlock;
-    }
-
-    l = pa_stream_writable_size(p->stream);
-    CHECK_SUCCESS_GOTO(c, l != (size_t) -1, unlock_and_fail,
-                       "pa_stream_writable_size failed\n");
 
     *size = -1;
     r = pa_stream_begin_write(p->stream, &ret, size);
     CHECK_SUCCESS_GOTO(c, r >= 0, unlock_and_fail,
                        "pa_stream_begin_write failed\n");
 
-unlock:
     pa_threaded_mainloop_unlock(c->mainloop);
-    if (*size > l) {
-        *size = l;
-    }
     return ret;
 
 unlock_and_fail:
@@ -901,6 +915,7 @@ static struct audio_pcm_ops qpa_pcm_ops = {
     .init_out = qpa_init_out,
     .fini_out = qpa_fini_out,
     .write    = qpa_write,
+    .buffer_get_free = qpa_buffer_get_free,
     .get_buffer_out = qpa_get_buffer_out,
     .put_buffer_out = qpa_put_buffer_out,
     .volume_out = qpa_volume_out,
-- 
2.35.1


