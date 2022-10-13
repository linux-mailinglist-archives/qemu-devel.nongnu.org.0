Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E13A5FD5C7
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 09:54:54 +0200 (CEST)
Received: from localhost ([::1]:39530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oit3N-00010f-2p
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 03:54:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ois5f-0005SV-KM
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 02:53:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ois5e-0006qA-5H
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 02:53:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665643989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3NjuP7msiZQKgw04bfFBCvc+opey6RGEMdNOIBvRLWI=;
 b=iP0thDt4BkUZgVXrqkPd/LX5zFZgr97458fcNmVS3lIIxCu+FBhuZWCuBye87eeiOsS/Ku
 6pjzpht+sQj99ti8tlZ1Ta3eU+oL5UPCpQke8bs+UZSlpuAjpXEQ0Esl6lw5Swy2D1WjuB
 gXoxQQMaaciDdNBLIBjotKGpnovWH0I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-twVefpS_OcyZ9tGuOD6JJA-1; Thu, 13 Oct 2022 02:53:05 -0400
X-MC-Unique: twVefpS_OcyZ9tGuOD6JJA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BAE138631F4;
 Thu, 13 Oct 2022 06:53:04 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 305712166BC0;
 Thu, 13 Oct 2022 06:52:57 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D2FDA180093B; Thu, 13 Oct 2022 08:52:24 +0200 (CEST)
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
Subject: [PULL 09/26] audio: rename audio_sw_bytes_free()
Date: Thu, 13 Oct 2022 08:52:07 +0200
Message-Id: <20221013065224.1864145-10-kraxel@redhat.com>
In-Reply-To: <20221013065224.1864145-1-kraxel@redhat.com>
References: <20221013065224.1864145-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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

Rename and refactor audio_sw_bytes_free(). This function is not
limited to calculate the free audio buffer size. The renamed
function returns the number of frames instead of bytes.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220923183640.8314-9-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/audio.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index 7213f8bf07ca..28262ffd58a5 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -1010,9 +1010,16 @@ static size_t audio_get_avail (SWVoiceIn *sw)
     return (((int64_t) live << 32) / sw->ratio) * sw->info.bytes_per_frame;
 }
 
-static size_t audio_sw_bytes_free(SWVoiceOut *sw, size_t free)
+/**
+ * audio_frontend_frames_out() - returns the number of frames needed to
+ * get frames_out frames after resampling
+ *
+ * @sw: audio playback frontend
+ * @frames_out: number of frames
+ */
+static size_t audio_frontend_frames_out(SWVoiceOut *sw, size_t frames_out)
 {
-    return (((int64_t)free << 32) / sw->ratio) * sw->info.bytes_per_frame;
+    return ((int64_t)frames_out << 32) / sw->ratio;
 }
 
 static size_t audio_get_free(SWVoiceOut *sw)
@@ -1034,8 +1041,8 @@ static size_t audio_get_free(SWVoiceOut *sw)
     dead = sw->hw->mix_buf->size - live;
 
 #ifdef DEBUG_OUT
-    dolog("%s: get_free live %zu dead %zu sw_bytes %zu\n",
-          SW_NAME(sw), live, dead, audio_sw_bytes_free(sw, dead));
+    dolog("%s: get_free live %zu dead %zu frontend frames %zu\n",
+          SW_NAME(sw), live, dead, audio_frontend_frames_out(sw, dead));
 #endif
 
     return dead;
@@ -1156,13 +1163,14 @@ static void audio_run_out (AudioState *s)
                 size_t free;
 
                 if (hw_free > sw->total_hw_samples_mixed) {
-                    free = audio_sw_bytes_free(sw,
+                    free = audio_frontend_frames_out(sw,
                         MIN(sw_free, hw_free - sw->total_hw_samples_mixed));
                 } else {
                     free = 0;
                 }
                 if (free > 0) {
-                    sw->callback.fn(sw->callback.opaque, free);
+                    sw->callback.fn(sw->callback.opaque,
+                                    free * sw->info.bytes_per_frame);
                 }
             }
         }
-- 
2.37.3


