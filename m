Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D22D450DB9C
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 10:48:41 +0200 (CEST)
Received: from localhost ([::1]:45054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niuOe-0002Dn-UD
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 04:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1niu0E-0006gM-HN
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 04:23:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1niu07-0002ix-9T
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 04:23:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650874998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=djWLap2ip9TeVgEs3MLYUVyamfKL3oD+pQvj2lMaBx8=;
 b=gl2BsEyC3vO+zCSBBWEUV8ZWRtuHuQaIiYUncCtsWeoek/wZ1CqUIykzzIMhwlSVClVeRi
 6/OAn4J01JZJVwGvuRVIgaeqT4xRKLHs/wYI0g0UZ+7bzlF0gm0pO937P31ssLUGsB856Y
 laZJOfP2JWDRUIu6Us0tPNlHvu34m7M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-438-w0NTe48bPh2CHBc7ed6I1A-1; Mon, 25 Apr 2022 04:22:07 -0400
X-MC-Unique: w0NTe48bPh2CHBc7ed6I1A-1
Received: by mail-wm1-f69.google.com with SMTP id
 t2-20020a7bc3c2000000b003528fe59cb9so6872357wmj.5
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 01:22:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=djWLap2ip9TeVgEs3MLYUVyamfKL3oD+pQvj2lMaBx8=;
 b=1nSRmY4m4/6g6EJXagh+aUK5BtKPCv7wzF2eKiYvhAh+QlS411r6LBl+CwcusQ36eA
 cruIDrgPvf6jmTtpjfRlwOS8wZaZnD0541IPoctTB7xg5HMjV5MQLY++pgRxn4bXoyTa
 lEDn9FKXF1VGKPzpeWNWJZ8U+nbETdAdg1k/7wKfXsOiFt2rVtgWTaJZ9sDWZ6eTorKB
 tKIBEf1JswzbxTR7bRhKgLi/ARj8V43DaRBqG8QcHNO/hLzPasOV/A4IUFomX7AXMa/H
 PLPmAzQK6EzZjnuOgpdakKc4XYGb44e/k4ba9EP/5g0F7KDeS7pLUquckHp4+0XHq5Zy
 VPfA==
X-Gm-Message-State: AOAM531q0zf0+1G7YE1M+LCr74AwQBJ9sUvIFL/XHHe9HXhslgvNU6oq
 9MMCUATuWwbDBeth7bBWNAEoqbunhPrW9Op6qigW7//koefhr4uHIINzmVxjGdVLZXaG67TXPhM
 NzR6SbEGDB+mpv0Q=
X-Received: by 2002:a05:600c:3548:b0:393:ecaa:d7ae with SMTP id
 i8-20020a05600c354800b00393ecaad7aemr2568977wmq.86.1650874926020; 
 Mon, 25 Apr 2022 01:22:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSpUPPGaj+xMe6KY5CZvzkGY6Wv6xc3xHTYv5gfb5J122ujfuQZRQfwFQCPnAmuoxcSEng6g==
X-Received: by 2002:a05:600c:3548:b0:393:ecaa:d7ae with SMTP id
 i8-20020a05600c354800b00393ecaad7aemr2568947wmq.86.1650874925705; 
 Mon, 25 Apr 2022 01:22:05 -0700 (PDT)
Received: from wheatley.localdomain (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 p125-20020a1c2983000000b0038e5ca446bcsm11127092wmp.5.2022.04.25.01.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 01:22:05 -0700 (PDT)
Received: from wheatley.redhat.com (wheatley.k8r.cz [127.0.0.1])
 by wheatley.localdomain (Postfix) with ESMTP id 6A5FE67B1B62;
 Mon, 25 Apr 2022 10:22:02 +0200 (CEST)
From: Martin Kletzander <mkletzan@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/18] audio: Make AUD_register_card fallible and require
 audiodev=
Date: Mon, 25 Apr 2022 10:21:56 +0200
Message-Id: <92b31c6af268b8f2a4cc4ed5b20ee8d0e19f614d.1650874791.git.mkletzan@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1650874791.git.mkletzan@redhat.com>
References: <cover.1650874791.git.mkletzan@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mkletzan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
 Stefan Hajnoczi <stefanha@redhat.com>, libvir-list@redhat.com,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yanan Wang <wangyanan55@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Thomas Huth <huth@tuxfamily.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that all callers support error reporting with errp and all machine-default
devices use an explicit audiodev, this can be changed.  To make the detection
easier make AUD_register_card() return false on error.

Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
---
 audio/audio.c        | 7 +++++--
 audio/audio.h        | 2 +-
 hw/arm/omap2.c       | 3 ++-
 hw/audio/ac97.c      | 6 +++++-
 hw/audio/adlib.c     | 7 +++++--
 hw/audio/cs4231a.c   | 6 ++++--
 hw/audio/es1370.c    | 5 ++++-
 hw/audio/gus.c       | 4 +++-
 hw/audio/hda-codec.c | 5 ++++-
 hw/audio/lm4549.c    | 4 +++-
 hw/audio/pcspk.c     | 4 +++-
 hw/audio/sb16.c      | 6 ++++--
 hw/audio/wm8750.c    | 5 ++++-
 hw/display/xlnx_dp.c | 6 ++++--
 hw/input/tsc210x.c   | 3 ++-
 hw/usb/dev-audio.c   | 5 ++++-
 16 files changed, 57 insertions(+), 21 deletions(-)

diff --git a/audio/audio.c b/audio/audio.c
index 671845c65d18..b95aca444382 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -1822,15 +1822,18 @@ void audio_free_audiodev_list(AudiodevListHead *head)
     }
 }
 
