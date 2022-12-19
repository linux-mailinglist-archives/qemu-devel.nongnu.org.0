Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 688CD650F64
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 16:54:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7IQW-0002hz-V2; Mon, 19 Dec 2022 10:51:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7IQJ-0002XY-0C
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 10:51:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7IQH-0000ZZ-6k
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 10:51:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671465084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FkqxzmbocBbQ7LPbMJis0iKkqXkaKfYVINFCiVt2BGo=;
 b=f0htghHX3T8fboDsv1KUcQQjTq+W3PwjZYqMgy4umXzBLisK7oUAUZ/l+SWp5nRr8UI+BN
 LHp771fwhpJNJBwJmBef3GvtfYeZo9i3c3cs7l1v9BbxhlzIrfAyzXyG1MuOGbsxMgN8WA
 517Wu8F4zWMZgMcQTzqFSQY6kftHLSk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-395-1anqH7A7MaOF2UCTlBQRsA-1; Mon, 19 Dec 2022 10:51:22 -0500
X-MC-Unique: 1anqH7A7MaOF2UCTlBQRsA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF5FA80234E;
 Mon, 19 Dec 2022 15:51:21 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 86D6D2166B26;
 Mon, 19 Dec 2022 15:51:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 53EA521E688F; Mon, 19 Dec 2022 16:51:20 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 00/13] Monitor patches for 2022-12-19
Date: Mon, 19 Dec 2022 16:51:07 +0100
Message-Id: <20221219155120.2273041-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

The following changes since commit 562d4af32ec2213061f844b3838223fd7711b56a:

  Merge tag 'pull-loongarch-20221215' of https://gitlab.com/gaosong/qemu into staging (2022-12-18 13:53:29 +0000)

are available in the Git repository at:

  https://repo.or.cz/qemu/armbru.git tags/pull-monitor-2022-12-19

for you to fetch changes up to e221cfac5935b0fea0989da9ef4ee5024777f23e:

  pci: Reject pcie_aer_inject_error -c with symbolic error status (2022-12-19 16:21:56 +0100)

----------------------------------------------------------------
Monitor patches for 2022-12-19

----------------------------------------------------------------
Markus Armbruster (13):
      pci: Clean up a few things checkpatch.pl would flag later on
      pci: Move QMP commands to new hw/pci/pci-qmp-cmds.c
      pci: Move HMP commands from monitor/ to new hw/pci/pci-hmp-cmds.c
      pci: Make query-pci stub consistent with the real one
      pci: Build hw/pci/pci-hmp-cmds.c only when CONFIG_PCI
      pci: Deduplicate get_class_desc()
      pci: Move pcibus_dev_print() to pci-hmp-cmds.c
      pci: Fix silent truncation of pcie_aer_inject_error argument
      pci: Move HMP command from hw/pci/pcie_aer.c to pci-hmp-cmds.c
      pci: Inline do_pcie_aer_inject_error() into its only caller
      pci: Rename hmp_pcie_aer_inject_error()'s local variable @err
      pci: Improve do_pcie_aer_inject_error()'s error messages
      pci: Reject pcie_aer_inject_error -c with symbolic error status

 hw/pci/pci-internal.h   |  25 +++++
 include/monitor/hmp.h   |   1 +
 include/sysemu/sysemu.h |   3 -
 hw/pci/pci-hmp-cmds.c   | 238 ++++++++++++++++++++++++++++++++++++++++++++++++
 hw/pci/pci-qmp-cmds.c   | 199 ++++++++++++++++++++++++++++++++++++++++
 hw/pci/pci-stub.c       |   9 +-
 hw/pci/pci.c            | 224 +--------------------------------------------
 hw/pci/pcie_aer.c       | 113 +----------------------
 monitor/hmp-cmds.c      | 107 ----------------------
 hw/pci/meson.build      |   2 +
 10 files changed, 478 insertions(+), 443 deletions(-)
 create mode 100644 hw/pci/pci-internal.h
 create mode 100644 hw/pci/pci-hmp-cmds.c
 create mode 100644 hw/pci/pci-qmp-cmds.c

-- 
2.37.3


