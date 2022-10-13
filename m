Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 900B05FD5A1
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 09:41:30 +0200 (CEST)
Received: from localhost ([::1]:52472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oisqP-00008j-LN
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 03:41:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ois5X-0005RB-VN
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 02:53:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ois5V-0006pD-Fm
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 02:53:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665643980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cfD8WOxu84cCbW8HYO0WD4LOWgInjSMMpU0eJWzRzKU=;
 b=ftbyhUrm80N0Gd4BFFYtHbayhnTb8f8F3IqsspLKynr5DtuO79GUbr5pOPWaYE7+eeKNwG
 6Xh+KOhgidPRmh4eCVvQrHLUalmfsKZHhOUGr6w7KfWSjzJ+j+2L1o/t4MOfs8fxTr3RrR
 FOe6pxfch+LCIDY0bNc1wRBkJ/jpAlY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-LpUVLOJxMk2XyYfON6BuOg-1; Thu, 13 Oct 2022 02:52:58 -0400
X-MC-Unique: LpUVLOJxMk2XyYfON6BuOg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B73348630CB;
 Thu, 13 Oct 2022 06:52:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BF2E384426;
 Thu, 13 Oct 2022 06:52:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C293F1800919; Thu, 13 Oct 2022 08:52:24 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: [PULL 08/26] audio: swap audio_rate_get_bytes() function parameters
Date: Thu, 13 Oct 2022 08:52:06 +0200
Message-Id: <20221013065224.1864145-9-kraxel@redhat.com>
In-Reply-To: <20221013065224.1864145-1-kraxel@redhat.com>
References: <20221013065224.1864145-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

Swap the rate and info parameters of the audio_rate_get_bytes()
function to align the parameter order with the rest of the
audio_rate_*() functions.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220923183640.8314-8-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/audio_int.h  | 2 +-
 audio/audio.c      | 2 +-
 audio/dbusaudio.c  | 4 ++--
 audio/noaudio.c    | 4 ++--
 audio/spiceaudio.c | 2 +-
 audio/wavaudio.c   | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/audio/audio_int.h b/audio/audio_int.h
index 97e20e842927..e87ce014a04b 100644
--- a/audio/audio_int.h
+++ b/audio/audio_int.h
@@ -265,7 +265,7 @@ typedef struct RateCtl {
 void audio_rate_start(RateCtl *rate);
 size_t audio_rate_peek_bytes(RateCtl *rate, struct audio_pcm_info *info);
 void audio_rate_add_bytes(RateCtl *rate, size_t bytes_used);
-size_t audio_rate_get_bytes(struct audio_pcm_info *info, RateCtl *rate,
+size_t audio_rate_get_bytes(RateCtl *rate, struct audio_pcm_info *info,
                             size_t bytes_avail);
 
 static inline size_t audio_ring_dist(size_t dst, size_t src, size_t len)
diff --git a/audio/audio.c b/audio/audio.c
index 61cdd73df5aa..7213f8bf07ca 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -2276,7 +2276,7 @@ void audio_rate_add_bytes(RateCtl *rate, size_t bytes_used)
     rate->bytes_sent += bytes_used;
 }
 
-size_t audio_rate_get_bytes(struct audio_pcm_info *info, RateCtl *rate,
+size_t audio_rate_get_bytes(RateCtl *rate, struct audio_pcm_info *info,
                             size_t bytes_avail)
 {
     size_t bytes;
diff --git a/audio/dbusaudio.c b/audio/dbusaudio.c
index a3d656d3b017..722df0355e1e 100644
--- a/audio/dbusaudio.c
+++ b/audio/dbusaudio.c
@@ -82,7 +82,7 @@ static void *dbus_get_buffer_out(HWVoiceOut *hw, size_t *size)
     }
 
     *size = MIN(vo->buf_size - vo->buf_pos, *size);
-    *size = audio_rate_get_bytes(&hw->info, &vo->rate, *size);
+    *size = audio_rate_get_bytes(&vo->rate, &hw->info, *size);
 
     return vo->buf + vo->buf_pos;
 
@@ -343,7 +343,7 @@ dbus_read(HWVoiceIn *hw, void *buf, size_t size)
 
     trace_dbus_audio_read(size);
 
-    /* size = audio_rate_get_bytes(&hw->info, &vo->rate, size); */
+    /* size = audio_rate_get_bytes(&vo->rate, &hw->info, size); */
 
     g_hash_table_iter_init(&iter, da->in_listeners);
     while (g_hash_table_iter_next(&iter, NULL, (void **)&listener)) {
diff --git a/audio/noaudio.c b/audio/noaudio.c
index 84a6bfbb1c87..4fdee5adecff 100644
--- a/audio/noaudio.c
+++ b/audio/noaudio.c
@@ -44,7 +44,7 @@ typedef struct NoVoiceIn {
 static size_t no_write(HWVoiceOut *hw, void *buf, size_t len)
 {
     NoVoiceOut *no = (NoVoiceOut *) hw;
-    return audio_rate_get_bytes(&hw->info, &no->rate, len);
+    return audio_rate_get_bytes(&no->rate, &hw->info, len);
 }
 
 static int no_init_out(HWVoiceOut *hw, struct audsettings *as, void *drv_opaque)
@@ -89,7 +89,7 @@ static void no_fini_in (HWVoiceIn *hw)
 static size_t no_read(HWVoiceIn *hw, void *buf, size_t size)
 {
     NoVoiceIn *no = (NoVoiceIn *) hw;
-    int64_t bytes = audio_rate_get_bytes(&hw->info, &no->rate, size);
+    int64_t bytes = audio_rate_get_bytes(&no->rate, &hw->info, size);
 
     audio_pcm_info_clear_buf(&hw->info, buf, bytes / hw->info.bytes_per_frame);
     return bytes;
diff --git a/audio/spiceaudio.c b/audio/spiceaudio.c
index f52f3a8bbb66..d17ef1a25efb 100644
--- a/audio/spiceaudio.c
+++ b/audio/spiceaudio.c
@@ -239,7 +239,7 @@ static void line_in_fini (HWVoiceIn *hw)
 static size_t line_in_read(HWVoiceIn *hw, void *buf, size_t len)
 {
     SpiceVoiceIn *in = container_of (hw, SpiceVoiceIn, hw);
-    uint64_t to_read = audio_rate_get_bytes(&hw->info, &in->rate, len) >> 2;
+    uint64_t to_read = audio_rate_get_bytes(&in->rate, &hw->info, len) >> 2;
     size_t ready = spice_server_record_get_samples(&in->sin, buf, to_read);
 
     /*
diff --git a/audio/wavaudio.c b/audio/wavaudio.c
index ac666335c783..3e1d84db83ee 100644
--- a/audio/wavaudio.c
+++ b/audio/wavaudio.c
@@ -42,7 +42,7 @@ typedef struct WAVVoiceOut {
 static size_t wav_write_out(HWVoiceOut *hw, void *buf, size_t len)
 {
     WAVVoiceOut *wav = (WAVVoiceOut *) hw;
-    int64_t bytes = audio_rate_get_bytes(&hw->info, &wav->rate, len);
+    int64_t bytes = audio_rate_get_bytes(&wav->rate, &hw->info, len);
     assert(bytes % hw->info.bytes_per_frame == 0);
 
     if (bytes && fwrite(buf, bytes, 1, wav->f) != 1) {
-- 
2.37.3


