Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3054533DADA
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 18:23:45 +0100 (CET)
Received: from localhost ([::1]:53872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMDQ0-0005Y2-4g
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 13:23:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lMD8q-0002lr-OJ
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:06:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lMD8n-00058S-5h
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:06:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615914355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xXfiGgRWp5hH62evdyhqwcgSGgb/JeI+kXnL5adrLbw=;
 b=bs7dRlm7W60B8wtmcVVaisKPp0bPSmtaQQ9ZSOyNkcpYMxn+g8m9QkM+nwIc9NBxOhNIKj
 BeDclf86+P+dh+xpP8bH+wEpxx+LMEy+vEOYIf6N0QW/iH97GXynJLQ5FAt0ZE5E46pYAb
 Xo6ZUFTKZZmc/RKnI4YQApXiU1VRTxY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-gL-NGnM9NjGleKO7QokqhA-1; Tue, 16 Mar 2021 13:05:53 -0400
X-MC-Unique: gL-NGnM9NjGleKO7QokqhA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA6B9801596;
 Tue, 16 Mar 2021 17:05:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C0315C261;
 Tue, 16 Mar 2021 17:05:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 187EC1132C12; Tue, 16 Mar 2021 18:05:51 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/11] QOM and fdc patches patches for 2021-03-16
Date: Tue, 16 Mar 2021 18:05:40 +0100
Message-Id: <20210316170551.3911643-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

The following changes since commit 6e31b3a5c34c6e5be7ef60773e607f189eaa15f3:

  Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' into staging (2021-03-16 10:53:47 +0000)

are available in the Git repository at:

  git://repo.or.cz/qemu/armbru.git tags/pull-qom-fdc-2021-03-16

for you to fetch changes up to 901c36b68c327c5a4e4b3701cd991dd927ac07ae:

  memory: Drop "qemu:" prefix from QOM memory region type names (2021-03-16 15:52:26 +0100)

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
 docs/system/removed-features.rst             |  56 +++
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
 34 files changed, 124 insertions(+), 761 deletions(-)

-- 
2.26.2


