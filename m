Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BC52DEDB9
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 08:30:32 +0100 (CET)
Received: from localhost ([::1]:59954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqWhD-0006YQ-MZ
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 02:30:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kqWb5-000442-Kk
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 02:24:11 -0500
Received: from relay2.mymailcheap.com ([151.80.165.199]:53459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kqWb3-000050-NV
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 02:24:11 -0500
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com
 [149.56.130.247])
 by relay2.mymailcheap.com (Postfix) with ESMTPS id CFE283ECDA;
 Sat, 19 Dec 2020 08:24:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by filter1.mymailcheap.com (Postfix) with ESMTP id 1FC862A374;
 Sat, 19 Dec 2020 02:24:06 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
 s=default; t=1608362646;
 bh=1h22Q81ELmn0MngW57iPmDs3dEPNoGgS5R+YZl2qWC4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IZby4Y9simOvN9Kf2eyvYamCiJUMxZdwghvOkXnV1yRW54KmPimX7rlzqVD4JGhn+
 K4HiekA/jn2EU9jQwVzUClnDz57ltfr++AA/ReUJxPQbNuPqaW4DwdQY4pwp8su3Pw
 gmmyuYDRwxGQqMUWQGVsTL7Tzs1l2QkzOej/Zs40=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
 by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B-Zgs47iHl2h; Sat, 19 Dec 2020 02:24:05 -0500 (EST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by filter1.mymailcheap.com (Postfix) with ESMTPS;
 Sat, 19 Dec 2020 02:24:05 -0500 (EST)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
 by mail20.mymailcheap.com (Postfix) with ESMTP id 3F25C41E18;
 Sat, 19 Dec 2020 07:24:04 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com; dkim=pass (1024-bit key;
 unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="g5WH1VOM"; 
 dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from localhost.localdomain (unknown [180.97.240.22])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id F08FC42F8B;
 Sat, 19 Dec 2020 07:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
 s=default; t=1608362636;
 bh=1h22Q81ELmn0MngW57iPmDs3dEPNoGgS5R+YZl2qWC4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=g5WH1VOMLhy9oHqU9hQK5L0kGKG825nMjTkJ6hb+qtG7NduC2w5BO/PqlGVZhCp8v
 DPOcF11uQdU3IxzmIzurFx/OlIhJWH6fbPZ7f5KNUQwAGUTiM46h+cqWD6byPAgYIn
 zansrugdnmb4AWXp+r7H7Xj9Ro6hBFKkKiWt+P2U=
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 8/8] tests/acceptance: Test boot_linux_console for fuloong2e
Date: Sat, 19 Dec 2020 15:23:26 +0800
Message-Id: <20201219072326.40157-2-jiaxun.yang@flygoat.com>
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
 ML_SERVERS(-3.10)[148.251.23.173];
 DKIM_TRACE(0.00)[flygoat.com:+];
 DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
 MID_CONTAINS_FROM(1.00)[];
 DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
 RECEIVED_SPAMHAUS_XBL(3.00)[180.97.240.22:received];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:24940, ipnet:148.251.0.0/16, country:DE];
 RCVD_COUNT_TWO(0.00)[2];
 HFILTER_HELO_BAREIP(3.00)[148.251.23.173,1]
X-Rspamd-Queue-Id: 3F25C41E18
X-Rspamd-Server: mail20.mymailcheap.com
X-Spam: Yes
Received-SPF: pass client-ip=151.80.165.199;
 envelope-from=jiaxun.yang@flygoat.com; helo=relay2.mymailcheap.com
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

The kernel comes from debian archive so it's trusted.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 tests/acceptance/boot_linux_console.py | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index cc6ec0f8c1..fb41bb7144 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -170,6 +170,27 @@ class BootLinuxConsole(LinuxKernelTest):
         console_pattern = 'Kernel command line: %s' % kernel_command_line
         self.wait_for_console_pattern(console_pattern)
 
+    def test_mips64el_fuloong2e(self):
+        """
+        :avocado: tags=arch:mips64el
+        :avocado: tags=machine:fuloong2e
+        :avocado: tags=endian:little
+        """
+        deb_url = ('http://archive.debian.org/debian/pool/main/l/linux/'
+                   'linux-image-3.16.0-6-loongson-2e_3.16.56-1+deb8u1_mipsel.deb')
+        deb_hash = 'd04d446045deecf7b755ef576551de0c4184dd44'
+        deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
+        kernel_path = self.extract_from_deb(deb_path,
+                                            '/boot/vmlinux-3.16.0-6-loongson-2e')
+
+        self.vm.set_console()
+        kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE + 'console=ttyS0'
+        self.vm.add_args('-kernel', kernel_path,
+                         '-append', kernel_command_line)
+        self.vm.launch()
+        console_pattern = 'Kernel command line: %s' % kernel_command_line
+        self.wait_for_console_pattern(console_pattern)
+
     def test_mips_malta_cpio(self):
         """
         :avocado: tags=arch:mips
-- 
2.29.2

