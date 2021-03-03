Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E56C32B6C7
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 11:43:40 +0100 (CET)
Received: from localhost ([::1]:49738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHOyh-00078J-Dc
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 05:43:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHOwr-0005vA-E5; Wed, 03 Mar 2021 05:41:45 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:36841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHOwp-00015d-V1; Wed, 03 Mar 2021 05:41:45 -0500
Received: by mail-ej1-x630.google.com with SMTP id do6so41273988ejc.3;
 Wed, 03 Mar 2021 02:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QvXqmm8Oi9fNVn4lffzqAFLD0lRMEe388AyOq75PBTc=;
 b=QAB1PLNZ27FDb1SYmdBU31red6CJM7BOs5dpRVOBJ7EzAp6DOqdAwZ8oeVeGquZ3Cq
 nZwKnQKRYDAcwc7JtcvoVO6MleoNqIZj3Up8qOPbijg2gZnxTI9hqVSFkRgoXRGl5tGV
 86gxvs772tl2/1dMyQcI2tFfOYMIXXk4KqdZm17VBf5b0w70admhjPIz9Fd0AOh9apwG
 /4LOWfZchxShPqfA2vNNDYTxf9kVNrbcJPMOVYQ4ApUnQ+iTDrtgPGaURh1JSDFxC8om
 F/xSzz0JrQ4EtMegV2QPNzIAcVJftZbbuK4s86EcfGNAPMRaPzxS59/8Y9bU3kSzp6Lv
 Xu3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QvXqmm8Oi9fNVn4lffzqAFLD0lRMEe388AyOq75PBTc=;
 b=ZBni+mtHjnJNWszsOqUdIi/rMZh+iJYwkuDhpYXb3zxZ+NiLcUwd+2LQ288+/zNIhv
 kOWInv8xY4ixZDj8CwHtxAFPyYcHbAmxoiqcyvDie5wxDL1ulfxKXztg+dnThqblj9xR
 gMPQ0/MdLN2Dhp4SAp7WfOLxVmGXWzkJ5QMrZNEa0q9vHv1aEOUrAwn1argB1hmCpFLc
 GTJK5sn/wRgsPl0sx7k9gnkLW7XB2KHtCTDBIb6nFcyQR72n1kf+TFr1bUeIVPglOKeN
 NSIv7lthj+skNNoExa1YqEpeOwWj5HvQIZoMcwd1oLXpB+9KyAMXcPm59XkCKxVab1Jq
 JN9A==
X-Gm-Message-State: AOAM533C4u51vgwNA72oSQR9R7bvT5n4Qg8u1C31JFqkPIGjwds4Ad6y
 najVNFLUqRi1o1QH63gf7SM=
X-Google-Smtp-Source: ABdhPJwuE70jctH9lWs37VwUALFnIL7b4LrDW+RQGnqTrq7P6JVMz2UzAGDzlFyCaB3wvKQUlUie8w==
X-Received: by 2002:a17:906:5811:: with SMTP id
 m17mr8022538ejq.115.1614768101296; 
 Wed, 03 Mar 2021 02:41:41 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id jx22sm19029811ejc.105.2021.03.03.02.41.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Mar 2021 02:41:40 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Li Qiang <liq3ea@163.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Prasad J Pandit <ppandit@redhat.com>, Bandan Das <bsd@redhat.com>
Subject: [PATCH v3 0/5] hw/sd: sdhci: Fixes to CVE-2020-17380, CVE-2020-25085,
 CVE-2021-3409
Date: Wed,  3 Mar 2021 18:41:23 +0800
Message-Id: <1614768088-20534-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x630.google.com
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

Changes in v3:
- Embed the reproducer in the commit message

Changes in v2:
- new patch: sdhci: Limit block size only when SDHC_BLKSIZE register is writable
- new patch: sdhci: Reset the data pointer of s->fifo_buffer[] when a different block size is programmed

Bin Meng (5):
  hw/sd: sdhci: Don't transfer any data when command time out
  hw/sd: sdhci: Don't write to SDHC_SYSAD register when transfer is in
    progress
  hw/sd: sdhci: Correctly set the controller status for ADMA
  hw/sd: sdhci: Limit block size only when SDHC_BLKSIZE register is
    writable
  hw/sd: sdhci: Reset the data pointer of s->fifo_buffer[] when a
    different block size is programmed

 hw/sd/sdhci.c | 53 ++++++++++++++++++++++++++++++++++++-----------------
 1 file changed, 36 insertions(+), 17 deletions(-)

-- 
2.7.4


