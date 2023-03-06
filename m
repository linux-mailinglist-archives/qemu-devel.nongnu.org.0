Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B956AB6A8
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 07:55:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ4jZ-0001fJ-UR; Mon, 06 Mar 2023 01:54:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ4jX-0001Sx-9B
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 01:54:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ4jV-0000mU-Kr
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 01:54:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678085645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HF65SJRLcmD1BZEkBuHNjZmgrFQItRq/7E7fKp0fdPM=;
 b=Gd74GXc8IyDRSynCeEKC1gO3PsBQdZ2cSH8gdmeEGApvTSKJ43qAgCTTD+D88WMVKhkTOc
 tZlwkVmXjrwBcYFXKdi2Ej3CfdtzT64HI+zKc49fwp0v5h2OtBAi1toXTYVe6h0lSOH4H8
 p8M1U3TIMEE/mBNONN+tWUi5mrhc8bk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-360-XVBWNL3vPFOAZDQflGoLUw-1; Mon, 06 Mar 2023 01:54:01 -0500
X-MC-Unique: XVBWNL3vPFOAZDQflGoLUw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5ACFE3C10C6A;
 Mon,  6 Mar 2023 06:54:01 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9963B40C10FA;
 Mon,  6 Mar 2023 06:54:00 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: [PULL 26/27] audio/audio_template: substitute sw->hw with hw
Date: Mon,  6 Mar 2023 10:52:01 +0400
Message-Id: <20230306065202.2160066-27-marcandre.lureau@redhat.com>
In-Reply-To: <20230306065202.2160066-1-marcandre.lureau@redhat.com>
References: <20230306065202.2160066-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Volker Rümelin <vr_qemu@t-online.de>

Substitute sw->hw with hw in the audio_pcm_sw_alloc_resources_*
functions.

Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-Id: <20230224190555.7409-14-vr_qemu@t-online.de>
---
 audio/audio_template.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/audio/audio_template.h b/audio/audio_template.h
index 0d8aab6fad..7e116426c7 100644
--- a/audio/audio_template.h
+++ b/audio/audio_template.h
@@ -107,6 +107,7 @@ static void glue (audio_pcm_sw_free_resources_, TYPE) (SW *sw)
 
 static int glue (audio_pcm_sw_alloc_resources_, TYPE) (SW *sw)
 {
+    HW *hw = sw->hw;
     int samples;
 
     if (!glue(audio_get_pdo_, TYPE)(sw->s->dev)->mixing_engine) {
@@ -125,7 +126,6 @@ static int glue (audio_pcm_sw_alloc_resources_, TYPE) (SW *sw)
     }
 
     if (samples == 0) {
-        HW *hw = sw->hw;
         size_t f_fe_min;
 
         /* f_fe_min = ceil(1 [frames] * f_be [Hz] / size_be [frames]) */
@@ -149,9 +149,9 @@ static int glue (audio_pcm_sw_alloc_resources_, TYPE) (SW *sw)
     sw->resample_buf.pos = 0;
 
 #ifdef DAC
-    sw->rate = st_rate_start (sw->info.freq, sw->hw->info.freq);
+    sw->rate = st_rate_start(sw->info.freq, hw->info.freq);
 #else
-    sw->rate = st_rate_start (sw->hw->info.freq, sw->info.freq);
+    sw->rate = st_rate_start(hw->info.freq, sw->info.freq);
 #endif
 
     return 0;
-- 
2.39.2


