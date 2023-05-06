Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEF26F9329
	for <lists+qemu-devel@lfdr.de>; Sat,  6 May 2023 18:39:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvKvh-00016j-4C; Sat, 06 May 2023 12:38:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pvKvc-00012d-EO
 for qemu-devel@nongnu.org; Sat, 06 May 2023 12:38:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pvKvZ-000470-1F
 for qemu-devel@nongnu.org; Sat, 06 May 2023 12:38:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683391112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sRBsSFPQUNom8zCXwU2PFYMU5zu3L19EbvriFS9BoxI=;
 b=E6GhWmotVZbbiAb+xA7ftvDimWVkGWCh6BAxaH2iC7y7GZZozoVHU0DmKFDE95ibtOPnXD
 tvivVRIfmvPizqnGr8NED6T9p0qGC0E/uKNRlaBAy0KZwwMd3iyDlEtRCWz2+iW+CbvJb+
 Nm2igmv/7de7fFc6C+sqRVfa+XEqKuU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-1E_Pnw7ZNYarNlb5rcP7Jg-1; Sat, 06 May 2023 12:38:31 -0400
X-MC-Unique: 1E_Pnw7ZNYarNlb5rcP7Jg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8C5680080E;
 Sat,  6 May 2023 16:38:30 +0000 (UTC)
