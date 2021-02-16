Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D4131C5E1
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 04:49:10 +0100 (CET)
Received: from localhost ([::1]:39808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBrML-00021X-Ep
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 22:49:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lBrKR-0000ga-Os; Mon, 15 Feb 2021 22:47:11 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:45421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lBrKQ-0002Qd-6b; Mon, 15 Feb 2021 22:47:11 -0500
Received: by mail-ed1-x52b.google.com with SMTP id y10so5705129edt.12;
 Mon, 15 Feb 2021 19:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ixjCuBaOVbk8NuYAzQgiAzKbO5CbRpSpHFZTua1RTEw=;
 b=muMqKxa+2q6JUl/MkIFSGsnTgCi2QmpCH9WTWP8WFiplV20zoS9zPqri4UBIsEy/fj
 Kvf8M69nnYpL7rL3ufneuSHiuqKtqAeYteKxSLgjzS8ZZr4gzB/yM9Dw6JU/eO7Y/oQk
 //YkoFWzB/soT/s81DZfV9xvUHKdEj/Uvu6Ou1ZSdcIFSu5TGOsfOWXNhVrwCl23TS7y
 Te9ncS4PZuU0Ok5Gg6xHGaekHnwlPLREd8ur6vH3HjqOKuWSLajbqpaXwRHDGguYKBwu
 jQlMc9i9OxZcF9p6rwW2vPIVgJw0SXu3i6fTkEZItL26cYXtzNSrz3JLMEeB2zSZbr7z
 vUxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ixjCuBaOVbk8NuYAzQgiAzKbO5CbRpSpHFZTua1RTEw=;
 b=NO4sQsIxPeRACHejkrJ1jXt+sW5D42fg+JcQ9dma0BwcSHltSf2cRKF1G/Grk5Z7qp
 YDvcjJv5/ltYQFilYci4C48Oo0v16ulncdmiBZmT0pfJxb+/r3UQ2Kv0306YcR/cyQhe
 LmzccO/ljdXCtsRX1RJOKCLJPPahzFUq8C4C8UsvqROEU+tLCDEQLpH+hi95iZG0R+6X
 lc2QYvVu/vfLwNgwex4Q7SLMfjf+QHvLAovMJTUmVYHNe4Ph4KbQnJKUI0L4xejmG4/7
 xkXPgOk48c1WumRA++crVnc0TLgdjyGl6PSqMg0/rhEWFUOrP4kQTV06al76IQ/7i2ey
 ncsQ==
X-Gm-Message-State: AOAM5325G/dYuhEC8ofPU8KW7z910MBCab3FRVGqOdvpCmbLmE1pe6yw
 psbw7z5mGyD68sH2PorO5MU=
X-Google-Smtp-Source: ABdhPJzrPDDe3WX4UIliwwFB+k3boD0/taDa8OQfD2Cultq1pbFa45Y4eJDiu8rFlP+P5F5yBiia1A==
X-Received: by 2002:a05:6402:3553:: with SMTP id
 f19mr19146642edd.271.1613447228132; 
 Mon, 15 Feb 2021 19:47:08 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id z19sm12837866edr.69.2021.02.15.19.47.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Feb 2021 19:47:07 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Li Qiang <liq3ea@163.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Prasad J Pandit <ppandit@redhat.com>, Bandan Das <bsd@redhat.com>
Subject: [PATCH v2 0/6] hw/sd: sdhci: Fixes to CVE-2020-17380, CVE-2020-25085,
 CVE-2021-3409
Date: Tue, 16 Feb 2021 11:46:48 +0800
Message-Id: <1613447214-81951-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52b.google.com
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series includes several fixes to CVE-2020-17380, CVE-2020-25085
and CVE-2021-3409 that are heap-based buffer overflow issues existing
in the sdhci model.

These CVEs are pretty much similar, and were filed using different
reproducers. With this series, current known reproducers I have
cannot be reproduced any more.

The implementation of this model still has some issues, e.g.: some codes
do not seem to strictly match the spec, but since this series only aimes
to address CVEs, such issue should be fixed in a separate series in the
future, if I have time :)

Changes in v2:
- new patch: sdhci: Limit block size only when SDHC_BLKSIZE register is writable
- new patch: sdhci: Reset the data pointer of s->fifo_buffer[] when a different block size is programmed

Bin Meng (6):
  hw/sd: sdhci: Don't transfer any data when command time out
  hw/sd: sdhci: Don't write to SDHC_SYSAD register when transfer is in
    progress
  hw/sd: sdhci: Correctly set the controller status for ADMA
  hw/sd: sdhci: Simplify updating s->prnsts in
    sdhci_sdma_transfer_multi_blocks()
  hw/sd: sdhci: Limit block size only when SDHC_BLKSIZE register is
    writable
  hw/sd: sdhci: Reset the data pointer of s->fifo_buffer[] when a
    different block size is programmed

 hw/sd/sdhci.c | 60 ++++++++++++++++++++++++++++++++++++++---------------------
 1 file changed, 39 insertions(+), 21 deletions(-)

-- 
2.7.4


