Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 889B748E4E4
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 08:33:43 +0100 (CET)
Received: from localhost ([::1]:50434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8H5i-0005un-1j
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 02:33:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n8GUG-0007We-D4
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 01:55:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n8GUE-0007Sc-PO
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 01:55:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642143298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E2aP4LCS1zwAwH3RWdjldRbWxxjT6RN5o/mJnGtszRw=;
 b=GR6DLltmSaz0iw3pxJi1EVFbOtJQ/4Kcgv33/s7Nwf1UOdoRsXx/zyme/AgTR/bVT1X7Uo
 7vx8nDqAGQP/9rbnk0Nnlwn9oIjYWunDHXIiG+Z3Q1//ZmaYN24cBJUR8nFyUmFJICx3ZZ
 K+29hkBXss1zUeGpLdSpSezmYUnIZmw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-530-NfDg6pwfN3-bip7H8Gthng-1; Fri, 14 Jan 2022 01:54:54 -0500
X-MC-Unique: NfDg6pwfN3-bip7H8Gthng-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 850EA1023F59;
 Fri, 14 Jan 2022 06:54:53 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AC16510589D8;
 Fri, 14 Jan 2022 06:54:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9D4B8180063C; Fri, 14 Jan 2022 07:53:26 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/20] dsoundaudio: fix crackling audio recordings
Date: Fri, 14 Jan 2022 07:53:11 +0100
Message-Id: <20220114065326.782420-6-kraxel@redhat.com>
In-Reply-To: <20220114065326.782420-1-kraxel@redhat.com>
References: <20220114065326.782420-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

Audio recordings with the DirectSound backend don't sound right.
A look a the Microsoft online documentation tells us why.

From the DirectSound Programming Guide, Capture Buffer Information:
'You can safely copy data from the buffer only up to the read
cursor.'

Change the code to read up to the read cursor instead of the
capture cursor.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-Id: <20211226154017.6067-2-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/dsoundaudio.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/audio/dsoundaudio.c b/audio/dsoundaudio.c
index cfc79c129eee..3dd2c4d4a60b 100644
--- a/audio/dsoundaudio.c
+++ b/audio/dsoundaudio.c
@@ -536,13 +536,12 @@ static void *dsound_get_buffer_in(HWVoiceIn *hw, size_t *size)
     DSoundVoiceIn *ds = (DSoundVoiceIn *) hw;
     LPDIRECTSOUNDCAPTUREBUFFER dscb = ds->dsound_capture_buffer;
     HRESULT hr;
-    DWORD cpos, rpos, act_size;
+    DWORD rpos, act_size;
     size_t req_size;
     int err;
     void *ret;
 
-    hr = IDirectSoundCaptureBuffer_GetCurrentPosition(
-        dscb, &cpos, ds->first_time ? &rpos : NULL);
+    hr = IDirectSoundCaptureBuffer_GetCurrentPosition(dscb, NULL, &rpos);
     if (FAILED(hr)) {
         dsound_logerr(hr, "Could not get capture buffer position\n");
         *size = 0;
@@ -554,7 +553,7 @@ static void *dsound_get_buffer_in(HWVoiceIn *hw, size_t *size)
         ds->first_time = false;
     }
 
-    req_size = audio_ring_dist(cpos, hw->pos_emul, hw->size_emul);
+    req_size = audio_ring_dist(rpos, hw->pos_emul, hw->size_emul);
     req_size = MIN(*size, MIN(req_size, hw->size_emul - hw->pos_emul));
 
     if (req_size == 0) {
-- 
2.34.1


