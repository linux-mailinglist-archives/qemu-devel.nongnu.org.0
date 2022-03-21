Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6854E2EDD
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 18:11:16 +0100 (CET)
Received: from localhost ([::1]:60528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWLYp-00029t-3G
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 13:11:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nWLRg-0001ra-E0
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 13:03:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nWLRe-00059o-5c
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 13:03:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647882229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DhuPmU9LJA8M+qjfjISBRbzoq636/OC0gkE+0xDHxo0=;
 b=TXlNfh+QQmaaG/d4vp2IphsVBNQhx1dtSNw6BfPK01mpMHHak7kpwIqEZxO8I3u9kXE+gp
 Bulp2+DQ4Pi9Hy7GEG89T5AcBS0y2O4rqddQwsJXpSZgreDDs5SJ5aEs8nNH2UMp0idE1+
 61un/H95t5FyrWKDgR7eEUxuf5d6IoA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-164-GrR_PXGoNdOXcO1Nxg__Vw-1; Mon, 21 Mar 2022 13:03:46 -0400
X-MC-Unique: GrR_PXGoNdOXcO1Nxg__Vw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06C7582A6C2;
 Mon, 21 Mar 2022 17:03:46 +0000 (UTC)
Received: from thuth.com (unknown [10.39.195.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5389C4010A1C;
 Mon, 21 Mar 2022 17:03:43 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 8/8] tests/qtest/fuzz-sdcard-test: Add reproducer for OSS-Fuzz
 (Issue 29225)
Date: Mon, 21 Mar 2022 18:03:20 +0100
Message-Id: <20220321170320.282496-9-thuth@redhat.com>
In-Reply-To: <20220321170320.282496-1-thuth@redhat.com>
References: <20220321170320.282496-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Include the qtest reproducer provided by Alexander Bulekov
in https://gitlab.com/qemu-project/qemu/-/issues/451. Without
the previous commit, we get:

  $ make check-qtest-i386
  ...
  Running test qtest-i386/fuzz-sdcard-test
  ==447470==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x61500002a080 at pc 0x564c71766d48 bp 0x7ffc126c62b0 sp 0x7ffc126c62a8
  READ of size 1 at 0x61500002a080 thread T0
      #0 0x564c71766d47 in sdhci_read_dataport hw/sd/sdhci.c:474:18
      #1 0x564c7175f139 in sdhci_read hw/sd/sdhci.c:1022:19
      #2 0x564c721b937b in memory_region_read_accessor softmmu/memory.c:440:11
      #3 0x564c72171e51 in access_with_adjusted_size softmmu/memory.c:554:18
      #4 0x564c7216f47c in memory_region_dispatch_read1 softmmu/memory.c:1424:16
      #5 0x564c7216ebb9 in memory_region_dispatch_read softmmu/memory.c:1452:9
      #6 0x564c7212db5d in flatview_read_continue softmmu/physmem.c:2879:23
      #7 0x564c7212f958 in flatview_read softmmu/physmem.c:2921:12
      #8 0x564c7212f418 in address_space_read_full softmmu/physmem.c:2934:18
      #9 0x564c721305a9 in address_space_rw softmmu/physmem.c:2962:16
      #10 0x564c7175a392 in dma_memory_rw_relaxed include/sysemu/dma.h:89:12
      #11 0x564c7175a0ea in dma_memory_rw include/sysemu/dma.h:132:12
      #12 0x564c71759684 in dma_memory_read include/sysemu/dma.h:152:12
      #13 0x564c7175518c in sdhci_do_adma hw/sd/sdhci.c:823:27
      #14 0x564c7174bf69 in sdhci_data_transfer hw/sd/sdhci.c:935:13
      #15 0x564c7176aaa7 in sdhci_send_command hw/sd/sdhci.c:376:9
      #16 0x564c717629ee in sdhci_write hw/sd/sdhci.c:1212:9
      #17 0x564c72172513 in memory_region_write_accessor softmmu/memory.c:492:5
      #18 0x564c72171e51 in access_with_adjusted_size softmmu/memory.c:554:18
      #19 0x564c72170766 in memory_region_dispatch_write softmmu/memory.c:1504:16
      #20 0x564c721419ee in flatview_write_continue softmmu/physmem.c:2812:23
      #21 0x564c721301eb in flatview_write softmmu/physmem.c:2854:12
      #22 0x564c7212fca8 in address_space_write softmmu/physmem.c:2950:18
      #23 0x564c721d9a53 in qtest_process_command softmmu/qtest.c:727:9

  0x61500002a080 is located 0 bytes to the right of 512-byte region [0x615000029e80,0x61500002a080)
  allocated by thread T0 here:
      #0 0x564c708e1737 in __interceptor_calloc (qemu-system-i386+0x1e6a737)
      #1 0x7ff05567b5e0 in g_malloc0 (/lib64/libglib-2.0.so.0+0x5a5e0)
      #2 0x564c71774adb in sdhci_pci_realize hw/sd/sdhci-pci.c:36:5

  SUMMARY: AddressSanitizer: heap-buffer-overflow hw/sd/sdhci.c:474:18 in sdhci_read_dataport
  Shadow bytes around the buggy address:
    0x0c2a7fffd3c0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
    0x0c2a7fffd3d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    0x0c2a7fffd3e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    0x0c2a7fffd3f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    0x0c2a7fffd400: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  =>0x0c2a7fffd410:[fa]fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
    0x0c2a7fffd420: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
    0x0c2a7fffd430: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
    0x0c2a7fffd440: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
    0x0c2a7fffd450: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
    0x0c2a7fffd460: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
  Shadow byte legend (one shadow byte represents 8 application bytes):
    Addressable:           00
    Heap left redzone:       fa
    Freed heap region:       fd
  ==447470==ABORTING
  Broken pipe
  ERROR qtest-i386/fuzz-sdcard-test - too few tests run (expected 3, got 2)

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20211215205656.488940-4-philmd@redhat.com>
[thuth: Replaced "-m 4G" with "-m 512M"]
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/fuzz-sdcard-test.c | 76 ++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/tests/qtest/fuzz-sdcard-test.c b/tests/qtest/fuzz-sdcard-test.c
index ae14305344..0f94965a66 100644
--- a/tests/qtest/fuzz-sdcard-test.c
+++ b/tests/qtest/fuzz-sdcard-test.c
@@ -87,6 +87,81 @@ static void oss_fuzz_36217(void)
     qtest_quit(s);
 }
 
+/*
+ * https://gitlab.com/qemu-project/qemu/-/issues/451
+ * Used to trigger a heap buffer overflow.
+ */
+static void oss_fuzz_36391(void)
+{
+    QTestState *s;
+
+    s = qtest_init(" -display none -m 512M -nodefaults -nographic"
+                   " -device sdhci-pci,sd-spec-version=3"
+                   " -device sd-card,drive=drv"
+                   " -drive if=none,index=0,file=null-co://,format=raw,id=drv");
+    qtest_outl(s, 0xcf8, 0x80001010);
+    qtest_outl(s, 0xcfc, 0xe0000000);
+    qtest_outl(s, 0xcf8, 0x80001004);
+    qtest_outw(s, 0xcfc, 0x7);
+    qtest_bufwrite(s, 0xe0000005, "\x73", 0x1);
+    qtest_bufwrite(s, 0xe0000028, "\x55", 0x1);
+    qtest_bufwrite(s, 0xe000002c, "\x55", 0x1);
+    qtest_bufwrite(s, 0x0, "\x65", 0x1);
+    qtest_bufwrite(s, 0x7, "\x69", 0x1);
+    qtest_bufwrite(s, 0x8, "\x65", 0x1);
+    qtest_bufwrite(s, 0xf, "\x69", 0x1);
+    qtest_bufwrite(s, 0x10, "\x65", 0x1);
+    qtest_bufwrite(s, 0x17, "\x69", 0x1);
+    qtest_bufwrite(s, 0x18, "\x65", 0x1);
+    qtest_bufwrite(s, 0x1f, "\x69", 0x1);
+    qtest_bufwrite(s, 0x20, "\x65", 0x1);
+    qtest_bufwrite(s, 0x27, "\x69", 0x1);
+    qtest_bufwrite(s, 0x28, "\x65", 0x1);
+    qtest_bufwrite(s, 0x2f, "\x69", 0x1);
+    qtest_bufwrite(s, 0x30, "\x65", 0x1);
+    qtest_bufwrite(s, 0x37, "\x69", 0x1);
+    qtest_bufwrite(s, 0x38, "\x65", 0x1);
+    qtest_bufwrite(s, 0x3f, "\x69", 0x1);
+    qtest_bufwrite(s, 0x40, "\x65", 0x1);
+    qtest_bufwrite(s, 0x47, "\x69", 0x1);
+    qtest_bufwrite(s, 0x48, "\x65", 0x1);
+    qtest_bufwrite(s, 0xe000000c, "\x55", 0x1);
+    qtest_bufwrite(s, 0xe000000e, "\x2c", 0x1);
+    qtest_bufwrite(s, 0xe000000f, "\x5b", 0x1);
+    qtest_bufwrite(s, 0xe0000010, "\x06\x46", 0x2);
+    qtest_bufwrite(s, 0x50, "\x65", 0x1);
+    qtest_bufwrite(s, 0x57, "\x69", 0x1);
+    qtest_bufwrite(s, 0x58, "\x65", 0x1);
+    qtest_bufwrite(s, 0x5f, "\x69", 0x1);
+    qtest_bufwrite(s, 0x60, "\x65", 0x1);
+    qtest_bufwrite(s, 0x67, "\x69", 0x1);
+    qtest_bufwrite(s, 0x68, "\x65", 0x1);
+    qtest_bufwrite(s, 0x6f, "\x69", 0x1);
+    qtest_bufwrite(s, 0x70, "\x65", 0x1);
+    qtest_bufwrite(s, 0x77, "\x69", 0x1);
+    qtest_bufwrite(s, 0x78, "\x65", 0x1);
+    qtest_bufwrite(s, 0x7f, "\x69", 0x1);
+    qtest_bufwrite(s, 0x80, "\x65", 0x1);
+    qtest_bufwrite(s, 0x87, "\x69", 0x1);
+    qtest_bufwrite(s, 0x88, "\x65", 0x1);
+    qtest_bufwrite(s, 0x8f, "\x69", 0x1);
+    qtest_bufwrite(s, 0x90, "\x65", 0x1);
+    qtest_bufwrite(s, 0x97, "\x69", 0x1);
+    qtest_bufwrite(s, 0x98, "\x65", 0x1);
+    qtest_bufwrite(s, 0xe0000026, "\x5a\x06", 0x2);
+    qtest_bufwrite(s, 0xe0000028, "\x46\xc0\xc9\xc9", 0x4);
+    qtest_bufwrite(s, 0xe0000028, "\x55", 0x1);
+    qtest_bufwrite(s, 0xe000002a, "\x5a", 0x1);
+    qtest_bufwrite(s, 0xa0, "\x65", 0x1);
+    qtest_bufwrite(s, 0xa5, "\xff", 0x1);
+    qtest_bufwrite(s, 0xa6, "\xff", 0x1);
+    qtest_bufwrite(s, 0xa7, "\xdf", 0x1);
+    qtest_bufwrite(s, 0xe000000c, "\x27", 0x1);
+    qtest_bufwrite(s, 0xe000000f, "\x55", 0x1);
+
+    qtest_quit(s);
+}
+
 int main(int argc, char **argv)
 {
     const char *arch = qtest_get_arch();
@@ -96,6 +171,7 @@ int main(int argc, char **argv)
    if (strcmp(arch, "i386") == 0) {
         qtest_add_func("fuzz/sdcard/oss_fuzz_29225", oss_fuzz_29225);
         qtest_add_func("fuzz/sdcard/oss_fuzz_36217", oss_fuzz_36217);
+        qtest_add_func("fuzz/sdcard/oss_fuzz_36391", oss_fuzz_36391);
    }
 
    return g_test_run();
-- 
2.27.0


