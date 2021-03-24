Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B41E53480AA
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 19:39:23 +0100 (CET)
Received: from localhost ([::1]:36074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP8PZ-0005Ts-Gn
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 14:39:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lP8Ff-0007nC-Rg
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:29:07 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:40898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lP8Fe-0000PB-Ap
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:29:07 -0400
Received: by mail-wr1-x42f.google.com with SMTP id v11so25429490wro.7
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 11:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pcPPtBK5FpxgZM5Y3MVvoO2LN2w3qmNzFLch2LcMMNQ=;
 b=FahV4kHEHZjw5zHfgXYtdh4n/MZMUgiZpVCYP5alnnaQ2Pgbun2pjMordrKWz1zlSk
 YgJYfIZKxrQeqgIicIzCymSdPudkE4oQC00pZucZ51YBHhFA5NyKtDd5KVVSG+2/EstH
 OreEgsnyyCsyAGzTth+R2pEz/iUk6MCMcWk/azNBF5gvHfH9o4Xrgc3oWFfyHW5u5TEg
 MhZ+MDwIAEKzPovvpnv1fXliRp9o7CGTHWVsqa9WB3YYRAYMoBilGE0aMJI/PYEsxZxd
 Z7eQZitdlPJC+qLrWEbZVMhVlyLqgPjl4IsseCOPBwIPGxC4kCE1onXctHvxRfCkLy9y
 kM6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=pcPPtBK5FpxgZM5Y3MVvoO2LN2w3qmNzFLch2LcMMNQ=;
 b=EZ3byvVTdqImYUM7R/43B/2QMCcHngeE6Rcn2InSBXyrWrmbPZsdDzAa6TtZdRLZ61
 bEDpoUZ1hbxYDWSr34Sa8vp+Xe6Aaox4WEtcg2GIVPx/qb2CbGIp2QuP09x8ZX18mTFs
 A+AEMU4OWnqYH17pQT4njpzzD1dCxrFbgnmH1P2FIaXJBd6L5qEHtKR/UnII024M/PAp
 BFTe/4L0RY/DoN4HYVjjqjt2NT0vPQG05r0s1eg+GCD9HRhKSSXwZELbvCb72V96jt5p
 Zy8GTcO3PAuq4/iJqR5zg2JOCFdynhy09Jp8CiJSSjlxr48pxr/fr6U2w0yOB3EV3tKs
 vuRg==
X-Gm-Message-State: AOAM530Abr7h+KB2NDN0mpn1BuQPr8hDGS9PfoW5tYSVLkWlQu687e5B
 TxKfgMkFL8QVJOkpeR5jXsZuuCMeOYhkQQ==
X-Google-Smtp-Source: ABdhPJzAHrWQHAnXQD4PsQBTnS6Qn49xSJbfOFgdw2nFw2yXPoLCrk2+mqvdOU+lZHN/7Dh6nVnVzQ==
X-Received: by 2002:a5d:6412:: with SMTP id z18mr4920004wru.214.1616610544385; 
 Wed, 24 Mar 2021 11:29:04 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id s83sm3630172wms.16.2021.03.24.11.29.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 11:29:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1] hw/isa/piix4: Use qdev_get_gpio_in_named() to get ISA
 IRQ
Date: Wed, 24 Mar 2021 19:29:02 +0100
Message-Id: <20210324182902.692419-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
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
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit 078778c5a55 ("piix4: Add an i8259 Interrupt Controller")
the TYPE_PIIX4_PCI_DEVICE exposes the ISA input IRQs as "isa" alias.

Use this alias to get IRQ for the power management PCI function.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/piix4.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index a50d97834c7..33b94e4511f 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -255,8 +255,9 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
     pci_create_simple(pci_bus, devfn + 2, "piix4-usb-uhci");
     if (smbus) {
         *smbus = piix4_pm_init(pci_bus, devfn + 3, 0x1100,
-                               isa_get_irq(NULL, 9), NULL, 0, NULL);
-   }
+                               qdev_get_gpio_in_named(dev, "isa", 9),
+                               NULL, 0, NULL);
+    }
 
     return dev;
 }
-- 
2.26.2


