Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C347734556B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 03:16:43 +0100 (CET)
Received: from localhost ([::1]:43486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOWb4-000229-Sz
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 22:16:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=709ee912d=alistair.francis@wdc.com>)
 id 1lOWKz-00038u-9U
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 22:00:05 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:2072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=709ee912d=alistair.francis@wdc.com>)
 id 1lOWKx-0006vy-9i
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 22:00:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1616464803; x=1648000803;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Pt+zzFWzl+7OxRVTSTlImJ1fRb2/n5V0OkAn7vFbaQY=;
 b=k8qIUAet08IYR1bfGvn4OfnAUQcVoAgZCBPPFBKGeP1W/DUQUJmkMdvS
 un3qHwJnoSbfk3EvHqY7X9guhIHxejFI52HjSn1K+e02l/xUMQ9DjB4sm
 7GSSai3knF5vDscpZrWHYKkicM/xvzHeYHY/YTB+PRGVzjpSbNZxzI5/L
 Ei4HY30MaPFBd3vMyCrOhnzZmoKo37hAYuTexIHT/3ebEzQCo9BzZdNOc
 Jv2rRvQvLxYfg/sOZnLsUIxRAlSbmv31Ct2rLGqxH0kz+vvnhxJRTtvsb
 V7JGKf8zxq1kV6VPdvYDq4leL43m93FYFiNugvY29x79Tqzuh8bT8nSaB A==;
IronPort-SDR: ynlty6keeFddtMSNqpN5nwlr/3EchqkDOFTbkdl0NJBB0GSQm6C3pkH4BE4vdWnravSFQ+FHQi
 5M84+n7oLvid3bHnN3ntYHXzE2/Z7KvIBF0PPFDkELIkRZ53LC16toreDRcqaqbOWOEuxOIjQh
 peQlScp81JSCZgg6eCwx8eUIdMunjxAFuLNKw8CDoE9RFTQY2JxIDvCha3UwbwsFzsPWkyBLcf
 UJUKbS4GeNUrFh3YQXKWn/63iHbb/COZ6GxpqrHwNuyelFNxzFF/KKedz2hk/4CJweIfRKpG8W
 ffY=
X-IronPort-AV: E=Sophos;i="5.81,270,1610380800"; d="scan'208";a="162707645"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Mar 2021 09:59:40 +0800
IronPort-SDR: fjJotshFsdQ02W8SDOV+Rf9uUwiKJrs0frSEY2K7BUa7vhsSncW/cgJY4jfxKceNss5pMP6vxL
 zs+LBIqJr7ndSIm3GCbHBdpwZ5T7sFy0ftPgoQc5Eci/Ii7gzfs/9qACukTqS+AgvOxbi1Okwk
 Yd20WnN9FceyMT3oQFhIFCheO4u1lNrXt8EZZQn46UayBii+xMtVYc1/bsZcVrrk0oyYc2IqFk
 MoD2FoGiKodh2wuL2Hg92l8CHnSt/XR/2ZwPVxUGhZgIh92pdbHN9y08hVWhpT/rZirxr/qL1N
 NdzxuJTmAoiVOz68OcbH6Qmz
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 18:41:48 -0700
IronPort-SDR: kybWN8yaz672PCB0mVQuVlrp9TqL/0F8sXMUr636Xi8puDCQxL1kmtMcRPlJU/Ubl8Wu/NEsFD
 Chs223spk1JaXogQZfL3nmJvzXKsttgp4aFgVg5nXVCao/DnL2t2oKAynUliHffFOjvLKFrgXn
 QxzHVey1oWWx+aUn/sMJHQM/TjdEz2vqBeFe+mOnF/BEUyySte33K6txbw0FcXfoj4PQfrUQ1E
 RXRGgXqMHxOJ1GfhKMU1n7rpPSNWkSP8y7QDC0jm4bQ2Aiuz1Jgp2dFlOJ7GJDvYEStTwPxjXC
 NP8=
WDCIronportException: Internal
Received: from cn6ntbqq2.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.49.5])
 by uls-op-cesaip01.wdc.com with ESMTP; 22 Mar 2021 18:59:40 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 13/16] hw/block: m25p80: Support fast read for SST flashes
Date: Mon, 22 Mar 2021 21:57:53 -0400
Message-Id: <20210323015756.3168650-14-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210323015756.3168650-1-alistair.francis@wdc.com>
References: <20210323015756.3168650-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=709ee912d=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Per SST25VF016B datasheet [1], SST flash requires a dummy byte after
the address bytes. Note only SPI mode is supported by SST flashes.

[1] http://ww1.microchip.com/downloads/en/devicedoc/s71271_04.pdf

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210306060152.7250-1-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/block/m25p80.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 5f9471d83c..183d3f44c2 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -895,6 +895,9 @@ static void decode_fast_read_cmd(Flash *s)
     s->needed_bytes = get_addr_length(s);
     switch (get_man(s)) {
     /* Dummy cycles - modeled with bytes writes instead of bits */
+    case MAN_SST:
+        s->needed_bytes += 1;
+        break;
     case MAN_WINBOND:
         s->needed_bytes += 8;
         break;
-- 
2.30.1


