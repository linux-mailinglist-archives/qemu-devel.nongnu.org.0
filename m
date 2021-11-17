Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1EC454B16
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 17:37:12 +0100 (CET)
Received: from localhost ([::1]:33854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnNvr-0007DJ-3E
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 11:37:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mnNtF-0003Od-PT
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:34:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mnNt9-00088b-TL
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:34:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637166861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=X96q9n+sZpTtoPm5jSUiHim0WQZTmGjmtwZn3wXnHCE=;
 b=OxhLx1fXihO3csdH3n2pLcQCmnTPaSTUWp3Pdg/XLrK2YG97I//3H/S31URgqlgbtf/0vS
 juoCEN4KdWiuYjTe0np642Cy7LZ2UatuyDe9aj/2p7BMzikNvrj42y1Kfomk7Wz9+mD9yi
 jF0KUvpJ1MUhEU2zRZevJP3t358vPVQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-F82ui1WmM0SpT7m4evLsrA-1; Wed, 17 Nov 2021 11:34:18 -0500
X-MC-Unique: F82ui1WmM0SpT7m4evLsrA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35A34804141;
 Wed, 17 Nov 2021 16:34:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 054E55C1D5;
 Wed, 17 Nov 2021 16:34:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 73E6711380A7; Wed, 17 Nov 2021 17:34:09 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/13] Eliminate drive_get_next()
Date: Wed, 17 Nov 2021 17:33:56 +0100
Message-Id: <20211117163409.3587705-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

drive_get_next() is basically a bad idea.  It returns the "next" block
backend of a certain interface type.  "Next" means bus=0,unit=N, where
subsequent calls count N up from zero, per interface type.

This lets you define unit numbers implicitly by execution order.  If
the order changes, or new calls appear "in the middle", unit numbers
change.  ABI break.  Hard to spot in review.  Replace its uses by
drive_get(), then delete it.

Markus Armbruster (13):
  hw/sd/ssi-sd: Do not create SD card within controller's realize
  hw: Replace trivial drive_get_next() by drive_get()
  hw/arm/npcm7xx_boards: Replace drive_get_next() by drive_get()
  hw/arm/versatilepb hw/arm/vexpress: Replace drive_get_next() by
    drive_get()
  hw/arm/imx25_pdk: Replace drive_get_next() by drive_get()
  hw/arm/mcimx6ul-evk: Replace drive_get_next() by drive_get()
  hw/arm/mcimx7d-sabre: Replace drive_get_next() by drive_get()
  hw/arm/xlnx-versal-virt: Replace drive_get_next() by drive_get()
  hw/microblaze: Replace drive_get_next() by drive_get()
  hw/arm/xlnx-zcu102: Replace drive_get_next() by drive_get()
  hw/arm/xilinx_zynq: Replace drive_get_next() by drive_get()
  hw/arm/aspeed: Replace drive_get_next() by drive_get()
  blockdev: Drop unused drive_get_next()

 include/sysemu/blockdev.h           |  1 -
 blockdev.c                          | 10 ----------
 hw/arm/aspeed.c                     | 21 +++++++++++++--------
 hw/arm/cubieboard.c                 |  2 +-
 hw/arm/imx25_pdk.c                  |  2 +-
 hw/arm/integratorcp.c               |  2 +-
 hw/arm/mcimx6ul-evk.c               |  2 +-
 hw/arm/mcimx7d-sabre.c              |  2 +-
 hw/arm/msf2-som.c                   |  2 +-
 hw/arm/npcm7xx_boards.c             |  6 +++---
 hw/arm/orangepi.c                   |  2 +-
 hw/arm/raspi.c                      |  2 +-
 hw/arm/realview.c                   |  2 +-
 hw/arm/sabrelite.c                  |  2 +-
 hw/arm/stellaris.c                  | 15 ++++++++++++++-
 hw/arm/versatilepb.c                |  4 ++--
 hw/arm/vexpress.c                   |  6 +++---
 hw/arm/xilinx_zynq.c                | 16 +++++++++-------
 hw/arm/xlnx-versal-virt.c           |  3 ++-
 hw/arm/xlnx-zcu102.c                |  6 +++---
 hw/microblaze/petalogix_ml605_mmu.c |  2 +-
 hw/misc/sifive_u_otp.c              |  2 +-
 hw/riscv/microchip_pfsoc.c          |  2 +-
 hw/riscv/sifive_u.c                 | 15 +++++++++++++--
 hw/sd/ssi-sd.c                      | 29 +----------------------------
 hw/sparc64/niagara.c                |  2 +-
 26 files changed, 77 insertions(+), 83 deletions(-)

-- 
2.31.1


