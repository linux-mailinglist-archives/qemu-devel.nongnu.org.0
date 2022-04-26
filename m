Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0C450EE99
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 04:13:47 +0200 (CEST)
Received: from localhost ([::1]:39318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njAi2-0003tl-0o
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 22:13:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1njAga-0001gc-2u; Mon, 25 Apr 2022 22:12:16 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:55458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1njAgW-0003C0-Jb; Mon, 25 Apr 2022 22:12:15 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 23Q1wvvA074069;
 Tue, 26 Apr 2022 09:58:57 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from localhost.localdomain (192.168.70.100) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 26 Apr
 2022 10:11:23 +0800
From: Steven Lee <steven_lee@aspeedtech.com>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Subject: [PATCH v6 0/3] aspeed/hace: Support AST2600 HACE
Date: Tue, 26 Apr 2022 10:11:17 +0800
Message-ID: <20220426021120.28255-1-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.70.100]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 23Q1wvvA074069
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

This patch series implements ast2600 hace engine with accumulative mode
and unit test against to it.

Verified with following models
- AST2600 with OpenBmc VERSION_ID=2.12.0-dev-660-g4c7b3e692-dirty
  - check hash verification in uboot and check whether qemu crashed
    during openbmc web gui login.
- AST1030 with ASPEED zephyr SDK v1.04
  - run `hash sha256` command in zephyr shell to verify aspeed hace.

Please help to review.

Thanks,
Steven

Changes in v6:
- Bug fixes in reconstruct_iov().

Steven Lee (3):
  aspeed/hace: Support HMAC Key Buffer register.
  aspeed/hace: Support AST2600 HACE
  tests/qtest: Add test for Aspeed HACE accumulative mode

 hw/misc/aspeed_hace.c          | 139 +++++++++++++++++++++++++++++--
 include/hw/misc/aspeed_hace.h  |   5 ++
 tests/qtest/aspeed_hace-test.c | 145 +++++++++++++++++++++++++++++++++
 3 files changed, 284 insertions(+), 5 deletions(-)

-- 
2.17.1


