Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B075E63A26E
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 09:03:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozZ5o-0005HO-TF; Mon, 28 Nov 2022 03:02:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ozZ5g-0005Gm-9V
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 03:02:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ozZ5e-0008Hk-Ot
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 03:02:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669622530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TAZQFuFPtwNyvs6C//QyV4Pp5i8gBNTCYFTaoMys/r0=;
 b=hgggIhHhGAyyHID8pBG0fO+jQ/B057Kffa5WHcAlZYmXnfeUlB+8S9oGO6bTUtfVd7myjO
 vRyk52WEPsPGfSp/HGSg3supXF0ZJeDR26ALGIUNgvcKJyYzQOxX/qb3VKjF5JWtXwmYM5
 u7HJp+Sk62p7x3emSfNEgw5Zuo8Qjfw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-541-RRtS27BVNkeW3ZKlFLRXLQ-1; Mon, 28 Nov 2022 03:02:06 -0500
X-MC-Unique: RRtS27BVNkeW3ZKlFLRXLQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 281BA3C3C166;
 Mon, 28 Nov 2022 08:02:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D0FA2112132C;
 Mon, 28 Nov 2022 08:02:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 88F5721E6921; Mon, 28 Nov 2022 09:02:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	marcel.apfelbaum@gmail.com,
	dgilbert@redhat.com
Subject: [PATCH 00/12] pci: Move and clean up monitor command code
Date: Mon, 28 Nov 2022 09:01:50 +0100
Message-Id: <20221128080202.2570543-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

This is mainly about splitting off monitor-related code.  There's also
a few UI fixes to HMP command pcie_aer_inject_error.  One UI issue
remains: when the second argument is symbolic (found in table
pcie_aer_error_list[]), then any -c is silently ignored.  Should it be
rejected?  Should it override the value from the table?

Markus Armbruster (12):
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

 hw/pci/pci-internal.h   |  25 +++++
 include/monitor/hmp.h   |   1 +
 include/sysemu/sysemu.h |   3 -
 hw/pci/pci-hmp-cmds.c   | 234 ++++++++++++++++++++++++++++++++++++++++
 hw/pci/pci-qmp-cmds.c   | 201 ++++++++++++++++++++++++++++++++++
 hw/pci/pci-stub.c       |   9 +-
 hw/pci/pci.c            | 226 +-------------------------------------
 hw/pci/pcie_aer.c       | 113 +------------------
 monitor/hmp-cmds.c      | 107 ------------------
 hw/pci/meson.build      |   2 +
 10 files changed, 476 insertions(+), 445 deletions(-)
 create mode 100644 hw/pci/pci-internal.h
 create mode 100644 hw/pci/pci-hmp-cmds.c
 create mode 100644 hw/pci/pci-qmp-cmds.c

-- 
2.37.3


