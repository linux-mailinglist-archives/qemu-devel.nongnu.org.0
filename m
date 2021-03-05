Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E5832EFFC
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 17:26:01 +0100 (CET)
Received: from localhost ([::1]:53780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIDH6-0002qT-Gz
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 11:26:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIDCq-0006yl-Kg
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:21:36 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:53969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIDCo-0007Mv-Aa
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:21:36 -0500
Received: by mail-wm1-x32d.google.com with SMTP id e23so1947596wmh.3
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 08:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L3v18ZL7N+cktt0efKAeS8NVT3CCQT0jjeaLH5CTmjc=;
 b=k9/JNp+drIugeMIXMV6TMBWcQZ9odEDj5cXVzLjG4tafg9VBwnyFBQBb9WgPItNtHn
 qnRTcC1L1wcObVOub5enOWlcUxN3MpwP2EHW46CMJHk8l7iKVEkmb70Bcev+QqESukSJ
 HHNndlTtkTUi7XysWReM2yQuWni0gtNE53X+OyBd8AS2K+bQ+eiEsXTA7tdxmnirZ5xz
 yeKxXkulVez+c2Tj9WmgUzFEjgsFVQ8fGLsGJ1LkxCvYkJ8xQxLepx2mV3qTNSa+yO96
 UdvbKw34xHrkjaRjFgnUEgHZdoVpTsbrwG+lo8Sa6/vt2hgt8Fj4HmkT/kVv9hoKzSMD
 Q0jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=L3v18ZL7N+cktt0efKAeS8NVT3CCQT0jjeaLH5CTmjc=;
 b=KMYprQ1NC1Y8xgJvmRwgVccwR6W5cnSFDvOlLrhDPWY0v2AVe9lBnlrN3gEGkBJMr4
 MzRopTUnpCSwlzSeyjE25dmOLnd9I5ls/JEqTp+5gZyu1Csd0xGNJ/cPjWctStJmg4ZK
 yYppFALA6vCaGK47r/tHAmdGYNqL7JblF2kY1hNKJzUs8jKaDUI7K94X3i8I7clGVrDF
 /d+WiOP0Rs4+DvI69OlI+c40nHe+j0dOXZ3lozUPeBRXawW2D6zEUEvZ/OF/Atzpwm8B
 /Yhw7T4nLYTbqGDZNGJtx2lM7zHxSQUfJ1bJk2ldXnMOilrzHW+LmyuPHh7/CNr3s5Et
 +pqQ==
X-Gm-Message-State: AOAM531ZqVofDqi7k2tZJvGD/S/HX1iAJMCP6cObxUZmXqSjcve4TECo
 H2EH4C2L1U/xD/rXyUCxcD+97WNZTRI=
X-Google-Smtp-Source: ABdhPJzcKBxGMWeSS8wj12nugQVqSTpzYfqURfdxUV7ksFDCHRqEJ9fWsBVmibW+1xH5QkirzO8nsA==
X-Received: by 2002:a7b:cbd1:: with SMTP id n17mr3968714wmi.170.1614961292783; 
 Fri, 05 Mar 2021 08:21:32 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f7sm5026504wmh.39.2021.03.05.08.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 08:21:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/6] hw/mips/gt64xxx: Trace accesses to ISD registers
Date: Fri,  5 Mar 2021 17:21:06 +0100
Message-Id: <20210305162107.2233203-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210305162107.2233203-1-f4bug@amsat.org>
References: <20210305162107.2233203-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Trace all accesses to Internal Space Decode (ISD) registers.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/gt64xxx_pci.c | 2 ++
 hw/mips/trace-events  | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index 9a12d00d1e1..43349d6837d 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -387,6 +387,7 @@ static void gt64120_writel(void *opaque, hwaddr addr,
     PCIHostState *phb = PCI_HOST_BRIDGE(s);
     uint32_t saddr = addr >> 2;
 
+    trace_gt64120_write(addr, val);
     if (!(s->regs[GT_CPU] & 0x00001000)) {
         val = bswap32(val);
     }
@@ -966,6 +967,7 @@ static uint64_t gt64120_readl(void *opaque,
     if (!(s->regs[GT_CPU] & 0x00001000)) {
         val = bswap32(val);
     }
+    trace_gt64120_read(addr, val);
 
     return val;
 }
diff --git a/hw/mips/trace-events b/hw/mips/trace-events
index b7e934c3933..13ee731a488 100644
--- a/hw/mips/trace-events
+++ b/hw/mips/trace-events
@@ -1,4 +1,6 @@
 # gt64xxx_pci.c
+gt64120_read(uint64_t addr, uint64_t value) "gt64120 read 0x%03"PRIx64" value:0x%08" PRIx64
+gt64120_write(uint64_t addr, uint64_t value) "gt64120 write 0x%03"PRIx64" value:0x%08" PRIx64
 gt64120_read_intreg(const char *regname, unsigned size, uint64_t value) "gt64120 read %s size:%u value:0x%08" PRIx64
 gt64120_write_intreg(const char *regname, unsigned size, uint64_t value) "gt64120 write %s size:%u value:0x%08" PRIx64
 gt64120_isd_remap(uint64_t from_length, uint64_t from_addr, uint64_t to_length, uint64_t to_addr) "ISD: 0x%08" PRIx64 "@0x%08" PRIx64 " -> 0x%08" PRIx64 "@0x%08" PRIx64
-- 
2.26.2


