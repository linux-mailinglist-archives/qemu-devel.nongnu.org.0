Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7D66911F0
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 21:10:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQDDp-0001bZ-Uq; Thu, 09 Feb 2023 15:08:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pQDDk-0001Zq-Qe
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 15:08:40 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pQDDd-0002fo-LG
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 15:08:36 -0500
Received: from myt5-8800bd68420f.qloud-c.yandex.net
 (myt5-8800bd68420f.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:4615:0:640:8800:bd68])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id C553B60356;
 Thu,  9 Feb 2023 23:08:22 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:6518::1:1])
 by myt5-8800bd68420f.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 A8lCI60OTGk1-ni2o8D07; Thu, 09 Feb 2023 23:08:22 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1675973302; bh=cYEK15D8jL3X8QMlruWQ9AyLi/0Fnlu2ZqSHBM4EoJA=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=Db8VjstLA/QPhDmJZmzIIq4oS/v7M/dF3mlnziod2DM+Femxu3P5T6i5XETqqHy5O
 Y5H9nP9coV8oAPpiQbIiXgsEHYUOmWZIPRbywCaha9EWCya4X2miih8MOXsSV4MCxk
 xlzn6nqXMcWNrvo1jliiHUaVZ3MdEqW5vo9iN5kk=
Authentication-Results: myt5-8800bd68420f.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, vsementsov@yandex-team.ru, den-plotnikov@yandex-team.ru
Subject: [PATCH v3 00/15] pci hotplug tracking
Date: Thu,  9 Feb 2023 23:07:53 +0300
Message-Id: <20230209200808.869275-1-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
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

That's called v3, as it includes "[PATCH v2 0/3] pcie: cleanup code":
Supersedes: <20230207121116.325456-1-vsementsov@yandex-team.ru>
Supersedes: <20230204174758.234951-1-vsementsov@yandex-team.ru>
Supersedes: <20230207120922.325203-1-vsementsov@yandex-team.ru>

Ok, what's this about?

The main patches are the last three ones:

- introduce HOTPLUG_STATE event, that inform when hotplug controller
change it's state, especially indicator leds

- query-hotplug command, that provides same information as event on
demand

- DEVICE_ON event - a kind of counterpart for DEVICE_DELETED, signals
when device is finally accepted by guest, power indicator is on and so
on.

That's all for smarter handling of SHPC and PCIe-native hotplug.

Vladimir Sementsov-Ogievskiy (15):
  pci/shpc: set attention led to OFF on reset
  pci/shpc: change shpc_get_status() return type to uint8_t
  pci/shpc: shpc_slot_command(): handle PWRONLY -> ENABLED transition
  pci/shpc: more generic handle hot-unplug in shpc_slot_command()
  pci/shpc: pass PCIDevice pointer to shpc_slot_command()
  pcie: pcie_cap_slot_write_config(): use correct macro
  pcie_regs: drop duplicated indicator value macros
  pcie: drop unused PCIExpressIndicator
  pcie: pcie_cap_slot_enable_power() use correct helper
  pcie: introduce pcie_sltctl_powered_off() helper
  pcie: set power indicator to off on reset by default
  pci: introduce pci_find_the_only_child()
  qapi: add HOTPLUG_STATE event
  qapi: introduce DEVICE_ON event
  qapi: introduce query-hotplug command

 qapi/qdev.json                  |  97 ++++++++++++++++
 include/hw/hotplug.h            |  12 ++
 include/hw/pci/pci.h            |  16 +++
 include/hw/pci/pci_bridge.h     |   2 +
 include/hw/pci/pcie.h           |  10 +-
 include/hw/pci/pcie_regs.h      |  14 ---
 include/hw/pci/shpc.h           |   2 +
 hw/core/hotplug.c               |  13 +++
 hw/pci-bridge/pci_bridge_dev.c  |  14 +++
 hw/pci-bridge/pcie_pci_bridge.c |   1 +
 hw/pci/pci.c                    |  66 +++++++++++
 hw/pci/pcie.c                   | 119 +++++++++++++++++--
 hw/pci/pcie_port.c              |   1 +
 hw/pci/shpc.c                   | 196 ++++++++++++++++++++++++--------
 softmmu/qdev-monitor.c          |  30 +++++
 15 files changed, 509 insertions(+), 84 deletions(-)

-- 
2.34.1


