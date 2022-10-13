Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCA15FD585
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 09:28:20 +0200 (CEST)
Received: from localhost ([::1]:40884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oisdf-00016U-6r
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 03:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ois5h-0005Sb-DJ
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 02:53:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ois5f-0006qH-46
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 02:53:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665643990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FHpvsuC9U4sCqZdndPcAdcKhz8SwEBsvj7g1gDTuuEw=;
 b=R+/Cv+kM5TxMtvMIzGPQo9I2tA+jZq1pDiZc0HWtcFzyShXfsIHr8hYM81qq9fgNA+vQRY
 f2LHUxKcoGhB8bKUEs55w6YqnGHKyeXHCNuqejT02y8dG4/TXNm9vt+RAOcvsKAt+pMHp+
 qheh+NTA78XSzcb5osIR/xi1KBrazv8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-Ig2ZqQOlMLiNsyFbNvZgSA-1; Thu, 13 Oct 2022 02:53:07 -0400
X-MC-Unique: Ig2ZqQOlMLiNsyFbNvZgSA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9AB3C101A5DC;
 Thu, 13 Oct 2022 06:52:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ADB4A40C2064;
 Thu, 13 Oct 2022 06:52:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 908DE1800634; Thu, 13 Oct 2022 08:52:24 +0200 (CEST)
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
Subject: [PULL 05/26] audio: add more audio rate control functions
Date: Thu, 13 Oct 2022 08:52:03 +0200
Message-Id: <20221013065224.1864145-6-kraxel@redhat.com>
In-Reply-To: <20221013065224.1864145-1-kraxel@redhat.com>
References: <20221013065224.1864145-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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

The next patch needs two new rate control functions. The first
one returns the bytes needed at call time to maintain the
selected rate. The second one adjusts the bytes actually sent.

Split the audio_rate_get_bytes() function into these two
functions and reintroduce audio_rate_get_bytes().

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220923183640.8314-5-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/audio_int.h |  2 ++
 audio/audio.c     | 35 ++++++++++++++++++++++++-----------
 2 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/audio/audio_int.h b/audio/audio_int.h
index 2a6914d2aa65..97e20e842927 100644
--- a/audio/audio_int.h
+++ b/audio/audio_int.h
@@ -263,6 +263,8 @@ typedef struct RateCtl {
 } RateCtl;
 
 void audio_rate_start(RateCtl *rate);
+size_t audio_rate_peek_bytes(RateCtl *rate, struct audio_pcm_info *info);
+void audio_rate_add_bytes(RateCtl *rate, size_t bytes_used);
 size_t audio_rate_get_bytes(struct audio_pcm_info *info, RateCtl *rate,
                             size_t bytes_avail);
 
diff --git a/audio/audio.c b/audio/audio.c
index 567f953e66f9..61cdd73df5aa 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -2251,26 +2251,39 @@ void audio_rate_start(RateCtl *rate)
     rate->start_ticks = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
 }
 
-size_t audio_rate_get_bytes(struct audio_pcm_info *info, RateCtl *rate,
-                            size_t bytes_avail)
+size_t audio_rate_peek_bytes(RateCtl *rate, struct audio_pcm_info *info)
 {
     int64_t now;
     int64_t ticks;
     int64_t bytes;
-    int64_t samples;
-    size_t ret;
+    int64_t frames;
 
     now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
     ticks = now - rate->start_ticks;
     bytes = muldiv64(ticks, info->bytes_per_second, NANOSECONDS_PER_SECOND);
-    samples = (bytes - rate->bytes_sent) / info->bytes_per_frame;
-    if (samples < 0 || samples > 65536) {
-        AUD_log(NULL, "Resetting rate control (%" PRId64 " samples)\n", samples);
+    frames = (bytes - rate->bytes_sent) / info->bytes_per_frame;
+    if (frames < 0 || frames > 65536) {
+        AUD_log(NULL, "Resetting rate control (%" PRId64 " frames)\n", frames);
         audio_rate_start(rate);
-        samples = 0;
+        frames = 0;
     }
 
-    ret = MIN(samples * info->bytes_per_frame, bytes_avail);
-    rate->bytes_sent += ret;
-    return ret;
+    return frames * info->bytes_per_frame;
+}
+
+void audio_rate_add_bytes(RateCtl *rate, size_t bytes_used)
+{
+    rate->bytes_sent += bytes_used;
+}
+
+size_t audio_rate_get_bytes(struct audio_pcm_info *info, RateCtl *rate,
+                            size_t bytes_avail)
+{
+    size_t bytes;
+
+    bytes = audio_rate_peek_bytes(rate, info);
+    bytes = MIN(bytes, bytes_avail);
+    audio_rate_add_bytes(rate, bytes);
+
+    return bytes;
 }
-- 
2.37.3


