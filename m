Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5A56F9323
	for <lists+qemu-devel@lfdr.de>; Sat,  6 May 2023 18:39:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvKvQ-0000tQ-2Y; Sat, 06 May 2023 12:38:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pvKvN-0000t4-7l
 for qemu-devel@nongnu.org; Sat, 06 May 2023 12:38:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pvKvL-00041L-IB
 for qemu-devel@nongnu.org; Sat, 06 May 2023 12:38:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683391098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DSiBYtkg23qajy6CBc1hd0LBHS3qyBtHW1cfIuhjnB0=;
 b=GyUwnjm6QCxUNXjJIV8iVZLk6BtVrV0ltqeCgHdBlAgbn88w4CGZ7ZQou1PZlPAcGOEdN7
 0jh+zP6LST18zLDA6lE0pbsEHefaTRm8h+aj1/DEHhXpmdAXd5V2Cq7Te8IfrYNS2KTx74
 vYAkL1Vw/kBmcS1PEuUY9zTxhszkCyg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-tbh9k-5kNvWTolnBhgRtJg-1; Sat, 06 May 2023 12:38:14 -0400
X-MC-Unique: tbh9k-5kNvWTolnBhgRtJg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DEFD1185A79C;
 Sat,  6 May 2023 16:38:13 +0000 (UTC)
Received: from localhost (unknown [10.39.208.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B7133492B07;
 Sat,  6 May 2023 16:38:12 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 dbassey@redhat.com,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 08/12] audio/pw: factorize some common code
Date: Sat,  6 May 2023 20:37:31 +0400
Message-Id: <20230506163735.3481387-9-marcandre.lureau@redhat.com>
In-Reply-To: <20230506163735.3481387-1-marcandre.lureau@redhat.com>
References: <20230506163735.3481387-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 audio/pwaudio.c | 85 ++++++++++++++++++++-----------------------------
 1 file changed, 34 insertions(+), 51 deletions(-)

diff --git a/audio/pwaudio.c b/audio/pwaudio.c
index d0bc4680a6..67df53948c 100644
--- a/audio/pwaudio.c
+++ b/audio/pwaudio.c
@@ -66,6 +66,9 @@ typedef struct PWVoiceIn {
     PWVoice v;
 } PWVoiceIn;
 
+#define PW_VOICE_IN(v) ((PWVoiceIn*)v)
+#define PW_VOICE_OUT(v) ((PWVoiceOut*)v)
+
 static void
 stream_destroy(void *data)
 {
@@ -630,62 +633,55 @@ qpw_init_in(HWVoiceIn *hw, struct audsettings *as, void *drv_opaque)
 }
 
 static void
-qpw_fini_out(HWVoiceOut *hw)
+qpw_voice_fini(PWVoice *v)
 {
-    PWVoiceOut *pw = (PWVoiceOut *) hw;
-    PWVoice *v = &pw->v;
+    pwaudio *c = v->g;
 
-    if (v->stream) {
-        pwaudio *c = v->g;
-        pw_thread_loop_lock(c->thread_loop);
-        pw_stream_destroy(v->stream);
-        v->stream = NULL;
-        pw_thread_loop_unlock(c->thread_loop);
+    if (!v->stream) {
+        return;
     }
+    pw_thread_loop_lock(c->thread_loop);
+    pw_stream_destroy(v->stream);
+    v->stream = NULL;
+    pw_thread_loop_unlock(c->thread_loop);
 }
 
 static void
-qpw_fini_in(HWVoiceIn *hw)
+qpw_fini_out(HWVoiceOut *hw)
 {
-    PWVoiceIn *pw = (PWVoiceIn *) hw;
-    PWVoice *v = &pw->v;
+    qpw_voice_fini(&PW_VOICE_OUT(hw)->v);
+}
 
-    if (v->stream) {
-        pwaudio *c = v->g;
-        pw_thread_loop_lock(c->thread_loop);
-        pw_stream_destroy(v->stream);
-        v->stream = NULL;
-        pw_thread_loop_unlock(c->thread_loop);
-    }
+static void
+qpw_fini_in(HWVoiceIn *hw)
+{
+    qpw_voice_fini(&PW_VOICE_IN(hw)->v);
 }
 
 static void
-qpw_enable_out(HWVoiceOut *hw, bool enable)
+qpw_voice_set_enabled(PWVoice *v, bool enable)
 {
-    PWVoiceOut *po = (PWVoiceOut *) hw;
-    PWVoice *v = &po->v;
     pwaudio *c = v->g;
     pw_thread_loop_lock(c->thread_loop);
     pw_stream_set_active(v->stream, enable);
     pw_thread_loop_unlock(c->thread_loop);
 }
 
+static void
+qpw_enable_out(HWVoiceOut *hw, bool enable)
+{
+    qpw_voice_set_enabled(&PW_VOICE_OUT(hw)->v, enable);
+}
+
 static void
 qpw_enable_in(HWVoiceIn *hw, bool enable)
 {
-    PWVoiceIn *pi = (PWVoiceIn *) hw;
-    PWVoice *v = &pi->v;
-    pwaudio *c = v->g;
-    pw_thread_loop_lock(c->thread_loop);
-    pw_stream_set_active(v->stream, enable);
-    pw_thread_loop_unlock(c->thread_loop);
+    qpw_voice_set_enabled(&PW_VOICE_IN(hw)->v, enable);
 }
 
 static void
-qpw_volume_out(HWVoiceOut *hw, Volume *vol)
+qpw_voice_set_volume(PWVoice *v, Volume *vol)
 {
-    PWVoiceOut *pw = (PWVoiceOut *) hw;
-    PWVoice *v = &pw->v;
     pwaudio *c = v->g;
     int i, ret;
 
@@ -707,28 +703,15 @@ qpw_volume_out(HWVoiceOut *hw, Volume *vol)
 }
 
 static void
-qpw_volume_in(HWVoiceIn *hw, Volume *vol)
+qpw_volume_out(HWVoiceOut *hw, Volume *vol)
 {
-    PWVoiceIn *pw = (PWVoiceIn *) hw;
-    PWVoice *v = &pw->v;
-    pwaudio *c = v->g;
-    int i, ret;
-
-    pw_thread_loop_lock(c->thread_loop);
-    v->volume.channels = vol->channels;
-
-    for (i = 0; i < vol->channels; ++i) {
-        v->volume.values[i] = (float)vol->vol[i] / 255;
-    }
-
-    ret = pw_stream_set_control(v->stream,
-        SPA_PROP_channelVolumes, v->volume.channels, v->volume.values, 0);
-    trace_pw_vol(ret == 0 ? "success" : "failed");
+    qpw_voice_set_volume(&PW_VOICE_OUT(hw)->v, vol);
+}
 
-    v->muted = vol->mute;
-    float val = v->muted ? 1.f : 0.f;
-    ret = pw_stream_set_control(v->stream, SPA_PROP_mute, 1, &val, 0);
-    pw_thread_loop_unlock(c->thread_loop);
+static void
+qpw_volume_in(HWVoiceIn *hw, Volume *vol)
+{
+    qpw_voice_set_volume(&PW_VOICE_IN(hw)->v, vol);
 }
 
 static int wait_resync(pwaudio *pw)
-- 
2.40.1


