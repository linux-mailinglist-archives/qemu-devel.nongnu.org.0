Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE91345511C
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 00:26:14 +0100 (CET)
Received: from localhost ([::1]:60336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnUJi-0005s9-3M
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 18:26:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnUIB-0003zV-Gi
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 18:24:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnUI8-0002SH-VV
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 18:24:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637191475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=47kPYn7uOgULylrkXDVpilzijynJ2WpK52xoSC0rC5M=;
 b=Cf1+eLPuOQIDHoIaaEEZliphZOLJ2RLO7OgQrU5uZCrk+VxL/0t1phvDc758K+PZmJhaGz
 N7o44X6xCD3KTmfYPYDqmHc3z3sjz3k2ub04aECEEKpH5IQEzlx0AdPUALfMOLKhM/Sqgw
 SqinVbgua38Y2DbabHGYOu3YQ2cDobE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-MxMgrz1JMM6heWY74sAb7g-1; Wed, 17 Nov 2021 18:24:35 -0500
X-MC-Unique: MxMgrz1JMM6heWY74sAb7g-1
Received: by mail-wr1-f69.google.com with SMTP id
 y4-20020adfd084000000b00186b16950f3so750929wrh.14
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 15:24:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=47kPYn7uOgULylrkXDVpilzijynJ2WpK52xoSC0rC5M=;
 b=uGtdEmhs2UxhHSLyEbZEZtml+rKyz7M/KUgAtYnGF8AeDoJo0TsKLLkqb2+g4X7uJd
 mJ40MGIgqlD3aOSs2Y0LESEnxkvNGP4aRBe7i/Xz+uRb7p5Sp5d/AjNBzhiHEhdGedF3
 U1JpY/QqNgsmQdVk74rrUP5O0AC5GvsKzAOKSU6kZenAfCMPBUuG6wZpFmlxBKffwKPK
 FLCfsA0gxDpoxZmicgsWS/zHLNfjF2/BJGF+7JcDdmNMpik/VktU37B/b7gjIpvTYsqk
 I/5gd4WDd3VaRibhcNLy+FUyo/qkEgjJfWfoMRPfLQgv27VkP14d8HMbSvpuzPpQwAHw
 G+5Q==
X-Gm-Message-State: AOAM531nap3EIy5cYpMYC6EDFcSXttLlWswJYR8M88iVrTaZbHXjUfwk
 S5UnrLxmQ4+X7G7gCf29F8Mrh5rtRrls+mFbPhhgRVDa1KEc3dG+mRKVZHwgqUuAe/nHXG6ONNP
 jQ+u+Sa7d6rReH65k5bDhe4mvgX45P83vJ7pd+vvUzqNcuRrPC/2Rnp23+F98V0GQ
X-Received: by 2002:a5d:648e:: with SMTP id o14mr24732142wri.141.1637191473490; 
 Wed, 17 Nov 2021 15:24:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyNkb6vonRxmsY/4qewwcb3ru6pJQfV/zbO2rrggMyMqi3QpX31twR0PJFYIYWhwHmm3Y4ZHQ==
X-Received: by 2002:a5d:648e:: with SMTP id o14mr24732106wri.141.1637191473302; 
 Wed, 17 Nov 2021 15:24:33 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 n32sm1115396wms.42.2021.11.17.15.24.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 15:24:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 v2 2/2] tests/qtest/fdc-test: Add a regression test
 for CVE-2021-20196
Date: Thu, 18 Nov 2021 00:24:22 +0100
Message-Id: <20211117232422.1026411-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211117232422.1026411-1-philmd@redhat.com>
References: <20211117232422.1026411-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Prasad J Pandit <pjp@fedoraproject.org>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gaoning Pan <pgn@zju.edu.cn>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Bulekov <alxndr@bu.edu>

When running 'make check-qtest-i386' with QEMU configured
with '--enable-sanitizers' we get:

  AddressSanitizer:DEADLYSIGNAL
  =================================================================
  ==287878==ERROR: AddressSanitizer: SEGV on unknown address 0x000000000344
  ==287878==The signal is caused by a WRITE memory access.
  ==287878==Hint: address points to the zero page.
      #0 0x564b2e5bac27 in blk_inc_in_flight block/block-backend.c:1346:5
      #1 0x564b2e5bb228 in blk_pwritev_part block/block-backend.c:1317:5
      #2 0x564b2e5bcd57 in blk_pwrite block/block-backend.c:1498:11
      #3 0x564b2ca1cdd3 in fdctrl_write_data hw/block/fdc.c:2221:17
      #4 0x564b2ca1b2f7 in fdctrl_write hw/block/fdc.c:829:9
      #5 0x564b2dc49503 in portio_write softmmu/ioport.c:201:9

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Message-Id: <20210319050906.14875-2-alxndr@bu.edu>
[PMD: Rebased, use global test_image]
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/fdc-test.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/qtest/fdc-test.c b/tests/qtest/fdc-test.c
index 26b69f7c5cd..dfca84c7b96 100644
--- a/tests/qtest/fdc-test.c
+++ b/tests/qtest/fdc-test.c
@@ -546,6 +546,26 @@ static void fuzz_registers(void)
     }
 }
 
+static void test_cve_2021_20196(void)
+{
+    QTestState *s;
+
+    s = qtest_initf("-nographic -m 32M -nodefaults "
+                    "-drive file=%s,format=raw,if=floppy", test_image);
+    qtest_outw(s, 0x3f2, 0x0004);
+    qtest_outw(s, 0x3f4, 0x0200);
+    qtest_outw(s, 0x3f4, 0x0000);
+    qtest_outw(s, 0x3f4, 0x0000);
+    qtest_outw(s, 0x3f4, 0x0000);
+    qtest_outw(s, 0x3f4, 0x0000);
+    qtest_outw(s, 0x3f4, 0x0000);
+    qtest_outw(s, 0x3f4, 0x0000);
+    qtest_outw(s, 0x3f4, 0x0000);
+    qtest_outw(s, 0x3f4, 0x0000);
+    qtest_outw(s, 0x3f2, 0x0001);
+    qtest_quit(s);
+}
+
 int main(int argc, char **argv)
 {
     int fd;
@@ -576,6 +596,7 @@ int main(int argc, char **argv)
     qtest_add_func("/fdc/read_no_dma_18", test_read_no_dma_18);
     qtest_add_func("/fdc/read_no_dma_19", test_read_no_dma_19);
     qtest_add_func("/fdc/fuzz-registers", fuzz_registers);
+    qtest_add_func("/fdc/fuzz/cve_2021_20196", test_cve_2021_20196);
 
     ret = g_test_run();
 
-- 
2.31.1


