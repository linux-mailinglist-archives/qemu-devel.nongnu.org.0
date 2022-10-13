Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 319475FD579
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 09:17:11 +0200 (CEST)
Received: from localhost ([::1]:51854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oisSr-0003Sb-TM
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 03:17:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ois5j-0005Sf-IT
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 02:53:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ois5c-0006px-GH
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 02:53:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665643987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oe/bA1NghX+pkkJCL4QRBTkli058N6Ldvjf7q2z7Zbk=;
 b=MKoTrKt0H2u5hKdols94972nxgUtVv2ZgWBmVgDUQi1OTbe4pBrzZJu1hZxi9Hqk+YU+aK
 7dbCaY3fPALEoA+2s/QDxapPZU1VHRIs166pHlxM35Ny3BnA0GZ4kiTj48K3eyyLHWvKEM
 05fYNXq9VWA8nO83E5fEvvnTAM2vRQs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-mQJPigrYMKuuL_mt72V94A-1; Thu, 13 Oct 2022 02:53:06 -0400
X-MC-Unique: mQJPigrYMKuuL_mt72V94A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E768C857020;
 Thu, 13 Oct 2022 06:53:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 69904112C070;
 Thu, 13 Oct 2022 06:53:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EE7FD18009BF; Thu, 13 Oct 2022 08:52:24 +0200 (CEST)
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
Subject: [PULL 11/26] audio: fix sw->buf size for audio recording
Date: Thu, 13 Oct 2022 08:52:09 +0200
Message-Id: <20221013065224.1864145-12-kraxel@redhat.com>
In-Reply-To: <20221013065224.1864145-1-kraxel@redhat.com>
References: <20221013065224.1864145-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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

The calculation of the buffer size needed to store audio samples
after resampling is wrong for audio recording. For audio recording
sw->ratio is calculated as

sw->ratio = frontend sample rate / backend sample rate.

From this follows

frontend samples = frontend sample rate / backend sample rate
 * backend samples
frontend samples = sw->ratio * backend samples

In 2 of 3 places in the audio recording code where sw->ratio
is used in a calculation to get the number of frontend frames,
the calculation is wrong. Fix this. The 3rd formula in
audio_pcm_sw_read() is correct.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/71
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Acked-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220923183640.8314-11-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/audio_template.h | 4 ++++
 audio/audio.c          | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/audio/audio_template.h b/audio/audio_template.h
index 98ab557684d8..720a32e57e7d 100644
--- a/audio/audio_template.h
+++ b/audio/audio_template.h
@@ -110,7 +110,11 @@ static int glue (audio_pcm_sw_alloc_resources_, TYPE) (SW *sw)
         return 0;
     }
 
+#ifdef DAC
     samples = ((int64_t) sw->HWBUF->size << 32) / sw->ratio;
+#else
+    samples = (int64_t)sw->HWBUF->size * sw->ratio >> 32;
+#endif
 
     sw->buf = audio_calloc(__func__, samples, sizeof(struct st_sample));
     if (!sw->buf) {
diff --git a/audio/audio.c b/audio/audio.c
index ed2b9d5f7e15..886725747bda 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -995,7 +995,7 @@ void AUD_set_active_in (SWVoiceIn *sw, int on)
  */
 static size_t audio_frontend_frames_in(SWVoiceIn *sw, size_t frames_in)
 {
-    return ((int64_t)frames_in << 32) / sw->ratio;
+    return (int64_t)frames_in * sw->ratio >> 32;
 }
 
 static size_t audio_get_avail (SWVoiceIn *sw)
-- 
2.37.3


