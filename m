Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A360ADC93D
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 17:45:20 +0200 (CEST)
Received: from localhost ([::1]:42134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLURL-0001uk-Ab
	for lists+qemu-devel@lfdr.de; Fri, 18 Oct 2019 11:45:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44115)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iLUOc-0008CD-K7
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 11:42:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iLUOb-0006AJ-Cp
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 11:42:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47250)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iLUOX-00066Q-Pc; Fri, 18 Oct 2019 11:42:25 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F1EA430B1B72;
 Fri, 18 Oct 2019 15:42:20 +0000 (UTC)
Received: from localhost (ovpn-112-40.ams2.redhat.com [10.36.112.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1BD4658B9;
 Fri, 18 Oct 2019 15:42:13 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/14] Clean-ups: remove QDEV_PROP_PTR
Date: Fri, 18 Oct 2019 17:41:58 +0200
Message-Id: <20191018154212.13458-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Fri, 18 Oct 2019 15:42:24 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm@nongnu.org,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

QDEV_PROP_PTR is marked in multiple places as "FIXME/TODO/remove
me". In most cases, it can be easily replaced with QDEV_PROP_LINK when
the pointer points to an Object.

There are a few places where such substitution isn't possible. For
those places, it seems reasonable to use a specific setter method
instead, and keep the user_creatable =3D false. It is the case for OMAP
clocks, and smbus-eeprom initial data pointer. Improving that
situation is left for a future improvement.

Marc-Andr=C3=A9 Lureau (14):
  sm501: replace PROP_PTR with PROP_LINK
  vmmouse: replace PROP_PTR with PROP_LINK
  lance: replace PROP_PTR with PROP_LINK
  etraxfs: remove PROP_PTR usage
  dp8393x: replace PROP_PTR with PROP_LINK
  leon3: replace PROP_PTR with PROP_LINK
  RFC: mips/cps: fix setting saar property
  cris: replace PROP_PTR with PROP_LINK for interrupt vector
  smbus-eeprom: remove PROP_PTR
  omap-intc: remove PROP_PTR
  omap-i2c: remove PROP_PTR
  omap-gpio: remove PROP_PTR
  qdev: remove PROP_MEMORY_REGION
  Remove QDEV_PROP_PTR

 hw/arm/omap1.c               |  8 +++----
 hw/arm/omap2.c               | 25 ++++++++++-----------
 hw/core/qdev-properties.c    | 18 ----------------
 hw/cris/axis_dev88.c         |  4 +---
 hw/display/sm501.c           |  5 +++--
 hw/dma/sparc32_dma.c         |  2 +-
 hw/gpio/omap_gpio.c          | 42 +++++++++++++-----------------------
 hw/i2c/omap_i2c.c            | 19 ++++++++++------
 hw/i2c/smbus_eeprom.c        | 17 +++++++--------
 hw/i386/pc.c                 |  6 +++---
 hw/i386/vmmouse.c            |  8 +++----
 hw/input/pckbd.c             |  8 +++----
 hw/intc/Makefile.objs        |  2 +-
 hw/intc/etraxfs_pic.c        | 18 ++++++----------
 hw/intc/grlib_irqmp.c        | 20 ++++++-----------
 hw/intc/omap_intc.c          | 17 +++++++++------
 hw/mips/cps.c                |  2 +-
 hw/mips/mips_jazz.c          |  3 ++-
 hw/net/dp8393x.c             |  7 +++---
 hw/net/etraxfs_eth.c         | 35 ++++++++++++++++++++----------
 hw/net/lance.c               |  5 ++---
 hw/net/pcnet-pci.c           |  2 +-
 hw/net/pcnet.h               |  2 +-
 hw/sh4/r2d.c                 |  3 ++-
 hw/sparc/leon3.c             |  7 +++---
 include/hw/arm/omap.h        | 36 +++++++++++++++++++++++++++++++
 include/hw/cris/etraxfs.h    | 20 +++--------------
 include/hw/input/i8042.h     |  4 +++-
 include/hw/qdev-properties.h | 24 ---------------------
 target/sparc/cpu.h           |  1 +
 30 files changed, 172 insertions(+), 198 deletions(-)

--=20
2.23.0.606.g08da6496b6


