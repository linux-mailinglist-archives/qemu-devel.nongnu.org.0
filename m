Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0ECD6A40FD
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:41:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWbpO-00075U-PB; Mon, 27 Feb 2023 06:37:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWboP-0005or-Ju
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:37:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWboN-0005iE-VS
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:36:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677497815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h9POaeahV7n6T9mhqPGZAa1rJHCMVIadxMowq0KgzEU=;
 b=Bpc7/2Tl548Ry82DkY96kI7tvbcFHf17KyZx0xBQsJIhyLNBf/2p7OEpBiDo+RItjoMJxu
 F73NpClTwqkPBB72Gl11PYkSiPdCDOeJ4dInq8gdnmExVc8s7r40FD7ym2+OemWvN3zbOH
 rTKz0YlMWylx9ATwBhil5TnygRdshqQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-121-bjt5ZPGiNdSRJZFhtirU1A-1; Mon, 27 Feb 2023 06:36:52 -0500
X-MC-Unique: bjt5ZPGiNdSRJZFhtirU1A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7663E85A5A3;
 Mon, 27 Feb 2023 11:36:51 +0000 (UTC)
Received: from thuth.com (unknown [10.45.227.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 940D81121314;
 Mon, 27 Feb 2023 11:36:50 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 23/33] tests/tcg/s390x: Add sam.S
Date: Mon, 27 Feb 2023 12:36:11 +0100
Message-Id: <20230227113621.58468-24-thuth@redhat.com>
In-Reply-To: <20230227113621.58468-1-thuth@redhat.com>
References: <20230227113621.58468-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

Add a small test to prevent regressions.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221129015328.55439-1-iii@linux.ibm.com>
Message-Id: <20230220184052.163465-7-richard.henderson@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/tcg/s390x/Makefile.softmmu-target |  1 +
 tests/tcg/s390x/sam.S                   | 67 +++++++++++++++++++++++++
 2 files changed, 68 insertions(+)
 create mode 100644 tests/tcg/s390x/sam.S

diff --git a/tests/tcg/s390x/Makefile.softmmu-target b/tests/tcg/s390x/Makefile.softmmu-target
index bcbe9367ef..725b6c598d 100644
--- a/tests/tcg/s390x/Makefile.softmmu-target
+++ b/tests/tcg/s390x/Makefile.softmmu-target
@@ -8,3 +8,4 @@ QEMU_OPTS=-action panic=exit-failure -kernel
 
 TESTS += unaligned-lowcore
 TESTS += bal
+TESTS += sam
diff --git a/tests/tcg/s390x/sam.S b/tests/tcg/s390x/sam.S
new file mode 100644
index 0000000000..4cab2dd200
--- /dev/null
+++ b/tests/tcg/s390x/sam.S
@@ -0,0 +1,67 @@
+/* DAT on, home-space mode, 64-bit mode */
+#define DAT_PSWM 0x400c00180000000
+#define VIRTUAL_BASE 0x123456789abcd000
+
+    .org 0x8e
+program_interruption_code:
+    .org 0x150
+program_old_psw:
+    .org 0x1d0                         /* program new PSW */
+    .quad 0,pgm_handler
+    .org 0x200                         /* lowcore padding */
+
+    .globl _start
+_start:
+    lctlg %c13,%c13,hasce
+    lpswe dat_psw
+start_dat:
+    sam24
+sam24_suppressed:
+    /* sam24 should fail */
+fail:
+    basr %r12,%r0
+    lpswe failure_psw-.(%r12)
+pgm_handler:
+    chhsi program_interruption_code,6  /* specification exception? */
+    jne fail
+    clc suppressed_psw(16),program_old_psw  /* correct location? */
+    jne fail
+    lpswe success_psw
+
+    .align 8
+dat_psw:
+    .quad DAT_PSWM,VIRTUAL_BASE+start_dat
+suppressed_psw:
+    .quad DAT_PSWM,VIRTUAL_BASE+sam24_suppressed
+success_psw:
+    .quad 0x2000000000000,0xfff        /* see is_special_wait_psw() */
+failure_psw:
+    .quad 0x2000000000000,0            /* disabled wait */
+hasce:
+    /* DT = 0b11 (region-first-table), TL = 3 (2k entries) */
+    .quad region_first_table + (3 << 2) + 3
+    .align 0x1000
+region_first_table:
+    .org region_first_table + ((VIRTUAL_BASE >> 53) & 0x7ff) * 8
+    /* TT = 0b11 (region-first-table), TL = 3 (2k entries) */
+    .quad region_second_table + (3 << 2) + 3
+    .org region_first_table + 0x800 * 8
+region_second_table:
+    .org region_second_table + ((VIRTUAL_BASE >> 42) & 0x7ff) * 8
+    /* TT = 0b10 (region-second-table), TL = 3 (2k entries) */
+    .quad region_third_table + (2 << 2) + 3
+    .org region_second_table + 0x800 * 8
+region_third_table:
+    .org region_third_table + ((VIRTUAL_BASE >> 31) & 0x7ff) * 8
+    /* TT = 0b01 (region-third-table), TL = 3 (2k entries) */
+    .quad segment_table + (1 << 2) + 3
+    .org region_third_table + 0x800 * 8
+segment_table:
+    .org segment_table + ((VIRTUAL_BASE >> 20) & 0x7ff) * 8
+    /* TT = 0b00 (segment-table) */
+    .quad page_table
+    .org segment_table + 0x800 * 8
+page_table:
+    .org page_table + ((VIRTUAL_BASE >> 12) & 0xff) * 8
+    .quad 0
+    .org page_table + 0x100 * 8
-- 
2.31.1


