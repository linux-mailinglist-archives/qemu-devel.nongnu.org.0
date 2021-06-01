Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 744683976D0
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 17:35:54 +0200 (CEST)
Received: from localhost ([::1]:60004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo6Qr-0000lf-HW
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 11:35:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lo6HV-0007rx-3B
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:26:13 -0400
Received: from indium.canonical.com ([91.189.90.7]:52094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lo6HS-0001eU-4m
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:26:12 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lo6HP-0002so-B2
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 15:26:07 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1E11F2E8298
 for <qemu-devel@nongnu.org>; Tue,  1 Jun 2021 15:26:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Jun 2021 15:18:13 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1910603@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: audio fuzzer
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr philmd th-huth
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <161005830186.3494.9820259593524409716.malonedeb@wampee.canonical.com>
Message-Id: <20210601151813.2059996-1-f4bug@amsat.org>
Subject: [Bug 1910603] [PATCH] hw/audio/sb16: Avoid assertion by restricting
 I/O sampling rate range
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="925b661396f90467a0d31fdfb13d4990b7239925"; Instance="production"
X-Launchpad-Hash: 6261dcc2b7d3b225d00b5a3299cc89f470a7323b
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1910603 <1910603@bugs.launchpad.net>
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
OSS-Fuzz Report: https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=3D29=
174
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
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
 =

+#define SAMPLE_RATE_MIN 5000
+#define SAMPLE_RATE_MAX 45000
+
 static void SB_audio_callback (void *opaque, int free);
 =

 static int magic_of_irq (int irq)
@@ -241,6 +244,17 @@ static void dma_cmd8 (SB16State *s, int mask, int dma_=
len)
         int tmp =3D (256 - s->time_const);
         s->freq =3D (1000000 + (tmp / 2)) / tmp;
     }
+    if (s->freq < SAMPLE_RATE_MIN) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "sampling range too low: %d, increasing to %u\n",
+                      s->freq, SAMPLE_RATE_MIN);
+        s->freq =3D SAMPLE_RATE_MIN;
+    } else if (s->freq > SAMPLE_RATE_MAX) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "sampling range too high: %d, decreasing to %u\n",
+                      s->freq, SAMPLE_RATE_MAX);
+        s->freq =3D SAMPLE_RATE_MAX;
+    }
 =

     if (dma_len !=3D -1) {
         s->block_size =3D dma_len << s->fmt_stereo;
diff --git a/tests/qtest/fuzz-sb16-test.c b/tests/qtest/fuzz-sb16-test.c
new file mode 100644
index 00000000000..51030cd7dc4
--- /dev/null
+++ b/tests/qtest/fuzz-sb16-test.c
@@ -0,0 +1,52 @@
+/*
+ * QTest fuzzer-generated testcase for sb16 audio device
+ *
+ * Copyright (c) 2021 Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
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
+    QTestState *s =3D qtest_init("-M q35 -display none "
+                               "-device sb16,audiodev=3Dsnd0 "
+                               "-audiodev none,id=3Dsnd0");
+    qtest_outw(s, 0x22c, 0x41);
+    qtest_outb(s, 0x22c, 0x00);
+    qtest_outw(s, 0x22c, 0x1004);
+    qtest_outw(s, 0x22c, 0x001c);
+    qtest_quit(s);
+}
+
+static void test_fuzz_sb16_0x91(void)
+{
+    QTestState *s =3D qtest_init("-M pc -display none "
+                               "-device sb16,audiodev=3Dnone "
+                               "-audiodev id=3Dnone,driver=3Dnone");
+    qtest_outw(s, 0x22c, 0xf141);
+    qtest_outb(s, 0x22c, 0x00);
+    qtest_outb(s, 0x22c, 0x24);
+    qtest_outb(s, 0x22c, 0x91);
+    qtest_quit(s);
+}
+
+int main(int argc, char **argv)
+{
+    const char *arch =3D qtest_get_arch();
+
+    g_test_init(&argc, &argv, NULL);
+
+   if (strcmp(arch, "i386") =3D=3D 0) {
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
 =

 Block layer core
 M: Kevin Wolf <kwolf@redhat.com>
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index c3a223a83d6..b03e8541700 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -20,6 +20,7 @@
 qtests_generic =3D \
   (config_all_devices.has_key('CONFIG_MEGASAS_SCSI_PCI') ? ['fuzz-megasas-=
test'] : []) + \
   (config_all_devices.has_key('CONFIG_VIRTIO_SCSI') ? ['fuzz-virtio-scsi-t=
est'] : []) + \
+  (config_all_devices.has_key('CONFIG_SB16') ? ['fuzz-sb16-test'] : []) + \
   [
   'cdrom-test',
   'device-introspect-test',
-- =

2.26.3

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1910603

Title:
  [OSS-Fuzz] Issue 29174 sb16: Abrt in audio_bug

Status in QEMU:
  Confirmed

Bug description:
  =3D=3D=3D Reproducer =3D=3D=3D
  cat << EOF | ../build-system/qemu-system-i386 \
  -machine q35 -device sb16,audiodev=3Dsnd0 \
  -audiodev none,id=3Dsnd0 -nographic -nodefaults \
  -qtest stdio
  outw 0x22c 0x41
  outb 0x22c 0x0
  outw 0x22c 0x1004
  outw 0x22c 0x1c
  EOF

  =3D=3D=3D Stack Trace =3D=3D=3D
  A bug was just triggered in audio_calloc
  Save all your work and restart without audio
  I am sorry
  Context:
  Aborted

  #0 raise
  #1 abort
  #2 audio_bug /src/qemu/audio/audio.c:119:9
  #3 audio_calloc /src/qemu/audio/audio.c:154:9
  #4 audio_pcm_sw_alloc_resources_out /src/qemu/audio/audio_template.h:116:=
15
  #5 audio_pcm_sw_init_out /src/qemu/audio/audio_template.h:175:11
  #6 audio_pcm_create_voice_pair_out /src/qemu/audio/audio_template.h:410:9
  #7 AUD_open_out /src/qemu/audio/audio_template.h:503:14
  #8 continue_dma8 /src/qemu/hw/audio/sb16.c:216:20
  #9 dma_cmd8 /src/qemu/hw/audio/sb16.c:276:5
  #10 command /src/qemu/hw/audio/sb16.c:0
  #11 dsp_write /src/qemu/hw/audio/sb16.c:949:13
  #12 portio_write /src/qemu/softmmu/ioport.c:205:13
  #13 memory_region_write_accessor /src/qemu/softmmu/memory.c:491:5
  #14 access_with_adjusted_size /src/qemu/softmmu/memory.c:552:18
  #15 memory_region_dispatch_write /src/qemu/softmmu/memory.c:0:13
  #16 flatview_write_continue /src/qemu/softmmu/physmem.c:2759:23
  #17 flatview_write /src/qemu/softmmu/physmem.c:2799:14
  #18 address_space_write /src/qemu/softmmu/physmem.c:2891:18
  #19 cpu_outw /src/qemu/softmmu/ioport.c:70:5

  =

  OSS-Fuzz Report:
  https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=3D29174

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1910603/+subscriptions

