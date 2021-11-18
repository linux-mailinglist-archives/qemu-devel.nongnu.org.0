Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED00455B55
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 13:14:02 +0100 (CET)
Received: from localhost ([::1]:46498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mngIj-0002Er-2o
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 07:14:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mngCC-0001vJ-GJ
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 07:07:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mngBo-00044h-4H
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 07:07:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637237211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r59luPWtxRlKzSRSIEGfjHStklJXogUMIUpFeVyWk9E=;
 b=JdqrpLv9i4w5lCoW9KHtEcZYNmDDLu2cRqMZeITtGA4TraRlqyno+6QQWQdiK2LjgM8ZnS
 6r0yEt18STNbaEUxLM1R89p8MAGVqfDRC8IZpw7wI8NLSDKP6WmQMOUl8wHmBelW8lqpy0
 NWPOwpHKkrMogqymO1+IMQdyMEC20VA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-575-motRABa4OsKtYqW5pgvx2A-1; Thu, 18 Nov 2021 07:06:49 -0500
X-MC-Unique: motRABa4OsKtYqW5pgvx2A-1
Received: by mail-wm1-f72.google.com with SMTP id
 201-20020a1c04d2000000b003335bf8075fso2533929wme.0
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 04:06:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r59luPWtxRlKzSRSIEGfjHStklJXogUMIUpFeVyWk9E=;
 b=S5mLwobH5r4Nq5bpq6vrqwIybf85LpF3xZ1eJ010aZ6AIbhKhs62/cUvW/SUXvnINr
 c0LYr3QiZq2pRlHSQ9S8ZWA8slpzkZ8dmNha9BlRd+vDoJ76+tSzdq75CpPCEGBanO7h
 n5ZQTxXfgoQc0+SZkaXqwbwY6Z1IFMWVh01xB7V65BA1D9wB/Sgl6KHaqmSurJM+xflS
 EsFvpMdCMV/v6kg67GN/LhbKur/JGV9HCh/fv3DGP/GetBwm5c1S/2gZp8yB99NjWB3M
 BDWOFuZ5+1IYvZPaAFMA3UzX5W2njbwutcGy9TsLhM6ngm9Sei04WNhJddvqNVM0eOY6
 W3kw==
X-Gm-Message-State: AOAM532o9mkWqS34D+KfZlngHfcu6sbqAbW9gQ1UsWB/omfxWsgHeVAg
 ZHg0Zax9ufU1A7c8+n8YkP7uTR4IOzwGP8q2i/BGk8zf4G50TfbVQgJR4pJKJlOnRBh0kl5FIMU
 kLaBkxzZcFNsZtzfeDp2KnghQ32yliwvheUeICWTFZG4NtyiwxbhpZ8T2tRJ5A/1O
X-Received: by 2002:a5d:4ecd:: with SMTP id s13mr31232848wrv.400.1637237207913; 
 Thu, 18 Nov 2021 04:06:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz02O8jhQFKBJ2/C66qdQ5YNObQuuEFiySs1in+N4oAqJxslJlPT8ziyIXH+bxhAKN10bScRQ==
X-Received: by 2002:a5d:4ecd:: with SMTP id s13mr31232792wrv.400.1637237207681; 
 Thu, 18 Nov 2021 04:06:47 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 a22sm2855997wme.19.2021.11.18.04.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 04:06:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 v3 2/2] tests/qtest/fdc-test: Add a regression test
 for CVE-2021-20196
Date: Thu, 18 Nov 2021 13:06:35 +0100
Message-Id: <20211118120635.4043197-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211118120635.4043197-1-philmd@redhat.com>
References: <20211118120635.4043197-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Prasad J Pandit <pjp@fedoraproject.org>,
 qemu-block@nongnu.org, Darren Kenny <darren.kenny@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Gaoning Pan <pgn@zju.edu.cn>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Bulekov <alxndr@bu.edu>

Without the previous commit, when running 'make check-qtest-i386'
with QEMU configured with '--enable-sanitizers' we get:

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

Add the reproducer for CVE-2021-20196.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Message-Id: <20210319050906.14875-2-alxndr@bu.edu>
[PMD: Rebased, use global test_image]
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/fdc-test.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/qtest/fdc-test.c b/tests/qtest/fdc-test.c
index f164d972d10..0f8b9b753f4 100644
--- a/tests/qtest/fdc-test.c
+++ b/tests/qtest/fdc-test.c
@@ -565,6 +565,26 @@ static void test_cve_2021_3507(void)
     qtest_quit(s);
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
@@ -596,6 +616,7 @@ int main(int argc, char **argv)
     qtest_add_func("/fdc/read_no_dma_19", test_read_no_dma_19);
     qtest_add_func("/fdc/fuzz-registers", fuzz_registers);
     qtest_add_func("/fdc/fuzz/cve_2021_3507", test_cve_2021_3507);
+    qtest_add_func("/fdc/fuzz/cve_2021_20196", test_cve_2021_20196);
 
     ret = g_test_run();
 
-- 
2.31.1


