Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4BF68ABBD
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 18:50:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOMeH-00030B-TI; Sat, 04 Feb 2023 12:48:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pOMeG-0002zI-97
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 12:48:24 -0500
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pOMeC-0006SP-88
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 12:48:24 -0500
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 2C56461E2A;
 Sat,  4 Feb 2023 20:48:12 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:b67f::1:2])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 3mds2O0QhiE1-wbDulygy; Sat, 04 Feb 2023 20:48:11 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1675532891; bh=cQmYgx3QWN3AwP5BNL2AzMH0kRpW8d65jXbnZuWelu0=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=dv0sqEku9QodxnnzmF1ocCaQ+60k4Ofepx7M+E+mLcJgVAbPjWmTd6Ed/o3Rl9GUm
 zL+rTaPxfIJfEXeIbzBkJegTcT1xogz6gtF4tYr0jMKwr9kqWAWYYTfHjd1yJfbm8e
 EHHLQplmQm6ww6vtgOYrYM8aAm3KLAbvZVQWdTCY=
Authentication-Results: iva4-f06c35e68a0a.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	marcel.apfelbaum@gmail.com,
	vsementsov@yandex-team.ru
Subject: [PATCH 0/4] pcie: cleanup code and add trace point
Date: Sat,  4 Feb 2023 20:47:53 +0300
Message-Id: <20230204174758.234951-1-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi all!

Here is tiny code cleanup + on trace point to track power indicator
changes (which may help to analyze
"Hot-unplug failed: guest is busy (power indicator blinking)" error
message).

Vladimir Sementsov-Ogievskiy (4):
  pcie: pcie_cap_slot_write_config(): use correct macro
  pcie_regs: drop duplicated indicator value macros
  pcie: drop unused PCIExpressIndicator
  pcie: add trace-point for power indicator transitions

 include/hw/pci/pcie.h      |  8 --------
 include/hw/pci/pcie_regs.h | 14 --------------
 hw/pci/pcie.c              | 33 +++++++++++++++++++++++++++------
 hw/pci/trace-events        |  3 +++
 4 files changed, 30 insertions(+), 28 deletions(-)

-- 
2.34.1


