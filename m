Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A46F6AB6AA
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 07:56:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ4jK-0007tP-Qd; Mon, 06 Mar 2023 01:53:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ4jH-0007g5-Pg
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 01:53:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ4jG-0000jD-2y
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 01:53:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678085629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8NqWQI79MCAj9hoRz4fbSI9k2RbTZEpAHjv0JP+qiFE=;
 b=XezDOlpBZMjlqSsqpO0bPNr7cA6s4eTBv4QiVEQGrrXNoGDqqqIsvReFAcKz1aZe1M8KRT
 eCQBAtRahfznTRmzYk3eW7ospUC19iRhGNIRlcnXYctmxeH+1z6Kc/pK48AVDA+3CN4Md7
 2dtqjnV+rdMFgkSGJDGAA05Iw+7LVJo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-271-94OgoeOXNtq1KQ3nNXd-KA-1; Mon, 06 Mar 2023 01:53:48 -0500
X-MC-Unique: 94OgoeOXNtq1KQ3nNXd-KA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9A7985A588;
 Mon,  6 Mar 2023 06:53:47 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0337D492C3E;
 Mon,  6 Mar 2023 06:53:46 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: [PULL 23/27] audio: rename variables in audio_pcm_sw_read()
Date: Mon,  6 Mar 2023 10:51:58 +0400
Message-Id: <20230306065202.2160066-24-marcandre.lureau@redhat.com>
In-Reply-To: <20230306065202.2160066-1-marcandre.lureau@redhat.com>
References: <20230306065202.2160066-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124;
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

The audio_pcm_sw_read() function uses a few very unspecific
variable names. Rename them for better readability.

ret => total_out
total => total_in
size => buf_len
samples => frames_out_max

Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-Id: <20230224190555.7409-11-vr_qemu@t-online.de>
---
 audio/audio.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index 9e9c03a42e..22c36d6660 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -576,10 +576,10 @@ static void audio_pcm_sw_resample_in(SWVoiceIn *sw,
     }
 }
 
-static size_t audio_pcm_sw_read(SWVoiceIn *sw, void *buf, size_t size)
+static size_t audio_pcm_sw_read(SWVoiceIn *sw, void *buf, size_t buf_len)
 {
     HWVoiceIn *hw = sw->hw;
-    size_t samples, live, ret, swlim, total;
+    size_t live, frames_out_max, swlim, total_in, total_out;
 
     live = hw->total_samples_captured - sw->total_hw_samples_acquired;
     if (!live) {
@@ -590,20 +590,20 @@ static size_t audio_pcm_sw_read(SWVoiceIn *sw, void *buf, size_t size)
         return 0;
     }
 
-    samples = size / sw->info.bytes_per_frame;
+    frames_out_max = buf_len / sw->info.bytes_per_frame;
 
     swlim = (live * sw->ratio) >> 32;
-    swlim = MIN (swlim, samples);
+    swlim = MIN(swlim, frames_out_max);
 
-    audio_pcm_sw_resample_in(sw, live, swlim, &total, &ret);
+    audio_pcm_sw_resample_in(sw, live, swlim, &total_in, &total_out);
 
     if (!hw->pcm_ops->volume_in) {
-        mixeng_volume(sw->resample_buf.buffer, ret, &sw->vol);
+        mixeng_volume(sw->resample_buf.buffer, total_out, &sw->vol);
     }
+    sw->clip(buf, sw->resample_buf.buffer, total_out);
 
-    sw->clip(buf, sw->resample_buf.buffer, ret);
-    sw->total_hw_samples_acquired += total;
-    return ret * sw->info.bytes_per_frame;
+    sw->total_hw_samples_acquired += total_in;
+    return total_out * sw->info.bytes_per_frame;
 }
 
 /*
-- 
2.39.2


