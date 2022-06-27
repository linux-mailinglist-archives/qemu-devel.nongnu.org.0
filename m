Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A128F55B965
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 13:51:05 +0200 (CEST)
Received: from localhost ([::1]:47684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5nGi-000514-AI
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 07:51:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=170689b83=niklas.cassel@wdc.com>)
 id 1o5nDj-0002dU-7P; Mon, 27 Jun 2022 07:47:59 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:27947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=170689b83=niklas.cassel@wdc.com>)
 id 1o5nDg-0004bj-JZ; Mon, 27 Jun 2022 07:47:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1656330476; x=1687866476;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NTbwRUO84sGM+nTlLCMcrr1UC4lNxnswasjeyZsfvZU=;
 b=KJ/5ikN0KzxxTkjKx1wtsGZ2Ti6dewHEowCz6vaq7wTljelfs+E7+1W+
 rf6o9rPGmRXpeYdKwkyjYAHvozlAjhXtmz34aSnnRcuWZb1uLzaYprmHI
 ZbvH7xHHhMkA9don+VyzLqpIxmuITtR2oA0yJY1RENtf5iXrGbHBqD8iI
 ypWUS9DsYEkQ9LELkCM4RkmyIgNNGkcYvZN0+li6ytMJKwN0lIA1xx9KI
 qft21nHjY+DnQ/fkVNXhjid/HIYY592xtE8+YaAv8hZZqaG+RX0lRTOEb
 cd1rYSA+GyD4WUHZxN9/f6/c9IHekk/n4sf7MIW9W6qdfOr1qmwO1I32i Q==;
X-IronPort-AV: E=Sophos;i="5.92,226,1650902400"; d="scan'208";a="316298964"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 27 Jun 2022 19:47:51 +0800
IronPort-SDR: GqlkvwE/swkGSvHBKhduB/6uPF0KcM5uXS5Jzdsg+e3shovAMXLXWiqaDwAyDbbrwXFdtRJHhq
 bMeTmqCGKbpJeS5wIJSXu63WP8cAL8cAHBHfwZZeIGxHEQEoZg+EpTJJkuLA3+iowc7jBQLwxC
 OYAitm/raEAsOqBo56KfQAUeD8p+fa00ZGq2PWummZqEF31XbuHkBzd8uxHCS+utGIhS0GJjJ4
 vHqC0lWklNhCj/R7n/ZOEHEK4atIVZZL0p7kkK5qVIjM8KRcQNcO7+GBighbYNwEFWaLL6QkCt
 gAYj+EtyI3CcY1YyiGCrALjw
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Jun 2022 04:10:14 -0700
IronPort-SDR: Bithl5pUrzyeh2KFiRPBotTBC8xN/u5enTZuGz601qflbItuBirMZh8x0dydhHZyxYvs1kHChy
 EK/fqLccVRRmbHDWGpOGKMHWhCCnqAcH9S4f4DdPh6xj7mDnvWHxjPT991JBdoNeALHjd/zf7e
 hmum+viHwL3UngWys2jIslv09Uw17+5FmC7euwyAUQ/498cpGGxf6UY3scuZNIRjhIRng0u/sX
 5/niWYMxeCkomFDicIcR0M4vQaXcA+ZfmbegC4ivuSEQXAl3pocvtF/fxHun5Xh1FrBJxL7nxw
 E70=
WDCIronportException: Internal
Received: from unknown (HELO x1-carbon.wdc.com) ([10.225.164.108])
 by uls-op-cesaip01.wdc.com with ESMTP; 27 Jun 2022 04:47:50 -0700
To: kbusch@kernel.org,
	its@irrelevant.dk
Cc: damien.lemoal@wdc.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Niklas Cassel <niklas.cassel@wdc.com>
Subject: [PATCH v2 1/4] hw/nvme: claim NVMe 2.0 compliance
Date: Mon, 27 Jun 2022 13:47:28 +0200
Message-Id: <20220627114731.356462-2-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627114731.356462-1-niklas.cassel@wdc.com>
References: <20220627114731.356462-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=170689b83=niklas.cassel@wdc.com; helo=esa1.hgst.iphmx.com
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
index f8ec4a7be3..8ca824ea14 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -204,7 +204,7 @@
 
 #define NVME_MAX_IOQPAIRS 0xffff
 #define NVME_DB_SIZE  4
-#define NVME_SPEC_VER 0x00010400
+#define NVME_SPEC_VER 0x00020000
 #define NVME_CMB_BIR 2
 #define NVME_PMR_BIR 4
 #define NVME_TEMPERATURE 0x143
-- 
2.36.1


