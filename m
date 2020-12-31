Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A097B2E7FAD
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 12:33:40 +0100 (CET)
Received: from localhost ([::1]:41022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuwD5-0000zQ-Nt
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 06:33:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kuwAA-0007Km-Qa; Thu, 31 Dec 2020 06:30:38 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:37760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kuwA9-000783-6Z; Thu, 31 Dec 2020 06:30:38 -0500
Received: by mail-pg1-x52e.google.com with SMTP id z21so12961129pgj.4;
 Thu, 31 Dec 2020 03:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P44WnRT0nGrTO8i23ZSMW5edo7dZWmNn0lvhX81hIgs=;
 b=pIo7vJtBqjHYoVEA6s7u9iSgQMqKP6MLD2lQNSvbAQ+uzGAGaazzyTeRBI5S51PwJv
 RCx8QmY0gVSAg56DeTVHd1srtZXN+XL0p1aJMyC6XILRJeB5kZ7NV7VmObM76ZyPkZ7+
 A7hGqfwlzSbkjwPFgtnhleoRRuPB3r4H2UAaplUJPvKsj8IGZw7DM3z4xR1DtQ7PAFyl
 jUzDl0C37/hD/17PVTLUWE1laszUSe6eqtJ8mvr2iloH1logoP5l6PVc1dh6LSi/lhqj
 X5aPYJ9kvN0PixKdQfDsZvFU1xfyyQXJbiOUsldjRSYWxFPK3IJZgy2TwDwrODzV0Weg
 Njwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P44WnRT0nGrTO8i23ZSMW5edo7dZWmNn0lvhX81hIgs=;
 b=FN5DfiAbrEettd9RYQJ5GE6nCEccwCjDm21FPqGOCHCSrkzPiBGkKNDPvg0TiLNepz
 daLWsMqrYvluJBNJsscvMzeFvm8LAk0aal9Q1wHmiYyVIlmkNODa2+OrNTNcupJPyCVk
 DmduJEugvqGQnRjkAt9MUQSANmM+P7c+41+JAkvLRTJeqvvdBA1p3DBNY6A4f8pfcUiq
 15NtCisUgdDzisW6ZBy3raQshIf6K2sS9cXdxC+rX8eC4ZXlzyNyEGtS3jmdBCabJ9pw
 ate8ZX7rbsghEH6i2YlRQb5GUM7H/QkaY+Ql6/jgHi0i9J5VjcwP4FqcSfy26XHSiPhI
 98wA==
X-Gm-Message-State: AOAM531ogVOXkhHnSkiPDAwqZhurZuUqs2wf5p7NQXrBbSD42vfHH1Th
 jVZhVfqQrdH/5GcOf1qO25M=
X-Google-Smtp-Source: ABdhPJxAvgJwz0WcTwrc67ce2WujfzfFKMPTWqOp2h6nLeXcmKp8+/nFU2+GP72iyMdD/zaguv/zCg==
X-Received: by 2002:a63:fa42:: with SMTP id g2mr32480337pgk.405.1609414233359; 
 Thu, 31 Dec 2020 03:30:33 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id t23sm45957591pfc.0.2020.12.31.03.30.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 03:30:32 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 02/22] hw/block: m25p80: Add various ISSI flash information
Date: Thu, 31 Dec 2020 19:29:50 +0800
Message-Id: <20201231113010.27108-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201231113010.27108-1-bmeng.cn@gmail.com>
References: <20201231113010.27108-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52e.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

This updates the flash information table to include various ISSI
flashes that are supported by upstream U-Boot and Linux kernel.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/block/m25p80.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 8a62bc4bc4..e82deb41c6 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -209,6 +209,19 @@ static const FlashPartInfo known_devices[] = {
     { INFO("640s33b",     0x898913,      0,  64 << 10, 128, 0) },
     { INFO("n25q064",     0x20ba17,      0,  64 << 10, 128, 0) },
 
+    /* ISSI */
+    { INFO("is25lq040b",  0x9d4013,      0,  64 << 10,   8, ER_4K) },
+    { INFO("is25lp080d",  0x9d6014,      0,  64 << 10,  16, ER_4K) },
+    { INFO("is25lp016d",  0x9d6015,      0,  64 << 10,  32, ER_4K) },
+    { INFO("is25lp032",   0x9d6016,      0,  64 << 10,  64, ER_4K) },
+    { INFO("is25lp064",   0x9d6017,      0,  64 << 10, 128, ER_4K) },
+    { INFO("is25lp128",   0x9d6018,      0,  64 << 10, 256, ER_4K) },
+    { INFO("is25lp256",   0x9d6019,      0,  64 << 10, 512, ER_4K) },
+    { INFO("is25wp032",   0x9d7016,      0,  64 << 10,  64, ER_4K) },
+    { INFO("is25wp064",   0x9d7017,      0,  64 << 10, 128, ER_4K) },
+    { INFO("is25wp128",   0x9d7018,      0,  64 << 10, 256, ER_4K) },
+    { INFO("is25wp256",   0x9d7019,      0,  64 << 10, 512, ER_4K) },
+
     /* Macronix */
     { INFO("mx25l2005a",  0xc22012,      0,  64 << 10,   4, ER_4K) },
     { INFO("mx25l4005a",  0xc22013,      0,  64 << 10,   8, ER_4K) },
-- 
2.25.1


