Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9CE207BFD
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 21:06:10 +0200 (CEST)
Received: from localhost ([::1]:57172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joAin-0001QC-8N
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 15:06:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1joAcg-0001tC-4A
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 14:59:50 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:22181
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1joAce-0004JV-Dq
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 14:59:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593025187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=aOr+KsfQLpLNaAsxr9ByNdgCOAJFOi6nmYS6M/ViSSQ=;
 b=fUrhu2/7Y3dURhVBR9H8htXvGfyp26kLuM9s/cOOSf9yq67Ty88/hXZ78n7DZVk7pAkj1o
 eyVlGj/y2SIu3jly0H3lxYkgp89Eqy0tgXswBCAoHxzyddta+HODqhxWZ6zVfc0khhFFJ9
 +5aZ8ferEvb2aI4ntNmrci4VeJDPSAs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-5-XjtsI1NVe4hRign-IlvQ-1; Wed, 24 Jun 2020 14:57:40 -0400
X-MC-Unique: 5-XjtsI1NVe4hRign-IlvQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34EBC800D5C;
 Wed, 24 Jun 2020 18:57:39 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.74.8.251])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F2D5D79303;
 Wed, 24 Jun 2020 18:57:26 +0000 (UTC)
From: P J P <ppandit@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 0/9] memory: assert and define MemoryRegionOps callbacks
Date: Thu, 25 Jun 2020 00:25:14 +0530
Message-Id: <20200624185523.762240-1-ppandit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 00:34:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Prasad J Pandit <pjp@fedoraproject.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Lei Sun <slei.casper@gmail.com>, Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Prasad J Pandit <pjp@fedoraproject.org>

Hello,

* This series asserts that MemoryRegionOps objects define read/write
  callback methods. Thus avoids potential NULL pointer dereference.
  ex. -> https://git.qemu.org/?p=qemu.git;a=commit;h=bb15013ef34617eb1344f5276292cadd326c21b2

* Also adds various undefined MemoryRegionOps read/write functions
  to avoid potential assert failure.

Thank you.
--
Prasad J Pandit (9):
  hw/pci-host: add pci-intack write method
  pci-host: add pcie-msi read method
  vfio: add quirk device write method
  prep: add ppc-parity write method
  nvram: add nrf51_soc flash read method
  spapr_pci: add spapr msi read method
  tz-ppc: add dummy read/write methods
  imx7-ccm: add digprog mmio write method
  memory: assert MemoryRegionOps callbacks are defined

 hw/misc/imx7_ccm.c       |  7 +++++++
 hw/misc/tz-ppc.c         | 15 +++++++++++++++
 hw/nvram/nrf51_nvm.c     |  8 ++++++++
 hw/pci-host/designware.c |  9 +++++++++
 hw/pci-host/prep.c       |  8 ++++++++
 hw/ppc/prep_systemio.c   |  8 ++++++++
 hw/ppc/spapr_pci.c       | 13 +++++++++++--
 hw/vfio/pci-quirks.c     |  8 ++++++++
 memory.c                 | 10 +++++++++-
 9 files changed, 83 insertions(+), 3 deletions(-)

-- 
2.26.2


