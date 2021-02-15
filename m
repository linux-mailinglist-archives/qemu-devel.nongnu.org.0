Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E8331BBF8
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 16:13:27 +0100 (CET)
Received: from localhost ([::1]:36178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBfZ0-00014C-42
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 10:13:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lBfXC-0007l1-G1; Mon, 15 Feb 2021 10:11:36 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:32962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lBfX9-0004vD-Bm; Mon, 15 Feb 2021 10:11:34 -0500
Received: by mail-ej1-x633.google.com with SMTP id jt13so11732105ejb.0;
 Mon, 15 Feb 2021 07:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jWoAMpQQVIYR1Ym25mB4uMOanooxJBFDpntJ3x/t+lU=;
 b=hmHO9DniUQFmFbkoOpnShOsMHFNir+qnBhmg6FguEskrshbhCvAX5S92KZ/0PSN3HC
 ycG89HpV9LhSzsc/xD8Dh1vJVlAHjdnZ9kLsj6LaEiDHWxExivtePLf+pV4jEw2JugKJ
 i0oE7sUGPGJZlnaHh/ncKGkz9aePr8FrXGjfMXifvoyxo5WH677PScyP1P9Ff9+fvTnz
 zXRkC7eLyFKgvKW7uHyJ3knUF33Jb+vjJM1tGxotYfd93j5ccB+DQZ9Lyc3gEhteFO6P
 O+dFCP5IXNVw54xx+UBmX0N6wsuZzvA6/K/iJp6rM7/nOakjcXh5d96iUI7luTmqsrIW
 Hu9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jWoAMpQQVIYR1Ym25mB4uMOanooxJBFDpntJ3x/t+lU=;
 b=p1ej8XKRWAsqIwaGgWy54xD3P02/7brPgVOTBM0lK4gO4XLenKcGAm5CYWzYNHWSkD
 oT1aoUnNdRoh4bkmzK9nddJ7KwdDs6U1wWLtKaS12SjdzdzLmlXoyY0aotlPXG8RmDg8
 Z2m9kfkUzZ5nIjdxuBMeyxGzH+VPdmLjpRhHTIw9Zjb5eblq0ZCGdnaZoBaI1qxck/A8
 CbLEWmC2BQ96VNPC4PfsKc4zo+zWA9ca9qX5r9NVnP5rro239Oj2uROqcJdJYLGRso9G
 XpdRfM1W7CGZ1kPsT9KrSDH6hWcun0gN8ZaAxgk0ceaWKUJfzL0RyWkJV7ynExOS0z15
 CdpQ==
X-Gm-Message-State: AOAM533Zmb6GZVfiBWnzNjyWHd6J+zgdPTMMQPViQP8Z0BiXawEKVGUE
 8aW9Vt4Jo6gx4ZG085jUA94=
X-Google-Smtp-Source: ABdhPJySA7YMgZ8Y2Umi8pggU9ictERu49c1/CBBmmtNPGRaMTKyVZpj+eaT2Us4N7e8SD06kXft1w==
X-Received: by 2002:a17:907:7605:: with SMTP id
 jx5mr16264449ejc.340.1613401887053; 
 Mon, 15 Feb 2021 07:11:27 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id gz14sm10813069ejc.105.2021.02.15.07.11.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Feb 2021 07:11:25 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Li Qiang <liq3ea@163.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Prasad J Pandit <ppandit@redhat.com>, Bandan Das <bsd@redhat.com>
Subject: [PATCH 0/4] hw/sd: sdhci: Fixes to CVE-2020-17380, CVE-2020-25085,
 CVE-2021-3409
Date: Mon, 15 Feb 2021 23:11:07 +0800
Message-Id: <1613401871-59515-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x633.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-stable@nongnu.org,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

This series includes several fixes to CVE-2020-17380, CVE-2020-25085
and CVE-2021-3409 that are heap-based buffer overflow issues existing
in the sdhci model.

These CVEs are pretty much similar, and were filed using different
reproducers. With this series, current known reproducers I have
cannot be reproduced any more.

The implementation of this model may still have some issues, i.e.:
some codes do not strictly match the spec, but since this series
only aimes to address CVEs, such issue should be fixed in a separate
series in the future, if I have time :)


Bin Meng (4):
  hw/sd: sdhci: Don't transfer any data when command time out
  hw/sd: sdhci: Don't write to SDHC_SYSAD register when transfer is in
    progress
  hw/sd: sdhci: Correctly set the controller status for ADMA
  hw/sd: sdhci: Simplify updating s->prnsts in
    sdhci_sdma_transfer_multi_blocks()

 hw/sd/sdhci.c | 34 ++++++++++++++++++++--------------
 1 file changed, 20 insertions(+), 14 deletions(-)

-- 
2.7.4


