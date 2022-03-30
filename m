Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDE94EC981
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 18:17:55 +0200 (CEST)
Received: from localhost ([::1]:41412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZb18-0005AG-6W
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 12:17:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nZavm-0001wM-J7
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 12:12:22 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:43260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nZavj-00015R-Ff
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 12:12:22 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id C160420780;
 Wed, 30 Mar 2022 16:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1648656736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=5FQs+8RM0htBQoHgvDqKOmP0UqWMALtkt95KG3gCUpY=;
 b=lXYm8eo0tEEAiohWuDetXg3D2X/dmCAi6bTarM7imAZNkz4GR582yLA5xcgDNhgv9LYinP
 GluLHe99z5PtsV6tKgtNm9evQg3AS9GDuYwBQHYP1uAZTW7fnc8Rcn+TyweT9dRYLXXQUf
 o4KQ/vlzoF7l2hjfXr2DAgh1w5QQ5Ys=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] Generalize the sysbus device machine allowance
Date: Wed, 30 Mar 2022 18:12:10 +0200
Message-Id: <20220330161215.235231-1-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

This series transforms the TYPE_SYSBUS_DEVICE allowed list that exists
in machine class model into a TYPE_DEVICE allowed list.

This will allow to add non-sysbus device into this list to prevent
the user to create them on most machines.
Typical use case will be for example cpu related devices like
these developed in the following series:
https://lore.kernel.org/qemu-devel/20220330125639.201937-1-damien.hedde@greensocs.com/

Thanks,
--
Damien

Damien Hedde (5):
  qdev: add uc_requires_machine_allowance flag
  machine: update machine allowed list related functions/fields
  qdev-monitor: use the newly uc_requires_machine_allowance
  rename machine_class_allow_dynamic_sysbus_dev
  machine: remove temporary inline functions

 include/hw/boards.h         | 40 ++++++++++++++++++-------------------
 include/hw/qdev-core.h      |  6 ++++++
 hw/arm/virt.c               | 10 +++++-----
 hw/core/machine.c           | 10 +++++-----
 hw/core/qdev.c              |  1 +
 hw/core/sysbus.c            |  1 +
 hw/i386/microvm.c           |  2 +-
 hw/i386/pc_piix.c           |  4 ++--
 hw/i386/pc_q35.c            |  8 ++++----
 hw/ppc/e500plat.c           |  2 +-
 hw/ppc/spapr.c              |  2 +-
 hw/riscv/virt.c             |  2 +-
 hw/xen/xen-legacy-backend.c |  2 +-
 softmmu/qdev-monitor.c      |  8 ++++----
 14 files changed, 53 insertions(+), 45 deletions(-)

-- 
2.35.1


