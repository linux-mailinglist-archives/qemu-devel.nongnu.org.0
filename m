Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC523FD9DB
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 14:54:04 +0200 (CEST)
Received: from localhost ([::1]:56322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLPkh-0001Bl-2i
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 08:54:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mLPcV-0003A6-Ml; Wed, 01 Sep 2021 08:45:37 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:38442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mLPcT-0003Wg-OO; Wed, 01 Sep 2021 08:45:35 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 g13-20020a17090a3c8d00b00196286963b9so4529687pjc.3; 
 Wed, 01 Sep 2021 05:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o2pmzupo+sdLEvr64T7VyZEHJUOePjMBuOCrScXM9Ek=;
 b=LHM80RBL/S0AqOD+m1zftvm0hD2Y0VZU2eXdVguCRt+73BVMapV1FhJBIlk9XpOInA
 Dls8pSkKYyF18LxHZVdqM7/HqnO+soPTfzL2svRO9j4nwjgltAdgleR/FCJApoB5jfZm
 h71xRr+woszOp++fQN86s9oZeNf3GmCRsb9s0FWRnABKPaJY4hfveSeZDIuBP4alCu8y
 4QBJFLwySYp4T+agUbk4JO/PgNbBXM0XrsVVREKf7AY29rlBcA9jvFSWttGCXuWEm6CZ
 2n2dIoYjn6uQId1E+rD5Xq14ln6y4jSqgaC9iRvHwm1IKxFcOZtUBThlMP7hZkzrDM2C
 wTQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o2pmzupo+sdLEvr64T7VyZEHJUOePjMBuOCrScXM9Ek=;
 b=Drs0plox/ACu8sa2NplUWb8Pt+9pMmBweczkbMXh9lmQgWe31IJCCWDb+bgk0RBBD0
 BLh8wPx8/3ib4GTw7QzAfjSS4DcTBY5sAJqUCU9n1t/X0vsyWdr+HqOV3lxZJC00/yP7
 bfXq/mNmB0OOqu7UlVsyoxmHRUmDLT07G2WAOIB0/hOfKlLfQ6r/WnGhroJjGVUzN+BQ
 sMdZo19Ba044PGd4LL8jeDM2pkoUpu5h/zEfHeDoy7DJIeJ8Cfk3Jn3rStS/oZNs74cN
 voJoiOiMEW1HlcB9l17CuTJF1tX55QUWf4daPbtZkM9Lxle+Fgo2cO1aWDIn0d9BFapc
 Ru4w==
X-Gm-Message-State: AOAM530PWd4DSCuPSU5YP6figrW41e8ctfYdN9POcekKVjWIzGlToPT9
 lqF8ZtETHSx5iSB/ymJ2+t0=
X-Google-Smtp-Source: ABdhPJx/Ipw56S7jCOROwP+u/KpI/pds8ygjRPIyO2Sq5x/mGPNy/rmoNCmnMNYvAdJqr0KA0ibnOg==
X-Received: by 2002:a17:90a:2e0a:: with SMTP id
 q10mr11701434pjd.136.1630500329570; 
 Wed, 01 Sep 2021 05:45:29 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id d22sm20917134pfq.158.2021.09.01.05.45.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 05:45:29 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 0/6] hw/arm: xilinx_zynq: Fix upstream U-Boot boot failure
Date: Wed,  1 Sep 2021 20:45:15 +0800
Message-Id: <20210901124521.30599-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1032.google.com
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

Changes in v3:
- new patch: hw/char: cadence_uart: Log a guest error when unclocked or in reset

Changes in v2:
- avoid declaring variables mid-scope
- new patch: hw/char: cadence_uart: Convert to memop_with_attrs() ops
- new patch: hw/char: cadence_uart: Ignore access when unclocked or in reset for uart_{read,write}()

Bin Meng (6):
  hw/misc: zynq_slcr: Correctly compute output clocks in the reset exit
    phase
  hw/char: cadence_uart: Disable transmit when input clock is disabled
  hw/char: cadence_uart: Move clock/reset check to uart_can_receive()
  hw/char: cadence_uart: Convert to memop_with_attrs() ops
  hw/char: cadence_uart: Ignore access when unclocked or in reset for
    uart_{read,write}()
  hw/char: cadence_uart: Log a guest error when device is unclocked or
    in reset

 hw/char/cadence_uart.c | 61 +++++++++++++++++++++++++++++-------------
 hw/misc/zynq_slcr.c    | 31 ++++++++++++---------
 2 files changed, 61 insertions(+), 31 deletions(-)

-- 
2.25.1


