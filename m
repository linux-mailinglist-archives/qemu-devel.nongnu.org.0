Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DB61BDFE9
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Apr 2020 16:03:32 +0200 (CEST)
Received: from localhost ([::1]:33768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTnJC-0004Ze-SW
	for lists+qemu-devel@lfdr.de; Wed, 29 Apr 2020 10:03:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42374)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1jTnGW-0002E3-9G
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 10:01:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1jTnG9-0003q7-OP
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 10:00:44 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:37806
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jTnG9-0003nD-95
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 10:00:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588168820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Pil/b8MmaFxQICR//sKN7Pgx/oFCcB938Y3KC3rV6jE=;
 b=dL/U7vpjbwqRski01/4Lr0YN5HCZxs/El+gebVPHc8+3PzoJfiV7zeDgJ7HFNSBmlZIhM2
 06HiOil5dPTkUrH4DCQWHSCE36o+/kxochGVk9eTal58n4WxCo59YogBso27cJ869G0fvl
 UGP/wIhfdJifYD8fHkJD4h8RsOLpOlo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-QzlS1_TKNpeWSee6aRJ0CQ-1; Wed, 29 Apr 2020 10:00:17 -0400
X-MC-Unique: QzlS1_TKNpeWSee6aRJ0CQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5BC380B70B;
 Wed, 29 Apr 2020 14:00:15 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-193.ams2.redhat.com
 [10.36.113.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F64128554;
 Wed, 29 Apr 2020 14:00:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1EC641753B; Wed, 29 Apr 2020 16:00:03 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/15] acpi: i386 tweaks
Date: Wed, 29 Apr 2020 15:59:48 +0200
Message-Id: <20200429140003.7336-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/29 01:42:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

First batch of microvm patches, some generic acpi stuff.
Split the acpi-build.c monster, specifically split the
pc and q35 and pci bits into a separate file which we
can skip building at some point in the future.

v2 changes: leave acpi-build.c largely as-is, move useful
bits to other places to allow them being reused, specifically:

 * move isa device generator functions to individual isa devices.
 * move fw_cfg generator function to fw_cfg.c

v3 changes: fix rtc, support multiple lpt devices.

take care,
  Gerd

Gerd Hoffmann (15):
  move 'typedef Aml' to qemu/types.h
  acpi: add aml builder stubs
  qtest: allow DSDT acpi table changes
  acpi: drop pointless _STA method
  acpi: add ISADeviceClass->build_aml()
  rtc: add RTC_ISA_BASE
  acpi: move aml builder code for rtc device
  acpi: serial: don't use _STA method
  acpi: move aml builder code for serial device
  acpi: parallel: don't use _STA method
  acpi: move aml builder code for parallel device
  acpi: move aml builder code for floppy device
  acpi: move aml builder code for i8042 (kbd+mouse) device
  acpi: factor out fw_cfg_add_acpi_dsdt()
  acpi: simplify build_isa_devices_aml()

 hw/i386/fw_cfg.h                            |   1 +
 include/hw/acpi/aml-build.h                 |   1 -
 include/hw/isa/isa.h                        |   2 +
 include/hw/rtc/mc146818rtc.h                |   1 +
 include/qemu/typedefs.h                     |   1 +
 tests/qtest/bios-tables-test-allowed-diff.h |  17 ++
 hw/acpi/aml-build-stub.c                    |  79 ++++++
 hw/block/fdc.c                              |  83 ++++++
 hw/char/parallel.c                          |  32 +++
 hw/char/serial-isa.c                        |  32 +++
 hw/i386/acpi-build.c                        | 271 +-------------------
 hw/i386/fw_cfg.c                            |  28 ++
 hw/input/pckbd.c                            |  31 +++
 hw/isa/isa-bus.c                            |  15 ++
 hw/rtc/mc146818rtc.c                        |  25 +-
 stubs/cmos.c                                |   7 +
 hw/acpi/Makefile.objs                       |   4 +-
 stubs/Makefile.objs                         |   1 +
 18 files changed, 361 insertions(+), 270 deletions(-)
 create mode 100644 hw/acpi/aml-build-stub.c
 create mode 100644 stubs/cmos.c

-- 
2.18.2


