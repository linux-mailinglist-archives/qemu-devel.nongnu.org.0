Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 746946AFABC
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 00:50:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZh3Z-0005NI-Up; Tue, 07 Mar 2023 18:49:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZh37-000566-5d
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:48:54 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZh34-0002ml-E0
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:48:52 -0500
Received: by mail-wr1-x432.google.com with SMTP id l1so13739373wry.12
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 15:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678232929;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=On55k3PnTVKUXNRwlYNTFY0ojQbTf7BC/rL43z5BXv4=;
 b=eBOrcOUQEAxOdrxfGeKa8VvJOk65Vv+wM57LxI0QdaQNvc6g3xCyE5vvdfiQlDmQWb
 eAj4DpUbhroi1LnRoKapVXA3UBLN1ajPhd3I3/bNnszAiuVsAlFAiH+W+3dQkSsY14i8
 vbUXP/7znwU5RG/oJX6dOudZFw7E+kHmWqYD4Tb2aII6OV4geSsVrpvJgnwF+DLR0wey
 yVtqTVWtiOYa77/vDtI8IPsOKeI8CPOg9mLQu3SDkyApShaLDDoTOTyJ3/lJ8fu9bbgS
 5BjbjXmtPt8MPvUF8xOe/jqdu27bR3zbn7YUaHIR8FVAbdG2NWECbysy4hivhn4HS3YZ
 QpfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678232929;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=On55k3PnTVKUXNRwlYNTFY0ojQbTf7BC/rL43z5BXv4=;
 b=Lzcu0hP1/eCiYU1PsoS5NDPPQIhmK6sCu3fuiUvOO/ETu18JftnUBva8iH14ZXmkJA
 n9F80c/jTzK6YJOc6g4tdOezjYoJhbG2V4UOo9omwqt5azm0eC1DW9yCNyN1+CfZV5cD
 FyTR6A8TiM1V/pLBxW5HdmP0Ybsi3XtUvvWjEGTgbXkt3owPQr1sHVPLDZilyVgobbPQ
 c2jZftolVGgcsDFh0LPzMeX3T/m9RHFcyXqJS7nSyNcE27XZBzmcPXNz/jWWphztDlcp
 HzQFuMBdA4KhIAAliTQKAFBeLLZFIUgrVmjK6YzlNex89B1MDbIqJWXNTKgWFq58Ozd+
 6TxQ==
X-Gm-Message-State: AO0yUKVLwf7jiUF93i/idsQ0zAINj6dXXmzxw3E/Z7GG5SbWqXP14SwP
 Vr3NLL0D5lRyu/yZz8dTodJB7SzA+xknxGYPpkY=
X-Google-Smtp-Source: AK7set/ntTVXLO63U1j1t7QtdQfOjC80WiKPCM6SmgS+SPiLAraGAHi2evYFhLQSjmfQWLgcV/tmKA==
X-Received: by 2002:adf:ec09:0:b0:2c3:e5e6:f0d8 with SMTP id
 x9-20020adfec09000000b002c3e5e6f0d8mr10706750wrn.11.1678232929096; 
 Tue, 07 Mar 2023 15:48:49 -0800 (PST)
Received: from localhost.localdomain (57.red-88-29-179.dynamicip.rima-tde.net.
 [88.29.179.57]) by smtp.gmail.com with ESMTPSA id
 x8-20020adff648000000b002c3dc4131f5sm13805670wrp.18.2023.03.07.15.48.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Mar 2023 15:48:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Rene Engel <ReneEngel80@emailn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PULL 16/20] hw/audio/via-ac97: Basic implementation of audio playback
Date: Wed,  8 Mar 2023 00:47:07 +0100
Message-Id: <20230307234711.55375-17-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230307234711.55375-1-philmd@linaro.org>
References: <20230307234711.55375-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: BALATON Zoltan <balaton@eik.bme.hu>

