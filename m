Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5D748A9CC
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 09:48:10 +0100 (CET)
Received: from localhost ([::1]:43758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Cp7-0001Wt-Fo
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 03:48:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <troy_lee@aspeedtech.com>)
 id 1n7Cn6-0000qA-E8
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 03:46:04 -0500
Received: from twspam01.aspeedtech.com ([211.20.114.71]:45464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <troy_lee@aspeedtech.com>)
 id 1n7Cn2-0005CF-SD
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 03:46:04 -0500
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 20B8dF4j066963;
 Tue, 11 Jan 2022 16:39:15 +0800 (GMT-8)
 (envelope-from troy_lee@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 11 Jan
 2022 16:45:48 +0800
From: Troy Lee <troy_lee@aspeedtech.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v3 0/2] Aspeed I3C device model
Date: Tue, 11 Jan 2022 16:45:44 +0800
Message-ID: <20220111084546.4145785-1-troy_lee@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.10.10]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 20B8dF4j066963
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=troy_lee@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: leetroy@gmail.com, hailin.wu@aspeedtech.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series of patch introduce a dummy implemenation of aspeed i3c
model, and it provide just enough information for guest machine.
However, the driver probing is still failed, but it will not cause
kernel panic.

v3:
- Remove unused AspeedI3CClass
- Refine memory region
- Refine register reset
- Remove unrelated changes to SPI2 address
- Remove i3c controller irq line

v2:
- Split i3c model into i3c and i3c_device
- Create 6x i3c devices
- Using register fields macro
- Rebase to mainline QEMU

Troy Lee (2):
  Introduce a dummy AST2600 I3C model.
  This patch includes i3c instance in ast2600 soc.

 hw/arm/aspeed_ast2600.c      |  16 ++
 hw/misc/aspeed_i3c.c         | 381 +++++++++++++++++++++++++++++++++++
 hw/misc/meson.build          |   1 +
 hw/misc/trace-events         |   6 +
 include/hw/arm/aspeed_soc.h  |   3 +
 include/hw/misc/aspeed_i3c.h |  48 +++++
 6 files changed, 455 insertions(+)
 create mode 100644 hw/misc/aspeed_i3c.c
 create mode 100644 include/hw/misc/aspeed_i3c.h

-- 
2.25.1