Received: from localhost (unknown [10.39.208.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B1B1C15BA0;
 Sat,  6 May 2023 16:38:29 +0000 (UTC)
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
Subject: [PATCH 12/12] audio/pw: improve channel position code
Date: Sat,  6 May 2023 20:37:35 +0400
Message-Id: <20230506163735.3481387-13-marcandre.lureau@redhat.com>
In-Reply-To: <20230506163735.3481387-1-marcandre.lureau@redhat.com>
References: <20230506163735.3481387-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124;
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

Follow PulseAudio backend comment and code, and only implement the
channels QEMU actually supports at this point, and add the same comment
about limits and future mappings. Simplify a bit the code.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 audio/pwaudio.c | 75 +++++++++++++++++--------------------------------
 1 file changed, 26 insertions(+), 49 deletions(-)

diff --git a/audio/pwaudio.c b/audio/pwaudio.c
index f74d506ec6..062610a704 100644
--- a/audio/pwaudio.c
+++ b/audio/pwaudio.c
@@ -417,8 +417,8 @@ pw_to_audfmt(enum spa_audio_format fmt, int *endianness,
 }
 
 static int
-create_stream(pwaudio *c, PWVoice *v, const char *stream_name,
-              const char *name, enum spa_direction dir)
+qpw_stream_new(pwaudio *c, PWVoice *v, const char *stream_name,
+               const char *name, enum spa_direction dir)
 {
     int res;
     uint32_t n_params;
@@ -482,62 +482,37 @@ create_stream(pwaudio *c, PWVoice *v, const char *stream_name,
     return 0;
 }
 
-static int
-qpw_stream_new(pwaudio *c, PWVoice *v, const char *stream_name,
-               const char *name, enum spa_direction dir)
+static void
+qpw_set_position(uint32_t channels, uint32_t position[SPA_AUDIO_MAX_CHANNELS])
 {
-    switch (v->info.channels) {
+    memcpy(position, (uint32_t[SPA_AUDIO_MAX_CHANNELS]) { SPA_AUDIO_CHANNEL_UNKNOWN, },
+           sizeof(uint32_t) * SPA_AUDIO_MAX_CHANNELS);
+    /*
+     * TODO: This currently expects the only frontend supporting more than 2
+     * channels is the usb-audio.  We will need some means to set channel
+     * order when a new frontend gains multi-channel support.
+     */
+    switch (channels) {
     case 8:
-        v->info.position[0] = SPA_AUDIO_CHANNEL_FL;
-        v->info.position[1] = SPA_AUDIO_CHANNEL_FR;
-        v->info.position[2] = SPA_AUDIO_CHANNEL_FC;
-        v->info.position[3] = SPA_AUDIO_CHANNEL_LFE;
-        v->info.position[4] = SPA_AUDIO_CHANNEL_RL;
-        v->info.position[5] = SPA_AUDIO_CHANNEL_RR;
-        v->info.position[6] = SPA_AUDIO_CHANNEL_SL;
-        v->info.position[7] = SPA_AUDIO_CHANNEL_SR;
-        break;
+        position[6] = SPA_AUDIO_CHANNEL_SL;
+        position[7] = SPA_AUDIO_CHANNEL_SR;
+        /* fallthrough */
     case 6:
-        v->info.position[0] = SPA_AUDIO_CHANNEL_FL;
-        v->info.position[1] = SPA_AUDIO_CHANNEL_FR;
-        v->info.position[2] = SPA_AUDIO_CHANNEL_FC;
-        v->info.position[3] = SPA_AUDIO_CHANNEL_LFE;
-        v->info.position[4] = SPA_AUDIO_CHANNEL_RL;
-        v->info.position[5] = SPA_AUDIO_CHANNEL_RR;
-        break;
-    case 5:
-        v->info.position[0] = SPA_AUDIO_CHANNEL_FL;
-        v->info.position[1] = SPA_AUDIO_CHANNEL_FR;
-        v->info.position[2] = SPA_AUDIO_CHANNEL_FC;
-        v->info.position[3] = SPA_AUDIO_CHANNEL_LFE;
-        v->info.position[4] = SPA_AUDIO_CHANNEL_RC;
-        break;
-    case 4:
-        v->info.position[0] = SPA_AUDIO_CHANNEL_FL;
-        v->info.position[1] = SPA_AUDIO_CHANNEL_FR;
-        v->info.position[2] = SPA_AUDIO_CHANNEL_FC;
-        v->info.position[3] = SPA_AUDIO_CHANNEL_RC;
-        break;
-    case 3:
-        v->info.position[0] = SPA_AUDIO_CHANNEL_FL;
-        v->info.position[1] = SPA_AUDIO_CHANNEL_FR;
-        v->info.position[2] = SPA_AUDIO_CHANNEL_LFE;
-        break;
+        position[2] = SPA_AUDIO_CHANNEL_FC;
+        position[3] = SPA_AUDIO_CHANNEL_LFE;
+        position[4] = SPA_AUDIO_CHANNEL_RL;
+        position[5] = SPA_AUDIO_CHANNEL_RR;
+        /* fallthrough */
     case 2:
-        v->info.position[0] = SPA_AUDIO_CHANNEL_FL;
-        v->info.position[1] = SPA_AUDIO_CHANNEL_FR;
+        position[0] = SPA_AUDIO_CHANNEL_FL;
+        position[1] = SPA_AUDIO_CHANNEL_FR;
         break;
     case 1:
-        v->info.position[0] = SPA_AUDIO_CHANNEL_MONO;
+        position[0] = SPA_AUDIO_CHANNEL_MONO;
         break;
     default:
-        for (size_t i = 0; i < v->info.channels; i++) {
-            v->info.position[i] = SPA_AUDIO_CHANNEL_UNKNOWN;
-        }
-        break;
+        dolog("Internal error: unsupported channel count %d\n", channels);
     }
-
-    return create_stream(c, v, stream_name, name, dir);
 }
 
 static int
@@ -555,6 +530,7 @@ qpw_init_out(HWVoiceOut *hw, struct audsettings *as, void *drv_opaque)
 
     v->info.format = audfmt_to_pw(as->fmt, as->endianness);
     v->info.channels = as->nchannels;
+    qpw_set_position(as->nchannels, v->info.position);
     v->info.rate = as->freq;
 
     obt_as.fmt =
@@ -601,6 +577,7 @@ qpw_init_in(HWVoiceIn *hw, struct audsettings *as, void *drv_opaque)
 
     v->info.format = audfmt_to_pw(as->fmt, as->endianness);
     v->info.channels = as->nchannels;
+    qpw_set_position(as->nchannels, v->info.position);
     v->info.rate = as->freq;
 
     obt_as.fmt =
-- 
2.40.1


