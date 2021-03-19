Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E8B34161D
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 07:47:31 +0100 (CET)
Received: from localhost ([::1]:50854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lN8uw-0006XG-EI
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 02:47:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lN8sx-0005tz-OL
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 02:45:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lN8su-0005NF-Ik
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 02:45:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616136323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XrRw3YEvFNgrYq6r8AO10GXOJzBSEzIOnb3BeIPkQAU=;
 b=ZyEiugnaDFM25VdQ2A7Pce3mob0Tqq4MapeImAKzlcrAT2iJ9Ozv1frbfNvEjINsdE0Q0F
 AG2h4JsoVBrN2HcgladsHhTNr2GsA4AyjMSIx3/OdhDmqgaBhhfHRU3lGryzgHkyG7qNfJ
 W9F47pW/pZrQYn3fidxXxdj8pnus+PQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-USwrLjs4Pne_cl3dXCUOMQ-1; Fri, 19 Mar 2021 02:45:21 -0400
X-MC-Unique: USwrLjs4Pne_cl3dXCUOMQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CCA741084C8C;
 Fri, 19 Mar 2021 06:45:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 878751000358;
 Fri, 19 Mar 2021 06:45:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0230711386A7; Fri, 19 Mar 2021 07:45:17 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 0/6] QOM and fdc patches patches for 2021-03-16
Date: Fri, 19 Mar 2021 07:45:17 +0100
Message-Id: <20210319064517.1496467-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 8a40754bca14df63c6d2ffe473b68a270dc50679:

  Merge remote-tracking branch 'remotes/nvme/tags/nvme-next-pull-request' into staging (2021-03-18 19:55:37 +0000)

are available in the Git repository at:

  git://repo.or.cz/qemu/armbru.git tags/pull-qom-fdc-2021-03-16-v4

for you to fetch changes up to 0c727a621a646504ccec2b08e55fd48030448466:

  memory: Drop "qemu:" prefix from QOM memory region type names (2021-03-19 06:55:49 +0100)

----------------------------------------------------------------
QOM and fdc patches patches for 2021-03-16

----------------------------------------------------------------
Markus Armbruster (6):
      docs/system/deprecated: Fix note on fdc drive properties
      fdc: Drop deprecated floppy configuration
      fdc: Inline fdctrl_connect_drives() into fdctrl_realize_common()
      blockdev: Drop deprecated bogus -drive interface type
      hw: Replace anti-social QOM type names
      memory: Drop "qemu:" prefix from QOM memory region type names

 docs/system/deprecated.rst                   |  33 --
 docs/system/removed-features.rst             |  57 +++
 include/exec/memory.h                        |   4 +-
 include/hw/arm/armv7m.h                      |   2 +-
 include/hw/arm/fsl-imx25.h                   |   2 +-
 include/hw/arm/fsl-imx31.h                   |   2 +-
 include/hw/arm/fsl-imx6.h                    |   2 +-
 include/hw/arm/fsl-imx6ul.h                  |   2 +-
 include/hw/arm/fsl-imx7.h                    |   2 +-
 include/hw/arm/xlnx-zynqmp.h                 |   2 +-
 include/hw/cris/etraxfs.h                    |   2 +-
 include/hw/i386/ich9.h                       |   2 +-
 include/hw/misc/grlib_ahb_apb_pnp.h          |   4 +-
 include/hw/misc/zynq-xadc.h                  |   2 +-
 include/hw/register.h                        |   2 +-
 include/hw/sparc/grlib.h                     |   6 +-
 include/sysemu/blockdev.h                    |   1 -
 blockdev.c                                   |  37 +-
 hw/arm/xilinx_zynq.c                         |   2 +-
 hw/audio/cs4231.c                            |   2 +-
 hw/block/fdc.c                               |  77 +---
 hw/char/etraxfs_ser.c                        |   2 +-
 hw/cris/axis_dev88.c                         |   6 +-
 hw/display/tcx.c                             |   2 +-
 hw/intc/etraxfs_pic.c                        |   2 +-
 hw/microblaze/xlnx-zynqmp-pmu.c              |   2 +-
 hw/misc/zynq_slcr.c                          |   2 +-
 hw/sparc/sun4m.c                             |  12 +-
 hw/timer/etraxfs_timer.c                     |   2 +-
 softmmu/vl.c                                 |  10 +-
 tests/qemu-iotests/172                       |  31 +-
 tests/qemu-iotests/172.out                   | 562 +--------------------------
 tests/vmstate-static-checker-data/dump1.json |   4 +-
 tests/vmstate-static-checker-data/dump2.json |   4 +-
 34 files changed, 125 insertions(+), 761 deletions(-)

-- 
2.26.3