Add basic implementation of the AC'97 sound part used in VIA south
bridge chips. Not all features of the device is emulated, only one
playback channel is supported for now but this is enough to get sound
output from some guests using this device on pegasos2.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Volker Rümelin <vr_qemu@t-online.de>
Tested-by: Rene Engel <ReneEngel80@emailn.de>
Message-Id: <63b99410895312f40e7be479f581da0805e605a1.1678188711.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/audio/trace-events     |   6 +
 hw/audio/via-ac97.c       | 455 +++++++++++++++++++++++++++++++++++++-
 hw/isa/trace-events       |   1 +
 hw/isa/vt82c686.c         |   2 +-
 include/hw/isa/vt82c686.h |  25 +++
 5 files changed, 482 insertions(+), 7 deletions(-)

diff --git a/hw/audio/trace-events b/hw/audio/trace-events
index e0e71cd9b1..4dec48a4fd 100644
--- a/hw/audio/trace-events
+++ b/hw/audio/trace-events
@@ -11,3 +11,9 @@ hda_audio_running(const char *stream, int nr, bool running) "st %s, nr %d, run %
 hda_audio_format(const char *stream, int chan, const char *fmt, int freq) "st %s, %d x %s @ %d Hz"
 hda_audio_adjust(const char *stream, int pos) "st %s, pos %d"
 hda_audio_overrun(const char *stream) "st %s"
