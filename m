Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BDB525161
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 17:37:35 +0200 (CEST)
Received: from localhost ([::1]:51466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npAsh-0001jx-0F
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 11:37:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1npApd-0006Al-5s
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:34:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1npApb-0003Rf-6U
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:34:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652369662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LlHp2QFgV12afbC9iBiyFGCbFkmU937vOMmvo5pijbs=;
 b=SbQhodAZASbJmEURjhxXpC7BzvRbOegm65VsqQnUDGZaiH0L2IrYEEyLpSRsSG5APUOJvU
 zzYF/1NMln8FHhvE4Dr3oX31maK4fjSsu6SQwQN+Y9CcSLTSNPzd3BaVbl0L+ggW495hui
 VzA/fN3kmc+891TCC/dWE4+2dMxn4gU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-90-b2_ITH0INZ6lUl7eba_0kA-1; Thu, 12 May 2022 11:34:19 -0400
X-MC-Unique: b2_ITH0INZ6lUl7eba_0kA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E2658038E3;
 Thu, 12 May 2022 15:34:19 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 774A0401E9D;
 Thu, 12 May 2022 15:34:18 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 07/10] tests/qtest/fdc-test: Add a regression test for
 CVE-2021-3507
Date: Thu, 12 May 2022 17:33:58 +0200
Message-Id: <20220512153401.202863-8-kwolf@redhat.com>
In-Reply-To: <20220512153401.202863-1-kwolf@redhat.com>
References: <20220512153401.202863-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Add the reproducer from https://gitlab.com/qemu-project/qemu/-/issues/339

Without the previous commit, when running 'make check-qtest-i386'
with QEMU configured with '--enable-sanitizers' we get:

  ==4028352==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x619000062a00 at pc 0x5626d03c491a bp 0x7ffdb4199410 sp 0x7ffdb4198bc0
  READ of size 786432 at 0x619000062a00 thread T0
      #0 0x5626d03c4919 in __asan_memcpy (qemu-system-i386+0x1e65919)
      #1 0x5626d1c023cc in flatview_write_continue softmmu/physmem.c:2787:13
      #2 0x5626d1bf0c0f in flatview_write softmmu/physmem.c:2822:14
      #3 0x5626d1bf0798 in address_space_write softmmu/physmem.c:2914:18
      #4 0x5626d1bf0f37 in address_space_rw softmmu/physmem.c:2924:16
      #5 0x5626d1bf14c8 in cpu_physical_memory_rw softmmu/physmem.c:2933:5
      #6 0x5626d0bd5649 in cpu_physical_memory_write include/exec/cpu-common.h:82:5
      #7 0x5626d0bd0a07 in i8257_dma_write_memory hw/dma/i8257.c:452:9
      #8 0x5626d09f825d in fdctrl_transfer_handler hw/block/fdc.c:1616:13
      #9 0x5626d0a048b4 in fdctrl_start_transfer hw/block/fdc.c:1539:13
      #10 0x5626d09f4c3e in fdctrl_write_data hw/block/fdc.c:2266:13
      #11 0x5626d09f22f7 in fdctrl_write hw/block/fdc.c:829:9
      #12 0x5626d1c20bc5 in portio_write softmmu/ioport.c:207:17

  0x619000062a00 is located 0 bytes to the right of 512-byte region [0x619000062800,0x619000062a00)
  allocated by thread T0 here:
      #0 0x5626d03c66ec in posix_memalign (qemu-system-i386+0x1e676ec)
      #1 0x5626d2b988d4 in qemu_try_memalign util/oslib-posix.c:210:11
      #2 0x5626d2b98b0c in qemu_memalign util/oslib-posix.c:226:27
      #3 0x5626d09fbaf0 in fdctrl_realize_common hw/block/fdc.c:2341:20
      #4 0x5626d0a150ed in isabus_fdc_realize hw/block/fdc-isa.c:113:5
      #5 0x5626d2367935 in device_set_realized hw/core/qdev.c:531:13

  SUMMARY: AddressSanitizer: heap-buffer-overflow (qemu-system-i386+0x1e65919) in __asan_memcpy
  Shadow bytes around the buggy address:
    0x0c32800044f0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
    0x0c3280004500: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    0x0c3280004510: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    0x0c3280004520: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    0x0c3280004530: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  =>0x0c3280004540:[fa]fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
    0x0c3280004550: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
    0x0c3280004560: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
    0x0c3280004570: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
    0x0c3280004580: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
    0x0c3280004590: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
  Shadow byte legend (one shadow byte represents 8 application bytes):
    Addressable:           00
    Heap left redzone:       fa
    Freed heap region:       fd
  ==4028352==ABORTING

[ kwolf: Added snapshot=on to prevent write file lock failure ]

Reported-by: Alexander Bulekov <alxndr@bu.edu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qtest/fdc-test.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/qtest/fdc-test.c b/tests/qtest/fdc-test.c
index 0b3c2c0d52..52ade90a7d 100644
--- a/tests/qtest/fdc-test.c
+++ b/tests/qtest/fdc-test.c
@@ -582,6 +582,26 @@ static void test_cve_2021_20196(void)
     qtest_quit(s);
 }
 
+static void test_cve_2021_3507(void)
+{
+    QTestState *s;
+
+    s = qtest_initf("-nographic -m 32M -nodefaults "
+                    "-drive file=%s,format=raw,if=floppy,snapshot=on",
+                    test_image);
+    qtest_outl(s, 0x9, 0x0a0206);
+    qtest_outw(s, 0x3f4, 0x1600);
+    qtest_outw(s, 0x3f4, 0x0000);
+    qtest_outw(s, 0x3f4, 0x0000);
+    qtest_outw(s, 0x3f4, 0x0000);
+    qtest_outw(s, 0x3f4, 0x0200);
+    qtest_outw(s, 0x3f4, 0x0200);
+    qtest_outw(s, 0x3f4, 0x0000);
+    qtest_outw(s, 0x3f4, 0x0000);
+    qtest_outw(s, 0x3f4, 0x0000);
+    qtest_quit(s);
+}
+
 int main(int argc, char **argv)
 {
     int fd;
@@ -613,6 +633,7 @@ int main(int argc, char **argv)
     qtest_add_func("/fdc/read_no_dma_19", test_read_no_dma_19);
     qtest_add_func("/fdc/fuzz-registers", fuzz_registers);
     qtest_add_func("/fdc/fuzz/cve_2021_20196", test_cve_2021_20196);
+    qtest_add_func("/fdc/fuzz/cve_2021_3507", test_cve_2021_3507);
 
     ret = g_test_run();
 
-- 
2.35.3


