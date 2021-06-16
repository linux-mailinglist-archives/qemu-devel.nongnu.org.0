Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B203A9800
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 12:45:08 +0200 (CEST)
Received: from localhost ([::1]:40650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltT2h-0007A3-A9
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 06:45:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltT1b-0006Fx-5J
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 06:43:59 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:39777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltT1V-0001YU-2u
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 06:43:58 -0400
Received: by mail-wr1-x432.google.com with SMTP id v9so2116807wrx.6
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 03:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UAVfUJHulbrUfT86pvPmOWYnBxX7mZ7NTqcwWBwD568=;
 b=fok5f+Ybxuoy5wnMQlLZms3MQ17u8uqT0bgtIih19uAcoDxKex9mwRQNKsvP1bhSlU
 V59Wl3mswi1YP6soc/K4hqPluRlH1qJ4eYYlr7wgwnyTqgLFQxXmLZnqz2jblu/oSbye
 HbXMvSZ+9I8Q7C99R4mbBHR8mWcSOHSLA5jzm112rVfnx5seSmQo3yZ8grMupCp2ANZd
 T+TTgEWLlmXoy27C1q5mMgydXDXtXDYVij7D76PIR8IyMfVAzzUbQKh9jQPTdS3MLgUs
 rNx1tTID1cC2L8iqFoPg7zvLI4tkW6u01b+GED5+mBS6iM6NLIHFpncO4UQy6VZXPKP2
 JyMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=UAVfUJHulbrUfT86pvPmOWYnBxX7mZ7NTqcwWBwD568=;
 b=NfkBPDpKpkH4iN2R3Cov6p2c9iwpZpaSoWLEJRglZWrAK6Ykg77ZL26X0frUWkB6nR
 pEUHcgBsZXneFAb5p01QZ+NsEbWkJ23BEItLba1BP5L2d4HISWkB0uuTqMjzg8OhIpUP
 wWLq2IOOr5RY/cOudjEoqDX81g+yIzKTUCnC8Y79/ngIUD338VNhN/n4uJfhowbN54Dy
 1hGK524SabIer3v4CV1vzBaPecuIl9RFW/kYm/g0J0wUYiVIAv0M7SlJjtVbNQ8pKLSG
 Hn5BzIojK+bYICKxEOJqHISZ24Sf19ey5GKNxiZgVuW3hsFvEtxVOieD1Qp98+ywUiAp
 yvKg==
X-Gm-Message-State: AOAM533asbkOKvzlBwR2OeFEggbVn1LBq66ZIhd5x48X/uvoFkdSpW6J
 PH7qAuCeTT6OxWO3cTjjxO055rAGS40KJA==
X-Google-Smtp-Source: ABdhPJwnRvjd25RKKb1IY0mH6xLlBY8U0g0qKVeGKHKVo7MBQa8zsygDrtFe0NzMk8t1zLigo+To0g==
X-Received: by 2002:adf:e112:: with SMTP id t18mr4548706wrz.46.1623840231453; 
 Wed, 16 Jun 2021 03:43:51 -0700 (PDT)
Received: from x1w.redhat.com (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id k5sm1645655wmk.11.2021.06.16.03.43.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 03:43:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] hw/audio/sb16: Avoid assertion by restricting I/O sampling
 rate range
Date: Wed, 16 Jun 2021 12:43:49 +0200
Message-Id: <20210616104349.2398060-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Qiang Liu <cyruscyliu@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
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
Tested-by: Qiang Liu <cyruscyliu@gmail.com>
Reviewed-by: Qiang Liu <cyruscyliu@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: Added Qiang Liu's T-b/R-b tags ¯\_(ツ)_/¯
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
index 7d9cd290426..d619ea8fcd1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2221,6 +2221,7 @@ F: qapi/audio.json
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
2.31.1


