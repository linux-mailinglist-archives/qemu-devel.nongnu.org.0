Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1794CD72D
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 16:08:00 +0100 (CET)
Received: from localhost ([::1]:49292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ9XD-0002lE-Vx
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 10:08:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nQ8r7-0005CJ-JK
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:24:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nQ8r5-0002B8-Bz
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:24:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646403866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zT7KjHLWieymJsj01ioRSfePTxZrCZgrRYRGma6bf00=;
 b=b47iBAvdLluokeziHQFIYad8ZtpVeZs+EiPApTAiB3JDSGfucqIjk72rVKdoBBAClTa7hd
 U4cjWZNwkhZShltBITNCtm4Md+Fuz37DutxPqn40/rEBwYhEiMsZaPLzUSSAKCCQL16BbG
 /J5xYwaFkd0t4lEfaBAtTgPjld8GxqI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-338-zeIk67sXMrKLFAkMuHe2Ng-1; Fri, 04 Mar 2022 09:24:23 -0500
X-MC-Unique: zeIk67sXMrKLFAkMuHe2Ng-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C024835DE4;
 Fri,  4 Mar 2022 14:24:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DB2367A525;
 Fri,  4 Mar 2022 14:24:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E5BB418009B0; Fri,  4 Mar 2022 15:21:24 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/35] ossaudio: reduce effective playback buffer size
Date: Fri,  4 Mar 2022 15:21:08 +0100
Message-Id: <20220304142123.956171-21-kraxel@redhat.com>
In-Reply-To: <20220304142123.956171-1-kraxel@redhat.com>
References: <20220304142123.956171-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

Return the free buffer size for the mmapped case in function
oss_buffer_get_free() to reduce the effective playback buffer
size. All intermediate audio playback buffers become temporary
buffers.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-Id: <20220301191311.26695-13-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/ossaudio.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/audio/ossaudio.c b/audio/ossaudio.c
index 1bd680084065..da9c232222e3 100644
--- a/audio/ossaudio.c
+++ b/audio/ossaudio.c
@@ -394,7 +394,7 @@ static size_t oss_buffer_get_free(HWVoiceOut *hw)
     OSSVoiceOut *oss = (OSSVoiceOut *)hw;
 
     if (oss->mmapped) {
-        return INT_MAX;
+        return oss_get_available_bytes(oss);
     } else {
         return audio_generic_buffer_get_free(hw);
     }
@@ -402,9 +402,10 @@ static size_t oss_buffer_get_free(HWVoiceOut *hw)
 
 static void *oss_get_buffer_out(HWVoiceOut *hw, size_t *size)
 {
-    OSSVoiceOut *oss = (OSSVoiceOut *) hw;
+    OSSVoiceOut *oss = (OSSVoiceOut *)hw;
+
     if (oss->mmapped) {
-        *size = MIN(oss_get_available_bytes(oss), hw->size_emul - hw->pos_emul);
+        *size = hw->size_emul - hw->pos_emul;
         return hw->buf_emul + hw->pos_emul;
     } else {
         return audio_generic_get_buffer_out(hw, size);
-- 
2.35.1


