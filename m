Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B58DF6EA85E
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 12:33:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppo4C-0007Zk-9K; Fri, 21 Apr 2023 06:32:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ppo46-0007OI-3X
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 06:32:30 -0400
Received: from forwardcorp1b.mail.yandex.net
 ([2a02:6b8:c02:900:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ppo44-0005QD-59
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 06:32:29 -0400
Received: from mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:7f29:0:640:9a2b:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id A44CB615C8;
 Fri, 21 Apr 2023 13:32:20 +0300 (MSK)
Received: from vsementsov-nix.yandex.net (unknown [2a02:6b8:b081:8816::1:4])
 by mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id 8WcxnS1Op4Y0-aPF94qur; Fri, 21 Apr 2023 13:32:19 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682073139; bh=YJ3dLVcAoNy9Wi1GxtVELrXOe591Ox52736CCwLFR94=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=oSqNCO+5J5xOcBTIiXh2Xt7asEv06HeyDKbhDcC82mbzcAZjVF97YEqDD4IN563FM
 kT4aE7ZNxKIRI3mlpVRPjtL9PBVkp0r4fmPlZgTOvaOlATx9Fgeq2py4M6itVB5jDq
 e434Dp+kH+GGnR2iP/ht7hE08H5Sc8cHH1gCmJrA=
Authentication-Results: mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, vsementsov@yandex-team.ru, philmd@linaro.org,
 antonkuchin@yandex-team.ru, den-plotnikov@yandex-team.ru
Subject: [PATCH v7 0/4] pci hotplug tracking
Date: Fri, 21 Apr 2023 13:32:03 +0300
Message-Id: <20230421103207.845847-1-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c02:900:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi all!

Main thing this series does is DEVICE_ON event - a counter-part to
DEVICE_DELETED. A guest-driven event that device is powered-on.
Details are in patch 2.

v7: improve commit message of 02, change version to 8.1 in QAPI.

v6:
- preparation part merged to master
- drop HOTPLUG_STATE event for now. I'm not sure we need it, and anyway,
  it should be throttled as it may be triggered by guest at any rate.
  And if it is throttled:
  - we can't track real state changes, so probably reporting only
  changed fields is not enough.. Then the format of the event is under
  question.
  - we should implement throttling separately for different devices
  - we should improve throttling to support several events in a short
  time, still keeping small rate in larger periods, as guest tends to
  change some states sequentially in a short time.
  So, that's not easy:) Let's just drop it for now.
- force DEVICE_ON event to be triggered only once per device
- flatten query-hotplug output and add device-on status (corresponding
  to DEVICE_ON event)

Vladimir Sementsov-Ogievskiy (4):
  qapi/qdev.json: unite DEVICE_* event data into single structure
  qapi: add DEVICE_ON and query-hotplug infrastructure
  shpc: implement DEVICE_ON event and query-hotplug
  pcie: implement DEVICE_ON event and query-hotplug

 hw/core/hotplug.c               |  13 +++
 hw/pci-bridge/pci_bridge_dev.c  |  14 +++
 hw/pci-bridge/pcie_pci_bridge.c |   1 +
 hw/pci/pcie.c                   |  83 +++++++++++++++
 hw/pci/pcie_port.c              |   1 +
 hw/pci/shpc.c                   |  86 +++++++++++++++
 include/hw/hotplug.h            |  12 +++
 include/hw/pci/pci_bridge.h     |   2 +
 include/hw/pci/pcie.h           |   2 +
 include/hw/pci/shpc.h           |   2 +
 include/hw/qdev-core.h          |   1 +
 include/monitor/qdev.h          |   6 ++
 qapi/qdev.json                  | 183 +++++++++++++++++++++++++++++---
 softmmu/qdev-monitor.c          |  58 ++++++++++
 14 files changed, 452 insertions(+), 12 deletions(-)

-- 
2.34.1


