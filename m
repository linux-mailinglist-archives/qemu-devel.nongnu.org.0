Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E5A5FD5B7
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 09:48:46 +0200 (CEST)
Received: from localhost ([::1]:48046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oisxR-0006DW-A3
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 03:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ois60-0005Tv-M1
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 02:53:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ois5x-0006rb-Uj
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 02:53:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665644009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VaoOLD866Vv+iJJJCfZMtkIRjPcnzma/W44vHVgYlKo=;
 b=XD7gVDsjY5IIzqnuk9x7Qzl4B0yw1xA+5CaJDF5G0elxMkoTC8ILENMbvOw3YR1B525xm5
 PlAba8zC4bFpgg+kR7d9v9OlMoDM0RS41REeEMfRnu0qcxIr+7oocEnhZ9FLn0RFgI7K8Z
 bOUWU5sQ2IM2Vd6OwBHEAD8pB3R3Tyk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-6-X32Mbye9MHqJwt2nPS02iA-1; Thu, 13 Oct 2022 02:53:25 -0400
X-MC-Unique: X32Mbye9MHqJwt2nPS02iA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA8F81C075AA;
 Thu, 13 Oct 2022 06:53:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 06BC6492B0F;
 Thu, 13 Oct 2022 06:52:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DFCC118009A2; Thu, 13 Oct 2022 08:52:24 +0200 (CEST)
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
Subject: [PULL 10/26] audio: refactor audio_get_avail()
Date: Thu, 13 Oct 2022 08:52:08 +0200
Message-Id: <20221013065224.1864145-11-kraxel@redhat.com>
In-Reply-To: <20221013065224.1864145-1-kraxel@redhat.com>
References: <20221013065224.1864145-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

Split out the code in audio_get_avail() that calculates the
buffer size that the audio frontend can read. This is similar
to the code changes in audio_get_free().

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220923183640.8314-10-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/audio.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index 28262ffd58a5..ed2b9d5f7e15 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -986,6 +986,18 @@ void AUD_set_active_in (SWVoiceIn *sw, int on)
     }
 }
 
+/**
+ * audio_frontend_frames_in() - returns the number of frames the resampling
+ * code generates from frames_in frames
+ *
+ * @sw: audio recording frontend
+ * @frames_in: number of frames
+ */
+static size_t audio_frontend_frames_in(SWVoiceIn *sw, size_t frames_in)
+{
+    return ((int64_t)frames_in << 32) / sw->ratio;
+}
+
 static size_t audio_get_avail (SWVoiceIn *sw)
 {
     size_t live;
@@ -1002,12 +1014,12 @@ static size_t audio_get_avail (SWVoiceIn *sw)
     }
 
     ldebug (
-        "%s: get_avail live %zu ret %" PRId64 "\n",
+        "%s: get_avail live %zu frontend frames %zu\n",
         SW_NAME (sw),
-        live, (((int64_t) live << 32) / sw->ratio) * sw->info.bytes_per_frame
+        live, audio_frontend_frames_in(sw, live)
         );
 
-    return (((int64_t) live << 32) / sw->ratio) * sw->info.bytes_per_frame;
+    return live;
 }
 
 /**
@@ -1309,11 +1321,13 @@ static void audio_run_in (AudioState *s)
             sw->total_hw_samples_acquired -= min;
 
             if (sw->active) {
+                size_t sw_avail = audio_get_avail(sw);
                 size_t avail;
 
-                avail = audio_get_avail (sw);
+                avail = audio_frontend_frames_in(sw, sw_avail);
                 if (avail > 0) {
-                    sw->callback.fn (sw->callback.opaque, avail);
+                    sw->callback.fn(sw->callback.opaque,
+                                    avail * sw->info.bytes_per_frame);
                 }
             }
         }
-- 
2.37.3


