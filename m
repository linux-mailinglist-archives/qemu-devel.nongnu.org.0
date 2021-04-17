Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5490A362FD5
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 14:55:00 +0200 (CEST)
Received: from localhost ([::1]:34022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXkTS-0007V0-W8
	for lists+qemu-devel@lfdr.de; Sat, 17 Apr 2021 08:54:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXkSV-00076a-Es
 for qemu-devel@nongnu.org; Sat, 17 Apr 2021 08:53:59 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:38907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXkSU-0004vH-0s
 for qemu-devel@nongnu.org; Sat, 17 Apr 2021 08:53:59 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 y20-20020a1c4b140000b029011f294095d3so17913412wma.3
 for <qemu-devel@nongnu.org>; Sat, 17 Apr 2021 05:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3yXOZoTUfxyQNFAWCAmS1kJdpG0/bIf8MfQR+y546HQ=;
 b=XldwWDSgz9SHReyjm/3fxxbgqVEk8TPCofmhdHAXwc2Ps+cJi8jYrlc8743YX3VNZd
 0Mj24UcS5XKDPf7SyGQc+/TTTlcZUD63Q0SP8pgWrQj33AksedXHSFMVzUnTPTP2qWls
 Glhf6U5ZyRTMIuiYbiL3byYiB4I707XZ4cdIb29+X77Y0c7F3ThJiM5EaCKwOy+CK9CK
 7vAz5oHf2cYBuBU/7n+ue8jKb7AfB3dQKjCvXnrkY18APMUd4AR92U3pVe4wHcZdhmXk
 Cp7zEsX/GmbM/LJ+LpzvItUmLGoU9j7A0eOvlXprHedvYNE+jRcXOFaLwMyEpdRW8OS+
 3VxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=3yXOZoTUfxyQNFAWCAmS1kJdpG0/bIf8MfQR+y546HQ=;
 b=B2e4McNycNHGrbE16i+m3SVF2ftegp8YUir2MzIdeMx6tzlzcXHgo6KKW2knMKqbbz
 w+6eGLtuFIFkTLrN74QZ207ccwpTc6IXAJMxYsptQ0n8xoOdoDaC5En0/s5zY+Inahj+
 ju8Sx+p5KJNhXteD79TTxeMjTtBMaEc0mxg/dvvAs6untAolvYMxTtjucy+05/udYpjQ
 voO+nYGLxkLX3pN8MXSBh7PcR3k5mP1sjPJrFSCWyY9ctkPcBKrOOeJsyx7aSRYLZm88
 XOeI3bB1m1LC9rbKWYFLPHY3sxtTpvlz16TeDJ8BTrV/ApNgSW7shlit/LUrLsX3nH0L
 qQtA==
X-Gm-Message-State: AOAM533wQN2iATzaM5Py62CnhQYWP2OTK08/b2NoIZ9B7fSIuyUFNxHE
 zCBt7Q+5kc9Q2X2REasAKfiAU+benWY=
X-Google-Smtp-Source: ABdhPJxYyG5IWjhEJA4zRtpGe7bcxtqhQwMwWj2elJgtQimAnUQX6T548VNJDatCRykJXKqluowiLQ==
X-Received: by 2002:a1c:bb46:: with SMTP id l67mr12513534wmf.103.1618664035907; 
 Sat, 17 Apr 2021 05:53:55 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id m14sm14498440wrh.28.2021.04.17.05.53.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Apr 2021 05:53:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] memory: Forbid memory_region_set_address() on AS root
Date: Sat, 17 Apr 2021 14:53:53 +0200
Message-Id: <20210417125353.632589-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To be sure an AddressSpace is zero-based, forbid changing
base address of MemoryRegion used as AddressSpace container.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Based-on: <20210417103028.601124-1-f4bug@amsat.org>
---
 softmmu/memory.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 409bcaec7f5..73c0e6f84f5 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2522,6 +2522,7 @@ static void memory_region_readd_subregion(MemoryRegion *mr)
 
 void memory_region_set_address(MemoryRegion *mr, hwaddr addr)
 {
+    assert(!mr->is_root_mr);
     if (addr != mr->addr) {
         mr->addr = addr;
         memory_region_readd_subregion(mr);
-- 
2.26.3


