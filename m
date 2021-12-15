Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A69475A4F
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 15:07:43 +0100 (CET)
Received: from localhost ([::1]:44758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxUwY-0004QA-5e
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 09:07:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mxUrZ-0000ob-Qa
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 09:02:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mxUrT-0001Rb-Es
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 09:02:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639576946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Js92v9nhcn0A039TeYzZywEDlOcBF39tHZpP44A/jrU=;
 b=WHL1K73pQhpZT0bL3B3fDXUCtL1G6HrTkSgxROLOqWgSyu6RjgXBN4M8DMQLYKkVsbFlaZ
 rpaMC8REGzGPvdufYLql7t2ZvxAd1QdsWkdgg2eNBXEGXWEhSK4XtXnOBk+nnUWnocK9dQ
 siDSPitwPeuOvc/xtDWmvLmY40uoLKs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-184--CTFbndZMGC_uS_ip2VoUQ-1; Wed, 15 Dec 2021 09:02:25 -0500
X-MC-Unique: -CTFbndZMGC_uS_ip2VoUQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1FE542F31;
 Wed, 15 Dec 2021 14:02:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-2.ams2.redhat.com [10.36.112.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D24965E486;
 Wed, 15 Dec 2021 14:02:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 47CA7113865F; Wed, 15 Dec 2021 15:02:22 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/13] Block device patches patches for 2021-12-15
Date: Wed, 15 Dec 2021 15:02:09 +0100
Message-Id: <20211215140222.769652-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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
Cc: richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 76b56fdfc9fa43ec6e5986aee33f108c6c6a511e:

  Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2021-12-14 12:46:18 -0800)

are available in the Git repository at:

  git://repo.or.cz/qemu/armbru.git tags/pull-block-2021-12-15

for you to fetch changes up to 95fd260f0a3663ed229b8e0d2ef111a9f8bd93ad:

  blockdev: Drop unused drive_get_next() (2021-12-15 14:56:14 +0100)

----------------------------------------------------------------
Block device patches patches for 2021-12-15

----------------------------------------------------------------
Markus Armbruster (13):
      hw/sd/ssi-sd: Do not create SD card within controller's realize
      hw: Replace trivial drive_get_next() by drive_get()
      hw/arm/npcm7xx_boards: Replace drive_get_next() by drive_get()
      hw/arm/versatilepb hw/arm/vexpress: Replace drive_get_next() by drive_get()
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
 hw/misc/sifive_u_otp.c              |  4 ++--
 hw/riscv/microchip_pfsoc.c          |  2 +-
 hw/riscv/sifive_u.c                 | 15 +++++++++++++--
 hw/sd/ssi-sd.c                      | 29 +----------------------------
 hw/sparc64/niagara.c                |  2 +-
 26 files changed, 78 insertions(+), 84 deletions(-)

-- 
2.31.1


