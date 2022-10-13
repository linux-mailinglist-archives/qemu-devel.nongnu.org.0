Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D475FD594
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 09:35:06 +0200 (CEST)
Received: from localhost ([::1]:51928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiskC-0005GB-9e
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 03:35:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ois5C-0005J7-UF
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 02:52:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ois5B-0006nH-8p
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 02:52:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665643960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=22pBYRTIMvEPA0Y2kGJFhykaWUMI7kqIIgn167stpvc=;
 b=BS5JyL3r1BhSeBTWip6y6mWyCNlVAJ238qhHnZGMm1QMJZN+mmszuwIjaycr1XNxI5khuX
 OhLbVqd6kBLDNyMojkvYv4iytjijIzolIHGx2KPhPal4kamspEQ8PKXrZzDzA1St6E3quN
 7ebWvCPwBgnQ9EqX/atzZJinsNKGLAY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-498-AsYnbbXWPB2xkgMuqHcWcg-1; Thu, 13 Oct 2022 02:52:37 -0400
X-MC-Unique: AsYnbbXWPB2xkgMuqHcWcg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D501F3806703;
 Thu, 13 Oct 2022 06:52:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 74B742166BA3;
 Thu, 13 Oct 2022 06:52:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 81AF5180062C; Thu, 13 Oct 2022 08:52:24 +0200 (CEST)
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
Subject: [PULL 04/26] alsaaudio: reduce playback latency
Date: Thu, 13 Oct 2022 08:52:02 +0200
Message-Id: <20221013065224.1864145-5-kraxel@redhat.com>
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

Change the buffer_get_free pcm_ops function to report the free
ALSA playback buffer. The generic buffer becomes a temporary
buffer and is empty after a call to audio_run_out().

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Acked-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220923183640.8314-4-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/alsaaudio.c | 38 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/audio/alsaaudio.c b/audio/alsaaudio.c
index 4a61378cd757..7a2a94cd427d 100644
--- a/audio/alsaaudio.c
+++ b/audio/alsaaudio.c
@@ -602,6 +602,42 @@ static int alsa_open(bool in, struct alsa_params_req *req,
     return -1;
 }
 
+static size_t alsa_buffer_get_free(HWVoiceOut *hw)
+{
+    ALSAVoiceOut *alsa = (ALSAVoiceOut *)hw;
+    snd_pcm_sframes_t avail;
+    size_t alsa_free, generic_free, generic_in_use;
+
+    avail = snd_pcm_avail_update(alsa->handle);
+    if (avail < 0) {
+        if (avail == -EPIPE) {
+            if (!alsa_recover(alsa->handle)) {
+                avail = snd_pcm_avail_update(alsa->handle);
+            }
+        }
+        if (avail < 0) {
+            alsa_logerr(avail,
+                        "Could not obtain number of available frames\n");
+            avail = 0;
+        }
+    }
+
+    alsa_free = avail * hw->info.bytes_per_frame;
+    generic_free = audio_generic_buffer_get_free(hw);
+    generic_in_use = hw->samples * hw->info.bytes_per_frame - generic_free;
+    if (generic_in_use) {
+        /*
+         * This code can only be reached in the unlikely case that
+         * snd_pcm_avail_update() returned a larger number of frames
+         * than snd_pcm_writei() could write. Make sure that all
+         * remaining bytes in the generic buffer can be written.
+         */
+        alsa_free = alsa_free > generic_in_use ? alsa_free - generic_in_use : 0;
+    }
+
+    return alsa_free;
+}
+
 static size_t alsa_write(HWVoiceOut *hw, void *buf, size_t len)
 {
     ALSAVoiceOut *alsa = (ALSAVoiceOut *) hw;
@@ -916,7 +952,7 @@ static struct audio_pcm_ops alsa_pcm_ops = {
     .init_out = alsa_init_out,
     .fini_out = alsa_fini_out,
     .write    = alsa_write,
-    .buffer_get_free = audio_generic_buffer_get_free,
+    .buffer_get_free = alsa_buffer_get_free,
     .run_buffer_out = audio_generic_run_buffer_out,
     .enable_out = alsa_enable_out,
 
-- 
2.37.3


