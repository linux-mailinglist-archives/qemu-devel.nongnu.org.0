Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE72699BD6
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 19:06:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSicA-0008Ss-AN; Thu, 16 Feb 2023 13:04:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pSic7-0008NH-U6
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 13:04:11 -0500
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pSic5-0005li-Hn
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 13:04:11 -0500
Received: from iva8-99b070b76c56.qloud-c.yandex.net
 (iva8-99b070b76c56.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:1099:0:640:99b0:70b7])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 40D27600F7;
 Thu, 16 Feb 2023 21:04:01 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:8813::1:16])
 by iva8-99b070b76c56.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 u3q89J0Qp8c1-QsYdnq3S; Thu, 16 Feb 2023 21:04:00 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676570640; bh=4mU3EYAumtlwOvRhED6qkVjVOWEvF441x7Q1zRMItdw=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=jEu2Awijbe7ZqxDGXFHZkwLs/Jwfpw/WAuhWImajq1giVfDY6GCbRWbFfjCVNhfha
 e7Bhwr2bRRl5tq9foVWsQvG2obQ/CwnooRIYW/iSiYXNA5jsXHXyPQ+H0mGiEQRCi9
 96+n6Fz/BRfAomtrb79do4CW/0qCfTUrRVVZxrYQ=
Authentication-Results: iva8-99b070b76c56.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, philmd@linaro.org, vsementsov@yandex-team.ru,
 den-plotnikov@yandex-team.ru, antonkuchin@yandex-team.ru
Subject: [PATCH v5 00/18] pci hotplug tracking
Date: Thu, 16 Feb 2023 21:03:38 +0300
Message-Id: <20230216180356.156832-1-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
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

v5: - don't deprecate IDs and return to ID & QOM scheme
    - split complicated HOTPLUG_STATE patch into several ones

----

The main patches are the last four ones:

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

Vladimir Sementsov-Ogievskiy (18):
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
  qapi/qdev.json: unite DEVICE_* event data into single structure
  qapi: add HOTPLUG_STATE infrastructure
  shpc: implement HOTPLUG_STATE event and query-hotplug
  pcie: implement HOTPLUG_STATE event and query-hotplug
  qapi: introduce DEVICE_ON event

 qapi/qdev.json                  | 224 ++++++++++++++++++++++++++++++--
 include/hw/hotplug.h            |  12 ++
 include/hw/pci/pci.h            |   1 +
 include/hw/pci/pci_bridge.h     |   2 +
 include/hw/pci/pcie.h           |  10 +-
 include/hw/pci/pcie_regs.h      |  14 --
 include/hw/pci/shpc.h           |   2 +
 include/monitor/qdev.h          |   7 +
 hw/core/hotplug.c               |  13 ++
 hw/pci-bridge/pci_bridge_dev.c  |  14 ++
 hw/pci-bridge/pcie_pci_bridge.c |   1 +
 hw/pci/pci.c                    |  33 +++++
 hw/pci/pcie.c                   | 122 +++++++++++++++--
 hw/pci/pcie_port.c              |   1 +
 hw/pci/shpc.c                   | 214 ++++++++++++++++++++++--------
 softmmu/qdev-monitor.c          |  67 ++++++++++
 16 files changed, 639 insertions(+), 98 deletions(-)

-- 
2.34.1


