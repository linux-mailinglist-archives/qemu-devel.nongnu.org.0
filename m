Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C63306AB6AD
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 07:56:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ4iO-0003o7-NR; Mon, 06 Mar 2023 01:52:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ4iI-0003em-Cb
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 01:52:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ4iG-0000Yn-E2
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 01:52:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678085567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v9U2rnkH56RGiYZ1YG5+/56tL3XbQI3JHqSlBjinnv4=;
 b=RDPagj6G8cR7g/6Cz9c8AKp9n5v7wP+PgCp2ztDB+cKRSDPq73zmOi7PlJZZsJra0Wkmu8
 QzLI8YShbLtR9/W9sk4aSdivKgnu8JfXLG9q23OpFiKQYnDygG7xDLkFOTNZIGZuypf7Xk
 SoIoQCPJbh6tcVxO5OlZGvC6ndv176Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-354-h8ktXhfBOzO537ZV36JH7Q-1; Mon, 06 Mar 2023 01:52:46 -0500
X-MC-Unique: h8ktXhfBOzO537ZV36JH7Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE998101A521;
 Mon,  6 Mar 2023 06:52:45 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 265E240C83B6;
 Mon,  6 Mar 2023 06:52:44 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: [PULL 09/27] audio/audio_template: use g_new0() to replace
 audio_calloc()
Date: Mon,  6 Mar 2023 10:51:44 +0400
Message-Id: <20230306065202.2160066-10-marcandre.lureau@redhat.com>
In-Reply-To: <20230306065202.2160066-1-marcandre.lureau@redhat.com>
References: <20230306065202.2160066-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Volker Rümelin <vr_qemu@t-online.de>

Replace audio_calloc() with the equivalent g_new0().

With a n_structs argument >= 1, g_new0() never returns NULL.
Also remove the unnecessary NULL checks.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20230121094735.11644-8-vr_qemu@t-online.de>
---
 audio/audio_template.h | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/audio/audio_template.h b/audio/audio_template.h
index 592866f14a..980e1f4bd0 100644
--- a/audio/audio_template.h
+++ b/audio/audio_template.h
@@ -115,6 +115,12 @@ static int glue (audio_pcm_sw_alloc_resources_, TYPE) (SW *sw)
 #else
     samples = (int64_t)sw->HWBUF->size * sw->ratio >> 32;
 #endif
+    if (audio_bug(__func__, samples < 0)) {
+        dolog("Can not allocate buffer for `%s' (%d samples)\n",
+              SW_NAME(sw), samples);
+        return -1;
+    }
+
     if (samples == 0) {
         HW *hw = sw->hw;
         size_t f_fe_min;
@@ -129,12 +135,7 @@ static int glue (audio_pcm_sw_alloc_resources_, TYPE) (SW *sw)
         return -1;
     }
 
-    sw->buf = audio_calloc(__func__, samples, sizeof(struct st_sample));
-    if (!sw->buf) {
-        dolog ("Could not allocate buffer for `%s' (%d samples)\n",
-               SW_NAME (sw), samples);
-        return -1;
-    }
+    sw->buf = g_new0(st_sample, samples);
 
 #ifdef DAC
     sw->rate = st_rate_start (sw->info.freq, sw->hw->info.freq);
@@ -425,34 +426,28 @@ static SW *glue(audio_pcm_create_voice_pair_, TYPE)(
         hw_as = *as;
     }
 
-    sw = audio_calloc(__func__, 1, sizeof(*sw));
-    if (!sw) {
-        dolog ("Could not allocate soft voice `%s' (%zu bytes)\n",
-               sw_name ? sw_name : "unknown", sizeof (*sw));
-        goto err1;
-    }
+    sw = g_new0(SW, 1);
     sw->s = s;
 
     hw = glue(audio_pcm_hw_add_, TYPE)(s, &hw_as);
     if (!hw) {
         dolog("Could not create a backend for voice `%s'\n", sw_name);
-        goto err2;
+        goto err1;
     }
 
     glue (audio_pcm_hw_add_sw_, TYPE) (hw, sw);
 
     if (glue (audio_pcm_sw_init_, TYPE) (sw, hw, sw_name, as)) {
-        goto err3;
+        goto err2;
     }
 
     return sw;
 
-err3:
+err2:
     glue (audio_pcm_hw_del_sw_, TYPE) (sw);
     glue (audio_pcm_hw_gc_, TYPE) (&hw);
-err2:
-    g_free (sw);
 err1:
+    g_free(sw);
     return NULL;
 }
 
-- 
2.39.2


