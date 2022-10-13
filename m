Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C355FD560
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 09:09:22 +0200 (CEST)
Received: from localhost ([::1]:59244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oisLI-0005ns-P9
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 03:09:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ois5W-0005R7-PQ
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 02:53:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ois5U-0006p9-Ro
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 02:53:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665643980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2NWDorLfic0TPnK8g2a/41AqpcyAcvzd3Rv0Q6FjG6c=;
 b=b+H3q8m/kObuchOoomfTglg3h0fdK4dqDDZH/mgpOcCjF3O/Wbanof8eoIxzbpl80vwDfu
 xY7I9NEa2yOSbwaWlhoUJEmZao0oCFfsThwpJ9RoxdnYQaU2B01yHS1atV1DczbIruo27O
 Ze5InQtrh1Q/96CEpoxatEFgmJfXS6U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-604-rH4DsIx_P-G4TFeKUnUMiw-1; Thu, 13 Oct 2022 02:52:57 -0400
X-MC-Unique: rH4DsIx_P-G4TFeKUnUMiw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 61A841C075A0;
 Thu, 13 Oct 2022 06:52:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B11442166BA3;
 Thu, 13 Oct 2022 06:52:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9D54C180079B; Thu, 13 Oct 2022 08:52:24 +0200 (CEST)
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
Subject: [PULL 06/26] spiceaudio: add a pcm_ops buffer_get_free function
Date: Thu, 13 Oct 2022 08:52:04 +0200
Message-Id: <20221013065224.1864145-7-kraxel@redhat.com>
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

It seems there is a demand [1] for low latency playback over
SPICE. Add a pcm_ops buffer_get_free function to reduce the
playback latency. The mixing engine buffer becomes a temporary
buffer.

[1] https://lists.nongnu.org/archive/html/qemu-devel/2022-01/msg01644.html

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220923183640.8314-6-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/spiceaudio.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/audio/spiceaudio.c b/audio/spiceaudio.c
index a8d370fe6f31..22892a7b9d42 100644
--- a/audio/spiceaudio.c
+++ b/audio/spiceaudio.c
@@ -120,6 +120,13 @@ static void line_out_fini (HWVoiceOut *hw)
     spice_server_remove_interface (&out->sin.base);
 }
 
+static size_t line_out_get_free(HWVoiceOut *hw)
+{
+    SpiceVoiceOut *out = container_of(hw, SpiceVoiceOut, hw);
+
+    return audio_rate_peek_bytes(&out->rate, &hw->info);
+}
+
 static void *line_out_get_buffer(HWVoiceOut *hw, size_t *size)
 {
     SpiceVoiceOut *out = container_of(hw, SpiceVoiceOut, hw);
@@ -133,8 +140,6 @@ static void *line_out_get_buffer(HWVoiceOut *hw, size_t *size)
         *size = MIN((out->fsize - out->fpos) << 2, *size);
     }
 
-    *size = audio_rate_get_bytes(&hw->info, &out->rate, *size);
-
     return out->frame + out->fpos;
 }
 
@@ -142,6 +147,8 @@ static size_t line_out_put_buffer(HWVoiceOut *hw, void *buf, size_t size)
 {
     SpiceVoiceOut *out = container_of(hw, SpiceVoiceOut, hw);
 
+    audio_rate_add_bytes(&out->rate, size);
+
     if (buf) {
         assert(buf == out->frame + out->fpos && out->fpos <= out->fsize);
         out->fpos += size >> 2;
@@ -282,6 +289,7 @@ static struct audio_pcm_ops audio_callbacks = {
     .init_out = line_out_init,
     .fini_out = line_out_fini,
     .write    = audio_generic_write,
+    .buffer_get_free = line_out_get_free,
     .get_buffer_out = line_out_get_buffer,
     .put_buffer_out = line_out_put_buffer,
     .enable_out = line_out_enable,
-- 
2.37.3


