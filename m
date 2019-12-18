Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8561E124F0C
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 18:23:52 +0100 (CET)
Received: from localhost ([::1]:58096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihd39-0001cK-4w
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 12:23:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37417)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ihd0J-0007jE-Hz
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 12:20:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ihd0E-0008EM-Uk
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 12:20:53 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:52755
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ihd0E-00087U-BZ
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 12:20:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576689648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=D0xFFDti/vGXy58bqKD5OhN2HcF80Gcn3Awn01okJwQ=;
 b=h0pbIGqTxGsgtmt4ecsrpd1B8OMbBMqREV9c3HlIn36nVrOKEZ3MNxtBGGFr9zROA0jAZr
 2/rUtolHRGpoNWhHOVyEku+HeccAj3p2pVOl904ImSyoqUmM8QK8Jl7IWBaScpIRSz4yOr
 7roWaRqUHC9543GyW9GUjcDnyc9zpP0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-t7rIPLpnM5O-B_mxO9_VMA-1; Wed, 18 Dec 2019 12:20:46 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F06DDC21;
 Wed, 18 Dec 2019 17:20:42 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-116-235.ams2.redhat.com [10.36.116.235])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B7F94100EBA4;
 Wed, 18 Dec 2019 17:20:15 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/14] chardev: Use QEMUChrEvent enum in IOEventHandler
 typedef
Date: Wed, 18 Dec 2019 18:19:55 +0100
Message-Id: <20191218172009.8868-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: t7rIPLpnM5O-B_mxO9_VMA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paul Burton <pburton@wavecomp.com>, Alberto Garcia <berto@igalia.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, qemu-block@nongnu.org,
 Zhang Chen <chen.zhang@intel.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>, Joel Stanley <joel@jms.id.au>,
 Laurent Vivier <lvivier@redhat.com>, Corey Minyard <minyard@acm.org>,
 Amit Shah <amit@kernel.org>, Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, qemu-riscv@nongnu.org,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>, Michael Walle <michael@walle.cc>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

After this chat on #qemu IRC:
13:20 <stsquad> so what is the difference between a IOReadHandler and IOEve=
ntHandler?
13:25 <f4bug> stsquad: one is in-band and the other out-of-band?
13:26 <stsquad> f4bug: ahh yes it seems so - connect/disconnect etc...
13:27 <f4bug> see QEMUChrEvent for IOEventHandler

I thought it might be a good opportunity to make the IOEventHandler
typedef meaning more obvious, by using the QEMUChrEvent enum.

To be able to build I had to explicit all enums ignored in the
switch(event) statement by these frontends.

Then I used a coccinelle spatch to change the various IOEventHandler.
I don't think the last patch can be split, but suggestions are welcome!

Regards,

Phil.

v2:
- do blindly ignore all events using a 'default' case.

