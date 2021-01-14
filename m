Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0671C2F63F7
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 16:14:18 +0100 (CET)
Received: from localhost ([::1]:49712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l04KF-0008IS-A3
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 10:14:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l04G0-0005Rs-Un; Thu, 14 Jan 2021 10:09:53 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:40960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l04Fy-0003po-DW; Thu, 14 Jan 2021 10:09:52 -0500
Received: by mail-pf1-x42a.google.com with SMTP id q20so3510896pfu.8;
 Thu, 14 Jan 2021 07:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EdssrEX6altoW4/e6bprbKcSaVYKf/sGKzo5DjP+ADw=;
 b=UgDoRmUHykC6GFljJ13a8uLPwVQ6ZC3joDGZGbUMzl/o94Z9UtK6OEDnLjVPc9vACU
 uQasm/me4voI6M6XOmPEklMe5YhLyxl4RqHwcW03VX2ahCGrVPbZYi1kBSDVpYSaMhfW
 d0ZuaCDwSJ0il9HY6v3srslvfeIZSnrRx/qk2u6ySdZTfYYNiSfAh1sdWxG0d9JH/EUa
 kW8QuWZEbkQ6lpDfqzn4/dzgDef1lUrl5Sjqr6F+aHyAcx/CJOOL1bHiH/vNKHUVCy2M
 Yno/dnfmooFw0mKrYkwm02Bj1RJIXI1DsmW1G2EZ0AH1feKjhwFQInCKdRZ2z1qG4AOQ
 MhTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EdssrEX6altoW4/e6bprbKcSaVYKf/sGKzo5DjP+ADw=;
 b=tymGZmq9Y3FmLsnEez6hyUv9yWe8vu5yZ3Bs4mt54p8odxhkXgeo92wwc0TA6cAbNS
 lVdMvtGoXK9jCyfQjBVFbQV2u3OIslNqmLcKsBVdCRKkWeSvxFIBvgLj2qeKSAoFsHzz
 1tZ/w5Xt1mBNPWjLj88hLCfzyKtIWCmWcqOjqdFKk136DLksZ8fajYvdCqUFE/pqFtLH
 PjAgiac+iNMbSfgIezqfdbboXU1VtHmtqVMyFReyhZZCpAty6fTYCJ+H0O9VnEBZ6xny
 VVwMAx67MQKgV8qn4MtdYsJZRa9MtY8vS2XdR09wNZmBiFEHoZRkHrmI8ATvDGFKQq+N
 z3ww==
X-Gm-Message-State: AOAM533ph2J1FnsXOZSebPHIKXcvqPu8tS1AUMJTyzcO7X0qF6BDDck0
 n0YSedysa65HlsE3mg57cPg=
X-Google-Smtp-Source: ABdhPJxMSzfyOh1JiVhdPNk6uWAGoS0HOxda0d+6/MqDrfatIu46JB0pDPPNfZ5MCnUl1HGfXwTDNw==
X-Received: by 2002:a63:286:: with SMTP id 128mr7898949pgc.246.1610636988486; 
 Thu, 14 Jan 2021 07:09:48 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id w21sm5372051pfq.67.2021.01.14.07.09.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 07:09:48 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <frasse.iglesias@gmail.com>
Subject: [PATCH 2/9] hw/block: m25p80: Fix the number of dummy bytes needed
 for Numonyx/Micron flashes
Date: Thu, 14 Jan 2021 23:08:55 +0800
Message-Id: <20210114150902.11515-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210114150902.11515-1-bmeng.cn@gmail.com>
References: <20210114150902.11515-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42a.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Marcin Krzeminski <marcin.krzeminski@nokia.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Joe Komlodi <komlodi@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Unfortunately the dummy cycle/bytes calculation for Numonyx/Micron
flashes is still wrong, even though there were fixes before that
tried to fix it.

First of all, the default number of dummy cycles is only related to
the SPI protocol mode. For QSPI it is 10, otherwise it is 8.

Secondly, per the datasheet [1], it's clear that in Quad I/O or Dual
I/O mode, the dummy bits show up on 4 or 2 lines.

The tricky part is the standard mode (extended mode). For such mode,
the dummy bits are not like other flashes that they show up on the
same lines as the address bits, but on the same lines as the data
bits, so for a Quad Output Fast Read command (6Bh), the dummy bits
must be sent on all the 4 IO lines. IOW, the total number of dummy
bits depend on the command.

The datasheet does not state crystal clearly how many lines are used
for 6Bh in the standard mode. We may only tell from figure 19 that is
showing the command sequence and interpret that dummy cycles need to
be on 4 lines for 6Bh.

Note as of today, both spi-nor drivers in U-Boot v2021.01 and Linux
v5.10 has the wrong assumption for all flashes that dummy cycle bus
width is the same as the address bits bus width, which is not true
for the Numonyx/Micron flash in the standard mode.

Last if the total number of dummy bits is not multiple of 8, log an
unimplemented message to notify user, and round it up. Right now the
QEMU ssi_transfer() API transfers one byte each time to the flash.
Leaving such as unimplemented will not cause any issue because as of
today both spi-nor drivers in U-Boot and Linux have the assumption
that the total number of dummy bits must be multiple of 8.

[1] https://media-www.micron.com/-/media/client/global/documents/products/
    data-sheet/nor-flash/serial-nor/n25q/n25q_512mb_1ce_3v_65nm.pdf

Fixes: 23af26856606 ("hw/block/m25p80: Fix Numonyx fast read dummy cycle count")
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/block/m25p80.c | 62 +++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 57 insertions(+), 5 deletions(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index c947716f99..c8cd12a6d3 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -856,19 +856,71 @@ static uint8_t numonyx_extract_cfg_num_dummies(Flash *s)
     mode = numonyx_mode(s);
     num_dummies = extract32(s->volatile_cfg, 4, 4);
 
+    /*
+     * The default nubmer of dummy cycles is only related to the SPI
+     * protocol mode. For QSPI it is 10, otherwise it is 8.
+     */
     if (num_dummies == 0x0 || num_dummies == 0xf) {
+        num_dummies = (mode == MODE_QIO) ? 10 : 8;
+    }
+
+    /*
+     * Convert the number of dummy cycles to bytes
+     *
+     * Per the datasheet, it's clear that in Quad I/O or Dual I/O mode,
+     * the dummy bits show up on 4 or 2 lines.
+     *
+     * The tricky part is the standard mode (extended mode). For such
+     * mode, the dummy bits are not like other flashes that they show up
+     * on the same lines as the address bits, but on the same lines as
+     * the data bits, so for a Quad Output Fast Read command (6Bh), the
+     * dummy bits must be sent on all the 4 IO lines. IOW, the total
+     * number of dummy bits depend on the command.
+     *
+     * The datasheet does not state crystal clearly how many lines are
+     * used for 6Bh in the standard mode. We may only tell from figure 19
+     * that is showing the command sequence and interpret that dummy cycles
+     * need to be on 4 lines for 6Bh.
+     *
+     * Note as of today, both spi-nor drivers in U-Boot v2021.01 and Linux
+     * v5.10 has the wrong assumption for all flashes that dummy cycle bus
+     * width is the same as the address bits bus width, which is not true
+     * for the Numonyx/Micron flash in the standard mode.
+     */
+
+    if (mode == MODE_QIO) {
+        num_dummies *= 4;
+    } else if (mode == MODE_DIO) {
+        num_dummies *= 2;
+    } else {
         switch (s->cmd_in_progress) {
+        case QOR:
+        case QOR4:
         case QIOR:
         case QIOR4:
-            num_dummies = 10;
+            num_dummies *= 4;
             break;
-        default:
-            num_dummies = (mode == MODE_QIO) ? 10 : 8;
+        case DOR:
+        case DOR4:
+        case DIOR:
+        case DIOR4:
+            num_dummies *= 2;
             break;
-        }
+         }
+    }
+
+    /*
+     * If the total number of dummy bits is not multiple of 8, log an
+     * unimplemented message to notify user, and round it up.
+     */
+    if (num_dummies % 8) {
+        qemu_log_mask(LOG_UNIMP,
+                      "M25P80: the number of dummy bits is not multiple of 8");
+        num_dummies = ROUND_UP(num_dummies, 8);
     }
 
-    return num_dummies;
+    /* return the number of dummy bytes */
+    return num_dummies / 8;
 }
 
 static void decode_fast_read_cmd(Flash *s)
-- 
2.25.1


