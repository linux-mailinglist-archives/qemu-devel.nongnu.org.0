Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C967E669DF9
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 17:27:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMoo-0006n6-5o; Fri, 13 Jan 2023 11:22:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pGMol-0006g1-AD
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 11:22:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pGMoj-0005mP-BE
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 11:22:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673626927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KAQDfWpLcqoo9B3hgDRi7A7BLl+HhUfF24Yv3pMnP3I=;
 b=PL1uhUBkhlXyD/L9vyAl9Es2nIkJv/3+93WSVDoVK9nDmtXdQfGLV/16coO/rgS/ES0/jU
 h8FAOHRyNSoWySM2YSRXBc5tFQS74ux7Fkm1su5M+69lBSKGE+4tanKrcBUIMdvpb5yTZA
 h6EmsIzYsObrAS2jA3bmrB34zwN+yeg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-357-vEquTEDoOFu0D4j0Q6cDyQ-1; Fri, 13 Jan 2023 11:22:04 -0500
X-MC-Unique: vEquTEDoOFu0D4j0Q6cDyQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7E5280D0F2;
 Fri, 13 Jan 2023 16:22:03 +0000 (UTC)
Received: from virtlab420.virt.lab.eng.bos.redhat.com
 (virtlab420.virt.lab.eng.bos.redhat.com [10.19.152.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 744E240C2007;
 Fri, 13 Jan 2023 16:22:03 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Bandan Das <bsd@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, libvir-list@redhat.com,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 5/9] audio: remove empty AUD_remove_card method
Date: Fri, 13 Jan 2023 11:21:56 -0500
Message-Id: <20230113162200.3010804-6-berrange@redhat.com>
In-Reply-To: <20230113162200.3010804-1-berrange@redhat.com>
References: <20230113162200.3010804-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

Since the linked list of QEMUSoundCard structs was removed,
AUD_remove_card does nothing useful.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 audio/audio.c        | 4 ----
 audio/audio.h        | 1 -
 hw/audio/ac97.c      | 1 -
 hw/audio/adlib.c     | 1 -
 hw/audio/es1370.c    | 1 -
 hw/audio/gus.c       | 1 -
 hw/audio/hda-codec.c | 1 -
 hw/audio/wm8750.c    | 1 -
 hw/usb/dev-audio.c   | 1 -
 9 files changed, 12 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index 217095306f..00128c2ad7 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -1833,10 +1833,6 @@ void AUD_register_card (const char *name, QEMUSoundCard *card)
     }
 }
 
-void AUD_remove_card (QEMUSoundCard *card)
-{
-}
-
 static struct audio_pcm_ops capture_pcm_ops;
 
 CaptureVoiceOut *AUD_add_capture(
diff --git a/audio/audio.h b/audio/audio.h
index ebcc540431..8ee0e2159a 100644
--- a/audio/audio.h
+++ b/audio/audio.h
@@ -93,7 +93,6 @@ void AUD_vlog (const char *cap, const char *fmt, va_list ap) G_GNUC_PRINTF(2, 0)
 void AUD_log (const char *cap, const char *fmt, ...) G_GNUC_PRINTF(2, 3);
 
 void AUD_register_card (const char *name, QEMUSoundCard *card);
-void AUD_remove_card (QEMUSoundCard *card);
 CaptureVoiceOut *AUD_add_capture(
     AudioState *s,
     struct audsettings *as,
diff --git a/hw/audio/ac97.c b/hw/audio/ac97.c
index 364cdfa733..fd8d3abba4 100644
--- a/hw/audio/ac97.c
+++ b/hw/audio/ac97.c
@@ -1358,7 +1358,6 @@ static void ac97_exit(PCIDevice *dev)
     AUD_close_in(&s->card, s->voice_pi);
     AUD_close_out(&s->card, s->voice_po);
     AUD_close_in(&s->card, s->voice_mc);
-    AUD_remove_card(&s->card);
 }
 
 static Property ac97_properties[] = {
diff --git a/hw/audio/adlib.c b/hw/audio/adlib.c
index 5f979b1487..79b1b8e271 100644
--- a/hw/audio/adlib.c
+++ b/hw/audio/adlib.c
@@ -240,7 +240,6 @@ static void Adlib_fini (AdlibState *s)
 
     s->active = 0;
     s->enabled = 0;
-    AUD_remove_card (&s->card);
 }
 
 static MemoryRegionPortio adlib_portio_list[] = {
diff --git a/hw/audio/es1370.c b/hw/audio/es1370.c
index 54cc19a637..9a504db37e 100644
--- a/hw/audio/es1370.c
+++ b/hw/audio/es1370.c
@@ -882,7 +882,6 @@ static void es1370_exit(PCIDevice *dev)
     }
 
     AUD_close_in(&s->card, s->adc_voice);
-    AUD_remove_card(&s->card);
 }
 
 static Property es1370_properties[] = {
diff --git a/hw/audio/gus.c b/hw/audio/gus.c
index 42f010b671..c086502708 100644
--- a/hw/audio/gus.c
+++ b/hw/audio/gus.c
@@ -263,7 +263,6 @@ static void gus_realizefn (DeviceState *dev, Error **errp)
         );
 
     if (!s->voice) {
-        AUD_remove_card (&s->card);
         error_setg(errp, "No voice");
         return;
     }
diff --git a/hw/audio/hda-codec.c b/hw/audio/hda-codec.c
index feb8f9e2bb..f70a6798df 100644
--- a/hw/audio/hda-codec.c
+++ b/hw/audio/hda-codec.c
@@ -743,7 +743,6 @@ static void hda_audio_exit(HDACodecDevice *hda)
             AUD_close_in(&a->card, st->voice.in);
         }
     }
-    AUD_remove_card(&a->card);
 }
 
 static int hda_audio_post_load(void *opaque, int version)
diff --git a/hw/audio/wm8750.c b/hw/audio/wm8750.c
index b5722b37c3..b63943dd3e 100644
--- a/hw/audio/wm8750.c
+++ b/hw/audio/wm8750.c
@@ -634,7 +634,6 @@ static void wm8750_fini(I2CSlave *i2c)
     WM8750State *s = WM8750(i2c);
 
     wm8750_reset(I2C_SLAVE(s));
-    AUD_remove_card(&s->card);
     g_free(s);
 }
 #endif
diff --git a/hw/usb/dev-audio.c b/hw/usb/dev-audio.c
index 8748c1ba04..72cc89548e 100644
--- a/hw/usb/dev-audio.c
+++ b/hw/usb/dev-audio.c
@@ -934,7 +934,6 @@ static void usb_audio_unrealize(USBDevice *dev)
 
     usb_audio_set_output_altset(s, ALTSET_OFF);
     AUD_close_out(&s->card, s->out.voice);
-    AUD_remove_card(&s->card);
 
     streambuf_fini(&s->out.buf);
 }
-- 
2.38.1


