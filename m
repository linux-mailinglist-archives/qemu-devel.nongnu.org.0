Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBAC4D95D5
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 09:02:03 +0100 (CET)
Received: from localhost ([::1]:39528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU27z-00039O-VE
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 04:01:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1nU24q-0000dx-EO; Tue, 15 Mar 2022 03:58:44 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:26132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1nU24n-0003kf-K0; Tue, 15 Mar 2022 03:58:44 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 22F7loYq061296;
 Tue, 15 Mar 2022 15:47:50 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from localhost.localdomain (192.168.70.100) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 15 Mar
 2022 15:57:56 +0800
From: Steven Lee <steven_lee@aspeedtech.com>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
Subject: [PATCH v2 0/2] hw: aspeed_scu: Add AST2600 hpll calculation function
Date: Tue, 15 Mar 2022 15:57:51 +0800
Message-ID: <20220315075753.8591-1-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.70.100]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 22F7loYq061296
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=steven_lee@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: jamin_lin@aspeedtech.com, troy_lee@aspeedtech.com,
 steven_lee@aspeedtech.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

AST2600's HPLL register offset and bit definition are different from AST2500.
The patch series adds a hpll calculation function for ast2600 and modify apb frequency
calculation function based on SCU200 register description and note in ast2600v11.pdf.

Changes since v1:
- introduce ast2400 and ast2600 get_apb_freq class handlers.
- introduce clkin_25Mhz attribute.

Please help to review.

Thanks,
Steven

Steven Lee (2):
  hw: aspeed_scu: Add AST2600 apb_freq and hpll calculation function
  hw: aspeed_scu: Introduce clkin_25Mhz attribute

 hw/misc/aspeed_scu.c         | 45 ++++++++++++++++++++++++++++++++++--
 include/hw/misc/aspeed_scu.h | 19 +++++++++++++++
 2 files changed, 62 insertions(+), 2 deletions(-)

-- 
2.17.1


