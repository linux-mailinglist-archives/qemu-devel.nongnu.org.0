Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD976AE5EC
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 17:07:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZZpB-0005Qp-LQ; Tue, 07 Mar 2023 11:06:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pZZp8-0005QR-K5
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:05:58 -0500
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pZZp6-0002SY-DQ
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:05:58 -0500
Received: from mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:5da4:0:640:ef2d:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 71DB65F64E;
 Tue,  7 Mar 2023 19:05:48 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:1223::1:36])
 by mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id d5eRk00OeKo0-RWJ0ugLR; Tue, 07 Mar 2023 19:05:47 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1678205147; bh=1x+ITN3gVl/QxMtt5POx1RDsZqNi3XqnkHL8N29Gt2Q=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=ugg0Uv58pJAl0HPgwULOCFyXMdb5Dic00x/Tyapqv0tZOaZP18GzsnlOVmsgC9ziM
 rE6PiIbEfCvi1yz3TbfEcVmlud16sJfMM/EtfxJy9mbrYZE55zPIh3CNS6FQnsPVnJ
 RzhIPaedUgNUCWNujNFbDfRFwiBM8FNRnASB1RG8=
Authentication-Results: mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, den-plotnikov@yandex-team.ru, antonkuchin@yandex-team.ru,
 vsementsov@yandex-team.ru, philmd@linaro.org
Subject: [PATCH v6 0/4] pci hotplug tracking
Date: Tue,  7 Mar 2023 19:05:33 +0300
Message-Id: <20230307160537.2261803-1-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

 qapi/qdev.json                  | 183 +++++++++++++++++++++++++++++---
 include/hw/hotplug.h            |  12 +++
 include/hw/pci/pci_bridge.h     |   2 +
 include/hw/pci/pcie.h           |   2 +
 include/hw/pci/shpc.h           |   2 +
 include/hw/qdev-core.h          |   1 +
 include/monitor/qdev.h          |   6 ++
 hw/core/hotplug.c               |  13 +++
 hw/pci-bridge/pci_bridge_dev.c  |  14 +++
 hw/pci-bridge/pcie_pci_bridge.c |   1 +
 hw/pci/pcie.c                   |  83 +++++++++++++++
 hw/pci/pcie_port.c              |   1 +
 hw/pci/shpc.c                   |  86 +++++++++++++++
 softmmu/qdev-monitor.c          |  58 ++++++++++
 14 files changed, 452 insertions(+), 12 deletions(-)

-- 
2.34.1