+
+#via-ac97.c
+via_ac97_codec_write(uint8_t addr, uint16_t val) "0x%x <- 0x%x"
+via_ac97_sgd_fetch(uint32_t curr, uint32_t addr, char stop, char eol, char flag, uint32_t len) "curr=0x%x addr=0x%x %c%c%c len=%d"
+via_ac97_sgd_read(uint64_t addr, unsigned size, uint64_t val) "0x%"PRIx64" %d -> 0x%"PRIx64
+via_ac97_sgd_write(uint64_t addr, unsigned size, uint64_t val) "0x%"PRIx64" %d <- 0x%"PRIx64
diff --git a/hw/audio/via-ac97.c b/hw/audio/via-ac97.c
index d1a856f63d..676254b7a4 100644
--- a/hw/audio/via-ac97.c
+++ b/hw/audio/via-ac97.c
@@ -1,39 +1,482 @@
 /*
  * VIA south bridges sound support
  *
+ * Copyright (c) 2022-2023 BALATON Zoltan
+ *
  * This work is licensed under the GNU GPL license version 2 or later.
  */
 
 /*
- * TODO: This is entirely boiler plate just registering empty PCI devices
- * with the right ID guests expect, functionality should be added here.
+ * TODO: This is only a basic implementation of one audio playback channel
+ *       more functionality should be added here.
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "hw/isa/vt82c686.h"
-#include "hw/pci/pci_device.h"
+#include "ac97.h"
+#include "trace.h"
+
+#define CLEN_IS_EOL(x)  ((x)->clen & BIT(31))
+#define CLEN_IS_FLAG(x) ((x)->clen & BIT(30))
+#define CLEN_IS_STOP(x) ((x)->clen & BIT(29))
+#define CLEN_LEN(x)     ((x)->clen & 0xffffff)
+
+#define STAT_ACTIVE BIT(7)
+#define STAT_PAUSED BIT(6)
+#define STAT_TRIG   BIT(3)
+#define STAT_STOP   BIT(2)
+#define STAT_EOL    BIT(1)
+#define STAT_FLAG   BIT(0)
+
+#define CNTL_START  BIT(7)
+#define CNTL_TERM   BIT(6)
+#define CNTL_PAUSE  BIT(3)
+
+static void open_voice_out(ViaAC97State *s);
+
+static uint16_t codec_rates[] = { 8000, 11025, 16000, 22050, 32000, 44100,
+                                  48000 };
+
+#define CODEC_REG(s, o)  ((s)->codec_regs[(o) / 2])
+#define CODEC_VOL(vol, mask)  ((255 * ((vol) & mask)) / mask)
+
+static void codec_volume_set_out(ViaAC97State *s)
+{
+    int lvol, rvol, mute;
+
+    lvol = 255 - CODEC_VOL(CODEC_REG(s, AC97_Master_Volume_Mute) >> 8, 0x1f);
+    lvol *= 255 - CODEC_VOL(CODEC_REG(s, AC97_PCM_Out_Volume_Mute) >> 8, 0x1f);
+    lvol /= 255;
+    rvol = 255 - CODEC_VOL(CODEC_REG(s, AC97_Master_Volume_Mute), 0x1f);
+    rvol *= 255 - CODEC_VOL(CODEC_REG(s, AC97_PCM_Out_Volume_Mute), 0x1f);
+    rvol /= 255;
+    mute = CODEC_REG(s, AC97_Master_Volume_Mute) >> MUTE_SHIFT;
+    mute |= CODEC_REG(s, AC97_PCM_Out_Volume_Mute) >> MUTE_SHIFT;
+    AUD_set_volume_out(s->vo, mute, lvol, rvol);
+}
+
+static void codec_reset(ViaAC97State *s)
+{
+    memset(s->codec_regs, 0, sizeof(s->codec_regs));
+    CODEC_REG(s, AC97_Reset) = 0x6a90;
+    CODEC_REG(s, AC97_Master_Volume_Mute) = 0x8000;
+    CODEC_REG(s, AC97_Headphone_Volume_Mute) = 0x8000;
+    CODEC_REG(s, AC97_Master_Volume_Mono_Mute) = 0x8000;
+    CODEC_REG(s, AC97_Phone_Volume_Mute) = 0x8008;
+    CODEC_REG(s, AC97_Mic_Volume_Mute) = 0x8008;
+    CODEC_REG(s, AC97_Line_In_Volume_Mute) = 0x8808;
+    CODEC_REG(s, AC97_CD_Volume_Mute) = 0x8808;
+    CODEC_REG(s, AC97_Video_Volume_Mute) = 0x8808;
+    CODEC_REG(s, AC97_Aux_Volume_Mute) = 0x8808;
+    CODEC_REG(s, AC97_PCM_Out_Volume_Mute) = 0x8808;
+    CODEC_REG(s, AC97_Record_Gain_Mute) = 0x8000;
+    CODEC_REG(s, AC97_Powerdown_Ctrl_Stat) = 0x000f;
+    CODEC_REG(s, AC97_Extended_Audio_ID) = 0x0a05;
+    CODEC_REG(s, AC97_Extended_Audio_Ctrl_Stat) = 0x0400;
+    CODEC_REG(s, AC97_PCM_Front_DAC_Rate) = 48000;
+    CODEC_REG(s, AC97_PCM_LR_ADC_Rate) = 48000;
+    /* Sigmatel 9766 (STAC9766) */
+    CODEC_REG(s, AC97_Vendor_ID1) = 0x8384;
+    CODEC_REG(s, AC97_Vendor_ID2) = 0x7666;
+}
+
+static uint16_t codec_read(ViaAC97State *s, uint8_t addr)
+{
+    return CODEC_REG(s, addr);
+}
+
+static void codec_write(ViaAC97State *s, uint8_t addr, uint16_t val)
+{
+    trace_via_ac97_codec_write(addr, val);
+    switch (addr) {
+    case AC97_Reset:
+        codec_reset(s);
+        return;
+    case AC97_Master_Volume_Mute:
+    case AC97_PCM_Out_Volume_Mute:
+        if (addr == AC97_Master_Volume_Mute) {
+            if (val & BIT(13)) {
+                val |= 0x1f00;
+            }
+            if (val & BIT(5)) {
+                val |= 0x1f;
+            }
+        }
+        CODEC_REG(s, addr) = val & 0x9f1f;
+        codec_volume_set_out(s);
+        return;
+    case AC97_Extended_Audio_Ctrl_Stat:
+        CODEC_REG(s, addr) &= ~EACS_VRA;
+        CODEC_REG(s, addr) |= val & EACS_VRA;
+        if (!(val & EACS_VRA)) {
+            CODEC_REG(s, AC97_PCM_Front_DAC_Rate) = 48000;
+            CODEC_REG(s, AC97_PCM_LR_ADC_Rate) = 48000;
+            open_voice_out(s);
+        }
+        return;
+    case AC97_PCM_Front_DAC_Rate:
+    case AC97_PCM_LR_ADC_Rate:
+        if (CODEC_REG(s, AC97_Extended_Audio_Ctrl_Stat) & EACS_VRA) {
+            int i;
+            uint16_t rate = val;
+
+            for (i = 0; i < ARRAY_SIZE(codec_rates) - 1; i++) {
+                if (rate < codec_rates[i] +
+                    (codec_rates[i + 1] - codec_rates[i]) / 2) {
+                    rate = codec_rates[i];
+                    break;
+                }
+            }
+            if (rate > 48000) {
+                rate = 48000;
+            }
+            CODEC_REG(s, addr) = rate;
+            open_voice_out(s);
+        }
+        return;
+    case AC97_Powerdown_Ctrl_Stat:
+        CODEC_REG(s, addr) = (val & 0xff00) | (CODEC_REG(s, addr) & 0xff);
+        return;
+    case AC97_Extended_Audio_ID:
+    case AC97_Vendor_ID1:
+    case AC97_Vendor_ID2:
+        /* Read only registers */
+        return;
+    default:
+        qemu_log_mask(LOG_UNIMP,
+                      "via-ac97: Unimplemented codec register 0x%x\n", addr);
+        CODEC_REG(s, addr) = val;
+    }
+}
+
+static void fetch_sgd(ViaAC97SGDChannel *c, PCIDevice *d)
+{
+    uint32_t b[2];
+
+    if (c->curr < c->base) {
+        c->curr = c->base;
+    }
+    if (unlikely(pci_dma_read(d, c->curr, b, sizeof(b)) != MEMTX_OK)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "via-ac97: DMA error reading SGD table\n");
+        return;
+    }
+    c->addr = le32_to_cpu(b[0]);
+    c->clen = le32_to_cpu(b[1]);
+    trace_via_ac97_sgd_fetch(c->curr, c->addr, CLEN_IS_STOP(c) ? 'S' : '-',
+                             CLEN_IS_EOL(c) ? 'E' : '-',
+                             CLEN_IS_FLAG(c) ? 'F' : '-', CLEN_LEN(c));
+}
+
+static void out_cb(void *opaque, int avail)
+{
+    ViaAC97State *s = opaque;
+    ViaAC97SGDChannel *c = &s->aur;
+    int temp, to_copy, copied;
+    bool stop = false;
+    uint8_t tmpbuf[4096];
+
+    if (c->stat & STAT_PAUSED) {
+        return;
+    }
+    c->stat |= STAT_ACTIVE;
+    while (avail && !stop) {
+        if (!c->clen) {
+            fetch_sgd(c, &s->dev);
+        }
+        temp = MIN(CLEN_LEN(c), avail);
+        while (temp) {
+            to_copy = MIN(temp, sizeof(tmpbuf));
+            pci_dma_read(&s->dev, c->addr, tmpbuf, to_copy);
+            copied = AUD_write(s->vo, tmpbuf, to_copy);
+            if (!copied) {
+                stop = true;
+                break;
+            }
+            temp -= copied;
+            avail -= copied;
+            c->addr += copied;
+            c->clen -= copied;
+        }
+        if (CLEN_LEN(c) == 0) {
+            c->curr += 8;
+            if (CLEN_IS_EOL(c)) {
+                c->stat |= STAT_EOL;
+                if (c->type & CNTL_START) {
+                    c->curr = c->base;
+                    c->stat |= STAT_PAUSED;
+                } else {
+                    c->stat &= ~STAT_ACTIVE;
+                    AUD_set_active_out(s->vo, 0);
+                }
+                if (c->type & STAT_EOL) {
+                    pci_set_irq(&s->dev, 1);
+                }
+            }
+            if (CLEN_IS_FLAG(c)) {
+                c->stat |= STAT_FLAG;
+                c->stat |= STAT_PAUSED;
+                if (c->type & STAT_FLAG) {
+                    pci_set_irq(&s->dev, 1);
+                }
+            }
+            if (CLEN_IS_STOP(c)) {
+                c->stat |= STAT_STOP;
+                c->stat |= STAT_PAUSED;
+            }
+            c->clen = 0;
+            stop = true;
+        }
+    }
+}
+
+static void open_voice_out(ViaAC97State *s)
+{
+    struct audsettings as = {
+        .freq = CODEC_REG(s, AC97_PCM_Front_DAC_Rate),
+        .nchannels = s->aur.type & BIT(4) ? 2 : 1,
+        .fmt = s->aur.type & BIT(5) ? AUDIO_FORMAT_S16 : AUDIO_FORMAT_S8,
+        .endianness = 0,
+    };
+    s->vo = AUD_open_out(&s->card, s->vo, "via-ac97.out", s, out_cb, &as);
+}
+
+static uint64_t sgd_read(void *opaque, hwaddr addr, unsigned size)
+{
+    ViaAC97State *s = opaque;
+    uint64_t val = 0;
+
+    switch (addr) {
+    case 0:
+        val = s->aur.stat;
+        if (s->aur.type & CNTL_START) {
+            val |= STAT_TRIG;
+        }
+        break;
+    case 1:
+        val = s->aur.stat & STAT_PAUSED ? BIT(3) : 0;
+        break;
+    case 2:
+        val = s->aur.type;
+        break;
+    case 4:
+        val = s->aur.curr;
+        break;
+    case 0xc:
+        val = CLEN_LEN(&s->aur);
+        break;
+    case 0x10:
+        /* silence unimplemented log message that happens at every IRQ */
+        break;
+    case 0x80:
+        val = s->ac97_cmd;
+        break;
+    case 0x84:
+        val = s->aur.stat & STAT_FLAG;
+        if (s->aur.stat & STAT_EOL) {
+            val |= BIT(4);
+        }
+        if (s->aur.stat & STAT_STOP) {
+            val |= BIT(8);
+        }
+        if (s->aur.stat & STAT_ACTIVE) {
+            val |= BIT(12);
+        }
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "via-ac97: Unimplemented register read 0x%"
+                      HWADDR_PRIx"\n", addr);
+    }
+    trace_via_ac97_sgd_read(addr, size, val);
+    return val;
+}
+
+static void sgd_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
+{
+    ViaAC97State *s = opaque;
+
+    trace_via_ac97_sgd_write(addr, size, val);
+    switch (addr) {
+    case 0:
+        if (val & STAT_STOP) {
+            s->aur.stat &= ~STAT_PAUSED;
+        }
+        if (val & STAT_EOL) {
+            s->aur.stat &= ~(STAT_EOL | STAT_PAUSED);
+            if (s->aur.type & STAT_EOL) {
+                pci_set_irq(&s->dev, 0);
+            }
+        }
+        if (val & STAT_FLAG) {
+            s->aur.stat &= ~(STAT_FLAG | STAT_PAUSED);
+            if (s->aur.type & STAT_FLAG) {
+                pci_set_irq(&s->dev, 0);
+            }
+        }
+        break;
+    case 1:
+        if (val & CNTL_START) {
+            AUD_set_active_out(s->vo, 1);
+            s->aur.stat = STAT_ACTIVE;
+        }
+        if (val & CNTL_TERM) {
+            AUD_set_active_out(s->vo, 0);
+            s->aur.stat &= ~(STAT_ACTIVE | STAT_PAUSED);
+            s->aur.clen = 0;
+        }
+        if (val & CNTL_PAUSE) {
+            AUD_set_active_out(s->vo, 0);
+            s->aur.stat &= ~STAT_ACTIVE;
+            s->aur.stat |= STAT_PAUSED;
+        } else if (!(val & CNTL_PAUSE) && (s->aur.stat & STAT_PAUSED)) {
+            AUD_set_active_out(s->vo, 1);
+            s->aur.stat |= STAT_ACTIVE;
+            s->aur.stat &= ~STAT_PAUSED;
+        }
+        break;
+    case 2:
+    {
+        uint32_t oldval = s->aur.type;
+        s->aur.type = val;
+        if ((oldval & 0x30) != (val & 0x30)) {
+            open_voice_out(s);
+        }
+        break;
+    }
+    case 4:
+        s->aur.base = val & ~1ULL;
+        s->aur.curr = s->aur.base;
+        break;
+    case 0x80:
+        if (val >> 30) {
+            /* we only have primary codec */
+            break;
+        }
+        if (val & BIT(23)) { /* read reg */
+            s->ac97_cmd = val & 0xc0ff0000ULL;
+            s->ac97_cmd |= codec_read(s, (val >> 16) & 0x7f);
+            s->ac97_cmd |= BIT(25); /* data valid */
+        } else {
+            s->ac97_cmd = val & 0xc0ffffffULL;
+            codec_write(s, (val >> 16) & 0x7f, val);
+        }
+        break;
+    case 0xc:
+    case 0x84:
+        /* Read only */
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "via-ac97: Unimplemented register write 0x%"
+                      HWADDR_PRIx"\n", addr);
+    }
+}
+
+static const MemoryRegionOps sgd_ops = {
+    .read = sgd_read,
+    .write = sgd_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+};
+
+static uint64_t fm_read(void *opaque, hwaddr addr, unsigned size)
+{
+    qemu_log_mask(LOG_UNIMP, "%s: 0x%"HWADDR_PRIx" %d\n", __func__, addr, size);
+    return 0;
+}
+
+static void fm_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
+{
+    qemu_log_mask(LOG_UNIMP, "%s: 0x%"HWADDR_PRIx" %d <= 0x%"PRIX64"\n",
+                  __func__, addr, size, val);
+}
+
+static const MemoryRegionOps fm_ops = {
+    .read = fm_read,
+    .write = fm_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+};
+
+static uint64_t midi_read(void *opaque, hwaddr addr, unsigned size)
+{
+    qemu_log_mask(LOG_UNIMP, "%s: 0x%"HWADDR_PRIx" %d\n", __func__, addr, size);
+    return 0;
+}
+
+static void midi_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
+{
+    qemu_log_mask(LOG_UNIMP, "%s: 0x%"HWADDR_PRIx" %d <= 0x%"PRIX64"\n",
+                  __func__, addr, size, val);
+}
+
+static const MemoryRegionOps midi_ops = {
+    .read = midi_read,
+    .write = midi_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+};
+
+static void via_ac97_reset(DeviceState *dev)
+{
+    ViaAC97State *s = VIA_AC97(dev);
+
+    codec_reset(s);
+}
 
 static void via_ac97_realize(PCIDevice *pci_dev, Error **errp)
 {
-    pci_set_word(pci_dev->config + PCI_COMMAND,
-                 PCI_COMMAND_INVALIDATE | PCI_COMMAND_PARITY);
+    ViaAC97State *s = VIA_AC97(pci_dev);
+    Object *o = OBJECT(s);
+
+    /*
+     * Command register Bus Master bit is documented to be fixed at 0 but it's
+     * needed for PCI DMA to work in QEMU. The pegasos2 firmware writes 0 here
+     * and the AmigaOS driver writes 1 only enabling IO bit which works on
+     * real hardware. So set it here and fix it to 1 to allow DMA.
+     */
+    pci_set_word(pci_dev->config + PCI_COMMAND, PCI_COMMAND_MASTER);
+    pci_set_word(pci_dev->wmask + PCI_COMMAND, PCI_COMMAND_IO);
     pci_set_word(pci_dev->config + PCI_STATUS,
                  PCI_STATUS_CAP_LIST | PCI_STATUS_DEVSEL_MEDIUM);
     pci_set_long(pci_dev->config + PCI_INTERRUPT_PIN, 0x03);
+    pci_set_byte(pci_dev->config + 0x40, 1); /* codec ready */
+
+    memory_region_init_io(&s->sgd, o, &sgd_ops, s, "via-ac97.sgd", 256);
+    pci_register_bar(pci_dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &s->sgd);
+    memory_region_init_io(&s->fm, o, &fm_ops, s, "via-ac97.fm", 4);
+    pci_register_bar(pci_dev, 1, PCI_BASE_ADDRESS_SPACE_IO, &s->fm);
+    memory_region_init_io(&s->midi, o, &midi_ops, s, "via-ac97.midi", 4);
+    pci_register_bar(pci_dev, 2, PCI_BASE_ADDRESS_SPACE_IO, &s->midi);
+
+    AUD_register_card ("via-ac97", &s->card);
 }
 
