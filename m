Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F8F2DEDA8
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 08:14:29 +0100 (CET)
Received: from localhost ([::1]:41266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqWRf-0006Cm-MS
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 02:14:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kqWQM-0005Og-5k
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 02:13:06 -0500
Received: from relay1.mymailcheap.com ([149.56.97.132]:47428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kqWQG-0003sX-EO
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 02:13:05 -0500
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com
 [91.134.140.82])
 by relay1.mymailcheap.com (Postfix) with ESMTPS id 642E73F201;
 Sat, 19 Dec 2020 07:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by filter2.mymailcheap.com (Postfix) with ESMTP id A885D2A524;
 Sat, 19 Dec 2020 08:12:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
 s=default; t=1608361977;
 bh=f9kzqVajYw0kHsOJgVnfCbJm4vyhZb+LIwVZk6QRM5U=;
 h=From:To:Cc:Subject:Date:From;
 b=W2UTV0ALRWsFldHqaxfdmOKfN/VLMngpGqWhUs0Yeque6V4VyuoPDGDIkYIcPi4Ls
 MGhZBqS7sO5u5OgC3ebiAKlTo9bJxiFICG6bMWrOhxCcAlEOAOqW+TFjrR7RoogMOR
 6ZRhvSvrVulZA9OVCcOdnyuRuc0I7GKBq+fHwG3M=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
 by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gEZT22ejHhH9; Sat, 19 Dec 2020 08:12:56 +0100 (CET)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by filter2.mymailcheap.com (Postfix) with ESMTPS;
 Sat, 19 Dec 2020 08:12:56 +0100 (CET)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
 by mail20.mymailcheap.com (Postfix) with ESMTP id C337E41E18;
 Sat, 19 Dec 2020 07:12:53 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com; dkim=pass (1024-bit key;
 unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="l6/JTcLU"; 
 dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from localhost.localdomain (unknown [180.97.240.22])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id 97BFD41009;
 Sat, 19 Dec 2020 07:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
 s=default; t=1608361969;
 bh=f9kzqVajYw0kHsOJgVnfCbJm4vyhZb+LIwVZk6QRM5U=;
 h=From:To:Cc:Subject:Date:From;
 b=l6/JTcLUdh/lZMf7UPivsMXjrf+hVJpufVMemAhi52DzD2HOkjocGSE+EKa4bGRN+
 HH6pluBtA+cJD8LIKaIEe2MmtdKx9yT4odc5dfBOcK3pbU0lRYXMs4yNdO8DvO61PB
 TVcJjpYHb3HKHdELJ33CgaQRddFMDWqhHEKXDW6g=
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/8] hm/mips/fuloong2e fixes
Date: Sat, 19 Dec 2020 15:12:27 +0800
Message-Id: <20201219071235.35040-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [4.90 / 10.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_XBL(3.00)[180.97.240.22:received];
 R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
 RECEIVED_SPAMHAUS_CSS(1.00)[180.97.240.22:received];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; R_SPF_SOFTFAIL(0.00)[~all];
 RCPT_COUNT_FIVE(0.00)[6]; ML_SERVERS(-3.10)[213.133.102.83];
 DKIM_TRACE(0.00)[flygoat.com:+];
 DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
 MID_CONTAINS_FROM(1.00)[];
 DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
 RCVD_COUNT_TWO(0.00)[2];
 HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1]
X-Rspamd-Queue-Id: C337E41E18
X-Rspamd-Server: mail20.mymailcheap.com
X-Spam: Yes
Received-SPF: pass client-ip=149.56.97.132;
 envelope-from=jiaxun.yang@flygoat.com; helo=relay1.mymailcheap.com
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

It can now boot Debian installer[1] as well as a custom PMON bootloader
distribution[2].

Note that it can't boot PMON shipped with actual machine as our ATI vgabios
is using some x86 hack that can't be handled by x86emu in original PMON. 


Tree avilable at: https://gitlab.com/FlyGoat/qemu/-/tree/fuloong_fixes_v2

v2:
 - Collect review tags.
 - Get CPU clock via elegant method. (philmd)
 - Add boot_linux_console scceptance test

[1]: http://archive.debian.org/debian/dists/jessie/main/installer-mipsel/current/images/loongson-2e/netboot/
[2]: https://github.com/loongson-community/pmon/releases/download/20201219/pmon-2edev.bin

Thanks.

- Jiaxun

Jiaxun Yang (8):
  hw/mips/fuloong2e: Remove define DEBUG_FULOONG2E_INIT
  hw/mips/fuloong2e: Relpace fault links
  hw/pci-host/bonito: Fixup IRQ mapping
  hw/pci-host/bonito: Fixup pci.lomem mapping
  hw/mips/fuloong2e: Remove unused env entry
  hw/mips/fuloong2e: Correct cpuclock env
  hw/mips/fuloong2e: Add highmem support
  tests/acceptance: Test boot_linux_console for fuloong2e

 hw/mips/fuloong2e.c                    | 84 +++++++++++++++++---------
 hw/pci-host/bonito.c                   | 45 ++++----------
 tests/acceptance/boot_linux_console.py | 21 +++++++
 3 files changed, 87 insertions(+), 63 deletions(-)

-- 
2.29.2

