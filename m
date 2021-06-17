Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6994C3AB443
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 15:05:22 +0200 (CEST)
Received: from localhost ([::1]:60682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltrhx-0007nB-1X
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 09:05:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ltrKv-00004v-00
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:41:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ltrKs-0007rf-ED
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:41:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623933689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RirCDaB2uNSdDNjHrdlm61ULRMUzoecD2useyBX5gFM=;
 b=E05p3/sXUMroMeNiq3e/Q4NKrD5LULrhkNXlSXR2k59Hmuqehou/RKQBVeudJWWFC0Heqz
 oVWelDOf/npDj/8fCIPKnFBb3glPmAoNLNcfEkXnoI9wnvB9lc5yKGhvG8Qf4z+hk3rbLW
 uprs0BFiFzniPe5y7D2uaEeXK9OqFew=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-_4ZJIdNwMW-EcK3XfkJsEw-1; Thu, 17 Jun 2021 08:41:26 -0400
X-MC-Unique: _4ZJIdNwMW-EcK3XfkJsEw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52BC519067E6;
 Thu, 17 Jun 2021 12:41:25 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C05BE61008;
 Thu, 17 Jun 2021 12:41:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EA57A18017CC; Thu, 17 Jun 2021 14:41:07 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/7] hw/audio/sb16: Avoid assertion by restricting I/O sampling
 rate range
Date: Thu, 17 Jun 2021 14:41:05 +0200
Message-Id: <20210617124107.2386073-6-kraxel@redhat.com>
In-Reply-To: <20210617124107.2386073-1-kraxel@redhat.com>
References: <20210617124107.2386073-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

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

OSS-Fuzz Report: https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=29174

Fixes: 85571bc7415 ("audio merge (malc)")
Buglink: https://bugs.launchpad.net/bugs/1910603
Tested-by: Qiang Liu <cyruscyliu@gmail.com>
Reviewed-by: Qiang Liu <cyruscyliu@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210616104349.2398060-1-f4bug@amsat.org>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/audio/sb16.c              | 14 ++++++++++
 tests/qtest/fuzz-sb16-test.c | 52 ++++++++++++++++++++++++++++++++++++
 MAINTAINERS                  |  1 +
 tests/qtest/meson.build      |  1 +
 4 files changed, 68 insertions(+)
 create mode 100644 tests/qtest/fuzz-sb16-test.c

diff --git a/hw/audio/sb16.c b/hw/audio/sb16.c
index 8b2070041025..5cf121fe3639 100644
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
index 000000000000..51030cd7dc40
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
index 636bf2f53655..4842cc26e5ce 100644
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
index c3a223a83d6a..b03e85417001 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -20,6 +20,7 @@ slow_qtests = {
 qtests_generic = \
   (config_all_devices.has_key('CONFIG_MEGASAS_SCSI_PCI') ? ['fuzz-megasas-test'] : []) + \
   (config_all_devices.has_key('CONFIG_VIRTIO_SCSI') ? ['fuzz-virtio-scsi-test'] : []) + \
+  (config_all_devices.has_key('CONFIG_SB16') ? ['fuzz-sb16-test'] : []) + \
   [
   'cdrom-test',
   'device-introspect-test',
-- 
2.31.1


