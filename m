Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CB731E44B
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 03:20:20 +0100 (CET)
Received: from localhost ([::1]:45712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCYvT-0007yL-5X
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 21:20:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6763bdb70=alistair.francis@wdc.com>)
 id 1lCYcT-0006tJ-2j
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 21:00:41 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:40597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6763bdb70=alistair.francis@wdc.com>)
 id 1lCYcR-0008Kh-F0
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 21:00:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1613613640; x=1645149640;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9X9gCf2KNjVAKkZtB/3drcTqh35RbUNgln83OyGTx+o=;
 b=U9hZUG6lsNQgs5beaWLApc5y7bMvgNv8Ews/FmDQY+hQatJT+k6FYT9e
 IlLAd2yZDKoL/spgzzJHZa/WafiL6JFAHA9hBVFSCL0zB0vm8yUtJNNbN
 ilNRr8qoObvX7erk/cihgCUyB8QQkCE9AdHw6x1vUwkod2BUwdILhh692
 XnFYqjx3dxEWSj6CX5hY+w8+49jySw0IiiSibQvfi5NaerSbG4LEwQJFP
 iyCuEjpMtLqzkg/VRK68F/wzB9z+QrKfEURlpPcctHHxnFuKaupLlE8tv
 nCZrnvspTo8P8+HjX0Z9zMWbqBlxRmdhgnJVmJfFzetVddUFN7MJ7cDn3 g==;
IronPort-SDR: d9dR/gf1yjuziUBcjcVRXMsYDBvbyOuyHOFaHcW2BLJytkvltK48r1C0J2x3osViSvHGHiidwS
 jXtOqNgcGvIA5l4H27v7fz6k76fMLQW95d13ntgUmA1WzQPxjF6Lao/762KboBjh4T7Juxez8o
 /KXXXFrMao/UBQEjPNFlXQ4grOnycNxSbbjc4l3UmPfWLKC/oWaeqE0Mb9w+ZZ06boI96/+T02
 oiOunrQaAfGXLkAWUdcRPoIcG+LmSWOHR+5BVImgdKI8DLZRWezMLu21KqAuPCCoh+54TXwZ5P
 faA=
X-IronPort-AV: E=Sophos;i="5.81,185,1610380800"; d="scan'208";a="161392141"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Feb 2021 10:00:00 +0800
IronPort-SDR: UhW5/PPuydtsiFuB0egKS+kXMze3MSquvJzDZ9y2wNVsaQd708DHJpcWY6sKlVhPpcC8Kv0whl
 BOtClaeyfmOT+N0O3KovH6p2vk/KKB1X4FQ7t9MpCimR6cLg1fUlpl5TqQe9Ypkv8wgh/Kd76d
 /uKawZaBIumIpiPNqINsj9oy5z0sdpKOSmxWweSVZyCp1iwDZNwlBRVhWS7b60fA9wNwiKMXPg
 BofbwuFXNRiUlVEg8m4qMMZWN1RWHm7KeFxq387OLcW1n5hgWauX+FBvupCEJTjBO4r7FJnc2+
 uTdyj0I1WhXfAvSP3ENEWOKP
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 17:43:30 -0800
IronPort-SDR: UJkmVU5Ougl8i/DewUXN6qFRztKui7FQwnGuj79LpmB8h7gjDr/h1SpXuK8e2Dve0SeWeo82Ck
 ypP/zEkg0bgiSKqHA1BhiCGq3n+T3d1spzWCOGDTNyykcANn64M/QjkJ4oX0sPfDXU66/+XRhY
 1eFaVn/ZDYIGxheM29b22QDXCww+pncjnrJI7xHiuIC+RxU8FDiEu0mbGx2SUg8k5sQNlVTQf5
 I4A00whV6VUxww2jcM9s/xEw760pbKW1ShOub72PoSOVYyxaiPNVjjs4G969zvilq5XluDNOOh
 MK0=
WDCIronportException: Internal
Received: from cn57xfd72.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.48.43])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Feb 2021 18:00:00 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 14/19] goldfish_rtc: re-arm the alarm after migration
Date: Wed, 17 Feb 2021 17:59:29 -0800
Message-Id: <20210218015934.1623959-15-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210218015934.1623959-1-alistair.francis@wdc.com>
References: <20210218015934.1623959-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=6763bdb70=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: alistair23@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <laurent@vivier.eu>

After a migration the clock offset is updated, but we also
need to re-arm the alarm if needed.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20201220112615.933036-7-laurent@vivier.eu
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/rtc/goldfish_rtc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/rtc/goldfish_rtc.c b/hw/rtc/goldfish_rtc.c
index 0f4e8185a7..e07ff0164e 100644
--- a/hw/rtc/goldfish_rtc.c
+++ b/hw/rtc/goldfish_rtc.c
@@ -211,6 +211,8 @@ static int goldfish_rtc_post_load(void *opaque, int version_id)
             qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
     s->tick_offset = s->tick_offset_vmstate - delta;
 
+    goldfish_rtc_set_alarm(s);
+
     return 0;
 }
 
-- 
2.30.0


