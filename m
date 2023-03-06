Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2566AB6AE
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 07:56:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ4iK-0003g9-37; Mon, 06 Mar 2023 01:52:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ4i6-0003Qo-IC
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 01:52:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ4i4-0000Xl-W3
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 01:52:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678085556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EEK4Ke9sTNOLkOdNaNV6/DX7YOr0f8MCkCxyJOVC/TY=;
 b=YdYXwJqsXOw6lfAS7gruuD4xbzde0W5vMKFsAkKQgOWrO2vBdMQ3Vh0Xg8V6Da0FS1FCc3
 tdfQJZLanpGlqQwzOK3sXbfV3V3WQZTpV5OO2bameXkF8/AuiMHE+65qGXmtc5g3YOTNF8
 wvafhmMZeiwlIoNsP/V5DXAdgvLNgCg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-402-qIIcZhr2PCuWpdxPQQsXRQ-1; Mon, 06 Mar 2023 01:52:32 -0500
X-MC-Unique: qIIcZhr2PCuWpdxPQQsXRQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F9743C025B1;
 Mon,  6 Mar 2023 06:52:32 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E6622166B26;
 Mon,  6 Mar 2023 06:52:31 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: [PULL 06/27] audio/mixeng: use g_new0() instead of audio_calloc()
Date: Mon,  6 Mar 2023 10:51:41 +0400
Message-Id: <20230306065202.2160066-7-marcandre.lureau@redhat.com>
In-Reply-To: <20230306065202.2160066-1-marcandre.lureau@redhat.com>
References: <20230306065202.2160066-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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

With a n_structs argument of 1, g_new0() never returns NULL.
Also remove the unnecessary NULL checks.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20230121094735.11644-5-vr_qemu@t-online.de>
---
 audio/audio_template.h | 6 +-----
 audio/audio.c          | 5 -----
 audio/mixeng.c         | 7 +------
 3 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/audio/audio_template.h b/audio/audio_template.h
index 33af42ed8b..dfa440f778 100644
--- a/audio/audio_template.h
+++ b/audio/audio_template.h
@@ -141,11 +141,7 @@ static int glue (audio_pcm_sw_alloc_resources_, TYPE) (SW *sw)
 #else
     sw->rate = st_rate_start (sw->hw->info.freq, sw->info.freq);
 #endif
-    if (!sw->rate) {
-        g_free (sw->buf);
-        sw->buf = NULL;
-        return -1;
-    }
+
     return 0;
 }
 
diff --git a/audio/audio.c b/audio/audio.c
index 81f5c0bb1e..012d10996b 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -509,11 +509,6 @@ static int audio_attach_capture (HWVoiceOut *hw)
         sw->ratio = ((int64_t) hw_cap->info.freq << 32) / sw->info.freq;
         sw->vol = nominal_volume;
         sw->rate = st_rate_start (sw->info.freq, hw_cap->info.freq);
-        if (!sw->rate) {
-            dolog ("Could not start rate conversion for `%s'\n", SW_NAME (sw));
-            g_free (sw);
-            return -1;
-        }
         QLIST_INSERT_HEAD (&hw_cap->sw_head, sw, entries);
         QLIST_INSERT_HEAD (&hw->cap_head, sc, entries);
 #ifdef DEBUG_CAPTURE
diff --git a/audio/mixeng.c b/audio/mixeng.c
index 100a306d6f..fe454e0725 100644
--- a/audio/mixeng.c
+++ b/audio/mixeng.c
@@ -414,12 +414,7 @@ struct rate {
  */
 void *st_rate_start (int inrate, int outrate)
 {
-    struct rate *rate = audio_calloc(__func__, 1, sizeof(*rate));
-
-    if (!rate) {
-        dolog ("Could not allocate resampler (%zu bytes)\n", sizeof (*rate));
-        return NULL;
-    }
+    struct rate *rate = g_new0(struct rate, 1);
 
     rate->opos = 0;
 
-- 
2.39.2


