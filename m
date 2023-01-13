Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 503F166A12C
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 18:52:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMon-0006j8-AK; Fri, 13 Jan 2023 11:22:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pGMoj-0006en-Kf
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 11:22:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pGMog-0005m5-NA
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 11:22:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673626926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QUJZXwRhI/ZpOXg/x4d3lTmRvcHGDw/vsn6+oWZD5uY=;
 b=bts6saHwMu9R8IT+qqjcMRfPjd9reEOH34V4DQ8nuQ/8RQXeyjJt2G2tA46nLAF68IiaIG
 rRrT6p3xGfibxO65o7/D7+TuhTsEKU/39CWXZsuWvn2n7uYbPf+nmj7JJD2d1SWmXKvuAh
 DUR1OBuv6bsI+Wtnv2LeTMxV738Cp6U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-336-h_a9ZMgaM1Coyh0AoWYrXQ-1; Fri, 13 Jan 2023 11:22:02 -0500
X-MC-Unique: h_a9ZMgaM1Coyh0AoWYrXQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86DF78533DD;
 Fri, 13 Jan 2023 16:22:02 +0000 (UTC)
Received: from virtlab420.virt.lab.eng.bos.redhat.com
 (virtlab420.virt.lab.eng.bos.redhat.com [10.19.152.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2385E40C2004;
 Fri, 13 Jan 2023 16:22:02 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Bandan Das <bsd@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, libvir-list@redhat.com,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 2/9] audio: remove special audio_calloc function
Date: Fri, 13 Jan 2023 11:21:53 -0500
Message-Id: <20230113162200.3010804-3-berrange@redhat.com>
In-Reply-To: <20230113162200.3010804-1-berrange@redhat.com>
References: <20230113162200.3010804-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

The audio_calloc function does various checks on the size and
nmembers parameters to detect various error conditions. There
are only 5 callers

 * alsa_poll_helper: the pollfd count is small and bounded,
 * audio_pcm_create_voice_pair_: allocating a single fixed
   size struct
 * audio_pcm_sw_alloc_resources_: samples could be negative
   zero, or overflow, so needs a check
 * audio_pcm_hw_add_new_: voice size could be zero for
   backends that don't support audio input
 * st_rate_start: allocating a single fixed size struct

IOW, only two of the callers need special error checks and
it is clearer if their respective checks are inlined. Thus
audio_calloc can be eliminated.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 audio/alsaaudio.c            |  6 +-----
 audio/audio.c                | 20 --------------------
 audio/audio_int.h            |  1 -
 audio/audio_template.h       | 28 ++++++++++++++--------------
 audio/mixeng.c               |  7 +------
 tests/qtest/fuzz-sb16-test.c |  6 ++++--
 6 files changed, 20 insertions(+), 48 deletions(-)

diff --git a/audio/alsaaudio.c b/audio/alsaaudio.c
index 714bfb6453..5f50dfa0bf 100644
--- a/audio/alsaaudio.c
+++ b/audio/alsaaudio.c
@@ -222,11 +222,7 @@ static int alsa_poll_helper (snd_pcm_t *handle, struct pollhlp *hlp, int mask)
         return -1;
     }
 
-    pfds = audio_calloc ("alsa_poll_helper", count, sizeof (*pfds));
-    if (!pfds) {
-        dolog ("Could not initialize poll mode\n");
-        return -1;
-    }
+    pfds = g_new0(struct pollfd, count);
 
     err = snd_pcm_poll_descriptors (handle, pfds, count);
     if (err < 0) {
diff --git a/audio/audio.c b/audio/audio.c
index 7b4b957945..f397072a1f 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -146,26 +146,6 @@ static inline int audio_bits_to_index (int bits)
     }
 }
 