-void AUD_register_card (const char *name, QEMUSoundCard *card)
+bool AUD_register_card (const char *name, QEMUSoundCard *card, Error **errp)
 {
     if (!card->state) {
-        card->state = audio_init(NULL, name);
+        error_setg(errp, "No audiodev specified for %s", name);
+        return false;
     }
 
     card->name = g_strdup (name);
     memset (&card->entries, 0, sizeof (card->entries));
     QLIST_INSERT_HEAD(&card->state->card_head, card, entries);
+
+    return true;
 }
 
 void AUD_remove_card (QEMUSoundCard *card)
diff --git a/audio/audio.h b/audio/audio.h
index 335704a4ddb1..9deed8ed6830 100644
--- a/audio/audio.h
+++ b/audio/audio.h
@@ -94,7 +94,7 @@ typedef struct QEMUAudioTimeStamp {
 void AUD_vlog (const char *cap, const char *fmt, va_list ap) G_GNUC_PRINTF(2, 0);
 void AUD_log (const char *cap, const char *fmt, ...) G_GNUC_PRINTF(2, 3);
 
-void AUD_register_card (const char *name, QEMUSoundCard *card);
+bool AUD_register_card (const char *name, QEMUSoundCard *card, Error **errp);
 void AUD_remove_card (QEMUSoundCard *card);
 CaptureVoiceOut *AUD_add_capture(
     AudioState *s,
diff --git a/hw/arm/omap2.c b/hw/arm/omap2.c
index 4ae524a1a1a6..407c24551c84 100644
--- a/hw/arm/omap2.c
+++ b/hw/arm/omap2.c
@@ -618,7 +618,8 @@ static struct omap_eac_s *omap_eac_init(struct omap_target_agent_s *ta,
                    s->codec.card.name);
     }
 
-    AUD_register_card("OMAP EAC", &s->codec.card);
+    /* We can quit here because this only gets called from machine class init */
+    AUD_register_card("OMAP EAC", &s->codec.card, &error_fatal);
 
     memory_region_init_io(&s->iomem, NULL, &omap_eac_ops, s, "omap.eac",
                           omap_l4_region_size(ta, 0));
diff --git a/hw/audio/ac97.c b/hw/audio/ac97.c
index fd0b3b97d5b5..8242ddb0f93d 100644
--- a/hw/audio/ac97.c
+++ b/hw/audio/ac97.c
@@ -1345,6 +1345,10 @@ static void ac97_realize(PCIDevice *dev, Error **errp)
     AC97LinkState *s = AC97(dev);
     uint8_t *c = s->dev.config;
 
+    if (!AUD_register_card ("ac97", &s->card, errp)) {
+        return;
+    }
+
     /* TODO: no need to override */
     c[PCI_COMMAND] = 0x00;      /* pcicmd pci command rw, ro */
     c[PCI_COMMAND + 1] = 0x00;
@@ -1378,7 +1382,7 @@ static void ac97_realize(PCIDevice *dev, Error **errp)
                            "ac97-nabm", 256);
     pci_register_bar (&s->dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &s->io_nam);
     pci_register_bar (&s->dev, 1, PCI_BASE_ADDRESS_SPACE_IO, &s->io_nabm);
-    AUD_register_card ("ac97", &s->card);
+
     ac97_on_reset(DEVICE(s));
 }
 
diff --git a/hw/audio/adlib.c b/hw/audio/adlib.c
index ba1be6c8378d..39932654f7f5 100644
--- a/hw/audio/adlib.c
+++ b/hw/audio/adlib.c
@@ -269,8 +269,6 @@ static void adlib_realizefn (DeviceState *dev, Error **errp)
     as.fmt = AUDIO_FORMAT_S16;
     as.endianness = AUDIO_HOST_ENDIANNESS;
 
