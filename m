Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7B354F0F5
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 08:13:19 +0200 (CEST)
Received: from localhost ([::1]:54590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o25EH-0000vN-Tz
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 02:13:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>)
 id 1o258d-0007mb-Oa; Fri, 17 Jun 2022 02:07:23 -0400
Received: from ozlabs.ru ([107.174.27.60]:36508)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aik@ozlabs.ru>)
 id 1o258a-0001vW-DM; Fri, 17 Jun 2022 02:07:23 -0400
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 1BDE18053D;
 Fri, 17 Jun 2022 02:07:13 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: [PATCH qemu v2 0/2] ppc/spapr: Implement H_WATCHDOG
Date: Fri, 17 Jun 2022 16:07:01 +1000
Message-Id: <20220617060703.951747-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=107.174.27.60; envelope-from=aik@ozlabs.ru;
 helo=ozlabs.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This implements H_WATCHDOG. More detailed comments are in the patches.

This is based on sha1
96c343cc774b Joel Stanley "linux-user: Add PowerPC ISA 3.1 and MMA to hwcap".

Please comment. Thanks.



Alexey Kardashevskiy (2):
  ppc: Define SETFIELD for the ppc target
  ppc/spapr: Implement H_WATCHDOG

 include/hw/pci-host/pnv_phb3_regs.h |  16 --
 include/hw/ppc/spapr.h              |  29 +++-
 target/ppc/cpu.h                    |   5 +
 hw/intc/pnv_xive.c                  |  20 ---
 hw/intc/pnv_xive2.c                 |  20 ---
 hw/pci-host/pnv_phb4.c              |  16 --
 hw/ppc/spapr.c                      |   4 +
 hw/watchdog/spapr_watchdog.c        | 248 ++++++++++++++++++++++++++++
 hw/watchdog/meson.build             |   1 +
 hw/watchdog/trace-events            |   7 +
 10 files changed, 293 insertions(+), 73 deletions(-)
 create mode 100644 hw/watchdog/spapr_watchdog.c

-- 
2.30.2


