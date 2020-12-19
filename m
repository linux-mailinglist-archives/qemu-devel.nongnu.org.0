Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFCD2DEDB4
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 08:26:10 +0100 (CET)
Received: from localhost ([::1]:56008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqWcy-0004jh-LO
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 02:26:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kqWZT-0002lo-UY
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 02:22:31 -0500
Received: from relay4.mymailcheap.com ([137.74.80.154]:50947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kqWZS-0007un-2z
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 02:22:31 -0500
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com
 [91.134.140.82])
 by relay4.mymailcheap.com (Postfix) with ESMTPS id 5AE883F162;
 Sat, 19 Dec 2020 08:22:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by filter2.mymailcheap.com (Postfix) with ESMTP id 2A2E52A524;
 Sat, 19 Dec 2020 08:22:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
 s=default; t=1608362548;
 bh=zkf8OP88hZRH0n+IZi2DL1V5j7BrE4FS4wH4Q9tOVEw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=U0wlZm19kMcZmuqlMqWRnZQ7xKYR3Hx0oXzZmiKUQ3eTNzpD53opSrAwwAfX/boBQ
 uyjJPPTLr2Kc8uEq0pMlEoOl6CuqlYRGgCCn51k0w9+iy32P9iPi7Z0VHulvWUYTGM
 I4kBPmAgxKWhX7vCFaHwly+I1MqJVpn03cBuR/Cg=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
 by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gQHDqy8-bp12; Sat, 19 Dec 2020 08:22:27 +0100 (CET)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by filter2.mymailcheap.com (Postfix) with ESMTPS;
 Sat, 19 Dec 2020 08:22:27 +0100 (CET)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
 by mail20.mymailcheap.com (Postfix) with ESMTP id DE3A941009;
 Sat, 19 Dec 2020 07:22:26 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com; dkim=pass (1024-bit key;
 unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="tvn2cDJp"; 
 dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from localhost.localdomain (unknown [180.97.240.22])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id 5C19541E18;
 Sat, 19 Dec 2020 07:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
 s=default; t=1608362535;
 bh=zkf8OP88hZRH0n+IZi2DL1V5j7BrE4FS4wH4Q9tOVEw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tvn2cDJpOmJ9K9XiVMvba9g7r8CygALoTEx30RrQx2m4B8+7aQq+FjQcS2Aoepx3v
 pepKzquk54h94c8JwNnlnKkq5jVDi9LmYhZa2Lrc1c93Uw6H//IoeFBqAVDME4FWDz
 quITOa9YYIRn5AUJrdmYtffe26bJmKYR+yH/GAXE=
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/8] hw/mips/fuloong2e: Correct cpuclock env
Date: Sat, 19 Dec 2020 15:21:39 +0800
Message-Id: <20201219072139.39347-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201219071235.35040-1-jiaxun.yang@flygoat.com>
References: <20201219071235.35040-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [8.90 / 10.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
 RECEIVED_SPAMHAUS_CSS(1.00)[180.97.240.22:received];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 R_MISSING_CHARSET(2.50)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; BROKEN_CONTENT_TYPE(1.50)[];
 R_SPF_SOFTFAIL(0.00)[~all:c]; RCPT_COUNT_FIVE(0.00)[6];
 ML_SERVERS(-3.10)[213.133.102.83];
 DKIM_TRACE(0.00)[flygoat.com:+];
 DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
 MID_CONTAINS_FROM(1.00)[];
 DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
 RECEIVED_SPAMHAUS_XBL(3.00)[180.97.240.22:received];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
 RCVD_COUNT_TWO(0.00)[2];
 HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1]
X-Rspamd-Queue-Id: DE3A941009
X-Rspamd-Server: mail20.mymailcheap.com
X-Spam: Yes
Received-SPF: pass client-ip=137.74.80.154;
 envelope-from=jiaxun.yang@flygoat.com; helo=relay4.mymailcheap.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_SBL_CSS=3.335,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: chenhuacai@kernel.org, f4bug@amsat.org, wainersm@redhat.com,
 crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It was missed in 3ca7639ff00 ("hw/mips/fuloong2e:
Set CPU frequency to 533 MHz"), we need to tell kernel
correct clocks.

Fixes: 3ca7639ff00 ("hw/mips/fuloong2e: Set CPU frequency to 533 MHz").
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 hw/mips/fuloong2e.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index c4843dd15e..2744b211fd 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -100,7 +100,7 @@ static void GCC_FMT_ATTR(3, 4) prom_set(uint32_t *prom_buf, int index,
     va_end(ap);
 }
 
-static uint64_t load_kernel(CPUMIPSState *env)
+static uint64_t load_kernel(MIPSCPU *cpu)
 {
     uint64_t kernel_entry, kernel_high, initrd_size;
     int index = 0;
@@ -159,7 +159,7 @@ static uint64_t load_kernel(CPUMIPSState *env)
     }
 
     /* Setup minimum environment variables */
-    prom_set(prom_buf, index++, "cpuclock=100000000");
+    prom_set(prom_buf, index++, "cpuclock=%u", clock_get_hz(cpu->clock));
     prom_set(prom_buf, index++, "memsize=%"PRIi64, loaderparams.ram_size / MiB);
     prom_set(prom_buf, index++, NULL);
 
@@ -304,7 +304,7 @@ static void mips_fuloong2e_init(MachineState *machine)
         loaderparams.kernel_filename = kernel_filename;
         loaderparams.kernel_cmdline = kernel_cmdline;
         loaderparams.initrd_filename = initrd_filename;
-        kernel_entry = load_kernel(env);
+        kernel_entry = load_kernel(cpu);
         write_bootloader(env, memory_region_get_ram_ptr(bios), kernel_entry);
     } else {
         filename = qemu_find_file(QEMU_FILE_TYPE_BIOS,
-- 
2.29.2