-    AUD_register_card ("adlib", &s->card);
-
     s->voice = AUD_open_out (
         &s->card,
         s->voice,
@@ -285,6 +283,11 @@ static void adlib_realizefn (DeviceState *dev, Error **errp)
         return;
     }
 
+    if (!AUD_register_card ("adlib", &s->card, errp)) {
+        Adlib_fini (s);
+        return;
+    }
+
     s->samples = AUD_get_buffer_size_out (s->voice) >> SHIFT;
     s->mixbuf = g_malloc0 (s->samples << SHIFT);
 
diff --git a/hw/audio/cs4231a.c b/hw/audio/cs4231a.c
index f510b862efbe..d9353a51ec66 100644
--- a/hw/audio/cs4231a.c
+++ b/hw/audio/cs4231a.c
@@ -676,13 +676,15 @@ static void cs4231a_realizefn (DeviceState *dev, Error **errp)
         return;
     }
 
+    if (!AUD_register_card ("cs4231a", &s->card, errp)) {
+        return;
+    }
+
     s->pic = isa_get_irq(d, s->irq);
     k = ISADMA_GET_CLASS(s->isa_dma);
     k->register_channel(s->isa_dma, s->dma, cs_dma_read, s);
 
     isa_register_ioport (d, &s->ioports, s->port);
-
-    AUD_register_card ("cs4231a", &s->card);
 }
 
 static Property cs4231a_properties[] = {
diff --git a/hw/audio/es1370.c b/hw/audio/es1370.c
index 62359b84f279..77a84f83060b 100644
--- a/hw/audio/es1370.c
+++ b/hw/audio/es1370.c
@@ -867,7 +867,10 @@ static void es1370_realize(PCIDevice *dev, Error **errp)
     memory_region_init_io (&s->io, OBJECT(s), &es1370_io_ops, s, "es1370", 256);
     pci_register_bar (&s->dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &s->io);
 
-    AUD_register_card ("es1370", &s->card);
+    if (!AUD_register_card ("es1370", &s->card, errp)) {
+        return;
+    }
+
     es1370_reset (s);
 }
 
diff --git a/hw/audio/gus.c b/hw/audio/gus.c
index c7710a684b88..f890042baa97 100644
--- a/hw/audio/gus.c
+++ b/hw/audio/gus.c
@@ -245,7 +245,9 @@ static void gus_realizefn (DeviceState *dev, Error **errp)
         return;
     }
 
-    AUD_register_card ("gus", &s->card);
+    if (!AUD_register_card ("gus", &s->card, errp)) {
+        return;
+    }
 
     as.freq = s->freq;
     as.nchannels = 2;