Philippe Mathieu-Daud=C3=A9 (14):
  hw/ipmi: Remove unnecessary declarations
  hw/ipmi: Explicit we ignore some QEMUChrEvent in IOEventHandler
  hw/char/terminal3270: Explicit ignored QEMUChrEvent in IOEventHandler
  hw/usb/dev-serial: Explicit we ignore few QEMUChrEvent in IOEventHandler
  hw/usb/redirect: Explicit we ignore few QEMUChrEvent in IOEventHandler
  ccid-card-passthru: Explicit we ignore QEMUChrEvent in IOEventHandler
  vhost-user-crypto: Explicit we ignore some QEMUChrEvent in IOEventHandler
  vhost-user-net: Explicit we ignore few QEMUChrEvent in IOEventHandler
  vhost-user-blk: Explicit we ignore few QEMUChrEvent in IOEventHandler
  virtio-console: Explicit we ignore some QEMUChrEvent in IOEventHandler
  monitor/qmp: Explicit we ignore few QEMUChrEvent in IOEventHandler
  monitor/hmp: Explicit we ignore a QEMUChrEvent in IOEventHandler
  chardev/char: Explicit we ignore some QEMUChrEvent in IOEventHandler
  chardev: Use QEMUChrEvent enum in IOEventHandler typedef

 include/chardev/char-fe.h       |  2 +-
 include/chardev/char-mux.h      |  2 +-
 include/chardev/char.h          |  4 ++--
 backends/cryptodev-vhost-user.c |  7 ++++++-
 chardev/char-mux.c              |  8 ++++----
 chardev/char.c                  |  9 +++++++--
 gdbstub.c                       |  2 +-
 hw/arm/pxa2xx.c                 |  2 +-
 hw/arm/strongarm.c              |  2 +-
 hw/block/vhost-user-blk.c       |  7 ++++++-
 hw/char/cadence_uart.c          |  2 +-
 hw/char/digic-uart.c            |  2 +-
 hw/char/escc.c                  |  2 +-
 hw/char/etraxfs_ser.c           |  2 +-
 hw/char/exynos4210_uart.c       |  2 +-
 hw/char/grlib_apbuart.c         |  2 +-
 hw/char/imx_serial.c            |  2 +-
 hw/char/ipoctal232.c            |  2 +-
 hw/char/lm32_juart.c            |  2 +-
 hw/char/lm32_uart.c             |  2 +-
 hw/char/mcf_uart.c              |  2 +-
 hw/char/milkymist-uart.c        |  2 +-
 hw/char/nrf51_uart.c            |  2 +-
 hw/char/pl011.c                 |  2 +-
 hw/char/serial.c                |  2 +-
 hw/char/sh_serial.c             |  2 +-
 hw/char/terminal3270.c          |  7 ++++++-
 hw/char/virtio-console.c        |  7 ++++++-
 hw/char/xilinx_uartlite.c       |  2 +-
 hw/ipmi/ipmi_bmc_extern.c       | 12 +++++++-----
 hw/mips/boston.c                |  2 +-
 hw/mips/mips_malta.c            |  2 +-
 hw/riscv/riscv_htif.c           |  2 +-
 hw/riscv/sifive_uart.c          |  2 +-
 hw/usb/ccid-card-passthru.c     |  7 ++++++-
 hw/usb/dev-serial.c             |  6 +++++-
 hw/usb/redirect.c               |  7 ++++++-
 monitor/hmp.c                   |  6 +++++-
 monitor/qmp.c                   |  7 ++++++-
 net/filter-mirror.c             |  2 +-
 net/vhost-user.c                |  9 +++++++--
 qtest.c                         |  2 +-
 tests/test-char.c               |  6 +++---
 tests/vhost-user-test.c         |  2 +-
 44 files changed, 111 insertions(+), 56 deletions(-)

Cc: "Gonglei (Arei)" <arei.gonglei@huawei.com>
Cc: "Marc-Andr=C3=A9 Lureau" <marcandre.lureau@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Alex Benn=C3=A9e" <alex.bennee@linaro.org>
Cc: "Philippe Mathieu-Daud=C3=A9" <philmd@redhat.com>
Cc: Andrzej Zaborowski <balrogg@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Max Reitz <mreitz@redhat.com>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Alistair Francis <alistair@alistair23.me>
Cc: Antony Pavlov <antonynpavlov@gmail.com>
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>
Cc: Fabien Chouteau <chouteau@adacore.com>
Cc: KONRAD Frederic <frederic.konrad@adacore.com>
Cc: Peter Chubb <peter.chubb@nicta.com.au>
Cc: Alberto Garcia <berto@igalia.com>
Cc: Michael Walle <michael@walle.cc>
Cc: Thomas Huth <huth@tuxfamily.org>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Laurent Vivier <lvivier@redhat.com>
Cc: Amit Shah <amit@kernel.org>
Cc: Corey Minyard <minyard@acm.org>
Cc: Paul Burton <pburton@wavecomp.com>
Cc: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: Aleksandar Markovic <amarkovic@wavecomp.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Zhang Chen <chen.zhang@intel.com>
Cc: Li Zhijian <lizhijian@cn.fujitsu.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: qemu-arm@nongnu.org
Cc: qemu-block@nongnu.org
Cc: qemu-s390x@nongnu.org
Cc: qemu-riscv@nongnu.org

--=20
2.21.0


