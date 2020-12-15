Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BC12DA835
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 07:50:05 +0100 (CET)
Received: from localhost ([::1]:45622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp49s-000296-6k
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 01:50:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kp45W-00061W-SZ
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 01:45:34 -0500
Received: from relay4.mymailcheap.com ([137.74.80.156]:56111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kp45T-0004xG-Tb
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 01:45:33 -0500
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com
 [91.134.140.82])
 by relay4.mymailcheap.com (Postfix) with ESMTPS id A657D3F20A;
 Tue, 15 Dec 2020 07:45:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by filter2.mymailcheap.com (Postfix) with ESMTP id 759D32A7C5;
 Tue, 15 Dec 2020 07:45:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
 s=default; t=1608014730;
 bh=CNQZUp/uUP92ip3oJH4DOwjwgvT3AQbjqIxo+Z3m7Bs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RcoR6ZcJuswxn422Hn7rMDAB4ijqXpCAmBLw3sStJbPFMsIalUk3XsjKxNbQU8xj8
 N2nN+4At1nwVFPbjA++Uv38I60401MuxHPmaxYQ7B7t9mzcxhWIc8hWjRmPlMRR9P/
 Xur+eL4UOrnfod+3zO6zRp8KWJaPVMfdwv1nb2GE=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
 by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qU9TWtW2L03c; Tue, 15 Dec 2020 07:45:29 +0100 (CET)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by filter2.mymailcheap.com (Postfix) with ESMTPS;
 Tue, 15 Dec 2020 07:45:29 +0100 (CET)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
 by mail20.mymailcheap.com (Postfix) with ESMTP id 1E77941001;
 Tue, 15 Dec 2020 06:45:29 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com; dkim=pass (1024-bit key;
 unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="Pga2ORzW"; 
 dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from strike.U-LINK.com (unknown [116.228.84.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id 1AC46403B9;
 Tue, 15 Dec 2020 06:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
 s=default; t=1608014723;
 bh=CNQZUp/uUP92ip3oJH4DOwjwgvT3AQbjqIxo+Z3m7Bs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Pga2ORzWyib1cQchDMCyRQvKI7j4KXoVOgdMer56+wTaN4W9dyGqSWAD4vZlpBBek
 w2y4Ctk0KZiyxaUNATE6gAGcXZvgPkFZi+IixTUL32oJvxzCWiVeP+mkpaMY8CoPyd
 J/eZXwwe2JA0bjJ3YIbNhgsWZGM0KM/fztg835s0=
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/8] target/mips/addr: Add translation helpers for KSEG1
Date: Tue, 15 Dec 2020 14:45:06 +0800
Message-Id: <20201215064507.30148-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201215064200.28751-1-jiaxun.yang@flygoat.com>
References: <20201215064200.28751-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: mail20.mymailcheap.com
X-Spamd-Result: default: False [4.90 / 10.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(0.00)[flygoat.com:s=default]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 BROKEN_CONTENT_TYPE(1.50)[]; R_SPF_SOFTFAIL(0.00)[~all:c];
 RCPT_COUNT_FIVE(0.00)[5]; ML_SERVERS(-3.10)[213.133.102.83];
 DKIM_TRACE(0.00)[flygoat.com:+];
 DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
 MID_CONTAINS_FROM(1.00)[];
 DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
 RCVD_COUNT_TWO(0.00)[2];
 HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1]
X-Rspamd-Queue-Id: 1E77941001
X-Spam: Yes
Received-SPF: pass client-ip=137.74.80.156;
 envelope-from=jiaxun.yang@flygoat.com; helo=relay4.mymailcheap.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_SORBS_WEB=1.5,
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
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, chenhuacai@kernel.org,
 f4bug@amsat.org, paulburton@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's useful for bootloader to do IO opreations.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 target/mips/addr.c | 10 ++++++++++
 target/mips/cpu.h  |  2 ++
 2 files changed, 12 insertions(+)

diff --git a/target/mips/addr.c b/target/mips/addr.c
index 27a6036c45..86f1c129c9 100644
--- a/target/mips/addr.c
+++ b/target/mips/addr.c
@@ -40,6 +40,16 @@ uint64_t cpu_mips_kvm_um_phys_to_kseg0(void *opaque, uint64_t addr)
     return addr | 0x40000000ll;
 }
 
+uint64_t cpu_mips_kseg1_to_phys(void *opaque, uint64_t addr)
+{
+    return addr & 0x1fffffffll;
+}
+
+uint64_t cpu_mips_phys_to_kseg1(void *opaque, uint64_t addr)
+{
+    return (addr & 0x1fffffffll) | 0xffffffffa0000000ll;
+}
+
 bool mips_um_ksegs_enabled(void)
 {
     return mips_um_ksegs;
diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 3ac21d0e9c..0bb1218a57 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1303,6 +1303,8 @@ uint64_t cpu_mips_kseg0_to_phys(void *opaque, uint64_t addr);
 uint64_t cpu_mips_phys_to_kseg0(void *opaque, uint64_t addr);
 
 uint64_t cpu_mips_kvm_um_phys_to_kseg0(void *opaque, uint64_t addr);
+uint64_t cpu_mips_kseg1_to_phys(void *opaque, uint64_t addr);
+uint64_t cpu_mips_phys_to_kseg1(void *opaque, uint64_t addr);
 bool mips_um_ksegs_enabled(void);
 void mips_um_ksegs_enable(void);
 
-- 
2.29.2

