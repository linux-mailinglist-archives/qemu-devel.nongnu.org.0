Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA623DF40F
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 19:46:18 +0200 (CEST)
Received: from localhost ([::1]:50474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAyUb-0007fw-It
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 13:46:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mAyOC-00088a-UM; Tue, 03 Aug 2021 13:39:41 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:38821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mAyO9-0003CW-Vh; Tue, 03 Aug 2021 13:39:40 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 i10-20020a05600c354ab029025a0f317abfso2242806wmq.3; 
 Tue, 03 Aug 2021 10:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bFi+Mr/sB/A1SSI1vPichqCqDLgz2QSTECDawCHTqTs=;
 b=TXd3Dls9yxZ4mAqZ5sXlbKLE4OZBJ8ONxUKOlaK+dtnvYY8BgpDe57KeSEgyBwgSCG
 CMQRtNnC2adbxU/ActDIvgFuNe0CgvssuT+NyrYW12YcHW9VQwrgAhL5Q2CV/Cv2O1wQ
 0D4FQKKnEez1eZXbNLCwUIk3tyzCvm2y8waSBPAlAV4PcnmWGpkIhddkijkplUAeazW6
 CGeOvHSeHW45xzI8fLQcdCwswt6Ex5B9aHaYN7/iN1wNQUPziONWNCEw64m4dRoaU6R4
 7h2YSMAWUdslnfYZaZvBo/wP9umoO25zqGKH7ugenMCytM7B3ML8x05A6hQEtQZrVqSE
 LyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bFi+Mr/sB/A1SSI1vPichqCqDLgz2QSTECDawCHTqTs=;
 b=DIaKcoidhLwiU6uv0rPcAglWGJ3Gxxo83F4Ct+OZseF2JeM7TVRQ6qDID3nCgRL0tN
 mhrKwNSbJ8NjQIxh3/t0rsN5YafOA1sPYgNbDx+RGn+A/+V2JkpjMBx8H5XfeM3yCDpC
 K8EP88nrd5lfpWlx/4OYW1TP/0J89wPJEEVuIyH31NB3rgx5pUQgXkgWlWgGXjQQ0JYa
 36tIh74v4h4sHkncb4WWBoNpYMGaAN0k3u5/UFFEeazeLsFgP0WKZcuWVghQ5z6uu4kw
 o+zBCb2tj5+BLSxi5FOxHBmKDQzMbZ8gdRUrULz/0buTLctlTcw/06qW+QIKHKtHsCOH
 lv4w==
X-Gm-Message-State: AOAM533ZJFVc/2R1BRdVhy1LfK0/YnD/wg18HNFmpXycCwKp9t2QXFx6
 n93cMCrVnhQ+fdTiSJtOgVaK7P7BLrZEOg==
X-Google-Smtp-Source: ABdhPJwDRN5IRGxLanWQRnwP6jJzT1hUDSg39U2XgIr3TuHg5uPeRM6RlIsmOVBIhX3jK7ZFdwViCA==
X-Received: by 2002:a7b:c5d2:: with SMTP id n18mr5540448wmk.97.1628012374986; 
 Tue, 03 Aug 2021 10:39:34 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 m14sm14968303wrs.56.2021.08.03.10.39.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 10:39:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/2] hw/sd/sdcard: Fix assertion accessing out-of-range
 addresses with CMD30
Date: Tue,  3 Aug 2021 19:39:22 +0200
Message-Id: <20210803173922.3599280-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210803173922.3599280-1-f4bug@amsat.org>
References: <20210803173922.3599280-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-stable@nongnu.org, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

OSS-Fuzz found sending illegal addresses when querying the write
protection bits triggers the assertion added in commit 84816fb63e5
("hw/sd/sdcard: Assert if accessing an illegal group"):

  qemu-fuzz-i386-target-generic-fuzz-sdhci-v3: ../hw/sd/sd.c:824: uint32_t sd_wpbits(SDState *, uint64_t):
  Assertion `wpnum < sd->wpgrps_size' failed.
  #3 0x7f62a8b22c91 in __assert_fail
  #4 0x5569adcec405 in sd_wpbits hw/sd/sd.c:824:9
  #5 0x5569adce5f6d in sd_normal_command hw/sd/sd.c:1389:38
  #6 0x5569adce3870 in sd_do_command hw/sd/sd.c:1737:17
  #7 0x5569adcf1566 in sdbus_do_command hw/sd/core.c:100:16
  #8 0x5569adcfc192 in sdhci_send_command hw/sd/sdhci.c:337:12
  #9 0x5569adcfa3a3 in sdhci_write hw/sd/sdhci.c:1186:9
  #10 0x5569adfb3447 in memory_region_write_accessor softmmu/memory.c:492:5

It is legal for the CMD30 to query for out-of-range addresses.
Such invalid addresses are simply ignored in the response (write
protection bits set to 0).

In commit 84816fb63e5 ("hw/sd/sdcard: Assert if accessing an illegal
group") we misplaced the assertion *before* we test the address is
in range. Move it *after*.

Include the qtest reproducer provided by Alexander Bulekov:

  $ make check-qtest-i386
  ...
  Running test qtest-i386/fuzz-sdcard-test
  qemu-system-i386: ../hw/sd/sd.c:824: sd_wpbits: Assertion `wpnum < sd->wpgrps_size' failed.

