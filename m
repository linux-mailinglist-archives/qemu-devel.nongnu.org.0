Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38964407D61
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 14:51:20 +0200 (CEST)
Received: from localhost ([::1]:51668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPOx5-0001XC-9U
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 08:51:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mPOqp-0004ba-2U
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 08:44:51 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:45655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mPOql-00059x-K6
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 08:44:50 -0400
Received: by mail-pl1-x62c.google.com with SMTP id d17so4067139plr.12
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 05:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oHlfkVnmB566xqPvLmY6le/BJxWxcQU2xChDQj5zOog=;
 b=fpBbi3kbhA3qr/TfGWiWjIvssQUAyCN8JEL21lGXRiomvYA/5uQV5ym6MMLKmzVrtP
 Yo1snI0P4Ljplox8uBVyxgsc+tCveSrfQaM5RBPHfTUg4vp4K4oozZpflcZGxlLY6na5
 1roGSn2wrq7zKbz9BsyQm2z/VauON9HJ6ZWO4WwC/6Xv8tJodOL6KWnYr7f4dPbeR5O2
 NMH0eg0eOmv75j77lHCLeAXc9gJs9pY2obD0LEhcIdQa+/HJyw3olTxrnT3UqJhO5D9b
 qAqjUzqQhnL8Mrkm6oFcIOY7MT9qMD8JhwD8E/Gemezn0d1iH9AmT+E5hmPEC/awZdOs
 WHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oHlfkVnmB566xqPvLmY6le/BJxWxcQU2xChDQj5zOog=;
 b=f0MGgcWSxw20i+tiIj6snWVGbImV/AoOmA7VfNaZNz5s8bdt9/sssRIvQmb3LezUfI
 hNu3YcrpS1NNmycAKPCE63chMWxrP5yc4BJJmagRcwicBitLWnR6KZUK8nEQiTelF548
 Iauy0d54iDgjMmt61rXlfklV75qb/HiW97iMb3+rRazQrfVJ8JmBSjjrSdnOcqYWWa6W
 34fdVjI/qMC8QWF6YHX6joR7KUoR6oefOvdsNJ85rrYN7TjVOLRY1zBHlJcjVERqPQt9
 XI0W297W+0Afb/euGdJuI/kNKH3xMIZ21TauHeKjx+iCsCVa4yerl52uIShhu6EDkADq
 Ni3A==
X-Gm-Message-State: AOAM531xcbh0HF3u1RuOBrXM8d2HzNgnSIHtDUAn1TONeBXj90XqlqzH
 GIxqLaNgqQemfO5B20vgYOWOAW1W08YwAQ==
X-Google-Smtp-Source: ABdhPJxkBE7NvZrtiI20t3+lk3LYCuSq4Gv81xiYTP/vRey5rT9OQDKAUzNxI2GbDi+3eXVQzr5Gfw==
X-Received: by 2002:a17:90b:3145:: with SMTP id
 ip5mr1509086pjb.161.1631450685835; 
 Sun, 12 Sep 2021 05:44:45 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id k3sm3807043pjs.11.2021.09.12.05.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 05:44:45 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v2 2/4] hw/dma: sifive_pdma: claim bit must be set before DMA
 transactions
Date: Sun, 12 Sep 2021 20:44:18 +0800
Message-Id: <20210912124425.166071-3-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210912124425.166071-2-frank.chang@sifive.com>
References: <20210912124425.166071-2-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Frank Chang <frank.chang@sifive.com>, Bin Meng <bin.meng@windriver.com>,
 Max Hsu <max.hsu@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Real PDMA must have Control.claim bit to be set before
Control.run bit is set to start any DMA transactions.
Otherwise nothing will be transferred.

The following result is PDMA tested in U-Boot on Unmatched board:

=> mw.l 0x3000000 0x0                      <= Disclaim channel 0
                                              (Channel 0 is not claimed)
=> mw.l 0x3000004 0x55000000               <= wsize = rsize = 5 (2^5 = 32 bytes)
=> mw.q 0x3000008 0x2                      <= NextBytes = 2
=> mw.q 0x3000010 0x84000000               <= NextDestination = 0x84000000
=> mw.q 0x3000018 0x84001000               <= NextSource = 0x84001000
=> mw.l 0x84000000 0x87654321              <= Fill test data to dst
=> mw.l 0x84001000 0x12345678              <= Fill test data to src
=> md.l 0x84000000 1; md.l 0x84001000 1    <= Dump src/dst memory contents
84000000: 87654321                               !Ce.
84001000: 12345678                               xV4.
=> md.l 0x3000000 8                        <= Dump PDMA status
03000000: 00000000 55000000 00000002 00000000    .......U........
03000010: 84000000 00000000 84001000 00000000    ................
=> mw.l 0x3000000 0x3                      <= Set channel 0 run and claim bits
=> md.l 0x3000000 8                        <= Dump PDMA status
03000000: 00000001 66000000 00000000 00000000    .......f........
03000010: 00000000 00000000 00000000 00000000    ................
=> md.l 0x84000000 1; md.l 0x84001000 1    <= Dump src/dst memory contents
84000000: 87654321                               !Ce.
84001000: 12345678                               xV4.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Tested-by: Max Hsu <max.hsu@sifive.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>
---
 hw/dma/sifive_pdma.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c
index d92e27dfdc4..a8ce3e6699a 100644
--- a/hw/dma/sifive_pdma.c
+++ b/hw/dma/sifive_pdma.c
@@ -252,6 +252,15 @@ static void sifive_pdma_write(void *opaque, hwaddr offset,
 
         s->chan[ch].control = value;
 
+        /*
+         * If channel was not claimed before run bit is set,
+         * DMA won't run.
+         */
+        if (!claimed) {
+            s->chan[ch].control &= ~CONTROL_RUN;
+            return;
+        }
+
         if (value & CONTROL_RUN) {
             sifive_pdma_run(s, ch);
         }
-- 
2.25.1


