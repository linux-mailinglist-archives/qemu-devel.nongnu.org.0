Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AE35420A7
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 03:33:19 +0200 (CEST)
Received: from localhost ([::1]:54184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nykZS-0004if-SN
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 21:33:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=151ed2091=niklas.cassel@wdc.com>)
 id 1nykVP-0001N9-Dt; Tue, 07 Jun 2022 21:29:07 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:39781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=151ed2091=niklas.cassel@wdc.com>)
 id 1nykVL-0001Ir-LT; Tue, 07 Jun 2022 21:29:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1654651742; x=1686187742;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=06fb3pRBEFQ+pFc9XQUHAV/EhZ3NHcHfemuc5ZfRpV8=;
 b=lCo2KhRixRIkj7PdiDNij6YEq5WHoVoxe6KqS/eUX0hfqbPPaBeH5tix
 eTljt5EdJneo58mcLkCTBafVRewCkjxaIGA5EfeyQu/Vth41ehEXxBzMN
 LY6AFWtnXDETqM8J4S+xjNRk9WPgp5VIqbIf5+yX0Nym+BvF28VFr0JX2
 2Di8Bd/G2v0utW16G+P4Zd5dRM91FmwsLTrLGdG8SFOrZ6U27NJcljHOb
 Lf6vF3e8hoVa8oWjolzHPbFgG6dmc1bBQYi9sLbwGgnAnXOze+i6uCHtg
 PYTwaMvop7Vy3pjmBws1jctunfwhujMnYsmE2bDwpjfpMx3Z34KyLcUuJ Q==;
X-IronPort-AV: E=Sophos;i="5.91,284,1647273600"; d="scan'208";a="207399234"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jun 2022 09:28:58 +0800
IronPort-SDR: 2upb8bi6p51Q3b5fIQ2WPe5+SK5EgsOy+d/tTNUcetpsDQbosFRDW/e7F3v2DLAiff1foqAgii
 kxi4Jxflfi6u+ByQ1wHT3G0b4+ddZgpOxGxCZ7JV3LWprKFVRRqVM962y8dI8C8MOke7bcTaSF
 vn30i5yBuX+hg/v7g67hXUTobo8KM9YDb+PqjQ0jvb05zg0jH6Fr80Nl0g5AOBakWJaaTtKODs
 dCKhKeSP8hTsiv/pHFgxUchKTjdveK4lknN2nBteQ2ZIzLdkKWdpDm4CciwOL/Ho6ZUy8saD06
 d+tMLp3toT1B9L10sBu3OD0b
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Jun 2022 17:47:48 -0700
IronPort-SDR: Ow/416sP6KcD9Y8kI1cfeEj3SeOTgBCMhDw7EIEtsnvzVHPYlwMr/HZTMnZjtE8nj2nVgpdsyu
 sRugnJUP48UOlcFlkPtxPIUGqJgh8aa3DPwqevei7UtWzHM73YrPHXDBUGBW/QvcSell5oK6aP
 utHqthyIW1KM71yBB/tioJBjjuVQQk9E4IvlKrTiQBzEzFUKGLkBuAQOtWSC8O8uT6DpYMNCKV
 DKlLIrm8ZX2mNmHd4rz5NkUkk3SiR616lAf0VzFVVnI4UWzS+YQCv6zY3MAnVnPAtPH1kQgZMY
 LJs=
WDCIronportException: Internal
Received: from unknown (HELO x1-carbon.lan) ([10.225.164.64])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Jun 2022 18:28:57 -0700
To: kbusch@kernel.org,
	its@irrelevant.dk
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Niklas Cassel <niklas.cassel@wdc.com>
Subject: [PATCH 1/4] hw/nvme: claim NVMe 2.0 compliance
Date: Wed,  8 Jun 2022 03:28:47 +0200
Message-Id: <20220608012850.668695-2-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220608012850.668695-1-niklas.cassel@wdc.com>
References: <20220608012850.668695-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=151ed2091=niklas.cassel@wdc.com; helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Niklas Cassel <niklas.cassel@wdc.com>
From:  Niklas Cassel via <qemu-devel@nongnu.org>

CRMS.CRWMS bit shall be set to 1 on controllers compliant with versions
later than NVMe 1.4.

The first version later than NVMe 1.4 is NVMe 2.0

Let's claim compliance with NVMe 2.0 such that a follow up patch can
set the CRMS.CRWMS bit.

This is needed since CC.CRIME is only writable when both CRMS.CRIMS
and CRMS.CRWMS is set.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
---
 hw/nvme/ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 1e6e0fcad9..91469834b0 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -168,7 +168,7 @@
 
 #define NVME_MAX_IOQPAIRS 0xffff
 #define NVME_DB_SIZE  4
-#define NVME_SPEC_VER 0x00010400
+#define NVME_SPEC_VER 0x00020000
 #define NVME_CMB_BIR 2
 #define NVME_PMR_BIR 4
 #define NVME_TEMPERATURE 0x143
-- 
2.36.1


