Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4903033B4
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 06:04:40 +0100 (CET)
Received: from localhost ([::1]:39744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4GWt-0005iX-It
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 00:04:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=653775e38=dmitry.fomichev@wdc.com>)
 id 1l4GVD-0004Qs-73; Tue, 26 Jan 2021 00:02:55 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:37779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=653775e38=dmitry.fomichev@wdc.com>)
 id 1l4GVB-00071d-IK; Tue, 26 Jan 2021 00:02:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1611637374; x=1643173374;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8VTCrUKIMXWNvchrgvn6Iwkz8GSz53dofWIR7PH33Iw=;
 b=JNWDuXOzdrkYdrx1khfEycoJSWP99QW9xv+OzkinVfHcGq9aqPglnmHr
 ZlGpFTwWxc5zkZM+xX2hUaPXkrK47sUwGuZivYJUsgU5aGUrmDrSccEtC
 OID/+tKCdgbSCE9+N8Je0zGUzmfH7pXQ57oUwCrufLjuxzKtsB4zKfEWK
 aDjN3ccgBa6U5YZQJWOzSELnlL21q8/YLU0zAT3yvxPuESshjYBc6eUHE
 AfxF09OM9dMK9zzBb/zq+8YIpXMMEizjiSHNK6T5tw1lBqZXfrZewAQ3F
 EdBiPbnwVmQS0W2MrORHENVAKWe9B5O80XMDWmR0ytNwjh1Bbi19K3cLG A==;
IronPort-SDR: /nQoxkOxMSpJE8VkWc0d6A84levK42AdvcX47NBikLRLzfyS2xfwZqIy3IPczSh4UAoa5KbiCl
 6LveHgqO5Sn5BDqf8AcxzWxhDYRpQ6JpfMex9BUR7qPnM5Cbun+7JhtBCZaBZ4SJTVoj6yTk87
 ShjfO7ldhjBOgX6zL7fhfhn4yks0ayokFErswnO2Hbt3UjwU4F0D/T/NtXJ/D4zbawApaL9S0x
 8la1nceJKCaA3ZFMdp5ZCHwItKuBASZ2jr/Kfy3fvTlzUENQF+ML9AO/kA8NgTOK7TrENT4877
 i+Y=
X-IronPort-AV: E=Sophos;i="5.79,375,1602518400"; d="scan'208";a="159493359"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 26 Jan 2021 13:02:51 +0800
IronPort-SDR: tcrYLbr1ILPkY738rSk6JUO1EfyVHtZ4kCrzysfgQigCWK4NFZrhduOiDQmEaS8DhY7iY9Rokc
 gNd/022PVqLip5d0T0q24LZUXt+Twlmy6OYezwmmhmKY2NUkvun+/8QrIUOHIxhlG0CYGtdheV
 0X0yDlzGkSnRG7+NtMkAgsHjZ3Ndd+CBDgxvjdCEUV6S86m9mvXkO8i596nIRa3NZGVTcZ3k2e
 Q2EF685vNawXaUHtL+Y6eNYHBuizj+v/dt7oyzMI2XwZK5D9qSgw+IaIy1VeNUfVOua90DoVHZ
 N1byrT2EYhH8PpDI3v/YYcSw
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2021 20:47:17 -0800
IronPort-SDR: p5SFD1HteIigNB4g+BhsE/+sVlCvch8hrdXukn7Z7a+PZ2dIomj2FR5gRKtk+uag8f+/lxPjry
 8xxwXWsZfeFH3kemiZhqrlHYps+1K/IP8RSAzRqLRLkiZV1xaXVgOEsYUSKCHaLK1Sl+38S826
 wfL1djjAECCBUzCHzChzrhRlUQi+blxs0pmEruqZd9V3SkHywsA+iFam3KwWeHojcU6oQ8J/2Z
 34y59LerfHrsBlgtnS4I7vURslZYlvH/oYz1/Z6X1TTQBAjOt/o0tcz88Xn8kXIg6n/2OS+MbM
 svk=
WDCIronportException: Internal
Received: from unknown (HELO redsun50.ssa.fujisawa.hgst.com) ([10.149.66.24])
 by uls-op-cesaip02.wdc.com with ESMTP; 25 Jan 2021 21:02:50 -0800
From: Dmitry Fomichev <dmitry.fomichev@wdc.com>
To: Klaus Jensen <k.jensen@samsung.com>, Keith Busch <kbusch@kernel.org>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org
Subject: [PATCH 0/3] Fix zone write validation
Date: Tue, 26 Jan 2021 14:02:45 +0900
Message-Id: <20210126050248.9077-1-dmitry.fomichev@wdc.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=653775e38=dmitry.fomichev@wdc.com; helo=esa6.hgst.iphmx.com
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
Cc: Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Niklas Cassel <niklas.cassel@wdc.com>, Damien Le Moal <damien.lemoal@wdc.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These patches solve a few problems that exist in zoned Write
ans Zone Append validation code.

Dmitry Fomichev (3):
  hw/block/nvme: Check for zone boundary during append
  hw/block/nvme: Check zone state before checking boundaries
  hw/block/nvme: Add trace events for zone boundary violations

 hw/block/nvme.c       | 35 ++++++++++++++++++++---------------
 hw/block/trace-events |  3 +++
 2 files changed, 23 insertions(+), 15 deletions(-)

-- 
2.28.0


