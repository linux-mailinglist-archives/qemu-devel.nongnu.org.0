Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 242A03976C5
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 17:34:09 +0200 (CEST)
Received: from localhost ([::1]:53402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo6PA-0004mQ-6d
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 11:34:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lo69s-0004Iq-UA
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:18:20 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:40774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lo69q-0005CK-P3
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:18:20 -0400
Received: by mail-ej1-x632.google.com with SMTP id jt22so22322272ejb.7
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 08:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=28CltUNqlTopqSjUnhymdKcISdhPgB/QxlhvPhAZa4g=;
 b=IRw5KPLhPUGM6flv5iegDC0JuEIUTedtOYjpAVRpkGYTGg3PbJMuDsTe8LpuDsNuaO
 H3oSu1+qRcBy508q0Gp54ipgdUBCT/Wh+nAqFMrAsDBSSecZJ8E7SWEqi8cTwNZet3jK
 3kYqBi/8j4UtxKBBgtgbb1fs7VK7rWCuhp8mv0piw/FtFX8FDVOfvloZYHvrjEgZSELd
 Hc91lCrlQEKudaFva/W6gDV5fcnKXty0gAKpGQs1uvf20Ay8OF9TE6PBKRw1pR5xldop
 ngT1QKdfbXiOwTE/2e1+FZWI/76jJHi7wSPSnjEfNJ/iB0YEJm1yOp/kT1VrnXyJTbJx
 Kmaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=28CltUNqlTopqSjUnhymdKcISdhPgB/QxlhvPhAZa4g=;
 b=riNOap7YbFfbtEJ2sQEv5x0TxxFe+Apv3VQbxDt5cCwWU2Ra+qLySkDagBRtDHDYDU
 zK8AWpyGJKmJ5US/BnYpzO0+SNKQHY4Ur6Ixtlj1bFWBedg90m/dmxh+eRiKqOoZtSK2
 j32KLGFQCFShe0Y87Y2gVHjuvrebh06ga+fD47hu3HkOBZsZZCrL1GKYC+eazeC9++qZ
 6zos3vrj3Wp9jpP7b1Q/h9PlBlk4Ut9a7kwaBs3/0FX8LB86WoKYgbfAqjUUv3I9rV23
 0MmfFCF2JGqdOTvgu1Y5SqVKGp/6KCM1G+uLrMmlkG9iK6uNlIqUnU0I0gOycv5Opwj+
 6Lxw==
X-Gm-Message-State: AOAM530hsBPt1iVWshrZpW4LztCmQ/AR3aa5yX56FpwUsjEgEyWX6LT7
 8lRscvyfTbVxhlxYegD/C/dn9BbYmujNBg==
X-Google-Smtp-Source: ABdhPJyJAOaMnIg9CbIlVJvfyQW7+avlh6rGnTEWds/qQgLRAcdfQfiupLf5YFOFgKnTtgKi7wCaLw==
X-Received: by 2002:a17:906:489:: with SMTP id
 f9mr11655644eja.508.1622560695335; 
 Tue, 01 Jun 2021 08:18:15 -0700 (PDT)
Received: from x1w.redhat.com (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id bh2sm7307458ejb.80.2021.06.01.08.18.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 08:18:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/audio/sb16: Avoid assertion by restricting I/O sampling
 rate range
Date: Tue,  1 Jun 2021 17:18:13 +0200
Message-Id: <20210601151813.2059996-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: 1910603@bugs.launchpad.net, Alexander Bulekov <alxndr@bu.edu>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While the SB16 seems to work up to 48000 Hz, the "Sound Blaster Series
Hardware Programming Guide" limit the sampling range from 4000 Hz to
44100 Hz (Section 3-9, 3-10: Digitized Sound I/O Programming, tables
3-2 and 3-3).

Later, section 6-15 (DSP Commands) is more specific regarding the 41h /
42h registers (Set digitized sound output sampling rate):

  Valid sampling rates range from 5000 to 45000 Hz inclusive.

There is no comment regarding error handling if the register is filled
with an out-of-range value.  (See also section 3-28 "8-bit or 16-bit
Auto-initialize Transfer"). Assume limits are enforced in hardware.

This fixes triggering an assertion in audio_calloc():

  #1 abort
  #2 audio_bug audio/audio.c:119:9
  #3 audio_calloc audio/audio.c:154:9
  #4 audio_pcm_sw_alloc_resources_out audio/audio_template.h:116:15
  #5 audio_pcm_sw_init_out audio/audio_template.h:175:11
  #6 audio_pcm_create_voice_pair_out audio/audio_template.h:410:9
  #7 AUD_open_out audio/audio_template.h:503:14
  #8 continue_dma8 hw/audio/sb16.c:216:20
  #9 dma_cmd8 hw/audio/sb16.c:276:5
  #10 command hw/audio/sb16.c:0
  #11 dsp_write hw/audio/sb16.c:949:13
  #12 portio_write softmmu/ioport.c:205:13
  #13 memory_region_write_accessor softmmu/memory.c:491:5
  #14 access_with_adjusted_size softmmu/memory.c:552:18
  #15 memory_region_dispatch_write softmmu/memory.c:0:13
  #16 flatview_write_continue softmmu/physmem.c:2759:23
  #17 flatview_write softmmu/physmem.c:2799:14
  #18 address_space_write softmmu/physmem.c:2891:18
  #19 cpu_outw softmmu/ioport.c:70:5

[*] http://www.baudline.com/solutions/full_duplex/sb16_pci/index.html

Fixes: 85571bc7415 ("audio merge (malc)")
Buglink: https://bugs.launchpad.net/bugs/1910603
OSS-Fuzz Report: https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=29174
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/audio/sb16.c              | 14 ++++++++++
 tests/qtest/fuzz-sb16-test.c | 52 ++++++++++++++++++++++++++++++++++++
 MAINTAINERS                  |  1 +
 tests/qtest/meson.build      |  1 +
 4 files changed, 68 insertions(+)
 create mode 100644 tests/qtest/fuzz-sb16-test.c

diff --git a/hw/audio/sb16.c b/hw/audio/sb16.c
index 8b207004102..5cf121fe363 100644
--- a/hw/audio/sb16.c
+++ b/hw/audio/sb16.c
@@ -115,6 +115,9 @@ struct SB16State {
     PortioList portio_list;
 };
 
+#define SAMPLE_RATE_MIN 5000
+#define SAMPLE_RATE_MAX 45000
+
 static void SB_audio_callback (void *opaque, int free);
 
 static int magic_of_irq (int irq)
@@ -241,6 +244,17 @@ static void dma_cmd8 (SB16State *s, int mask, int dma_len)
         int tmp = (256 - s->time_const);
         s->freq = (1000000 + (tmp / 2)) / tmp;
     }
+    if (s->freq < SAMPLE_RATE_MIN) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "sampling range too low: %d, increasing to %u\n",
+                      s->freq, SAMPLE_RATE_MIN);
+        s->freq = SAMPLE_RATE_MIN;
+    } else if (s->freq > SAMPLE_RATE_MAX) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "sampling range too high: %d, decreasing to %u\n",
+                      s->freq, SAMPLE_RATE_MAX);
+        s->freq = SAMPLE_RATE_MAX;
+    }
 
     if (dma_len != -1) {
         s->block_size = dma_len << s->fmt_stereo;
diff --git a/tests/qtest/fuzz-sb16-test.c b/tests/qtest/fuzz-sb16-test.c
new file mode 100644
index 00000000000..51030cd7dc4
--- /dev/null
+++ b/tests/qtest/fuzz-sb16-test.c
@@ -0,0 +1,52 @@
+/*
+ * QTest fuzzer-generated testcase for sb16 audio device
+ *
+ * Copyright (c) 2021 Philippe Mathieu-Daudé <f4bug@amsat.org>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "libqos/libqtest.h"
+
+/*
+ * This used to trigger the assert in audio_calloc
+ * https://bugs.launchpad.net/qemu/+bug/1910603
+ */
+static void test_fuzz_sb16_0x1c(void)
+{
+    QTestState *s = qtest_init("-M q35 -display none "
+                               "-device sb16,audiodev=snd0 "
+                               "-audiodev none,id=snd0");
+    qtest_outw(s, 0x22c, 0x41);
+    qtest_outb(s, 0x22c, 0x00);
+    qtest_outw(s, 0x22c, 0x1004);
+    qtest_outw(s, 0x22c, 0x001c);
+    qtest_quit(s);
+}
+
+static void test_fuzz_sb16_0x91(void)
+{
+    QTestState *s = qtest_init("-M pc -display none "
+                               "-device sb16,audiodev=none "
+                               "-audiodev id=none,driver=none");
+    qtest_outw(s, 0x22c, 0xf141);
+    qtest_outb(s, 0x22c, 0x00);
+    qtest_outb(s, 0x22c, 0x24);
+    qtest_outb(s, 0x22c, 0x91);
+    qtest_quit(s);
+}
+
+int main(int argc, char **argv)
+{
+    const char *arch = qtest_get_arch();
+
+    g_test_init(&argc, &argv, NULL);
+
+   if (strcmp(arch, "i386") == 0) {
+        qtest_add_func("fuzz/test_fuzz_sb16/1c", test_fuzz_sb16_0x1c);
+        qtest_add_func("fuzz/test_fuzz_sb16/91", test_fuzz_sb16_0x91);
+   }
+
+   return g_test_run();
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index 5f55404f2fa..7edb26d2293 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2213,6 +2213,7 @@ F: qapi/audio.json
 F: tests/qtest/ac97-test.c
 F: tests/qtest/es1370-test.c
 F: tests/qtest/intel-hda-test.c
+F: tests/qtest/fuzz-sb16-test.c
 
 Block layer core
 M: Kevin Wolf <kwolf@redhat.com>
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index c3a223a83d6..b03e8541700 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -20,6 +20,7 @@
 qtests_generic = \
   (config_all_devices.has_key('CONFIG_MEGASAS_SCSI_PCI') ? ['fuzz-megasas-test'] : []) + \
   (config_all_devices.has_key('CONFIG_VIRTIO_SCSI') ? ['fuzz-virtio-scsi-test'] : []) + \
+  (config_all_devices.has_key('CONFIG_SB16') ? ['fuzz-sb16-test'] : []) + \
   [
   'cdrom-test',
   'device-introspect-test',
-- 
2.26.3


