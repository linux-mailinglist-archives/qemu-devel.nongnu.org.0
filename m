Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DADFD4CC2E3
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 17:34:17 +0100 (CET)
Received: from localhost ([::1]:42820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPoPA-0005E9-W8
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 11:34:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amir.gonnen@neuroblade.ai>)
 id 1nPo3w-0005Qh-S6
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 11:12:21 -0500
Received: from [2a01:111:f400:fe0d::70f] (port=3727
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amir.gonnen@neuroblade.ai>)
 id 1nPo3v-0000Si-8v
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 11:12:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fPfdAtKyMtkywBXFop0v6hmDNizzRgWevCyKfmQJS5WuxHxYFVYLm8Qaoi4CuQ+Sq8Yt2L2Y1y3mIOSJ3i7cs8Cvy4bwg4QYml/wIDp8DabXFWmGBBY6Ay1stUXuJV6a3IiVANlbSmTBUNL72wlpxgo/MJKnCldmxSEdcmIYPRVetN//Vinfi720L1RO1gSeKUEh4nJ3rQi4s9RTeNqtgajyJrOKaHGnB/9RP6QEOt5T4QqfrMFIUBlcM9M9QJDHd4lPzH5sm1sML6fFXGR+wmxHN0ZisEtHkTGaKoiBNBc+PFe08J+gGhMsGbty1/+QFOlNSafOuRVYhfDsBz2JYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yqAh1CVkMLJMfQerIebVY2OOExvLNp6P1mBa1KrIsYU=;
 b=ZbBo59lLC0lXRYPUjJ1lfIylGidEjPFWDt8eE0xEqsKcO17LIJCkO5vHwQUM/ehqsxLXUPnfIUlX55SNJZki+D6X/lvuQu7h+3ykWludOF5IqUchfN3hm/rwb1QdV1ojuDMh8eDQo3VMmV5XUp/16QPXObjA9RtpUs+FVQgZi50B+puqXM0lpY1djYlXE5sD9ZJtN7K7dD0gSoPCHMbyWBsxYuZV7YQj26d1Y/IdlAMI0qToSKmmRE/cmy9Jx/gjHAVb/Wsz/8xBuaS7AEzi9hpSvjXsFigC321Cfsj9dNpf4uQL09VpEu2A1JLXgDYiWdtTCFG/3HeYEyelpD6SsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 192.116.190.34) smtp.rcpttodomain=denx.de smtp.mailfrom=neuroblade.ai;
 dmarc=none action=none header.from=neuroblade.ai; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=neuroblade.ai;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yqAh1CVkMLJMfQerIebVY2OOExvLNp6P1mBa1KrIsYU=;
 b=aoArfWuNRK4zHnbWoKifDdJVMzOeBemEAfx+qL93NJ/9DKw2UZFsPPwxdZvJgF9kthZQPVrpnd1kLcx8QRJxxLm/xF6BiMkwrZm9U4v1vKn1wWwbL4HGXh+nUMUneZn1FfcWk16JObZrDYfEGQBWUYN7fzySVm5ukAhw1q93j1k=
Received: from SV0P279CA0058.NORP279.PROD.OUTLOOK.COM (2603:10a6:f10:14::9) by
 DB8PR09MB4327.eurprd09.prod.outlook.com (2603:10a6:10:15e::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.14; Thu, 3 Mar 2022 15:39:16 +0000
Received: from HE1EUR02FT063.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:f10:14:cafe::7c) by SV0P279CA0058.outlook.office365.com
 (2603:10a6:f10:14::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Thu, 3 Mar 2022 15:39:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 192.116.190.34)
 smtp.mailfrom=neuroblade.ai; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=neuroblade.ai;
Received-SPF: Fail (protection.outlook.com: domain of neuroblade.ai does not
 designate 192.116.190.34 as permitted sender)
 receiver=protection.outlook.com; client-ip=192.116.190.34;
 helo=nb-o365.localdomain;