+static void via_ac97_exit(PCIDevice *dev)
+{
+    ViaAC97State *s = VIA_AC97(dev);
+
+    AUD_close_out(&s->card, s->vo);
+    AUD_remove_card(&s->card);
+}
+
+static Property via_ac97_properties[] = {
+    DEFINE_AUDIO_PROPERTIES(ViaAC97State, card),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void via_ac97_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
     k->realize = via_ac97_realize;
+    k->exit = via_ac97_exit;
     k->vendor_id = PCI_VENDOR_ID_VIA;
     k->device_id = PCI_DEVICE_ID_VIA_AC97;
     k->revision = 0x50;
     k->class_id = PCI_CLASS_MULTIMEDIA_AUDIO;
+    device_class_set_props(dc, via_ac97_properties);
     set_bit(DEVICE_CATEGORY_SOUND, dc->categories);
     dc->desc = "VIA AC97";
+    dc->reset = via_ac97_reset;
     /* Reason: Part of a south bridge chip */
     dc->user_creatable = false;
 }
@@ -41,7 +484,7 @@ static void via_ac97_class_init(ObjectClass *klass, void *data)
 static const TypeInfo via_ac97_info = {
     .name          = TYPE_VIA_AC97,
     .parent        = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(PCIDevice),
+    .instance_size = sizeof(ViaAC97State),
     .class_init    = via_ac97_class_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
diff --git a/hw/isa/trace-events b/hw/isa/trace-events
index c4567a9b47..1816e8307a 100644
--- a/hw/isa/trace-events
+++ b/hw/isa/trace-events
@@ -16,6 +16,7 @@ apm_io_write(uint8_t addr, uint8_t val) "write addr=0x%x val=0x%02x"
 
 # vt82c686.c
 via_isa_write(uint32_t addr, uint32_t val, int len) "addr 0x%x val 0x%x len 0x%x"
+via_pm_read(uint32_t addr, uint32_t val, int len) "addr 0x%x val 0x%x len 0x%x"
 via_pm_write(uint32_t addr, uint32_t val, int len) "addr 0x%x val 0x%x len 0x%x"
 via_pm_io_read(uint32_t addr, uint32_t val, int len) "addr 0x%x val 0x%x len 0x%x"
 via_pm_io_write(uint32_t addr, uint32_t val, int len) "addr 0x%x val 0x%x len 0x%x"
diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 71da316052..ca89119ce0 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -554,7 +554,7 @@ struct ViaISAState {
     PCIIDEState ide;
     UHCIState uhci[2];
     ViaPMState pm;
-    PCIDevice ac97;
+    ViaAC97State ac97;
     PCIDevice mc97;
 };
 
diff --git a/include/hw/isa/vt82c686.h b/include/hw/isa/vt82c686.h
index e273cd38dc..da1722daf2 100644
--- a/include/hw/isa/vt82c686.h
+++ b/include/hw/isa/vt82c686.h
@@ -1,6 +1,8 @@
 #ifndef HW_VT82C686_H
 #define HW_VT82C686_H
 
+#include "hw/pci/pci_device.h"
+#include "audio/audio.h"
 
 #define TYPE_VT82C686B_ISA "vt82c686b-isa"
 #define TYPE_VT82C686B_USB_UHCI "vt82c686b-usb-uhci"
@@ -9,6 +11,29 @@
 #define TYPE_VIA_IDE "via-ide"
 #define TYPE_VIA_MC97 "via-mc97"
 
+typedef struct {
+    uint8_t stat;
+    uint8_t type;
+    uint32_t base;
+    uint32_t curr;
+    uint32_t addr;
+    uint32_t clen;
+} ViaAC97SGDChannel;
+
+OBJECT_DECLARE_SIMPLE_TYPE(ViaAC97State, VIA_AC97);
+
+struct ViaAC97State {
+    PCIDevice dev;
+    QEMUSoundCard card;
+    MemoryRegion sgd;
+    MemoryRegion fm;
+    MemoryRegion midi;
+    SWVoiceOut *vo;
+    ViaAC97SGDChannel aur;
+    uint16_t codec_regs[128];
+    uint32_t ac97_cmd;
+};
+
 void via_isa_set_irq(PCIDevice *d, int n, int level);
 
 #endif
-- 
2.38.1


