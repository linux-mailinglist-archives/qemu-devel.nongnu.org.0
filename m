Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 085154CD716
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 16:06:06 +0100 (CET)
Received: from localhost ([::1]:43300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ9VM-00077B-Uy
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 10:06:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nQ8r7-0005CK-Kr
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:24:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nQ8r5-0002As-CH
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:24:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646403865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cq+81k6haAkzX2UVOXPff9s/ab4llUF+4v1p/e72amA=;
 b=in5pJ9JfmCgeKJCmZbtpvXuFa8CiMEAmjK1Bp1HgwYqz3RZz8+uIe7j+Y+iGR0rJjipaXw
 qre+gHtEFPqfZ6gXQLNoXNSX4K/vDmIPexKT8KIPIXPLNY8guWI77tTvlsRMrMsElGBJd9
 Ln9GGd4fnDqqZEjOvduBv+yghvP6uyI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-280-8XZC0Lv0MlagsIOeVljdZg-1; Fri, 04 Mar 2022 09:24:23 -0500
X-MC-Unique: 8XZC0Lv0MlagsIOeVljdZg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68A561091DA3;
 Fri,  4 Mar 2022 14:24:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B4BFE7A52F;
 Fri,  4 Mar 2022 14:24:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id F18F218009B1; Fri,  4 Mar 2022 15:21:24 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/35] paaudio: fix samples vs. frames mix-up
Date: Fri,  4 Mar 2022 15:21:09 +0100
Message-Id: <20220304142123.956171-22-kraxel@redhat.com>
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

Now that the mixing buffer size no longer adds to playback
latency, fix the samples vs. frames mix-up in the mixing buffer
size calculation. This change will go largely unnoticed as long
as the user doesn't use a buffer-size smaller than timer-period.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-Id: <20220301191311.26695-14-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/paaudio.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/audio/paaudio.c b/audio/paaudio.c
index d94f858ec761..a53ed85e0b82 100644
--- a/audio/paaudio.c
+++ b/audio/paaudio.c
@@ -549,11 +549,8 @@ static int qpa_init_out(HWVoiceOut *hw, struct audsettings *as,
     }
 
     audio_pcm_init_info (&hw->info, &obt_as);
-    /*
-     * This is wrong. hw->samples counts in frames. hw->samples will be
-     * number of channels times larger than expected.
-     */
-    hw->samples = audio_buffer_samples(
+    /* hw->samples counts in frames */
+    hw->samples = audio_buffer_frames(
         qapi_AudiodevPaPerDirectionOptions_base(ppdo), &obt_as, 46440);
 
     return 0;
@@ -601,11 +598,8 @@ static int qpa_init_in(HWVoiceIn *hw, struct audsettings *as, void *drv_opaque)
     }
 
     audio_pcm_init_info (&hw->info, &obt_as);
-    /*
-     * This is wrong. hw->samples counts in frames. hw->samples will be
-     * number of channels times larger than expected.
-     */
-    hw->samples = audio_buffer_samples(
+    /* hw->samples counts in frames */
+    hw->samples = audio_buffer_frames(
         qapi_AudiodevPaPerDirectionOptions_base(ppdo), &obt_as, 46440);
 
     return 0;
-- 
2.35.1


