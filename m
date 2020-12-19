Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 898572DEDAF
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 08:20:58 +0100 (CET)
Received: from localhost ([::1]:49952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqWXx-0001ZP-K4
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 02:20:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kqWVy-0000jA-7Y
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 02:18:54 -0500
Received: from relay1.mymailcheap.com ([149.56.97.132]:33408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kqWVv-0006Nu-Mv
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 02:18:52 -0500
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com
 [91.134.140.82])
 by relay1.mymailcheap.com (Postfix) with ESMTPS id ABAAC3F201;
 Sat, 19 Dec 2020 07:18:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by filter2.mymailcheap.com (Postfix) with ESMTP id F18A42A524;
 Sat, 19 Dec 2020 08:18:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
 s=default; t=1608362330;
 bh=eKoDjSU09L+lCJ3Pvy0RBeJSqAVU9BqQvA7QQSHj1V4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=j0RBNvOfcesrQqRHOzVMzakJ/4I2mbUai7Q2VOYDQo3Q9yvkfqWAd5W4/pX4u7qXt
 SoZwxuGFbhLn6VVXTvMNCWar6GzweV7WEucrfSa9O06UU+YBD8F3Fp54wITjYbRIe9
 UFQ4Cdpuq8XyxjaU3t7R5frkYLn/wpAF7jY6TkqU=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
 by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6b_xEY6NfsfY; Sat, 19 Dec 2020 08:18:48 +0100 (CET)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by filter2.mymailcheap.com (Postfix) with ESMTPS;
 Sat, 19 Dec 2020 08:18:47 +0100 (CET)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
 by mail20.mymailcheap.com (Postfix) with ESMTP id AB8A741009;
 Sat, 19 Dec 2020 07:18:47 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com; dkim=pass (1024-bit key;
 unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="sAgNLeEO"; 
 dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from localhost.localdomain (unknown [180.97.240.22])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id BFD0141009;
 Sat, 19 Dec 2020 07:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
 s=default; t=1608362319;
 bh=eKoDjSU09L+lCJ3Pvy0RBeJSqAVU9BqQvA7QQSHj1V4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sAgNLeEOwPqvDQVvrPZovfVqp+kveMyBD6Iv6Ppqs2VewvgS6KY/GTLzwAWy3ytUz
 9RvWbK9PXq1wOdRaZ4gxabRTnpPGQqgPAVHvxRUlJWTuxmwQMGHgXDZMXJJgI8MgH8
 kZZUCyEy3LkM5NX6vWMoUp9flskCXmlZtMfxhxbo=
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/8] hw/pci-host/bonito: Fixup pci.lomem mapping
Date: Sat, 19 Dec 2020 15:18:16 +0800
Message-Id: <20201219071816.37963-2-jiaxun.yang@flygoat.com>
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
X-Rspamd-Queue-Id: AB8A741009
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

The original mapping had wrong base address.
Fix by correct the base adress and merge three alias into
a single.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 hw/pci-host/bonito.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index 43b79448a9..3a31ba42f2 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -608,7 +608,7 @@ static void bonito_pcihost_realize(DeviceState *dev, Error **errp)
 {
     PCIHostState *phb = PCI_HOST_BRIDGE(dev);
     BonitoState *bs = BONITO_PCI_HOST_BRIDGE(dev);
-    MemoryRegion *pcimem_lo_alias = g_new(MemoryRegion, 3);
+    MemoryRegion *pcimem_lo_alias = g_new(MemoryRegion, 1);
 
     memory_region_init(&bs->pci_mem, OBJECT(dev), "pci.mem", BONITO_PCIHI_SIZE);
     phb->bus = pci_register_root_bus(dev, "pci",
@@ -616,16 +616,11 @@ static void bonito_pcihost_realize(DeviceState *dev, Error **errp)
                                      dev, &bs->pci_mem, get_system_io(),
                                      0x28, 32, TYPE_PCI_BUS);
 
-    for (size_t i = 0; i < 3; i++) {
-        char *name = g_strdup_printf("pci.lomem%zu", i);
-
-        memory_region_init_alias(&pcimem_lo_alias[i], NULL, name,
-                                 &bs->pci_mem, i * 64 * MiB, 64 * MiB);
-        memory_region_add_subregion(get_system_memory(),
-                                    BONITO_PCILO_BASE + i * 64 * MiB,
-                                    &pcimem_lo_alias[i]);
-        g_free(name);
-    }
+    memory_region_init_alias(pcimem_lo_alias, OBJECT(dev), "pci.lomem",
+                             &bs->pci_mem, BONITO_PCILO_BASE,
+                             BONITO_PCILO_SIZE);
+    memory_region_add_subregion(get_system_memory(), BONITO_PCILO_BASE,
+                                pcimem_lo_alias);
 
     create_unimplemented_device("pci.io", BONITO_PCIIO_BASE, 1 * MiB);
 }
-- 
2.29.2

