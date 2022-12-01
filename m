Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B4463F06F
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 13:26:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0iPp-0004Ef-VE; Thu, 01 Dec 2022 07:11:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0iPo-0004EK-G6
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 07:11:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0iPl-0008D9-SE
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 07:11:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669896700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=s+r0099d/pO2fi5L5YyMTfZYnO/7OZnaAuqlxjLj/zs=;
 b=T3n/jDVzhMrnKB2a9kp90yK6dpnQAO27hlLeX064XnpksH5L0rYlw4icZKo++VupvwjSZA
 LryySddOUvWZ7fQrBdGiFwtL/jaePO8ToQh666gqOl59D1z2Vl0PVNCD8Lxw6iGNafIuBS
 1JY9g2rf7fKtZT78dAC6VCyRJHnxXSE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-113-B_-JBPyyNfWEIfBGEIbefg-1; Thu, 01 Dec 2022 07:11:37 -0500
X-MC-Unique: B_-JBPyyNfWEIfBGEIbefg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F32B833AEF;
 Thu,  1 Dec 2022 12:11:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 317A61121314;
 Thu,  1 Dec 2022 12:11:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DB21E21E6921; Thu,  1 Dec 2022 13:11:33 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, marcel.apfelbaum@gmail.com, dgilbert@redhat.com,
 philmd@linaro.org
Subject: [PATCH v2 00/13] pci: Move and clean up monitor command code
Date: Thu,  1 Dec 2022 13:11:20 +0100
Message-Id: <20221201121133.3813857-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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

This is mainly about splitting off monitor-related code.  There's also
a few UI fixes to HMP command pcie_aer_inject_error.

v2:
* PATCH 08: Use qemu_strtoui() [David], commit message corrected
* PATCH 13: New

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
 hw/pci/pci-hmp-cmds.c   | 238 ++++++++++++++++++++++++++++++++++++++++
 hw/pci/pci-qmp-cmds.c   | 201 +++++++++++++++++++++++++++++++++
 hw/pci/pci-stub.c       |   9 +-
 hw/pci/pci.c            | 226 +-------------------------------------
 hw/pci/pcie_aer.c       | 113 +------------------
 monitor/hmp-cmds.c      | 107 ------------------
 hw/pci/meson.build      |   2 +
 10 files changed, 480 insertions(+), 445 deletions(-)
 create mode 100644 hw/pci/pci-internal.h
 create mode 100644 hw/pci/pci-hmp-cmds.c
 create mode 100644 hw/pci/pci-qmp-cmds.c

-- 
2.37.3


