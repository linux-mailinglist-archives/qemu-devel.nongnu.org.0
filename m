Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DC62E8E2C
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 21:54:02 +0100 (CET)
Received: from localhost ([::1]:44598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwAO1-0005gU-4s
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 15:54:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwAKd-0002GF-QC
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:50:31 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:53512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwAKc-0005Zg-D2
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:50:31 -0500
Received: by mail-wm1-x334.google.com with SMTP id k10so15960707wmi.3
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 12:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gAe+ySOPN0ziiB9Rsr0qc0IoOAIOTLWZuAmtV89p3uU=;
 b=U2DhFvJ66OYBTjFqTNoB8wHvw32hZo/1wIWRzOmSWUaC8xI7vyo1K852LrTO7ZRl67
 hBnmjGjiDLxkYefwdGlYITf0NAK9UfHVaPG+LeuND4Au9t3D+vst0/bNHVzWHvtqFE7j
 acci5BFRc0ommVIzqVRVkbUNUJJOrDbL+W3mMu7/c7lFCMuKXuMoOkEJNJ5qWOKpEifY
 0QUWJIqyLcBhMXrtAT2A9FU+DnvhfqmfjSWaQNTPfCq534LHp38AI0CfNnFkoEL/cPWB
 P/6KGht7mjyyk0s+ZI2Ay3apG25wEud9Kk6z2Uw4tS18GPQvP1QdKA5dTMayQ6r2cmRU
 0xQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gAe+ySOPN0ziiB9Rsr0qc0IoOAIOTLWZuAmtV89p3uU=;
 b=DnvcvdJHcsR2i6G/j+RrvmeMBHCtFz9lJ/5Z58RI27BGIewHpj0oiqGf1Aal4nqIdA
 nVM6yQkUa68gzyLE+i/aUM3uSwTs9iiZok700ANXCiyam7V2/55eguMfWH8fUJTmJZF5
 g1W0ZbeuoikUJfUALjKSqWztfPbK3h66HwUJ3kjdR9LfcaM03i1AQKZVq61/2JZPvZ5J
 Mq95l7TJD9EbQITvIGoa//oOYE31MBIIJi0eKVHsFEWREfJdZRPSCZ6jIcqD1BYcCJb8
 kchc8h/uskOcik+iwEK/JJtH/e5hGcu94XATCAbRVH9paiIjaQofAdh9a5FjDZgj71f3
 aJBw==
X-Gm-Message-State: AOAM533F4lWJPYnQsQXkLIDjM/pdcP15u3V+ZxarbQGmpwMX5srfwE+w
 KocL75Fh3vWHbltfy7oNTf9WsV0rUIU=
X-Google-Smtp-Source: ABdhPJzOMyRRIqVILF2QacHFbgrWNhP3hxGAxT7fqhT+y35VyqrzHaGfn5lOOtxWIyj84fivdCnMyA==
X-Received: by 2002:a05:600c:211:: with SMTP id
 17mr24154915wmi.84.1609707029019; 
 Sun, 03 Jan 2021 12:50:29 -0800 (PST)
Received: from localhost.localdomain
 (194.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id s25sm96778933wrs.49.2021.01.03.12.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jan 2021 12:50:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/35] hw/pci-host: Use the PCI_BUILD_BDF() macro from
 'hw/pci/pci.h'
Date: Sun,  3 Jan 2021 21:49:47 +0100
Message-Id: <20210103205021.2837760-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103205021.2837760-1-f4bug@amsat.org>
References: <20210103205021.2837760-1-f4bug@amsat.org>
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
Cc: David Gibson <david@gibson.dropbear.id.au>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already have a generic PCI_BUILD_BDF() macro in "hw/pci/pci.h"
to pack these values, use it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20201012124506.3406909-3-philmd@redhat.com>
---
 hw/pci-host/bonito.c   | 3 +--
 hw/pci-host/pnv_phb4.c | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index a99eced0657..b05295639a6 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -196,8 +196,7 @@ FIELD(BONGENCFG, PCIQUEUE,      12, 1)
 #define PCI_IDSEL_VIA686B          (1 << PCI_IDSEL_VIA686B_BIT)
 
 #define PCI_ADDR(busno , devno , funno , regno)  \
-    ((((busno) << 16) & 0xff0000) + (((devno) << 11) & 0xf800) + \
-    (((funno) << 8) & 0x700) + (regno))
+    ((PCI_BUILD_BDF(busno, PCI_DEVFN(devno , funno)) << 8) + (regno))
 
 typedef struct BonitoState BonitoState;
 
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 03daf40a237..6328e985f81 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -889,7 +889,7 @@ static bool pnv_phb4_resolve_pe(PnvPhb4DMASpace *ds)
     /* Read RTE */
     bus_num = pci_bus_num(ds->bus);
     addr = rtt & PHB_RTT_BASE_ADDRESS_MASK;
-    addr += 2 * ((bus_num << 8) | ds->devfn);
+    addr += 2 * PCI_BUILD_BDF(bus_num, ds->devfn);
     if (dma_memory_read(&address_space_memory, addr, &rte, sizeof(rte))) {
         phb_error(ds->phb, "Failed to read RTT entry at 0x%"PRIx64, addr);
         /* Set error bits ? fence ? ... */
-- 
2.26.2


