Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37ACC200213
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jun 2020 08:44:18 +0200 (CEST)
Received: from localhost ([::1]:39336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmAl7-0003Y7-5S
	for lists+qemu-devel@lfdr.de; Fri, 19 Jun 2020 02:44:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4324eb4de=alistair.francis@wdc.com>)
 id 1jmAbt-0005cR-84
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 02:34:46 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:61617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4324eb4de=alistair.francis@wdc.com>)
 id 1jmAbl-00028J-Tq
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 02:34:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1592548478; x=1624084478;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wjfXyN3NWwu3m0SqemYRz9ib0aF+Yfq0vhP7wPn1ngY=;
 b=ovj9nv8oaHi7uiIyak/JwPdJu1a1iU9/OHZ/csgnD47hXhdj1MLmz+Pm
 agtNtSUaNWHlt7rBc+NJ7daOawkuB8cljjcWkJLqGOEZhyqhPo9VtcBSX
 uRNdrcqW6QtLSOXFi20vGqIu+cu7H1unPxoI/JMriACh41/dh1Oyymd5o
 87NHsu1PqQXXRJ8Bywtn8e2Bzt5DaYpyZchWAZx102jqZapzHbmEw39m/
 p0yDePgQgksLKtzAUQF/LbqqRLtwhgNa3/Qtv6cDWJspkSb8NV0sak5TJ
 QYYUjCr4SF2kS2Bnd712Rp2yrONIL6mMd5Vh4Lpm3kfWtHELmt6bKwRD5 g==;
IronPort-SDR: kSY3812w0xCb+s8D2nX19RM1qdtE4OI71MH6b8OUzL738t216NdTuX3pZNwFQBrP+J6QDwrv6P
 C5KgDw6S9o+cd/K8iriZ/pK9HVfq+GLz8U4edaBGSvZdtPJVzBQH+Umd1RwZ1/lImnMnkuGcVb
 lFTrb+Gutd/YraMQQsoi09JrIoZloX2vNaD0nlret1+J5QDRBJwcKp1I5tuEPM6aEHjE9vxelA
 5QTUl4i8XAiSXcsd7Yb+J2sAuhFDebYn1VDM+2797FMomG159USe/bviPqWKUIqCMMXgeuEERD
 kgg=
X-IronPort-AV: E=Sophos;i="5.75,253,1589212800"; d="scan'208";a="144724288"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 19 Jun 2020 14:34:28 +0800
IronPort-SDR: pXNiBjF1KeZRw1aOAfhQe+tNH+Zd93TJvYfORz9ha+kddfMWSNjNP2W3Sf5vx8qKLciVlwfVly
 plJx1GJPXFN6ongIr1uM7/lkdwt+p5FS4=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2020 23:23:39 -0700
IronPort-SDR: AwAwKaPLHJ19qp369xe1LfpJ3BSCjnvwI/5dpASpcMbOOgjYjPDSE6y7KGp4vDZxDHJToxDkvP
 2gYcYXKj6cvQ==
WDCIronportException: Internal
Received: from unknown (HELO risc6-mainframe.hgst.com) ([10.86.58.142])
 by uls-op-cesaip02.wdc.com with ESMTP; 18 Jun 2020 23:34:27 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 08/32] target/riscv: Report errors validating 2nd-stage PTEs
Date: Thu, 18 Jun 2020 23:24:54 -0700
Message-Id: <20200619062518.1718523-9-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200619062518.1718523-1-alistair.francis@wdc.com>
References: <20200619062518.1718523-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=4324eb4de=alistair.francis@wdc.com;
 helo=esa3.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/19 02:34:26
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu_helper.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index eda7057663..75d2ae3434 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -435,8 +435,13 @@ restart:
             hwaddr vbase;
 
             /* Do the second stage translation on the base PTE address. */
-            get_physical_address(env, &vbase, &vbase_prot, base, MMU_DATA_LOAD,
-                                 mmu_idx, false, true);
+            int vbase_ret = get_physical_address(env, &vbase, &vbase_prot,
+                                                 base, MMU_DATA_LOAD,
+                                                 mmu_idx, false, true);
+
+            if (vbase_ret != TRANSLATE_SUCCESS) {
+                return vbase_ret;
+            }
 
             pte_addr = vbase + idx * ptesize;
         } else {
-- 
2.27.0


