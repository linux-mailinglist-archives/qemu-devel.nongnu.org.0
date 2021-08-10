Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E60393D9528
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 20:19:30 +0200 (CEST)
Received: from localhost ([::1]:47278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8o9R-0005Yu-Vz
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 14:19:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m8o7m-0002QR-Jc; Wed, 28 Jul 2021 14:17:46 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:44979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m8o7k-0005Jn-Hr; Wed, 28 Jul 2021 14:17:46 -0400
Received: by mail-wr1-x42f.google.com with SMTP id z4so3650129wrv.11;
 Wed, 28 Jul 2021 11:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YwYKVHNgecu5jiIKoXnoWtjk/FNw2rOw7861LGYxMNs=;
 b=fy9J5xznGE0VLXw+HWBexvcNxEB0SuThh+YUPyuqh/X+TgrMej8Tz3M63H4ONwFB1u
 JYzurTtXN3lCT+/MPRvpbNjGnKccz3TbFZIpCkfDow4OM9goCMQxAoHvLXRZk7ZTH1bH
 LcVpTjbsBY6oxeAoq6BBWa0pjlKZR7Nn1TWQj4qiO+wqJL/UXmJZLr1sE/h/DdDgaXgG
 0k2QersmTjfrYvfCDrqNPZDH1iozBuPQj+0m9YXl1bCV+za12sd9+4CaxcEb7d61aR+z
 tzQpnnddtwNQh5W/627bZiViwgyrwzJD4IvIPh0GEO4UEp3zzgq0SmpUPxPQhKYsaBK+
 hvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YwYKVHNgecu5jiIKoXnoWtjk/FNw2rOw7861LGYxMNs=;
 b=HnVIOfUOgKrrmrNJfvXWmPztVKMVpyeGv0jw3/q6V2NmHw2Udf5TXwTSrp04n3G+is
 94GILoILwhdhEvIlPZ7OuhC59l8W8NrUTd5AQ2qmS2f3KngPHcmiu7QBTw2HixvefEen
 CME3GhcM1kNuT2asIw2ab8m4lMMbxlRg1xSZ9zjTLzQkeeNpCyr5CrB+oqns83vFQNff
 ZAUtzRwJWVtmmJAqCKqmkO5sazcga54d2KTRh0p1va7uzOhKm+Lg/EJRiBb7TU/cPuBq
 b+ZB2mf2LdPmv/bZ77X3s/iBZ/sfXZS29dUuUZOpNQaJj/2H1fbmR0QYV2GvnGbrXx8A
 2pUw==
X-Gm-Message-State: AOAM532HJSGgPYxPqU9mnPGG2MyWvL5MpakfHIe5Shp7pM1AP/fEkbwG
 9c8LLmAKSzmdt+hrBv47coEaXMvjLoTDCw==
X-Google-Smtp-Source: ABdhPJyZYmkpkyVUCqBdcQVKEoSji5VcnZDFm4a411qC3uQzfpzGwoJj7JuoSLL2P0xKIbUluKhIlg==
X-Received: by 2002:adf:f1c6:: with SMTP id z6mr674996wro.207.1627496261720;
 Wed, 28 Jul 2021 11:17:41 -0700 (PDT)
Received: from x1w.. (122.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id
 v5sm614199wrd.74.2021.07.28.11.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 11:17:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1 2/3] hw/sd/sdcard: Fix assertion accessing
 out-of-range addresses with CMD30
Date: Wed, 28 Jul 2021 20:17:27 +0200
Message-Id: <20210728181728.2012952-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210728181728.2012952-1-f4bug@amsat.org>
References: <20210728181728.2012952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
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
Cc: qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-stable@nongnu.org, Alexander Bulekov <alxndr@bu.edu>, qemu-arm@nongnu.org
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

Note, we had an off-by-one in the wpgrps_size check since commit
a1bb27b1e98. Since we have a total of 'wpgrps_size' bits, the latest
valid group bit is 'wpgrps_size - 1'.

Since we now check the group bit is in range, remove the assertion.

Include the qtest reproducer provided by Alexander Bulekov:

  $ make check-qtest-i386
  ...
  Running test qtest-i386/fuzz-sdcard-test
  qemu-system-i386: ../hw/sd/sd.c:824: sd_wpbits: Assertion `wpnum < sd->wpgrps_size' failed.

Cc: qemu-stable@nongnu.org
Reported-by: OSS-Fuzz (Issue 29225)
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/495
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c                     |  4 ++--
 tests/qtest/fuzz-sdcard-test.c | 36 ++++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 707dcc12a14..273af75c1be 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -820,8 +820,8 @@ static uint32_t sd_wpbits(SDState *sd, uint64_t addr)
 
     wpnum = sd_addr_to_wpnum(addr);
 
-    for (i = 0; i < 32; i++, wpnum++, addr += WPGROUP_SIZE) {
-        assert(wpnum < sd->wpgrps_size);
+    for (i = 0; i < 32 && wpnum < sd->wpgrps_size - 1;
+                i++, wpnum++, addr += WPGROUP_SIZE) {
         if (addr >= sd->size) {
             /*
              * If the addresses of the last groups are outside the valid range,
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