diff --git a/hw/audio/hda-codec.c b/hw/audio/hda-codec.c
index e86a2adf31a0..7f8a7fa7ca1b 100644
--- a/hw/audio/hda-codec.c
+++ b/hw/audio/hda-codec.c
@@ -690,7 +690,10 @@ static void hda_audio_init(HDACodecDevice *hda,
     a->name = object_get_typename(OBJECT(a));
     dprint(a, 1, "%s: cad %d\n", __func__, a->hda.cad);
 
-    AUD_register_card("hda", &a->card);
+    if (!AUD_register_card("hda", &a->card, errp)) {
+        return;
+    }
+
     for (i = 0; i < a->desc->nnodes; i++) {
         node = a->desc->nodes + i;
         param = hda_codec_find_param(node, AC_PAR_AUDIO_WIDGET_CAP);
diff --git a/hw/audio/lm4549.c b/hw/audio/lm4549.c
index 418041bc9c6c..9afb81517e8f 100644
--- a/hw/audio/lm4549.c
+++ b/hw/audio/lm4549.c
@@ -289,7 +289,9 @@ void lm4549_init(lm4549_state *s, lm4549_callback data_req_cb, void* opaque,
     lm4549_reset(s);
 
     /* Register an audio card */
-    AUD_register_card("lm4549", &s->card);
+    if (!AUD_register_card("lm4549", &s->card, errp)) {
+        return;
+    }
 
     /* Open a default voice */
     as.freq = 48000;
diff --git a/hw/audio/pcspk.c b/hw/audio/pcspk.c
index 72bea5fb202a..41bf6a5cfdb3 100644
--- a/hw/audio/pcspk.c
+++ b/hw/audio/pcspk.c
@@ -122,7 +122,9 @@ static int pcspk_audio_init(PCSpkState *s)
         return 0;
     }
 
-    AUD_register_card(s_spk, &s->card);
+    if (!AUD_register_card(s_spk, &s->card, NULL)) {
+        return -1;
+    }
 
     s->voice = AUD_open_out(&s->card, s->voice, s_spk, s, pcspk_callback, &as);
     if (!s->voice) {
diff --git a/hw/audio/sb16.c b/hw/audio/sb16.c
index 593da2478c14..dd2131426cd3 100644
--- a/hw/audio/sb16.c
+++ b/hw/audio/sb16.c
@@ -1400,6 +1400,10 @@ static void sb16_realizefn (DeviceState *dev, Error **errp)
     SB16State *s = SB16 (dev);
     IsaDmaClass *k;
 
+    if (!AUD_register_card ("sb16", &s->card, errp)) {
+        return;
+    }
+
     s->isa_hdma = isa_get_dma(isa_bus_from_device(isadev), s->hdma);
     s->isa_dma = isa_get_dma(isa_bus_from_device(isadev), s->dma);
     if (!s->isa_dma || !s->isa_hdma) {
@@ -1432,8 +1436,6 @@ static void sb16_realizefn (DeviceState *dev, Error **errp)
     k->register_channel(s->isa_dma, s->dma, SB_read_DMA, s);
 
     s->can_write = 1;
-
-    AUD_register_card ("sb16", &s->card);
 }
 
 static Property sb16_properties[] = {
diff --git a/hw/audio/wm8750.c b/hw/audio/wm8750.c
index b5722b37c36b..57954a631442 100644
--- a/hw/audio/wm8750.c
+++ b/hw/audio/wm8750.c
@@ -624,7 +624,10 @@ static void wm8750_realize(DeviceState *dev, Error **errp)
 {
     WM8750State *s = WM8750(dev);
 
-    AUD_register_card(CODEC, &s->card);
+    if (!AUD_register_card(CODEC, &s->card, errp)) {
+        return;
+    }
+
     wm8750_reset(I2C_SLAVE(s));
 }
 
diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index b16d6be2b5cc..d6699f00d89e 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -1278,6 +1278,10 @@ static void xlnx_dp_realize(DeviceState *dev, Error **errp)
     DisplaySurface *surface;
     struct audsettings as;
 
+    if (!AUD_register_card("xlnx_dp.audio", &s->aud_card, errp)) {
+        return;
+    }
+
     aux_bus_realize(s->aux_bus);
 
     qdev_realize(DEVICE(s->dpcd), BUS(s->aux_bus), &error_fatal);
@@ -1296,8 +1300,6 @@ static void xlnx_dp_realize(DeviceState *dev, Error **errp)
     as.fmt = AUDIO_FORMAT_S16;
     as.endianness = 0;
 
-    AUD_register_card("xlnx_dp.audio", &s->aud_card);
-
     s->amixer_output_stream = AUD_open_out(&s->aud_card,
                                            s->amixer_output_stream,
                                            "xlnx_dp.audio.out",
diff --git a/hw/input/tsc210x.c b/hw/input/tsc210x.c
index f0b02bc72280..1ebf0199bfc7 100644
--- a/hw/input/tsc210x.c
+++ b/hw/input/tsc210x.c
@@ -1106,7 +1106,8 @@ static void tsc210x_init(TSC210xState *s,
                    s->card.name);
     }
 
-    AUD_register_card(s->name, &s->card);
+    /* We can quit here because this only gets called from machine class init */
+    AUD_register_card(s->name, &s->card, &error_fatal);
 
     qemu_register_reset((void *) tsc210x_reset, s);
     vmstate_register(NULL, 0, vmsd, s);
diff --git a/hw/usb/dev-audio.c b/hw/usb/dev-audio.c
index 8748c1ba0401..d5ac1f8962e3 100644
--- a/hw/usb/dev-audio.c
+++ b/hw/usb/dev-audio.c
@@ -944,12 +944,15 @@ static void usb_audio_realize(USBDevice *dev, Error **errp)
     USBAudioState *s = USB_AUDIO(dev);
     int i;
 
+    if (!AUD_register_card(TYPE_USB_AUDIO, &s->card, errp)) {
+        return;
+    }
+
     dev->usb_desc = s->multi ? &desc_audio_multi : &desc_audio;
 
     usb_desc_create_serial(dev);
     usb_desc_init(dev);
     s->dev.opaque = s;
-    AUD_register_card(TYPE_USB_AUDIO, &s->card);
 
     s->out.altset        = ALTSET_OFF;
     s->out.vol.mute      = false;
-- 
2.35.1


