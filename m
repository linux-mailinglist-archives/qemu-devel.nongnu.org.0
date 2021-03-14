Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3919D33A8CE
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 00:33:25 +0100 (CET)
Received: from localhost ([::1]:52304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLaEe-0003kL-8F
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 19:33:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLaB2-00081l-TI
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 19:29:40 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:44110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLaB0-0003a1-Uy
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 19:29:40 -0400
Received: by mail-wr1-x429.google.com with SMTP id o14so3990340wrm.11
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 16:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MR0TI0p/wk8rjHEQtPPg4Akk9TSXYFy78Mij8j91GoM=;
 b=YkpxnBpdjI6gHJi9CH80xVmsuUsuX5J2D2vr5VxrX3sp/wEkEz7SFmKOx6SrkIwUGv
 Ks5aWy0xn65GNztYWRi2OKdXabOZABQswFGPAkSMsYfCF+PjQ5bFS1IMbVusgUzC8w3H
 APrgIEsVGU1qI7+PkyrUpOwj4TAhXh9eLpHpl87M1BuXGZRwMssJk08lkKaVjNDimWbE
 f6ragMe8GjebD8vmZ54hAahrs7rNT0gs/mtb2a2ZzOGrQ7PyKgCwSZzi03ly/TYdLCDY
 TQOMzXoDFMkoqjKpjsLnf89C2ssXCuPMq+fncyPzejkG9cqYYF0cT5CEgj49orBqXfWo
 SBeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MR0TI0p/wk8rjHEQtPPg4Akk9TSXYFy78Mij8j91GoM=;
 b=pIxuuWhfJxuO9fTdVzW8nP8iOEN6awr1vnA1A++fr7/Y/64036QII1dPq9msnvvMb6
 iHf+1ygo9qe7IK6BvrnY8wSyWQqHH4H+jQY0b3QvjVVpYzK2DfFaiDMfvpMNF8tm3hUx
 246v8AIvH2NZmn8G+KsBLmcqWJOuuEXjWypAawKBq124OFz8zuji4MGksBSsMCbrpfbe
 OZaoSMS9uNGdQOh7qCLspGb6JuEaXi+nhMfkXKM9KF9L/+ekeWGxt/LAxDMqdxy037KJ
 Owx74OFsCxFBSXiIdY2pUt14E8/K161N2hYIgSy6FW/Rfqk9T9SdDqeqsfBw44G+d4VG
 BEBw==
X-Gm-Message-State: AOAM530rNdQyanB5Gk1qqbTrQ3YRxqH2zghi/XA7fX/v5sW7UF8+USgG
 jhar0XIVvkcYz2v+5OrL0IcS7vxkBFFqBQ==
X-Google-Smtp-Source: ABdhPJwH4XXN0wlyakrsIVtQFO33BnUjaxGyPiNfwEKk18FV8cpayJc8q5Fxq24nWbabDr4kFPoVhQ==
X-Received: by 2002:a5d:4e0b:: with SMTP id p11mr25198732wrt.343.1615764577344; 
 Sun, 14 Mar 2021 16:29:37 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id y205sm12699717wmc.18.2021.03.14.16.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 16:29:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 4/8] qtest/fuzz: Restrict CPU I/O instructions
Date: Mon, 15 Mar 2021 00:29:09 +0100
Message-Id: <20210314232913.2607360-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210314232913.2607360-1-f4bug@amsat.org>
References: <20210314232913.2607360-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict CPU I/O instructions to architectures providing
I/O bus.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/qtest/fuzz/generic_fuzz.c   | 16 ++++++++++------
 tests/qtest/fuzz/qtest_wrappers.c |  4 ++++
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index ee8c17a04c4..3e0089f4a63 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -304,6 +304,13 @@ static bool get_io_address(address_range *result, AddressSpace *as,
     return cb_info.found;
 }
 
+static bool get_mmio_address(address_range *result,
+                             uint8_t index, uint32_t offset)
+{
+    return get_io_address(result, &address_space_memory, index, offset);
+}
+
+#ifdef TARGET_HAS_IOPORT
 static bool get_pio_address(address_range *result,
                             uint8_t index, uint16_t offset)
 {
@@ -318,12 +325,6 @@ static bool get_pio_address(address_range *result,
     return result->addr <= 0xFFFF ? found : false;
 }
 
-static bool get_mmio_address(address_range *result,
-                             uint8_t index, uint32_t offset)
-{
-    return get_io_address(result, &address_space_memory, index, offset);
-}
-
 static void op_in(QTestState *s, const unsigned char * data, size_t len)
 {
     enum Sizes {Byte, Word, Long, end_sizes};
@@ -395,6 +396,7 @@ static void op_out(QTestState *s, const unsigned char * data, size_t len)
         break;
     }
 }
+#endif /* TARGET_HAS_IOPORT */
 
 static void op_read(QTestState *s, const unsigned char * data, size_t len)
 {
@@ -626,8 +628,10 @@ static void handle_timeout(int sig)
 static void generic_fuzz(QTestState *s, const unsigned char *Data, size_t Size)
 {
     void (*ops[]) (QTestState *s, const unsigned char* , size_t) = {
+#ifdef TARGET_HAS_IOPORT
         [OP_IN]                 = op_in,
         [OP_OUT]                = op_out,
+#endif /* TARGET_HAS_IOPORT */
         [OP_READ]               = op_read,
         [OP_WRITE]              = op_write,
         [OP_PCI_READ]           = op_pci_read,
diff --git a/tests/qtest/fuzz/qtest_wrappers.c b/tests/qtest/fuzz/qtest_wrappers.c
index 921d1e5ed3a..d56dda9e9b8 100644
--- a/tests/qtest/fuzz/qtest_wrappers.c
+++ b/tests/qtest/fuzz/qtest_wrappers.c
@@ -24,12 +24,14 @@ static bool serialize = true;
     RET_TYPE __wrap_##NAME_AND_ARGS;\
     RET_TYPE __real_##NAME_AND_ARGS;
 
+#ifdef TARGET_HAS_IOPORT
 WRAP(uint8_t  , qtest_inb(QTestState *s, uint16_t addr))
 WRAP(uint16_t , qtest_inw(QTestState *s, uint16_t addr))
 WRAP(uint32_t , qtest_inl(QTestState *s, uint16_t addr))
 WRAP(void     , qtest_outb(QTestState *s, uint16_t addr, uint8_t value))
 WRAP(void     , qtest_outw(QTestState *s, uint16_t addr, uint16_t value))
 WRAP(void     , qtest_outl(QTestState *s, uint16_t addr, uint32_t value))
+#endif /* TARGET_HAS_IOPORT */
 WRAP(uint8_t  , qtest_readb(QTestState *s, uint64_t addr))
 WRAP(uint16_t , qtest_readw(QTestState *s, uint64_t addr))
 WRAP(uint32_t , qtest_readl(QTestState *s, uint64_t addr))
@@ -50,6 +52,7 @@ WRAP(void,      qtest_memset(QTestState *s, uint64_t addr,
                              uint8_t patt, size_t size))
 
 
+#ifdef TARGET_HAS_IOPORT
 uint8_t __wrap_qtest_inb(QTestState *s, uint16_t addr)
 {
     if (!serialize) {
@@ -103,6 +106,7 @@ void __wrap_qtest_outl(QTestState *s, uint16_t addr, uint32_t value)
         __real_qtest_outl(s, addr, value);
     }
 }
+#endif /* TARGET_HAS_IOPORT */
 
 uint8_t __wrap_qtest_readb(QTestState *s, uint64_t addr)
 {
-- 
2.26.2