-void *audio_calloc (const char *funcname, int nmemb, size_t size)
-{
-    int cond;
-    size_t len;
-
-    len = nmemb * size;
-    cond = !nmemb || !size;
-    cond |= nmemb < 0;
-    cond |= len < size;
-
-    if (audio_bug ("audio_calloc", cond)) {
-        AUD_log (NULL, "%s passed invalid arguments to audio_calloc\n",
-                 funcname);
-        AUD_log (NULL, "nmemb=%d size=%zu (len=%zu)\n", nmemb, size, len);
-        return NULL;
-    }
-
-    return g_malloc0 (len);
-}
-
 void AUD_vlog (const char *cap, const char *fmt, va_list ap)
 {
     if (cap) {
diff --git a/audio/audio_int.h b/audio/audio_int.h
index e87ce014a0..b0cc2cd390 100644
--- a/audio/audio_int.h
+++ b/audio/audio_int.h
@@ -251,7 +251,6 @@ void audio_pcm_init_info (struct audio_pcm_info *info, struct audsettings *as);
 void audio_pcm_info_clear_buf (struct audio_pcm_info *info, void *buf, int len);
 
 int audio_bug (const char *funcname, int cond);
-void *audio_calloc (const char *funcname, int nmemb, size_t size);
 
 void audio_run(AudioState *s, const char *msg);
 
diff --git a/audio/audio_template.h b/audio/audio_template.h
index 720a32e57e..564cbb1f01 100644
--- a/audio/audio_template.h
+++ b/audio/audio_template.h
@@ -116,13 +116,20 @@ static int glue (audio_pcm_sw_alloc_resources_, TYPE) (SW *sw)
     samples = (int64_t)sw->HWBUF->size * sw->ratio >> 32;
 #endif
 
-    sw->buf = audio_calloc(__func__, samples, sizeof(struct st_sample));
-    if (!sw->buf) {
-        dolog ("Could not allocate buffer for `%s' (%d samples)\n",
+    if (audio_bug(__func__, samples <= 0)) {
+        dolog ("Could not allocate buffer for '%s', samples %d <= 0\n",
                SW_NAME (sw), samples);
         return -1;
     }
 
+    if (audio_bug(__func__, (SIZE_MAX / sizeof(struct st_sample) < samples))) {
+        dolog ("Could not allocate buffer for '%s', samples %d overflows\n",
+               SW_NAME (sw), samples);
+        return -1;
+    }
+
+    sw->buf = g_new0(struct st_sample, samples);
+
 #ifdef DAC
     sw->rate = st_rate_start (sw->info.freq, sw->hw->info.freq);
 #else
@@ -264,13 +271,12 @@ static HW *glue(audio_pcm_hw_add_new_, TYPE)(AudioState *s,
         return NULL;
     }
 
-    hw = audio_calloc(__func__, 1, glue(drv->voice_size_, TYPE));
-    if (!hw) {
-        dolog ("Can not allocate voice `%s' size %d\n",
-               drv->name, glue (drv->voice_size_, TYPE));
+    if (audio_bug(__func__, glue(drv->voice_size_, TYPE) == 0)) {
+        dolog ("Voice size is zero");
         return NULL;
     }
 
+    hw = g_malloc0(glue(drv->voice_size_, TYPE));
     hw->s = s;
     hw->pcm_ops = drv->pcm_ops;
 
@@ -398,12 +404,7 @@ static SW *glue(audio_pcm_create_voice_pair_, TYPE)(
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
@@ -424,7 +425,6 @@ err3:
     glue (audio_pcm_hw_gc_, TYPE) (&hw);
 err2:
     g_free (sw);
-err1:
     return NULL;
 }
 
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
 
diff --git a/tests/qtest/fuzz-sb16-test.c b/tests/qtest/fuzz-sb16-test.c
index fc445b1871..a28b93be3a 100644
--- a/tests/qtest/fuzz-sb16-test.c
+++ b/tests/qtest/fuzz-sb16-test.c
@@ -10,7 +10,8 @@
 #include "libqtest.h"
 
 /*
- * This used to trigger the assert in audio_calloc
+ * This used to trigger the audio_bug calls in
+ * audio_pcm_sw_alloc_resources
  * https://bugs.launchpad.net/qemu/+bug/1910603
  */
 static void test_fuzz_sb16_0x1c(void)
@@ -38,7 +39,8 @@ static void test_fuzz_sb16_0x91(void)
 }
 
 /*
- * This used to trigger the assert in audio_calloc
+ * This used to trigger the audio_bug calls in
+ * audio_pcm_sw_alloc_resources
  * through command 0xd4
  */
 static void test_fuzz_sb16_0xd4(void)
-- 
2.38.1


