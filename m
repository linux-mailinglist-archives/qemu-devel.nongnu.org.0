Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0079354E62
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 10:18:43 +0200 (CEST)
Received: from localhost ([::1]:59272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTgv4-00070M-Tw
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 04:18:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lTgs8-0004Vg-Ga; Tue, 06 Apr 2021 04:15:40 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:35651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lTgs6-0003zZ-KG; Tue, 06 Apr 2021 04:15:40 -0400
Received: by mail-ej1-x62d.google.com with SMTP id u17so14219021ejk.2;
 Tue, 06 Apr 2021 01:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=hpLfcLZHJjMECLvlszpIpEdjfVF3ZYOP2Rby1VxmtQs=;
 b=mgnLZlrAWqZcMxjgsK78yRy6bzEPpRW4DHciSFHGQ6QVB19PuFDG+a2yIaSBPZvvfj
 gLXVJLencsvTMk+rVoAa4NTRzZhVWwN28dmxbThXl2pH0SCR8CoTc7+DfDMe7W8+Niv8
 58erjV/G7GEQZuRwDvRofdCCVzCCvGiZcG6XPJ6n4t01rPXJoak/1e+mMf2gFvMX0brL
 nRSAc7P/RkuIfu/zrZTEymXcA9CdPSeqdPSV+UA35xNPiM+n4WL9wAvoy42CPAus8CQI
 UbNAGzfQLsEqaIIRvF4xAnZvdf3P3PHCQgFKO3OSn5sp6kwWQL5zxys2QOB0ekM8PXfG
 BCMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hpLfcLZHJjMECLvlszpIpEdjfVF3ZYOP2Rby1VxmtQs=;
 b=T1tijZwpwTdVpqOo9+W3Y34RH9LTP9HFOR48Eafy26OQ/68+fpfyAZbqIjsueEtfmR
 8vdXySEvNNaZpGmffA7jIBAdySgwUnyifvOWTgB3tPB5oyMLWJZpYM9rEE6i0OAMIu9c
 vtk7TKxeMGs3waTcKf8eqrypMFak27rNZzyXmV6dH0HEclyrTxEwHh4bKFezzZNtmREp
 3yB0hpQCTYbCIFC89d+FpoMHiga7bxnE8v1ENU+IBtajP10BC2JwFiZaBcNFm/xgH/g3
 OS2W47q0ZF30QeyipZfL0xpIujPPOOnZLtObl0w4nmBwD7KORhNyOlExCNIcRocF3UYf
 rC+w==
X-Gm-Message-State: AOAM530cz6Skqt/KVtuthhhUPzjHXiYpJPFa2G/CY6eV9ULNvHUTgz36
 RBzRPJOFvsSJaMX+qmysVtDPynbBRkw=
X-Google-Smtp-Source: ABdhPJyqj4//RGSOw5PGMDB03WVF6Bi9xAEVW0x2WOOI9ObRrtZznQqNIwZ2boH/O6fQzViUz3AOhA==
X-Received: by 2002:a17:906:4055:: with SMTP id
 y21mr32126202ejj.507.1617696936989; 
 Tue, 06 Apr 2021 01:15:36 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id h23sm2455213ejd.103.2021.04.06.01.15.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 01:15:36 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [for-6.0 PATCH 2/3] roms/u-boot: Bump ppce500 u-boot to v2021.04 to
 fix broken pci support
Date: Tue,  6 Apr 2021 16:15:12 +0800
Message-Id: <20210406081513.1013372-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210406081513.1013372-1-bmeng.cn@gmail.com>
References: <20210406081513.1013372-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When QEMU originally supported the ppce500 machine back in Jan 2014,
it was created with a 1:1 mapping of PCI bus address. Things seemed
to change rapidly that in Nov 2014 with the following QEMU commits:

commit e6b4e5f4795b ("PPC: e500: Move CCSR and MMIO space to upper end of address space")

and

commit cb3778a0455a ("PPC: e500 pci host: Add support for ATMUs")

the PCI memory and IO physical address were moved to beyond 4 GiB,
but PCI bus address remained below 4 GiB, hence a non-identity
mapping was created. Unfortunately corresponding U-Boot updates
were missed along with the QEMU changes and the U-Boot QEMU ppce500
PCI support has been broken since then, until this issue was fixed
recently in U-Boot mainline v2021.04 release, specifically by the
following U-Boot series:

http://patchwork.ozlabs.org/project/uboot/list/?series=230985&state=*

The cross-compilation toolchain used to build the U-Boot image is:
https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/10.1.0/x86_64-gcc-10.1.0-nolibc-powerpc-linux.tar.xz

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 pc-bios/u-boot.e500 | Bin 349148 -> 406920 bytes
 roms/u-boot         |   2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/pc-bios/u-boot.e500 b/pc-bios/u-boot.e500
index 732660f348..d2e29f81d6 100644
Binary files a/pc-bios/u-boot.e500 and b/pc-bios/u-boot.e500 differ
diff --git a/roms/u-boot b/roms/u-boot
index d3689267f9..b46dd116ce 160000
--- a/roms/u-boot
+++ b/roms/u-boot
@@ -1 +1 @@
-Subproject commit d3689267f92c5956e09cc7d1baa4700141662bff
+Subproject commit b46dd116ce03e235f2a7d4843c6278e1da44b5e1
-- 
2.25.1