Received: from nb-o365.localdomain (192.116.190.34) by
 HE1EUR02FT063.mail.protection.outlook.com (10.152.11.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.14 via Frontend Transport; Thu, 3 Mar 2022 15:39:14 +0000
Received: from amirgonnen-vm.neuroblade.corp (amirgonnen-vm.neuroblade.corp
 [192.168.3.87])
 by nb-o365.localdomain (Postfix) with ESMTP id 42B5F1F55B;
 Thu,  3 Mar 2022 17:38:59 +0200 (IST)
From: Amir Gonnen <amir.gonnen@neuroblade.ai>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 0/5] target/nios2: Shadow register set, EIC and VIC
Date: Thu,  3 Mar 2022 17:39:01 +0200
Message-Id: <20220303153906.2024748-1-amir.gonnen@neuroblade.ai>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: afa8a738-20ed-456f-f0c1-08d9fd2bf8e1
X-MS-TrafficTypeDiagnostic: DB8PR09MB4327:EE_
X-Microsoft-Antispam-PRVS: <DB8PR09MB4327B65E038E8A69DB313AE7EB049@DB8PR09MB4327.eurprd09.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SDHtzdypmE2kFR3c0GKJlQczYnk6/xr+8yaf4JdqQXykrilJ31+myMCelSKJaMgXpGqyZH9yXdI0CevSkxid4c/iY+kFzpphjz2YOicbUSzgj8ui47xnGBfVxdKehFBNkNOJ/Dqy6eDeV0B6+Uj7cljyEvGjdsvGj4eFZqlyFyrsTgg00rf27swsFIPZifEx6rHuZiHWiGNKwjxedySMB7Km3MJ5NS9X0nKtE0QWQDK1lUZYU3Q6Rd2XN1EPyVL5lHWiD1N1DzIttjxo2hEBrAvg0x5/Xog9Fx2arYURgknJBITGTMUhOa4UKD/fnHe6AUxRRpUf6IDZHxTP73/03WWDxtl1Yc4m5P8mxYQfIHCOADgosADIeO9dCZ3SMeG9iyUeONaiIalgVUIEsTEl/QWmG7mNVCegWk24ipWsKwlSvCbJtB2SH4xW9/xxGPJ+6U1ipP2pfHWgAzejEtinRZA/U3kaRJoQ2Sp7kmgTN/3eVvMlABruiAV59QISxlulTHDQBXqNC33Yu8vLLprGfP2V+dkjE92w5oVYnqWRE2KzfMtfMT1Ig9IWZAP1g/2cMtlQdqQk3gPhKrF1kJCZnLXqTB/q3TfFhZ5WjY2Fo/0FLqzDGWG8zD3NB6WgzJeGHlj67tRctnjt8cLvpdpXrV8irAZryJ7tZyNh+AaYcI1ZijMkOa14u84b4Wuvq2kysjDxjqAQbyhmOM+8FeuVUC73/pWmB3dc9vXYlPVDcN0=
X-Forefront-Antispam-Report: CIP:192.116.190.34; CTRY:IL; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:nb-o365.localdomain; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(346002)(39840400004)(376002)(396003)(136003)(36840700001)(46966006)(86362001)(316002)(110136005)(47076005)(6666004)(83380400001)(107886003)(508600001)(2616005)(40480700001)(82310400004)(1076003)(36860700001)(44832011)(8936002)(5660300002)(336012)(2906002)(26005)(70206006)(70586007)(186003)(6266002)(356005)(36756003)(81166007)(4326008)(8676002)(36900700001)(27056005);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: neuroblade.ai
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 15:39:14.8771 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afa8a738-20ed-456f-f0c1-08d9fd2bf8e1
X-MS-Exchange-CrossTenant-Id: 63c61203-65af-4cf8-98e5-d12f35edaefa
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=63c61203-65af-4cf8-98e5-d12f35edaefa; Ip=[192.116.190.34];
 Helo=[nb-o365.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR02FT063.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR09MB4327
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0d::70f
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0d::70f;
 envelope-from=amir.gonnen@neuroblade.ai;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Amir Gonnen <amir.gonnen@neuroblade.ai>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: 20220227182125.21809-1-richard.henderson@linaro.org
("target/nios2: Rewrite interrupt handling")

Implement nios2 Shadow register set, EIC and VIC.

Currently nios2 on QEMU contains an internal Interrupt Controller.
The nios2 architecture can support a more powerful External Interrupt
Controller (EIC) instead of the internal, and implements special cpu
features to support it: Shadow register set and External Interrupt
Controller Interface.

This patch series introduces the necessary changes to the nios2 cpu to
support an External Interrupt Controller, and includes a Vectored
Interrupt Controller (VIC) device that can be attached to the EIC.

Changes from v2
===============
- Rebase patchest on "target/nios2: Rewrite interrupt handling", which
  introduces fixes to nios2 interrupt handling
- Check supervisor on eret as a separate patch
- Check supervisor on rdprs and wrprs
- Use FIELD_EX32 and FIELD_DP32 to access IL, CRS and PRS
- Added a comment on helper_eret
- Compute rdprs and wrprs inline, without helper functions
- Check nios2_take_eic_irq on nios2_cpu_exec_interrupt
- Check regs[CR_IPENDING] instead of env->irq_pending
- Fix Kconfig (remove defaults and depends)
- Added URL to VIC documentaion on Intel website
- Removed LOG_VIC
- Added comments in nios_vic.c
- Report an error in case of write to invalid CSR address

Changes from v1
===============
- Splitted into several independant patches
- Added a board that wires up the VIC

Signed-off-by: Amir Gonnen

Amir Gonnen (5):
  target/nios2: Check supervisor on eret
  target/nios2: Shadow register set
  target/nios2: Exteral Interrupt Controller (EIC)
  hw/intc: Vectored Interrupt Controller (VIC)
  hw/nios2: Machine with a Vectored Interrupt Controller

 hw/intc/Kconfig           |   3 +
 hw/intc/meson.build       |   1 +
 hw/intc/nios2_vic.c       | 341 ++++++++++++++++++++++++++++++++++++++
 hw/nios2/10m50_devboard.c |  64 ++++++-
 hw/nios2/Kconfig          |   1 +
 target/nios2/cpu.c        |  55 ++++--
 target/nios2/cpu.h        |  69 +++++++-
 target/nios2/helper.c     |  33 +++-
 target/nios2/helper.h     |   1 +
 target/nios2/op_helper.c  |  18 ++
 target/nios2/translate.c  |  66 +++++++-
 11 files changed, 621 insertions(+), 31 deletions(-)
 create mode 100644 hw/intc/nios2_vic.c

-- 
2.25.1