Cc: qemu-stable@nongnu.org
Reported-by: OSS-Fuzz (Issue 29225)
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Fixes: 84816fb63e5 ("hw/sd/sdcard: Assert if accessing an illegal group")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/495
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210802235524.3417739-3-f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Alexander Bulekov <alxndr@bu.edu>
---
 hw/sd/sd.c                     |  2 +-
 tests/qtest/fuzz-sdcard-test.c | 36 ++++++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 707dcc12a14..bb5dbff68c0 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -821,7 +821,6 @@ static uint32_t sd_wpbits(SDState *sd, uint64_t addr)
     wpnum = sd_addr_to_wpnum(addr);
 
     for (i = 0; i < 32; i++, wpnum++, addr += WPGROUP_SIZE) {
-        assert(wpnum < sd->wpgrps_size);
         if (addr >= sd->size) {
             /*
              * If the addresses of the last groups are outside the valid range,
@@ -829,6 +828,7 @@ static uint32_t sd_wpbits(SDState *sd, uint64_t addr)
              */
             continue;
         }
+        assert(wpnum < sd->wpgrps_size);
         if (test_bit(wpnum, sd->wp_groups)) {
             ret |= (1 << i);
         }
diff --git a/tests/qtest/fuzz-sdcard-test.c b/tests/qtest/fuzz-sdcard-test.c
index 96602eac7e5..ae14305344a 100644
--- a/tests/qtest/fuzz-sdcard-test.c
+++ b/tests/qtest/fuzz-sdcard-test.c
@@ -52,6 +52,41 @@ static void oss_fuzz_29225(void)
     qtest_quit(s);
 }
 
+/*
+ * https://gitlab.com/qemu-project/qemu/-/issues/495
+ * Used to trigger:
+ *  Assertion `wpnum < sd->wpgrps_size' failed.
+ */
+static void oss_fuzz_36217(void)
+{
+    QTestState *s;
+
+    s = qtest_init(" -display none -m 32 -nodefaults -nographic"
+                   " -device sdhci-pci,sd-spec-version=3 "
+                   "-device sd-card,drive=d0 "
+                   "-drive if=none,index=0,file=null-co://,format=raw,id=d0");
+
+    qtest_outl(s, 0xcf8, 0x80001010);
+    qtest_outl(s, 0xcfc, 0xe0000000);
+    qtest_outl(s, 0xcf8, 0x80001004);
+    qtest_outw(s, 0xcfc, 0x02);
+    qtest_bufwrite(s, 0xe000002c, "\x05", 0x1);
+    qtest_bufwrite(s, 0xe000000f, "\x37", 0x1);
+    qtest_bufwrite(s, 0xe000000a, "\x01", 0x1);
+    qtest_bufwrite(s, 0xe000000f, "\x29", 0x1);
+    qtest_bufwrite(s, 0xe000000f, "\x02", 0x1);
+    qtest_bufwrite(s, 0xe000000f, "\x03", 0x1);
+    qtest_bufwrite(s, 0xe0000005, "\x01", 0x1);
+    qtest_bufwrite(s, 0xe000000f, "\x06", 0x1);
+    qtest_bufwrite(s, 0xe000000c, "\x05", 0x1);
+    qtest_bufwrite(s, 0xe000000e, "\x20", 0x1);
+    qtest_bufwrite(s, 0xe000000f, "\x08", 0x1);
+    qtest_bufwrite(s, 0xe000000b, "\x3d", 0x1);
+    qtest_bufwrite(s, 0xe000000f, "\x1e", 0x1);
+
+    qtest_quit(s);
+}
+
 int main(int argc, char **argv)
 {
     const char *arch = qtest_get_arch();
@@ -60,6 +95,7 @@ int main(int argc, char **argv)
 
    if (strcmp(arch, "i386") == 0) {
         qtest_add_func("fuzz/sdcard/oss_fuzz_29225", oss_fuzz_29225);
+        qtest_add_func("fuzz/sdcard/oss_fuzz_36217", oss_fuzz_36217);
    }
 
    return g_test_run();
-- 
2.31.1


