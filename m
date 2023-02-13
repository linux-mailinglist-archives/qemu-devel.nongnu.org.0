Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C446947A9
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 15:05:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRZOm-0006bT-Jv; Mon, 13 Feb 2023 09:01:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pRZOT-0006b1-Nr
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:01:21 -0500
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pRZOQ-0005s5-S9
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:01:21 -0500
Received: from myt6-23a5e62c0090.qloud-c.yandex.net
 (myt6-23a5e62c0090.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:1da3:0:640:23a5:e62c])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id C283762208;
 Mon, 13 Feb 2023 17:01:11 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:6527::1:3a])
 by myt6-23a5e62c0090.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 51j9w00QYCg1-ptV5GrFl; Mon, 13 Feb 2023 17:01:11 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676296871; bh=3aHAQrjsecDyFJREJ82RQxW/RouKuAukQ+0AwJAyrnU=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=AfQ83+lvh/rh+r8TAUurZCLCMxz0beeML1+AcCO82e/oYNIJgK5gYJJpl1BRef4bE
 ddwyJLBQNQQysNBtXj6BLzKIdnUrVomlpvlVzKoAut72TqmPTvynMvkOqbyNKC7WCB
 eYhwATqkpqxkTnG23Xo0TyPloAuMw4LEkhONPwOA=
Authentication-Results: myt6-23a5e62c0090.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, philmd@linaro.org, vsementsov@yandex-team.ru,
 den-plotnikov@yandex-team.ru, antonkuchin@yandex-team.ru
Subject: [PATCH v4 00/16] pci hotplug tracking
Date: Mon, 13 Feb 2023 17:00:47 +0300
Message-Id: <20230213140103.1518173-1-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

v4: rework the API after discussion in the mailing list

----

The main patches are the last two ones:

- introduce HOTPLUG_STATE event, that inform when hotplug controller
change it's state, especially indicator leds

- query-hotplug command, that provides same information as event on
demand

- DEVICE_ON event - a kind of counterpart for DEVICE_DELETED, signals
when device is finally accepted by guest, power indicator is on and so
on.

That's all for smarter handling of SHPC and PCIe-native hotplug.

If you want to test new events, don't forget
  -global ICH9-LPC.acpi-pci-hotplug-with-bridge-support=off
flag, to disable ACPI hotplug default.

Vladimir Sementsov-Ogievskiy (16):
  pci/shpc: set attention led to OFF on reset
  pci/shpc: change shpc_get_status() return type to uint8_t
  pci/shpc: shpc_slot_command(): handle PWRONLY -> ENABLED transition
  pci/shpc: more generic handle hot-unplug in shpc_slot_command()
  pci/shpc: pass PCIDevice pointer to shpc_slot_command()
  pci/shpc: refactor shpc_device_plug_common()
  pcie: pcie_cap_slot_write_config(): use correct macro
  pcie_regs: drop duplicated indicator value macros
  pcie: drop unused PCIExpressIndicator
  pcie: pcie_cap_slot_enable_power() use correct helper
  pcie: introduce pcie_sltctl_powered_off() helper
  pcie: set power indicator to off on reset by default
  pci: introduce pci_find_the_only_child()
  qapi: deprecate "device" field of DEVICE_* events
  qapi: add HOTPLUG_STATE event
  qapi: introduce DEVICE_ON event

 docs/about/deprecated.rst       |   9 ++
 qapi/qdev.json                  | 200 ++++++++++++++++++++++++++++-
 include/hw/hotplug.h            |  12 ++
 include/hw/pci/pci.h            |   4 +
 include/hw/pci/pci_bridge.h     |   2 +
 include/hw/pci/pcie.h           |  10 +-
 include/hw/pci/pcie_regs.h      |  14 ---
 include/hw/pci/shpc.h           |   2 +
 include/monitor/qdev.h          |   5 +
 hw/core/hotplug.c               |  13 ++
 hw/pci-bridge/pci_bridge_dev.c  |  14 +++
 hw/pci-bridge/pcie_pci_bridge.c |   1 +
 hw/pci/pci.c                    |  33 +++++
 hw/pci/pcie.c                   | 122 ++++++++++++++++--
 hw/pci/pcie_port.c              |   1 +
 hw/pci/shpc.c                   | 215 ++++++++++++++++++++++++--------
 softmmu/qdev-monitor.c          |  39 ++++++
 17 files changed, 608 insertions(+), 88 deletions(-)

-- 
2.34.1


