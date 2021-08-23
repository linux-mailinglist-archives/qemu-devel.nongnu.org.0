Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 701AD3F4354
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 04:10:35 +0200 (CEST)
Received: from localhost ([::1]:60370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHzQ1-0006DM-U5
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 22:10:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mHzNx-0004FJ-M5; Sun, 22 Aug 2021 22:08:25 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:34497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mHzNw-0005p5-4N; Sun, 22 Aug 2021 22:08:25 -0400
Received: by mail-pf1-x433.google.com with SMTP id g14so14011731pfm.1;
 Sun, 22 Aug 2021 19:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IsrzO/Lp2Th0I10sGeT4W/vuPaOlI3Gh6oj9iYU2+Sk=;
 b=tndKcgLklJXeyp3qo2+WD8e4GfjSEorGyHvF5Fs42AqNBI4zhbIB8cSmBhnq+DGjAR
 DZtw/LaSVS6w1WXorkDjF6kTyoIeSsEqXPkS7+ywKmHNxEc/7lrXtAuNMIl8hhHuKq+i
 BkhDRnBpXrJR5ZO71jBHDRlmWrH8SrMBj8NUMbql5SmMpt26WG8XHvJWcSTCdbvoWc8J
 C+Xt+1yv6qwEY91AI6ioMFQxku+3D3B+YaUrsQHyAoCq2Wf8fQqYcUwPprvrbbIMLzaD
 BpN/UH9I6y9U5abg4nD9mcd8V4cXh+97Y5sLn0Mx2PwIQMgLtbYgeJnrg+hCzP5kerp8
 /UsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IsrzO/Lp2Th0I10sGeT4W/vuPaOlI3Gh6oj9iYU2+Sk=;
 b=jwVwB3EEMSlS+YTskz1PVu+fPcnbAiOBczp7TD+exkQ4E6NgWRQOB7om2hmIPo5OMI
 9QcI/xg0zxDRjBysONJLYenQj2uRljA99TOAtbdID688g6Gmj7BXEOulczlPYnfKwmjz
 bllabIWfhxfmSvtMUvRsM7Dn1JjiuiTOzUFdBFhtv/rvWbZam/hYZZ5vw/ehXJ24iyqu
 UkrcZDofJgip3cxSNTsD/rUDcd669bBd9PB2TbmB3tinXsLGCFSlK7N2j0cCoI2uH61Y
 ZCCo7sq6BuWKbixrbHV1YTlNxJZ+0Gy6kFivEsBB9gguCQQNzoDWBa8rFCcyTDkeZfsc
 dr7w==
X-Gm-Message-State: AOAM530fczbI12uZGDQODiR3+hNUvAgtvpytOT9YnbKggG6SMXiXOK8a
 iO+kaTLDT3SD02KD139E4JQ=
X-Google-Smtp-Source: ABdhPJwV+9RQad//nlgV9cRM8BGeoqx0MNq5Wrwpc7pVl0AONMgZ3AokfRTSkLfBWoLlwBkSjU2/Kw==
X-Received: by 2002:a65:62c1:: with SMTP id m1mr29986929pgv.339.1629684502067; 
 Sun, 22 Aug 2021 19:08:22 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id e26sm13804358pfj.46.2021.08.22.19.08.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Aug 2021 19:08:21 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 0/3] hw/arm: xilinx_zynq: Fix upstream U-Boot boot failure
Date: Mon, 23 Aug 2021 10:08:10 +0800
Message-Id: <20210823020813.25192-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x433.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As of today, when booting upstream U-Boot for Xilinx Zynq, the UART
does not receive anything. Debugging shows that the UART input clock
frequency is zero which prevents the UART from receiving anything as.
per the logic in uart_receive().

Note the U-Boot can still output data to the UART tx fifo, which should
not happen, as the design seems to prevent the data transmission when
clock is not enabled but somehow it only applies to the Rx side.

For anyone who is interested to give a try, here is the U-Boot defconfig:
$ make xilinx_zynq_virt_defconfig

and QEMU commands to test U-Boot:
$ qemu-system-arm -M xilinx-zynq-a9 -m 1G -display none -serial null -serial stdio \
    -device loader,file=u-boot-dtb.bin,addr=0x4000000,cpu-num=0

Note U-Boot used to boot properly in QEMU 4.2.0 which is the QEMU
version used in current U-Boot's CI testing. The UART clock changes
were introduced by the following 3 commits:

38867cb7ec90 ("hw/misc/zynq_slcr: add clock generation for uarts")
b636db306e06 ("hw/char/cadence_uart: add clock support")
5b49a34c6800 ("hw/arm/xilinx_zynq: connect uart clocks to slcr")


Bin Meng (3):
  hw/misc: zynq_slcr: Correctly compute output clocks in the reset exit
    phase
  hw/char: cadence_uart: Disable transmit when input clock is disabled
  hw/char: cadence_uart: Move clock/reset check to uart_can_receive()

 hw/char/cadence_uart.c | 16 +++++++++++-----
 hw/misc/zynq_slcr.c    | 31 ++++++++++++++++++-------------
 2 files changed, 29 insertions(+), 18 deletions(-)

-- 
2.25.1


